//
//  ApiService.swift
//  TestApp
//
//  Created by hilman anwarsah on 05/06/19.
//  Copyright © 2019 hilman anwarsah. All rights reserved.
//

import Foundation
import ObjectMapper
//import ObjectMapper
public protocol FaspayService {
    func createBilling(mFaspayPaymentRequest:FaspayPaymentRequest, mCallback:FaspayCreateBillingServiceCallback);
    func inqueryPaymentStatus(mRequest:FaspayPaymentStatusRequest, mCallback:FaspayInquiryPaymentStatusCallback);
    func cancelTransaction( mFaspayCancelPaymentRequest:FaspayCancelPaymentRequest,mCallback:FaspayCancelPaymentCallback)
    
    func inquiryPaymentChannel(mCallback:FaspayInquiryServiceCallback)
}
public protocol FaspayInquiryServiceCallback:UnregisteredErrorCallback {
    func onGetPaymentChannel( channel:[FaspayPaymentChannel]);
    
    func onErrorGetPaymentChannel( e:Error);
}
public protocol FaspayCancelPaymentCallback:UnregisteredErrorCallback {
    func onCancelPaymentSuccess(channel:FaspayCancelPaymentResponse);
    
    func onErrorRequstCancelPayment(e:Error);
}
public protocol FaspayCreateBillingServiceCallback:UnregisteredErrorCallback {
    
    func onGetPaymentResponse( response:FaspayPaymentResponse);
    
    func onErrorGetPaymentResponse( e:Error);
}
public protocol FaspayInquiryPaymentStatusCallback:UnregisteredErrorCallback {
    
    func onGetInquiryPaymentStatusResponse( response:FaspayPaymentStatusResponse);
    
    func onErrorGetInquiryPaymentStatusResponse( e:Error);
}
public class FaspayServiceImpl:ApiServiceImpl,FaspayService{
    public     override init(config: FaspayConfig) {
        super.init(config: config)
        
    }
    public  func inquiryPaymentChannel(mCallback: FaspayInquiryServiceCallback) {
        self.errorHandlerCallback = mCallback
        if let userx = config.faspayUser.userId,let passwordx = config.faspayUser.password{
            
            let raw = userx+passwordx;
            
            
            let d = raw.data(using: .utf8);
            
            if let str:String = d?.md5{
                let
                signature = SHA1.hexString(from: str)?.replacingOccurrences(of: " ", with: "").lowercased()
                let jsonObject: [String: Any] = [
                    "request": "",
                    "merchant_id": config.faspayUser.merchantId,
                    
                    "merchant": config.faspayUser.merchantName,
                    "signature":signature
                ]
                if let jsonString = try? JSONSerialization.data(withJSONObject: jsonObject, options: .prettyPrinted){
                    sendRequestHttpPost(url: config.getInquiryPaymentChannelUrl(), data: jsonString, c: IPaymentChannelCallback(mCallback: mCallback))}
            }
            
            
            
            
        }
        
    }
    
    public     func createBilling(mFaspayPaymentRequest: FaspayPaymentRequest, mCallback: FaspayCreateBillingServiceCallback) {
        self.errorHandlerCallback = mCallback
        let jsonStr =         Mapper<FaspayPaymentRequest>().toJSONString(mFaspayPaymentRequest, prettyPrint: true);
        if let xdata = jsonStr?.data(using: .utf8){
            sendRequestHttpPost(url: config.getCreateBillingUrl(), data: xdata, c: CBillingCallback(mCallback: mCallback))
        }
        
    }
    public     func inqueryPaymentStatus(mRequest: FaspayPaymentStatusRequest, mCallback: FaspayInquiryPaymentStatusCallback) {
        self.errorHandlerCallback = mCallback
        let jsonStr =         Mapper<FaspayPaymentStatusRequest>().toJSONString(mRequest, prettyPrint: true);
        if let xdata = jsonStr?.data(using: .utf8){
            sendRequestHttpPost(url: config.getInqueryPaymentStatusUrl(), data: xdata, c: IPaymentStatusCallback(mCallback: mCallback))
        }
    }
    public     func cancelTransaction(mFaspayCancelPaymentRequest: FaspayCancelPaymentRequest, mCallback: FaspayCancelPaymentCallback) {
        self.errorHandlerCallback = mCallback
        let jsonStr =         Mapper<FaspayCancelPaymentRequest>().toJSONString(mFaspayCancelPaymentRequest, prettyPrint: true);
        if let xdata = jsonStr?.data(using: .utf8){
            sendRequestHttpPost(url: config.getCancelTransactionUrl(), data: xdata, c: ICancelCallback(mCallback: mCallback))
        }
    }
    
    
}
class IPaymentChannelCallback:ApiServiceCallbackString{
    let mCallback:FaspayInquiryServiceCallback
    init(mCallback:FaspayInquiryServiceCallback) {
        self.mCallback = mCallback;
    }
    func onGetError(data: Error) {
        mCallback.onErrorGetPaymentChannel(e: data)
    }
    func onGetResponse(data: String) {
        if let response = FaspayPaymentChannelResponse(JSONString: data) {
            if let pc = response.payment_channel{
                mCallback.onGetPaymentChannel(channel: pc);
            }
            
        }
    }
}
class ICancelCallback:ApiServiceCallbackString{
    let mCallback: FaspayCancelPaymentCallback
    init(mCallback:FaspayCancelPaymentCallback) {
        self.mCallback = mCallback
    }
    
    func onGetError(data: Error) {
        mCallback.onErrorRequstCancelPayment(e: data)
    }
    func onGetResponse(data: String) {
        if let response = FaspayCancelPaymentResponse(JSONString: data) {
            
            mCallback.onCancelPaymentSuccess(channel: response)
        }
    }
}
class CBillingCallback:ApiServiceCallbackString{
    let mCallback: FaspayCreateBillingServiceCallback
    init(mCallback:FaspayCreateBillingServiceCallback) {
        self.mCallback = mCallback
    }
    func onGetError(data: Error) {
        mCallback.onErrorGetPaymentResponse(e: data)
    }
    func onGetResponse(data: String) {
        
        if let response = FaspayPaymentResponse(JSONString: data) {
            
            mCallback.onGetPaymentResponse(response: response)
        }
    }
}
class IPaymentStatusCallback:ApiServiceCallbackString{
    let mCallback: FaspayInquiryPaymentStatusCallback
    init(mCallback:FaspayInquiryPaymentStatusCallback) {
        self.mCallback = mCallback
    }
    func onGetError(data: Error) {
        mCallback.onErrorGetInquiryPaymentStatusResponse(e: data)
    }
    func onGetResponse(data: String) {
        if let response = FaspayPaymentStatusResponse(JSONString: data) {
            
            mCallback.onGetInquiryPaymentStatusResponse(response: response)
        }
    }
}

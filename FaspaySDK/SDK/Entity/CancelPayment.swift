//
//  CancelPayment.swift
//  TestApp
//
//  Created by hilman anwarsah on 06/06/19.
//  Copyright © 2019 hilman anwarsah. All rights reserved.
//
import ObjectMapper
import Foundation
import ObjectMapper
//import ObjectMapper
public class FaspayCancelPaymentRequest:Mappable{
  public var request : String?
  public var trx_id : String?
  public var merchant_id : String?
  public var merchant : String?
  public var bill_no : String?
  public var payment_cancel : String? = ""
  public var signature : String?
    
public     init() {
        
    }
public     required init?(map: Map) {
        
    }
public     func mapping(map: Map) {
        request <- map["request"]
        trx_id <- map["trx_id"]
        merchant_id <- map["merchant_id"]
        merchant <- map["merchant"]
        bill_no <- map["bill_no"]
        payment_cancel <- map["payment_cancel"]
        signature <- map["signature"]
        
    }
}

public class FaspayCancelPaymentRequestWrapper :FaspayCancelPaymentRequest{
    
public     required init?(map: Map) {
        super.init(map: map)
    }
public     init(trxId:String?,  billNo:String?, paymentCancel:String?,mFaspayConfig:FaspayConfig) {
        super.init()
        self.trx_id = trxId
        self.bill_no = billNo
        self.payment_cancel = paymentCancel
        self.merchant_id = mFaspayConfig.faspayUser.merchantId
        self.merchant = mFaspayConfig.faspayUser.merchantName
        if let userx = mFaspayConfig.faspayUser.userId,let passwordx = mFaspayConfig.faspayUser.password,let bill = bill_no{
            let raw = userx+passwordx+bill;
            
            
            let d = raw.data(using: .utf8);
            if let str:String = d?.md5{
                signature = SHA1.hexString(from: str)?.replacingOccurrences(of: " ", with: "").lowercased()
            }
            
            
            
            
        }
        
    }
}


public class FaspayCancelPaymentResponse:Mappable{
  public var response : String?
  public var trx_id : String?
  public var merchant_id : String?
  public var merchant : String?
  public var bill_no : String?
  public var trx_status_code : String?
  public var trx_status_desc : String?
  public var payment_status_code : String?
  public var payment_status_desc : String?
  public var payment_cancel_date : String?
  public var payment_cancel : String?
  public var response_code : String?
  public var response_desc : String?
    
public     init(){
        
    }
public     required init?(map: Map) {
        
    }
public     func mapping(map: Map) {
        response <- map["response"]
        trx_id <- map["trx_id"]
        merchant_id <- map["merchant_id"]
        merchant <- map["merchant"]
        bill_no <- map["bill_no"]
        trx_status_code <- map["trx_status_code"]
        trx_status_desc <- map["trx_status_desc"]
        payment_status_code <- map["payment_status_code"]
        payment_status_desc <- map["payment_status_desc"]
        payment_cancel_date <- map["payment_cancel_date"]
        payment_cancel <- map["payment_cancel"]
        response_code <- map["response_code"]
        response_desc <- map["response_desc"]
    }
}

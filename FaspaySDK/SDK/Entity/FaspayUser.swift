//
//  FaspayUser.swift
//  TestApp
//
//  Created by hilman anwarsah on 05/06/19.
//  Copyright © 2019 hilman anwarsah. All rights reserved.
//

import Foundation

import Foundation
//import ObjectMapper
public class FaspayUser {
    public var  merchantName:String?;
    public var  merchantId:String?;
    public var  userId:String?;
    public var  password:String?;
    public var  redirectUrl:String?;
    public init(
        merchantName:String?,
        merchantId:String?,
        userId:String?,
        password:String?,
        redirectUrl:String
        ) {
        self.merchantId = merchantId
        self.merchantName = merchantName
        self.userId = userId
        self.password = password
        self.redirectUrl = redirectUrl
        
        
    }
    public init(){
        
    }
}

public class FaspayConfig{
    public let faspayUser:FaspayUser
    private let inquiryPaymentChannelUrl:String;
    private let createBillingUrl:String;
    private let inquiryPaymentStatuslUrl:String;
    private let cancelTransactionUrl:String;
    
    public     init(withUser faspayUser:FaspayUser) {
        self.faspayUser = faspayUser;
        self.inquiryPaymentChannelUrl = "";
        self.createBillingUrl = "";
        self.inquiryPaymentStatuslUrl = "";
        self.cancelTransactionUrl = "";
    }
    
    public func getInquiryPaymentChannelUrl()->String{
        return inquiryPaymentStatuslUrl;
    }
    
    public func getCreateBillingUrl()->String{
        return createBillingUrl;
    }
    
    public func getInqueryPaymentStatusUrl()->String{
        return inquiryPaymentStatuslUrl;
    }
    
    public func getCancelTransactionUrl()->String{
        return cancelTransactionUrl;
    };
}
public class FaspayConfigDev :FaspayConfig{
    public     override init(withUser faspayUser: FaspayUser) {
        super.init(withUser: faspayUser)
    }
    
    public     override func getInquiryPaymentChannelUrl() ->String {
        return "https://dev.faspay.co.id/cvr/100001/10";
    }
    
    
    public     override func  getCreateBillingUrl()->String {
        return "https://dev.faspay.co.id/cvr/300011/10";
    }
    
    
    public     override func  getInqueryPaymentStatusUrl()->String {
        return "https://dev.faspay.co.id/cvr/100004/10";
    }
    
    
    public     override func  getCancelTransactionUrl()->String{
        return "https://dev.faspay.co.id/cvr/100005/10";
    }
}
public class FaspayConfigProd :FaspayConfig{
    
    public     override init(withUser faspayUser: FaspayUser) {
        super.init(withUser: faspayUser)
    }
    public     override func getInquiryPaymentChannelUrl() ->String {
        return "https://web.faspay.co.id/cvr/100001/10";
    }
    
    
    public     override func  getCreateBillingUrl()->String {
        return "https://web.faspay.co.id/cvr/300011/10";
    }
    
    
    public     override func  getInqueryPaymentStatusUrl()->String {
        return "https://web.faspay.co.id/cvr/100004/10";
    }
    
    
    public     override func  getCancelTransactionUrl()->String{
        return "https://web.faspay.co.id/cvr/100005/10";
    }
}

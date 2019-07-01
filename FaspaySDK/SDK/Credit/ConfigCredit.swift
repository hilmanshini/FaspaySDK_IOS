//
//  ConfigCredit.swift
//  FaspaySDK
//
//  Created by hilman anwarsah on 26/06/19.
//  Copyright © 2019 hilman anwarsah. All rights reserved.
//

import Foundation
import ObjectMapper
public protocol FaspayConfigCredit {

        func getMerchantWindowUrl() -> String;
        func getMerchantDirectUrl() -> String;
        func getMerchantInquiryUrl() -> String;
    
}


public class FaspayConfigCreditDev :FaspayConfigCredit{
    public init(){
        
    }
    public func getMerchantInquiryUrl() -> String {
        return "https://fpgdev.faspay.co.id/payment/api";
    }
    
    
    


    
    public func getMerchantWindowUrl() -> String {
        return "https://fpgdev.faspay.co.id/payment";
    }
    
    public func getMerchantDirectUrl() -> String {
        return "https://fpgdev.faspay.co.id/payment";
    }
    
    
    
}

public class FaspayConfigCreditProd :FaspayConfigCredit{
    public init(){
        
    }
    
    public func getMerchantWindowUrl() -> String {
        return "https://fpg.faspay.co.id/payment";
    }
    
    public func getMerchantDirectUrl() -> String {
        return "https://fpg.faspay.co.id/payment";
    }
    
     public func getMerchantInquiryUrl() -> String {
return "https://fpg.faspay.co.id/payment/api";
    }
    
    
}
public class FaspayUserCredit{
    public var merchantId:String?;
    public var pass:String?;
    public init(){
        
    }
}

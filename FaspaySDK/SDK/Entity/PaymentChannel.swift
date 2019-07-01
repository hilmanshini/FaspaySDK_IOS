//
//  PaymentChannel.swift
//  TestApp
//
//  Created by hilman anwarsah on 05/06/19.
//  Copyright © 2019 hilman anwarsah. All rights reserved.
//

import Foundation
import ObjectMapper
public class FaspayPaymentChannel :Mappable{
public     var pg_code:String?
public     var pg_name:String?
    public     init() {
        
    }
    public     required init?(map: Map) {
        
    }
    public     func mapping(map: Map) {
        pg_code <- map["pg_code"]
        pg_name <- map["pg_name"]
    }
    
}
public class FaspayPaymentChannelResponse :Mappable{
    public var response_code:String?;
    public var response_desc:String?;
public     var response:String?;
public     var merchant_id:String?;
public     var merchant:String?;
public     var payment_channel:[FaspayPaymentChannel]?
    
    public     required init?(map: Map) {
        
    }
    public     func mapping(map: Map) {
        response_code <- map["response_code"]
        response_desc <- map["response_desc"]
        response <- map["response"]
        merchant_id <- map["merchant_id"]
        merchant <- map["merchant"]
        payment_channel <- map["payment_channel"]
    }
}

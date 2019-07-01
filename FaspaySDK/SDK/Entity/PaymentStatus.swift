//
//  FaspayPaymentStatus.swift
//  TestApp
//
//  Created by hilman anwarsah on 06/06/19.
//  Copyright © 2019 hilman anwarsah. All rights reserved.
//

import Foundation

import ObjectMapper
public class FaspayPaymentStatusRequest:Mappable{
public     var request : String?
public     var trx_id : String?
public     var merchant_id : String?
public     var bill_no : String?
public     var signature : String?
public     required init?(map: Map) {
        
    }
public     init(){
        
    }
public     func mapping(map: Map) {
        request <- map["request"]
        trx_id <- map["trx_id"]
        merchant_id <- map["merchant_id"]
        bill_no <- map["bill_no"]
        signature <- map["signature"]
    }
}

public class FaspayPaymentStatusRequestWrapper:FaspayPaymentStatusRequest{
    public required init?(map:Map) {
        super.init(map:map)
    }
    
public     init?(request:String?,trxId:String?,bill_no:String?,config:FaspayConfig) {
        super.init()
        
        if let userx = config.faspayUser.userId,let passwordx = config.faspayUser.password,let bill = bill_no{
            self.request = request
            self.trx_id = trxId
            self.bill_no = bill_no
            self.merchant_id = config.faspayUser.merchantId
            let raw = userx+passwordx+bill;
            
            
            let d = raw.data(using: .utf8);
            if let str:String = d?.md5{
                signature = SHA1.hexString(from: str)?.replacingOccurrences(of: " ", with: "").lowercased()
            }
            
            
            
            
        }
    }
}
public class FaspayPaymentStatusResponse:Mappable{
public     var response : String?
public     var trx_id : String?
public     var merchant_id : String?
public     var merchant : String?
public     var bill_no : String?
public     var payment_reff : String?
public     var payment_date : String?
public     var payment_status_code : String?
public     var payment_status_desc : String?
public     var response_code : String?
public     var response_desc : String?
public     required init?(map: Map) {
        
    }
public     func mapping(map: Map) {
        response <- map["response"]
        trx_id <- map["trx_id"]
        merchant_id <- map["merchant_id"]
        merchant <- map["merchant"]
        bill_no <- map["bill_no"]
        payment_reff <- map["payment_reff"]
        payment_date <- map["payment_date"]
        payment_status_code <- map["payment_status_code"]
        payment_status_desc <- map["payment_status_desc"]
        response_code <- map["response_code"]
        response_desc <- map["response_desc"]
    }
}

//
//  BaseError.swift
//  FaspaySDK
//
//  Created by hilman anwarsah on 10/06/19.
//  Copyright © 2019 hilman anwarsah. All rights reserved.
//

import Foundation
import ObjectMapper
//import ObjectMapper
import var CommonCrypto.CC_MD5_DIGEST_LENGTH
import func CommonCrypto.CC_MD5
import typealias CommonCrypto.CC_LONG

 public class UnregisteredError : Mappable{
    public var response_error:UnregisterErrorDef?;
    public     init() {
        
    }
    public     required init?(map: Map) {
        
    }
    public func mapping(map: Map) {
        response_error <- map["response_error"]
    }
}
 public class UnregisterErrorDef :Mappable{
    public var response_code:String?;
    
    public var response_desc:String?;
    public required init?(map: Map) {
        
    }
    public required init() {
        
    }
    public  func mapping(map: Map) {
        response_code <- map["response_code"]
        response_desc <- map["response_desc"]
    }
}

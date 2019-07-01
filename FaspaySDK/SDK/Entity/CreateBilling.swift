//
//  File.swift
//  TestApp
//
//  Created by hilman anwarsah on 05/06/19.
//  Copyright © 2019 hilman anwarsah. All rights reserved.
//

import Foundation
import ObjectMapper
import var CommonCrypto.CC_MD5_DIGEST_LENGTH
import func CommonCrypto.CC_MD5
import typealias CommonCrypto.CC_LONG

public class BillItem:Mappable{
    public var product:String?
    public var qty:String?
    public var amount:String?
    public var payment_plan:String?
    public var merchant_id:String?
    public var tenor:String?
public     required init?(map: Map) {
        
    }
   public  init(){}
    
public     func mapping(map: Map) {
        product <- map["product"]
        qty <- map["qty"]
        amount <- map["amount"]
        payment_plan <- map["payment_plan"]
        merchant_id <- map["merchant_id"]
        tenor <- map["tenor"]
        
    }
    
    
}
public class CreateBillingResponse :Mappable{
    public var response:String?
    public var trx_id:String?
    public var merchant_id:String?
    public var merchant:String?
    public var bill_no:String?
    public var bill_items:[BillItem]?
    public var response_code:String?
    public var response_desc:String?
    public var redirect_url:String?
    public required init?(map: Map) {
        
    }
    init(){}
    public func mapping(map: Map) {
        response <- map["response"]
        trx_id <- map["trx_id"]
        merchant_id <- map["merchant_id"]
        merchant <- map["merchant"]
        bill_no <- map["bill_no"]
        bill_items <- map["bill_items"]
        response_code <- map["response_code"]
        response_desc <- map["response_desc"]
        redirect_url <- map["redirect_url"]
    }
}
public class FaspayPayment:Mappable{
    public static let PAYMENT_PLAN_FULL_SETTLEMENT : String = "1";
    public static let PAYMENT_PLAN_INSTALLMENT : String = "2";
    public static let TENOR_FULL : String = "00";
    public static let TENOR_3MONTHS : String = "03";
    public static let TENOR_6MONTHS : String = "06";
    public static let TENOR_12MONTHS : String = "12";
    public var product : String?
    public var qty : String?
    public var amount : String?
    public var payment_plan : String?
    public var merchant_id : String?
    public var tenor: String?
    public required init?(map: Map) {
        
    }
    public init (product : String?,qty : String?,amount : String?,payment_plan : String?,merchant_id : String?,tenor: String?){
        self.product =   product
        self.qty =   qty
        self.amount =   amount
        self.payment_plan =   payment_plan
        self.merchant_id =   merchant_id
        self.tenor =  tenor
    }
    public init(){}
    public func mapping(map: Map) {
        product <- map["product"]
        qty <- map["qty"]
        amount <- map["amount"]
        payment_plan <- map["payment_plan"]
        merchant_id <- map["merchant_id"]
        tenor <- map["tenor"]
    }
    
}
public class FaspayPaymentRequest:Mappable{
    
    public var request : String?
    public var merchant_id : String?
    public var merchant : String?
    public var bill_no : String?
    public var bill_reff : String?
    public var bill_date : String?
    public var bill_expired : String?
    public var bill_desc : String?
    public var bill_currency : String?
    public var bill_gross : String?
    public var bill_miscfee : String?
    public var bill_total : String?
    public var cust_no : String?
    public var cust_name : String?
    public var payment_channel : String?
    public var pay_type : String?
    public var bank_userid : String?
    public var msisdn : String?
    public var email : String?
    public var terminal : String?
    public var billing_name : String?
    public var billing_lastname : String?
    public var billing_address : String?
    public var billing_address_city : String?
    public var billing_address_region : String?
    public var billing_address_state : String?
    public var billing_address_poscode : String?
    public var billing_msisdn : String?
    public var billing_address_country_code : String?
    public var receiver_name_for_shipping : String?
    public var shipping_lastname : String?
    public var shipping_address : String?
    public var shipping_address_city : String?
    public var shipping_address_region : String?
    public var shipping_address_state : String?
    public var shipping_address_poscode : String?
    public var shipping_msisdn : String?
    public var shipping_address_country_code : String?
    public var item : [FaspayPayment]?
    public var reserve1 : String?
    public var reserve2 : String?
    public var signature : String?
    
    
public     required init?(map: Map) {
        
    }
    init(){
        
    }
public     func mapping(map: Map) {
        request <- map["request"]
        merchant_id <- map["merchant_id"]
        merchant <- map["merchant"]
        bill_no <- map["bill_no"]
        bill_reff <- map["bill_reff"]
        bill_date <- map["bill_date"]
        bill_expired <- map["bill_expired"]
        bill_desc <- map["bill_desc"]
        bill_currency <- map["bill_currency"]
        bill_gross <- map["bill_gross"]
        bill_miscfee <- map["bill_miscfee"]
        bill_total <- map["bill_total"]
        cust_no <- map["cust_no"]
        cust_name <- map["cust_name"]
        payment_channel <- map["payment_channel"]
        pay_type <- map["pay_type"]
        bank_userid <- map["bank_userid"]
        msisdn <- map["msisdn"]
        email <- map["email"]
        terminal <- map["terminal"]
        billing_name <- map["billing_name"]
        billing_lastname <- map["billing_lastname"]
        billing_address <- map["billing_address"]
        billing_address_city <- map["billing_address_city"]
        billing_address_region <- map["billing_address_region"]
        billing_address_state <- map["billing_address_state"]
        billing_address_poscode <- map["billing_address_poscode"]
        billing_msisdn <- map["billing_msisdn"]
        billing_address_country_code <- map["billing_address_country_code"]
        receiver_name_for_shipping <- map["receiver_name_for_shipping"]
        shipping_lastname <- map["shipping_lastname"]
        shipping_address <- map["shipping_address"]
        shipping_address_city <- map["shipping_address_city"]
        shipping_address_region <- map["shipping_address_region"]
        shipping_address_state <- map["shipping_address_state"]
        shipping_address_poscode <- map["shipping_address_poscode"]
        shipping_msisdn <- map["shipping_msisdn"]
        shipping_address_country_code <- map["shipping_address_country_code"]
        item <- map["item"]
        reserve1 <- map["reserve1"]
        reserve2 <- map["reserve2"]
        signature <- map["signature"]
    }
}
public class FaspayPaymentRequestUserData :Mappable{
    public var bank_userid:String? = ""
    public var msisdn:String?
    public var email:String?;
    public var terminal:String?
    public var custNo:String?
    public var custName:String?
public     required init?(map: Map) {
        
    }
    
    public init(msisdn:String?, email:String?,terminal:String?,custNo:String?,custName:String?){
        
        self.msisdn =   msisdn
        self.email =   email
        self.terminal =   terminal
        self.custNo =   custNo
        self.custName =   custName
    }
    public init() {
        
    }
public     func mapping(map: Map) {
        bank_userid <- map["bank_userid"]
        msisdn <- map["msisdn"]
        email <- map["email"]
        terminal <- map["terminal"]
        
        
    }
}
public class FaspayPaymentRequestShippingData:Mappable{
    public var receiver_name_for_shipping : String?
    public var shipping_lastname : String?
    public var shipping_address : String?
    public var shipping_address_city : String?
    public var shipping_address_region : String?
    public var shipping_address_state : String?
    public var shipping_address_poscode : String?
    public var shipping_msisdn : String?
    public var shipping_address_country_code : String?
public     init(){}
public     required init?(map: Map) {
        
    }
public     func mapping(map: Map) {
        receiver_name_for_shipping <- map["receiver_name_for_shipping"]
        shipping_lastname <- map["shipping_lastname"]
        shipping_address <- map["shipping_address"]
        shipping_address_city <- map["shipping_address_city"]
        shipping_address_region <- map["shipping_address_region"]
        shipping_address_state <- map["shipping_address_state"]
        shipping_address_poscode <- map["shipping_address_poscode"]
        shipping_msisdn <- map["shipping_msisdn"]
        shipping_address_country_code <- map["shipping_address_country_code"]
    }
}
public class FaspayPaymentRequestBillData :Mappable{
    public var bill_no : String?
    public var bill_reff : String?
    public var bill_date : String?
    public var bill_expired : String?
    public var bill_desc : String?
    public var bill_currency : String?
    public var bill_gross : String?
    public var bill_miscfee : String?
    public var bill_total : String?
    public var billing_name : String?
    public var billing_lastname : String?
    public var billing_address : String?
    public var billing_address_city : String?
    public var billing_address_region : String?
    public var billing_address_state : String?
    public var billing_address_poscode : String?
    public var billing_msisdn : String?
    public var billing_address_country_code : String?
    public var item:[FaspayPayment]?
    public var pay_type :String?
public     required init?(map: Map) {
        
    }
    init(){}
public     init(billNo:String?,billDesc:String?,expiredDayInterval:Int = 0,billTotal:String?,items:[FaspayPayment]?){
        self.bill_no = billNo
        self.bill_desc = billDesc
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let dateNow = Date()
        let dateNowStr = dateFormatterGet.string(from: dateNow)
        self.bill_date = dateNowStr
        if let nextDate = Calendar.current.date(byAdding: .day,value:expiredDayInterval ,to: dateNow){
            let dateNextStr = dateFormatterGet.string(from: nextDate)
            self.bill_expired = dateNextStr
            
        }
        
        
        self.bill_total = billTotal
        self.item = items
        
        
    }
public     func mapping(map: Map) {
        bill_no <- map["bill_no"]
        bill_reff <- map["bill_reff"]
        bill_date <- map["bill_date"]
        bill_expired <- map["bill_expired"]
        bill_desc <- map["bill_desc"]
        bill_currency <- map["bill_currency"]
        bill_gross <- map["bill_gross"]
        bill_miscfee <- map["bill_miscfee"]
        bill_total <- map["bill_total"]
        billing_name <- map["billing_name"]
        billing_lastname <- map["billing_lastname"]
        billing_address <- map["billing_address"]
        billing_address_city <- map["billing_address_city"]
        billing_address_region <- map["billing_address_region"]
        billing_address_state <- map["billing_address_state"]
        billing_address_poscode <- map["billing_address_poscode"]
        billing_msisdn <- map["billing_msisdn"]
        billing_address_country_code <- map["billing_address_country_code"]
        item <- map["item"]
        pay_type <- map["pay_type"]
    }
}


public class FaspayPaymentRequestWrapper:FaspayPaymentRequest{
    public static let PAY_TYPE_PAY_TYPE_FULL_SETTLEMENT : Int = 1;
    public static let PAY_TYPE_INSTALLMENT : Int = 2;
    public static let PAY_TYPE_MIXED : Int = 3;
    public static let TERMINAL_WEB : Int = 10;
    public static let TERMINAL_MOBILE_APP_BLACKBERRY : Int = 20;
    public static let TERMINAL_MOBILE_APP_ANDROID : Int = 21;
    public static let TERMINAL_MOBILE_APP_IOS : Int = 22;
    public static let TERMINAL_MOBILE_APP_WINDOWS : Int = 23;
    public static let TERMINAL_MOBILE_APP_SYMBIAN : Int = 24;
    public static let TERMINAL_TAB_APP_BLACKBERRY : Int = 30;
    public static let TERMINAL_TAB_APP_ANDROID : Int = 31;
    public static let TERMINAL_TAB_APP_IOS : Int = 32;
    public static let TERMINAL_TAB_APP_WINDOWS : Int = 33;
    public var c:FaspayConfig?
public     required init?(map: Map) {
        super.init(map:map)
    }
public     init?(config:FaspayConfig,bill_data:FaspayPaymentRequestBillData,pc:FaspayPaymentChannel,userdata:FaspayPaymentRequestUserData,shippingData:FaspayPaymentRequestShippingData) {
        super.init()
        c = config;
        merchant_id = config.faspayUser.merchantId;
        merchant = config.faspayUser.merchantName;
        bill_no = bill_data.bill_no
        bill_reff = bill_data.bill_reff
        bill_date = bill_data.bill_date
        bill_expired = bill_data.bill_expired
        bill_desc = bill_data.bill_desc
        bill_currency = bill_data.bill_currency
        bill_gross = bill_data.bill_gross
        bill_miscfee = bill_data.bill_miscfee
        bill_total = bill_data.bill_total
        cust_no = userdata.custNo
        cust_name = userdata.custName
        payment_channel = pc.pg_code
        bank_userid = userdata.bank_userid
        msisdn = userdata.msisdn
        email = userdata.email
        terminal = userdata.terminal
        billing_name = bill_data.billing_name
        billing_lastname = bill_data.billing_lastname
        billing_address = bill_data.billing_address
        billing_address_city = bill_data.billing_address_city
        billing_address_region = bill_data.billing_address_region
        billing_address_state = bill_data.billing_address_state
        billing_address_poscode = bill_data.billing_address_poscode
        billing_msisdn = bill_data.billing_msisdn
        billing_address_country_code = bill_data.billing_address_country_code
        receiver_name_for_shipping = shippingData.receiver_name_for_shipping
        shipping_lastname = shippingData.shipping_lastname
        shipping_address = shippingData.shipping_address
        shipping_address_city = shippingData.shipping_address_city
        shipping_address_region = shippingData.shipping_address_region
        shipping_address_state = shippingData.shipping_address_state
        shipping_address_poscode = shippingData.shipping_address_poscode
        shipping_msisdn = shippingData.shipping_msisdn
        shipping_address_country_code = shippingData.shipping_address_country_code
        item = bill_data.item
        reserve1 = ""
        reserve2 = ""
        pay_type = bill_data.pay_type
        if let userx = config.faspayUser.userId,let passwordx = config.faspayUser.password,let bill = bill_no{
            let raw = userx+passwordx+bill;
            
            
            let d = raw.data(using: .utf8);
            if let str:String = d?.md5{
                signature = SHA1.hexString(from: str)?.replacingOccurrences(of: " ", with: "").lowercased()
            }
            
            
            
            
        }
        //        let userAndPass = config.faspayUser.userId+config.faspayUser.password+bill_no
        
        
    }
    
    func MD5(string: String) -> Data {
        let messageData = string.data(using:.utf8)!
        var digestData = Data(count: Int(CC_MD5_DIGEST_LENGTH))
        
        _ = digestData.withUnsafeMutableBytes {digestBytes in
            messageData.withUnsafeBytes {messageBytes in
                CC_MD5(messageBytes, CC_LONG(messageData.count), digestBytes)
            }
        }
        
        
        return digestData
    }
    
    
    
}
public extension Data{
    public var md5 : String {
        var digest = [UInt8](repeating: 0, count: Int(CC_MD5_DIGEST_LENGTH))
        _ =  self.withUnsafeBytes { bytes in
            CC_MD5(bytes, CC_LONG(self.count), &digest)
        }
        var digestHex = ""
        for index in 0..<Int(CC_MD5_DIGEST_LENGTH) {
            digestHex += String(format: "%02x", digest[index])
        }
        return digestHex
    }
    
}
public class FaspayPaymentResponse:Mappable{
    public var response : String?
    public var trx_id : String?
    public var merchant_id : String?
    public var merchant : String?
    public var bill_no : String?
    public var bill_items : String?
    public var response_code : String?
    public var response_desc : String?
public     required init?(map: Map) {
        
    }
public     func mapping(map: Map) {
        
        response <- map["response"]

        trx_id <- map["trx_id"]
        merchant_id <- map["merchant_id"]
        merchant <- map["merchant"]
        bill_no <- map["bill_no"]
        bill_items <- map["bill_items"]
        response_code <- map["response_code"]
        response_desc <- map["response_desc"]
    }
}

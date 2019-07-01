//
//  Payment.swift
//  FaspaySDK
//
//  Created by hilman anwarsah on 27/06/19.
//  Copyright © 2019 hilman anwarsah. All rights reserved.
//

import Foundation
import var CommonCrypto.CC_MD5_DIGEST_LENGTH
import func CommonCrypto.CC_MD5
import typealias CommonCrypto.CC_LONG
import ObjectMapper;
public class FaspayPaymentCredit:Mappable{
    public init(){
        
    }
    public required init?(map: Map) {
        
        
    }
    public func mapping(map: Map) {
        self.payment_method <- map["payment_method"]
        self.merchantid <- map["merchantid"]
        self.merchant_tranid <- map["merchant_tranid"]
        self.txn_password <- map["txn_password"]
        self.lang <- map["lang"]
        self.currencycode <- map["currencycode"]
        self.amount <- map["amount"]
        self.signature <- map["signature"]
        self.custname <- map["custname"]
        self.custemail <- map["custemail"]
        self.shopper_ip <- map["shopper_ip"]
        self.description <- map["description"]
        self.response_type <- map["response_type"]
        self.return_url <- map["return_url"]
        self.cardno <- map["cardno"]
        self.cardname <- map["cardname"]
        self.cardtype <- map["cardtype"]
        self.expirymonth <- map["expirymonth"]
        self.expiryyear <- map["expiryyear"]
        self.cardcvc <- map["cardcvc"]
        self.card_issuer_bank_country_code <- map["card_issuer_bank_country_code"]
        self.billing_address <- map["billing_address"]
        self.billing_address_city <- map["billing_address_city"]
        self.billing_address_region <- map["billing_address_region"]
        self.billing_address_state <- map["billing_address_state"]
        self.billing_address_poscode <- map["billing_address_poscode"]
        self.billing_address_country_code <- map["billing_address_country_code"]
        self.receiver_name_for_shipping <- map["receiver_name_for_shipping"]
        self.shipping_address <- map["shipping_address"]
        self.shipping_address_city <- map["shipping_address_city"]
        self.shipping_address_region <- map["shipping_address_region"]
        self.shipping_address_state <- map["shipping_address_state"]
        self.shipping_address_poscode <- map["shipping_address_poscode"]
        self.shipping_address_country_code <- map["shipping_address_country_code"]
        self.shippingcost <- map["shippingcost"]
        self.phone_no <- map["phone_no"]
        self.mref1 <- map["mref1"]
        self.mref2 <- map["mref2"]
        self.mref3 <- map["mref3"]
        self.mref4 <- map["mref4"]
        self.mref5 <- map["mref5"]
        self.mref6 <- map["mref6"]
        self.mref7 <- map["mref7"]
        self.mref8 <- map["mref8"]
        self.mref9 <- map["mref9"]
        self.mref10 <- map["mref10"]
        self.mparam1 <- map["mparam1"]
        self.mparam2 <- map["mparam2"]
        self.customer_ref <- map["customer_ref"]
        self.frisk1 <- map["frisk1"]
        self.frisk2 <- map["frisk2"]
        self.domicile_address <- map["domicile_address"]
        self.domicile_address_city <- map["domicile_address_city"]
        self.domicile_address_region <- map["domicile_address_region"]
        self.domicile_address_state <- map["domicile_address_state"]
        self.domicile_address_poscode <- map["domicile_address_poscode"]
        self.domicile_address_country_code <- map["domicile_address_country_code"]
        self.domicile_phone_no <- map["domicile_phone_no"]
        self.handshake_url <- map["handshake_url"]
        self.handshake_param <- map["handshake_param"]
        self.card_issuer_bank <- map["card_issuer_bank"]
        self.card_identity_ref_type <- map["card_identity_ref_type"]
        self.card_identity_ref <- map["card_identity_ref"]
        self.card_phone <- map["card_phone"]
        self.card_bill_addr <- map["card_bill_addr"]
        self.card_bill_addr_poscode <- map["card_bill_addr_poscode"]
        self.card_bill_addr_city <- map["card_bill_addr_city"]
        self.card_bill_addr_region <- map["card_bill_addr_region"]
        self.card_bill_addr_state <- map["card_bill_addr_state"]
        self.card_bill_addr_country_code <- map["card_bill_addr_country_code"]
        self.card_email <- map["card_email"]
        self.transactiontype <- map["transactiontype"];
    }
    public var payment_method:String? = "1";
    public var merchantid:String?;
    public var merchant_tranid:String?;
    public var txn_password:String?;
    public var lang:String?;
    public var currencycode:String?;
    public var amount:String?;
    public var signature:String?;
    public var custname:String?;
    public var custemail:String?;
    public var shopper_ip:String?;
    public var description:String?;
    public var response_type:String?;
    public var return_url:String?;
    public var cardno:String?;
    public var cardname:String?;
    public var cardtype:String?;
    public var expirymonth:String?;
    public var expiryyear:String?;
    public var cardcvc:String?;
    public var card_issuer_bank_country_code:String?;
    public var billing_address:String?;
    public var billing_address_city:String?;
    public var billing_address_region:String?;
    public var billing_address_state:String?;
    public var billing_address_poscode:String?;
    public var billing_address_country_code:String?;
    public var receiver_name_for_shipping:String?;
    public var shipping_address:String?;
    public var shipping_address_city:String?;
    public var shipping_address_region:String?;
    public var shipping_address_state:String?;
    public var shipping_address_poscode:String?;
    public var shipping_address_country_code:String?;
    public var shippingcost:String?;
    public var phone_no:String?;
    public var mref1:String?;
    public var mref2:String?;
    public var mref3:String?;
    public var mref4:String?;
    public var mref5:String?;
    public var mref6:String?;
    public var mref7:String?;
    public var mref8:String?;
    public var mref9:String?;
    public var mref10:String?;
    public var mparam1:String?;
    public var mparam2:String?;
    public var customer_ref:String?;
    public var frisk1:String?;
    public var frisk2:String?;
    public var domicile_address:String?;
    public var domicile_address_city:String?;
    public var domicile_address_region:String?;
    public var domicile_address_state:String?;
    public var domicile_address_poscode:String?;
    public var domicile_address_country_code:String?;
    public var domicile_phone_no:String?;
    public var handshake_url:String?;
    public var handshake_param:String?;
    public var card_issuer_bank:String?;
    public var card_identity_ref_type:String?;
    public var card_identity_ref:String?;
    public var card_phone:String?;
    public var card_bill_addr:String?;
    public var card_bill_addr_poscode:String?;
    public var card_bill_addr_city:String?;
    public var card_bill_addr_region:String?;
    public var card_bill_addr_state:String?;
    public var card_bill_addr_country_code:String?;
    public var card_email:String?;
    public var transactiontype = "1";
    
    
    public static let RESPONSE_TYPE_GET = "1";
    public static let RESPONSE_TYPE_POST = "2";
    public static let RESPONSE_TYPE_PRINT = "3";
    
    public static let  CARD_TYPE_MASTERCARD:String = "M";
    public static let CARD_TYPE_VISA:String = "V";
    public static let CARD_TYPE_JCB:String = "J";
    public static let  CARD_TYPE_AMEX:String = "A";
    func getUrl() -> String {
        return "";
    }
    
    public func getHtml()->String?{
        
        do {
            let jsonResponse:[String:Any] = self.toJSON();

            var sortedKeys = Array(jsonResponse.keys).sorted(by: {$0 < $1})
            var htmlString = "<form method=\"post\" name=\"form\" action=\""+getUrl()+"\">";
            for ship in sortedKeys {
                var v = jsonResponse[ship];
                var k:String = ship;
//                var v:String = ship.value as! String;
                if(k.lowercased() != "cardno" && k.lowercased() != "cardname"){
                    htmlString += "\n";
                    htmlString += "<input type=\"hidden\" name=\"";
                    htmlString += k.uppercased();
                    htmlString += "\" value=\"";
                    htmlString += v as! String;
                    htmlString += "\"/>";

                }
            }
            htmlString += "\n</form>";
            htmlString += "<script> document.form.submit();</script>";
            
            print(htmlString);
            return htmlString;
        } catch let Error {
            print("Error",Error);
            return nil;
        }
    }

}










public class FaspayPaymentCreditProd : FaspayPaymentCredit{
    public var pymt_ind:String = "";
    public var pymt_criteria:String = "";
    public var pymt_token:String = "";
    public override init() {
        super.init();
        
    }
    
    public required init?(map: Map) {
        super.init();
    }
    
    public override func mapping(map: Map) {
        super.mapping(map: map);
    }
    override func getUrl() -> String {
        return  "https://fpg.faspay.co.id/payment";
    }
}
public class FaspayPaymentCreditDev : FaspayPaymentCredit{
    public var pymt_ind:String = "";
    public var pymt_criteria:String = "";
    public var pymt_token:String = "";
    public override init() {
        super.init();
        
    }
    
    public required init?(map: Map) {
        super.init();
    }
    
    public override func mapping(map: Map) {
        super.mapping(map: map);
    }
    override func getUrl() -> String {
        return "https://fpgdev.faspay.co.id/payment";
    }
}

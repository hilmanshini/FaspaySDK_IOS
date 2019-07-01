//
//  Refund.swift
//  FaspaySDK
//
//  Created by hilman anwarsah on 27/06/19.
//  Copyright © 2019 hilman anwarsah. All rights reserved.
//

import Foundation
import ObjectMapper
public class RefundRequest :Mappable{
    public var transactiontype:String? = "11";
    public var response_type:String? = "3";
    public var merchantid:String?;
    public var payment_method:String? = "1";
    public var merchant_tranid:String?;
    public var refund_amount:String?;
    public var transactionid:String?;
    public var amount:String?;
    public var custname:String?;
    public var custemail:String?;
    public var description:String?;
    public var return_url:String?;
    public var signature:String?;
    public init(){
        
    }
    public required init?(map: Map) {
        
        
    }
    public func mapping(map: Map) {
        self.transactiontype <- map["transactiontype"]
        self.response_type <- map["response_type"]
        self.merchantid <- map["merchantid"]
        self.payment_method <- map["payment_method"]
        self.merchant_tranid <- map["merchant_tranid"]
        self.refund_amount <- map["refund_amount"]
        self.transactionid <- map["transactionid"]
        self.amount <- map["amount"]
        self.custname <- map["custname"]
        self.custemail <- map["custemail"]
        self.description <- map["description"]
        self.return_url <- map["return_url"]
        self.signature <- map["signature"]
    }
    func getUrl() -> String {
        return "";
    }
    public func getHtml()->String?{
        
        do {
            let jsonResponse:[String:Any] = self.toJSON();
            
            var htmlString = "<form method=\"post\" name=\"form\" action=\""+getUrl()+"\">";
            for ship in jsonResponse {
                var k:String = ship.key;
                var v:String = ship.value as! String;
                htmlString += "\n";
                htmlString += "<input type=\"hidden\" name=\"";
                htmlString += k.uppercased();
                htmlString += "\" value=\"";
                htmlString += v;
                htmlString += "\">";
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

public class RefundRequestWrapperDev : RefundRequest{
    public required init?(map: Map) {
        super.init(map: map);
    }
    public required init(user:FaspayUserCredit , MERCHANT_TRANID:String , TRANSACTIONID:String , AMOUNT:Int , CUSTNAME:String , CUSTEMAIL:String , DESCRIPTION:String , RETURN_URL:String , REFUND_AMOUNT:Int) {
        super.init();

        self.merchantid = user.merchantId;
        self.merchant_tranid = MERCHANT_TRANID;
        self.transactionid = TRANSACTIONID
        self.amount = String(AMOUNT)+".00";
        self.custname = CUSTNAME
        self.custemail = CUSTEMAIL
        self.description = DESCRIPTION
        self.return_url = RETURN_URL
        self.refund_amount = String(REFUND_AMOUNT)+".00";
        if let mid = user.merchantId,let pass = user.pass,let mtd = self.merchant_tranid,let
            tid = self.transactionid,let am = self.amount{

            let rawSig = "##"+mid.uppercased()+"##"+pass.uppercased()+"##"+mtd.uppercased()+"##"+am+"##"+tid+"##";
            self.signature = SHA1.hexString(from: rawSig);
        }
    }
    override func getUrl() -> String {
        return "https://fpgdev.faspay.co.id/payment/api";
    }
}


public class RefundRequestWrapperPrd : RefundRequest{
    public required init?(map: Map) {
        super.init(map: map);
    }
    public required init(user:FaspayUserCredit , MERCHANT_TRANID:String , TRANSACTIONID:String , AMOUNT:Int , CUSTNAME:String , CUSTEMAIL:String , DESCRIPTION:String , RETURN_URL:String , REFUND_AMOUNT:Int) {
        super.init();
        
        self.merchantid = user.merchantId;
        self.merchant_tranid = MERCHANT_TRANID;
        self.transactionid = TRANSACTIONID
        self.amount = String(AMOUNT)+".00";
        self.custname = CUSTNAME
        self.custemail = CUSTEMAIL
        self.description = DESCRIPTION
        self.return_url = RETURN_URL
        self.refund_amount = String(REFUND_AMOUNT)+".00";
        if let mid = user.merchantId,let pass = user.pass,let mtd = self.merchant_tranid,let
            tid = self.transactionid,let am = self.amount{
            
            let rawSig = "##"+mid.uppercased()+"##"+pass.uppercased()+"##"+mtd.uppercased()+"##"+am+"##"+tid+"##";
            let sha1 = SHA1.hexString(from: rawSig)
            if let nsha1 = sha1{
                self.signature = nsha1.replacingOccurrences(of: " ", with: "").lowercased()
            }

        }
    }
    override func getUrl() -> String {
            return "https://fpg.faspay.co.id/payment/api";
    }
}

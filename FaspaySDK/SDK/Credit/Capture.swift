//
//  Capture.swift
//  FaspaySDK
//
//  Created by hilman anwarsah on 26/06/19.
//  Copyright © 2019 hilman anwarsah. All rights reserved.
//

import Foundation
import var CommonCrypto.CC_MD5_DIGEST_LENGTH
import func CommonCrypto.CC_MD5
import typealias CommonCrypto.CC_LONG
import ObjectMapper;
public class CaptureRequest:Mappable{
    public init(){
        
    }
    public required init?(map: Map) {
        
        
    }
    public func getHtml()->String?{

        do {
            
            let d:CreateBillingResponse = CreateBillingResponse();
//            d.bill_no = "333";
//            self.amount = "!23123";
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
    
    public func mapping(map: Map) {
        transactiontype <- map["transactiontype"]
        response_type <- map["response_type"]
        merchantid <- map["merchantid"]
        payment_method <- map["payment_method"]
        merchant_tranid <- map["merchant_tranid"]
        transactionid <- map["transactionid"]
        amount <- map["amount"]
        custname <- map["custname"]
        custemail <- map["custemail"]
        description <- map["description"]
        return_url <- map["return_url"]
        signature <- map["signature"]
    }
    
    public    var transactiontype:String = "2";
    public    var response_type:String = "3";
    public    var merchantid:String?;
    public    var payment_method:String = "1";
    public    var merchant_tranid:String?;
    public    var transactionid:String?;
    public    var amount:String?;
    public    var custname:String?;
    public    var custemail:String?;
    public    var description:String?;
    public    var return_url:String?;
    public    var signature:String?;
    func getUrl() -> String {
        return "";
    }
}
public extension String{
    public var md5 : String {
        var edata = self.data(using: .utf8)
        var digest = [UInt8](repeating: 0, count: Int(CC_MD5_DIGEST_LENGTH))
        _ =  edata!.withUnsafeBytes { bytes in
            CC_MD5(bytes, CC_LONG(self.count), &digest)
        }
        var digestHex = ""
        for index in 0..<Int(CC_MD5_DIGEST_LENGTH) {
            digestHex += String(format: "%02x", digest[index])
        }
        return digestHex
    }
    
}
public class CaptureRequestWrapperProd:CaptureRequest{
    public init(user:FaspayUserCredit?,MERCHANT_TRANID:String, TRANSACTIONID:String, AMOUNT:Int,  CUSTNAME:String, CUSTEMAIL:String, DESCRIPTION:String, RETURN_URL:String) {
        super.init();
        if let nuser = user{
            self.merchantid = user?.merchantId;
            self.merchant_tranid = MERCHANT_TRANID;
            self.transactionid = TRANSACTIONID;
            self.amount = String(AMOUNT)+".00";
            self.custname = CUSTNAME;
            self.custemail = CUSTEMAIL;
            self.description = DESCRIPTION;
            self.return_url = RETURN_URL;
            
            
            
            if let mmid = nuser.merchantId , let npass = nuser.pass,let namount = self.amount{
                
                var sigRaw:String =  "##"+mmid.uppercased()+"##"+npass.uppercased()+"##";
                sigRaw +=             MERCHANT_TRANID+"##";
                sigRaw +=             namount+"##";
                sigRaw +=               TRANSACTIONID+"##";
                let sha1 = SHA1.hexString(from: sigRaw);
                if let nsha1 = sha1{
                    self.signature = nsha1.replacingOccurrences(of: " ", with: "").lowercased()
                }
//                self.signature = sha1;
            }
        }
        
        
        
        
    }
    public required init?(map: Map) {
        super.init(map:map);
    }
    override func getUrl() -> String {
        return "https://fpg.faspay.co.id/payment/api";
    }
}

public class CaptureRequestWrapperDev:CaptureRequest{
    public init(user:FaspayUserCredit?,MERCHANT_TRANID:String, TRANSACTIONID:String, AMOUNT:Int,  CUSTNAME:String, CUSTEMAIL:String, DESCRIPTION:String, RETURN_URL:String) {
        super.init();
        if let nuser = user{
            self.merchantid = user?.merchantId;
            self.merchant_tranid = MERCHANT_TRANID;
            self.transactionid = TRANSACTIONID;
            self.amount = String(AMOUNT)+".00";
            self.custname = CUSTNAME;
            self.custemail = CUSTEMAIL;
            self.description = DESCRIPTION;
            self.return_url = RETURN_URL;



            if let mmid = nuser.merchantId , let npass = nuser.pass,let namount = self.amount{

                var sigRaw:String =  "##"+mmid.uppercased()+"##"+npass.uppercased()+"##";
                sigRaw +=             MERCHANT_TRANID+"##";
                sigRaw +=             namount+"##";
                sigRaw +=               TRANSACTIONID+"##";
                let sha1 = SHA1.hexString(from: sigRaw);
                
                if let nsha1 = sha1{
                    self.signature = nsha1.replacingOccurrences(of: " ", with: "").lowercased()
                }
            }
        }



        
    }
    public required init?(map: Map) {
        super.init(map:map);
    }
    override func getUrl() -> String {
        return "https://fpgdev.faspay.co.id/payment/api";
    }
}

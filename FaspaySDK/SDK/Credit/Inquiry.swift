//
//  Inquiry.swift
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
public class InquiryRequestCredit:Mappable {
    public var  transactiontype:String?;
    public var  response_type:String?;
    public var  merchantid:String?;
    public var  payment_method:String?;
    public var  merchant_tranid:String?;
    public var  signature:String?;
    public var  amount:String?;
    var configCredit:FaspayConfigCredit?;
    
    public init(configCredit:FaspayConfigCredit){
        self.configCredit = configCredit;
    }
    
    public required init?(map: Map) {

        
    }
    public func mapping(map: Map) {

        self.transactiontype <- map[" transactiontype"]
        self.response_type <- map[" response_type"]
        self.merchantid <- map[" merchantid"]
        self.payment_method <- map[" payment_method"]
        self.merchant_tranid <- map[" merchant_tranid"]
        self.signature <- map[" signature"]
        self.amount <- map[" amount"]
    }
    public func getHtml()->String?{
        
        do {
            let jsonResponse:[String:Any] = self.toJSON();
            if let liurl = configCredit{
                var htmlString = "<form method=\"post\" name=\"form\" action=\""+liurl.getMerchantInquiryUrl()+"\">";
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
                
            }
            return "";
            
        } catch let Error {
            print("Error",Error);
            return nil;
        }
    }
    
}
public class InquiryRequestCreditWrapper:InquiryRequestCredit{
    
    public var user:FaspayUserCredit?;
    

    public init(configCredit:FaspayConfigCredit ,user:FaspayUserCredit ,   MERCHANT_TRANID:String,amount:Int) {
        super.init(configCredit: configCredit);
        self.user = user;
        
        self.merchant_tranid = MERCHANT_TRANID;
        self.amount = String(amount)+".00";
        self.transactiontype = "4";
        self.response_type = "3";
        self.merchantid = user.merchantId;
        self.payment_method = "1";
        if let nmid = user.merchantId , let npass = user.pass,let namount = self.amount{
            var rawSig = "##"+nmid.uppercased()+"##"+npass.uppercased()+"##"+MERCHANT_TRANID+"##"+namount+"##0##";
            print(rawSig)
            let sha1 = SHA1.hexString(from: rawSig);
            if let nsha1 = sha1{
                self.signature = nsha1.replacingOccurrences(of: " ", with: "").lowercased()
            }

        }

        
//        var rawsig:String = "##"+user.getMerchantId().toUpperCase()).append("##").append(user.getPass().toUpperCase()).append("##").append(MERCHANT_TRANID).append("##").append(getAmount()).append("##0##").toString();
//        System.out.println("raw sign = "+rawsig);
//        self.signature =  new String(Hex.encodeHex(DigestUtils.sha1(rawsig)));
    }
    public required init?(map: Map) {
        super.init(map: map);
        
    }
}

//
//  PaymentWrapper.swift
//  FaspaySDK
//
//  Created by hilman anwarsah on 27/06/19.
//  Copyright © 2019 hilman anwarsah. All rights reserved.
//

import Foundation
import ObjectMapper

public class FaspayPaymentCreditBillData{
    public var billing_address:String?;
    public var billing_address_city:String?;
    public var billing_address_region:String?;
    public var billing_address_state:String?;
    public var billing_address_poscode:String?;
    public var billing_address_country_code:String?;
    public init(billing_address:String?,billing_address_city:String?,billing_address_region:String?,billing_address_state:String?,billing_address_poscode:String?,billing_address_country_code:String?){
        self.billing_address  = billing_address;
        self.billing_address_city  = billing_address_city;
        self.billing_address_region  = billing_address_region;
        self.billing_address_state  = billing_address_state;
        self.billing_address_poscode  = billing_address_poscode;
        self.billing_address_country_code  = billing_address_country_code;
        
    }
}

public class FaspayPaymentCreditCardData{
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
    public init(card_issuer_bank:String?,card_identity_ref_type:String?,card_identity_ref:String?,card_phone:String?,card_bill_addr:String?,card_bill_addr_poscode:String?,card_bill_addr_city:String?,card_bill_addr_region:String?,card_bill_addr_state:String?,card_bill_addr_country_code:String?,card_email:String?){
        self.card_issuer_bank  = card_issuer_bank;
        self.card_identity_ref_type  = card_identity_ref_type;
        self.card_identity_ref  = card_identity_ref;
        self.card_phone  = card_phone;
        self.card_bill_addr  = card_bill_addr;
        self.card_bill_addr_poscode  = card_bill_addr_poscode;
        self.card_bill_addr_city  = card_bill_addr_city;
        self.card_bill_addr_region  = card_bill_addr_region;
        self.card_bill_addr_state  = card_bill_addr_state;
        self.card_bill_addr_country_code  = card_bill_addr_country_code;
        self.card_email  = card_email;
        
    }
}



public class FaspayPaymentCreditConfigApp{
    public var response_type:String?;
    public var return_url:String?;
    public var mparam1:String?;
    public var mparam2:String?;
    public var frisk1,frisk2:String?;
    public var handshake_url:String?;
    public var handshake_param:String?;
    public init(response_type:String?,return_url:String?,mparam1:String?,mparam2:String?,frisk1:String?,frisk2:String?,handshake_url:String?,handshake_param:String?){
        self.response_type  = response_type;
        self.return_url  = return_url;
        self.mparam1  = mparam1;
        self.mparam2  = mparam2;
        self.frisk1  = frisk1;
        self.frisk2 = frisk2;
        self.handshake_url  = handshake_url;
        self.handshake_param  = handshake_param;
        
    }
    init(responseType:String) {
        self.response_type = responseType;
    }
    init(responseType:String,responseUrl:String) {
        self.response_type = responseType;
        self.return_url = responseUrl;
    }
}
public class FaspayPaymentCreditDomicileData {
    public var domicile_address:String?;
    public var domicile_address_city:String?;
    public var domicile_address_region:String?;
    public var domicile_address_state:String?;
    public var domicile_address_poscode:String?;
    public var domicile_address_country_code:String?;
    public var domicile_phone_no:String?;
    public init(domicile_address:String?,domicile_address_city:String?,domicile_address_region:String?,domicile_address_state:String?,domicile_address_poscode:String?,domicile_address_country_code:String?,domicile_phone_no:String?){
        self.domicile_address  = domicile_address;
        self.domicile_address_city  = domicile_address_city;
        self.domicile_address_region  = domicile_address_region;
        self.domicile_address_state  = domicile_address_state;
        self.domicile_address_poscode  = domicile_address_poscode;
        self.domicile_address_country_code  = domicile_address_country_code;
        self.domicile_phone_no  = domicile_phone_no;
        
    }
}

public class FaspayPaymentCreditItemData {
    
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
    public init(mref1:String?,mref2:String?,mref3:String?,mref4:String?,mref5:String?,mref6:String?,mref7:String?,mref8:String?,mref9:String?,mref10:String?){
        self.mref1  = mref1;
        self.mref2  = mref2;
        self.mref3  = mref3;
        self.mref4  = mref4;
        self.mref5  = mref5;
        self.mref6  = mref6;
        self.mref7  = mref7;
        self.mref8  = mref8;
        self.mref9  = mref9;
        self.mref10  = mref10;
    }
    
    public init(mref1:String) {
    self.mref1 = mref1;
    }
    
    public init() {
    }
    
    public init(mref1:String,  mref2:String) {
    self.mref1 = mref1;
    self.mref2 = mref2;
    }
    
    public init(mref1:String,  mref2:String,  mref3:String) {
    self.mref1 = mref1;
    self.mref2 = mref2;
    self.mref3 = mref3;
    }
    
    public init(mref1:String,  mref2:String,  mref3:String,  mref4:String,  mref5:String,  mref6:String,  mref7:String,  mref8:String,  mref9:String,  mref10:String) {
    self.mref1 = mref1;
    self.mref2 = mref2;
    self.mref3 = mref3;
    self.mref4 = mref4;
    self.mref5 = mref5;
    self.mref6 = mref6;
    self.mref7 = mref7;
    self.mref8 = mref8;
    self.mref9 = mref9;
    self.mref10 = mref10;
    }
    
    public init(mref1:String,  mref2:String,  mref3:String,  mref4:String,  mref5:String,  mref6:String,  mref7:String,  mref8:String,  mref9:String) {
    self.mref1 = mref1;
    self.mref2 = mref2;
    self.mref3 = mref3;
    self.mref4 = mref4;
    self.mref5 = mref5;
    self.mref6 = mref6;
    self.mref7 = mref7;
    self.mref8 = mref8;
    self.mref9 = mref9;
    }
    
    public init(mref1:String,  mref2:String,  mref3:String,  mref4:String,  mref5:String,  mref6:String,  mref7:String,  mref8:String) {
    self.mref1 = mref1;
    self.mref2 = mref2;
    self.mref3 = mref3;
    self.mref4 = mref4;
    self.mref5 = mref5;
    self.mref6 = mref6;
    self.mref7 = mref7;
    self.mref8 = mref8;
    }
    
    public init(mref1:String,  mref2:String,  mref3:String,  mref4:String) {
    self.mref1 = mref1;
    self.mref2 = mref2;
    self.mref3 = mref3;
    self.mref4 = mref4;
    }
    
    public init(mref1:String,  mref2:String,  mref3:String,  mref4:String,  mref5:String) {
    self.mref1 = mref1;
    self.mref2 = mref2;
    self.mref3 = mref3;
    self.mref4 = mref4;
    self.mref5 = mref5;
    }
    
    public init(mref1:String,  mref2:String,  mref3:String,  mref4:String,  mref5:String,  mref6:String) {
    self.mref1 = mref1;
    self.mref2 = mref2;
    self.mref3 = mref3;
    self.mref4 = mref4;
    self.mref5 = mref5;
    self.mref6 = mref6;
    }
    
    public init(mref1:String,  mref2:String,  mref3:String,  mref4:String,  mref5:String,  mref6:String,  mref7:String) {
    self.mref1 = mref1;
    self.mref2 = mref2;
    self.mref3 = mref3;
    self.mref4 = mref4;
    self.mref5 = mref5;
    self.mref6 = mref6;
    self.mref7 = mref7;
    }
}


public class FaspayPaymentCreditShippingdata {
    public var receiver_name_for_shipping:String?;
    public var shipping_address:String?;
    public var shipping_address_city:String?;
    public var shipping_address_region:String?;
    public var shipping_address_state:String?;
    public var shipping_address_poscode:String?;
    public var shipping_address_country_code:String?;
    public var shippingcost:String?;
    public init(receiver_name_for_shipping:String?,shipping_address:String?,shipping_address_city:String?,shipping_address_region:String?,shipping_address_state:String?,shipping_address_poscode:String?,shipping_address_country_code:String?,shippingcost:String?){
        self.receiver_name_for_shipping  = receiver_name_for_shipping;
        self.shipping_address  = shipping_address;
        self.shipping_address_city  = shipping_address_city;
        self.shipping_address_region  = shipping_address_region;
        self.shipping_address_state  = shipping_address_state;
        self.shipping_address_poscode  = shipping_address_poscode;
        self.shipping_address_country_code  = shipping_address_country_code;
        self.shippingcost  = shippingcost;
        
    }
}
public class FaspayPaymentCreditShopperData {
    
    public var custname:String?;
    public var custemail:String?;
    public var shopper_ip:String?;
    public var description:String?;
    public var cardno:String?;
    public var cardname:String?;
    public var cardtype:String?;
    public var expirymonth:String?;
    public var expiryyear:String?;
    public var cardcvc:String?;
    public var card_issuer_bank_country_code:String?;
    public var phone_no:String?;
    public var customer_ref:String?;
    public init(custname:String?,custemail:String?,shopper_ip:String?,description:String?,cardno:String?,cardname:String?,cardtype:String?,expirymonth:String?,expiryyear:String?,cardcvc:String?,card_issuer_bank_country_code:String?,phone_no:String?,customer_ref:String?){
        self.custname  = custname;
        self.custemail  = custemail;
        self.shopper_ip  = shopper_ip;
        self.description  = description;
        self.cardno  = cardno;
        self.cardname  = cardname;
        self.cardtype  = cardtype;
        self.expirymonth  = expirymonth;
        self.expiryyear  = expiryyear;
        self.cardcvc  = cardcvc;
        self.card_issuer_bank_country_code  = card_issuer_bank_country_code;
        self.phone_no  = phone_no;
        self.customer_ref  = customer_ref;
        
    }
}


public class FaspayPaymentCreditTransactionData {
    public var merchant_tranid:String?;
    public var currencycode:String?;
    public var amount:Int?;
    public var usr:FaspayUserCredit?;
    public var signature:String?;
    public init(merchant_tranid:String?,currencycode:String?,amount:Int?,usr:FaspayUserCredit?,signature:String?){
        self.merchant_tranid  = merchant_tranid;
        self.currencycode  = currencycode;
        self.amount  = amount;
        self.usr  = usr;
        self.signature  = signature;
        
    }
    func getSignature() -> String {
        if let u = usr,let pass = u.pass, let mid = u.merchantId,let mtid = self.merchant_tranid,let namount = self.amount{
            let xamount = String(namount)+".00";
            
            let rawSig = "##"+mid.uppercased()+"##"+pass.uppercased()+"##"+mtid+"##"+xamount+"##0##";
            
            if let xrawSig = SHA1.hexString(from: rawSig){
                
                return xrawSig.replacingOccurrences(of: " ", with: "").lowercased();
            }
        }
        return "";

    }
}

public class FaspayPaymentCreditWrapperProd:FaspayPaymentCreditProd{
    var shopperData:FaspayPaymentCreditShopperData?;
    /**
     * *
     * TODO PYMT_IND, PYMT_CRITERIA in PROD
     */
    var app:FaspayPaymentCreditConfigApp?;
    var user:FaspayUserCredit?;
    var transactionData:FaspayPaymentCreditTransactionData?;
    var billData:FaspayPaymentCreditBillData?;
    var shippingdata:FaspayPaymentCreditShippingdata?;
    var itemData:FaspayPaymentCreditItemData?;
    var domicileData:FaspayPaymentCreditDomicileData?;
    var cardData:FaspayPaymentCreditCardData?;
    public required  init(user:FaspayUserCredit,transactionData:FaspayPaymentCreditTransactionData,shopperData:FaspayPaymentCreditShopperData,app:FaspayPaymentCreditConfigApp, billData:FaspayPaymentCreditBillData,shippingdata:FaspayPaymentCreditShippingdata,itemData:FaspayPaymentCreditItemData,domicileData:FaspayPaymentCreditDomicileData,cardData:FaspayPaymentCreditCardData) {
        super.init();
        self.card_issuer_bank = cardData.card_issuer_bank;
        self.card_identity_ref_type = cardData.card_identity_ref_type;
        self.card_identity_ref = cardData.card_identity_ref;
        self.card_phone = cardData.card_phone;
        self.card_bill_addr = cardData.card_bill_addr;
        self.card_bill_addr_poscode = cardData.card_bill_addr_poscode;
        self.card_bill_addr_city = cardData.card_bill_addr_city;
        self.card_bill_addr_region = cardData.card_bill_addr_region;
        self.card_bill_addr_state = cardData.card_bill_addr_state;
        self.card_bill_addr_country_code = cardData.card_bill_addr_country_code;
        self.card_email = cardData.card_email;
        self.cardData = cardData;
        
        
        
        self.domicile_address = domicileData.domicile_address;
        self.domicile_address_city = domicileData.domicile_address_city;
        self.domicile_address_region = domicileData.domicile_address_region;
        self.domicile_address_state = domicileData.domicile_address_state;
        self.domicile_address_poscode = domicileData.domicile_address_poscode;
        self.domicile_address_country_code = domicileData.domicile_address_country_code;
        self.domicile_phone_no = domicileData.domicile_phone_no;
        self.domicileData = domicileData;
        
        
        
        self.receiver_name_for_shipping = shippingdata.receiver_name_for_shipping;
        self.shipping_address = shippingdata.shipping_address;
        self.shipping_address_city = shippingdata.shipping_address_city;
        self.shipping_address_region = shippingdata.shipping_address_region;
        self.shipping_address_state = shippingdata.shipping_address_state;
        self.shipping_address_poscode = shippingdata.shipping_address_poscode;
        self.shipping_address_country_code = shippingdata.shipping_address_country_code;
        self.shippingcost = shippingdata.shippingcost;
        self.shippingdata = shippingdata;
        
        
        self.mref1 = itemData.mref1;
        self.mref2 = itemData.mref2;
        self.mref3 = itemData.mref3;
        self.mref4 = itemData.mref4;
        self.mref5 = itemData.mref5;
        self.mref6 = itemData.mref6;
        self.mref7 = itemData.mref7;
        self.mref8 = itemData.mref8;
        self.mref9 = itemData.mref9;
        self.mref10 = itemData.mref10;
        self.itemData = itemData;
        
        
        
        self.response_type = app.response_type;
        self.return_url = app.return_url;
        self.mparam1 = app.mparam1;
        self.mparam2 = app.mparam2;
        self.frisk1 = app.frisk1;
        self.frisk2 = app.frisk2;
        self.handshake_url = app.handshake_url;
        self.handshake_param = app.handshake_param;
        self.app = app;
        
        
        self.billing_address = billData.billing_address;
        self.billing_address_city = billData.billing_address_city;
        self.billing_address_region = billData.billing_address_region;
        self.billing_address_state = billData.billing_address_state;
        self.billing_address_poscode = billData.billing_address_poscode;
        self.billing_address_country_code = billData.billing_address_country_code;
        self.billData = billData;
        
        
        self.merchantid = user.merchantId;
        self.user = user;
        
        
        self.merchant_tranid = transactionData.merchant_tranid;
        self.currencycode = transactionData.currencycode;
        if let tdata = transactionData.amount{
            self.amount = String(tdata)+".00";
        }
        
        
        self.user = transactionData.usr;
        self.signature = transactionData.signature;
        self.transactionData = transactionData;
        
        
        
        self.custname = shopperData.custname;
        self.custemail = shopperData.custemail;
        self.shopper_ip = shopperData.shopper_ip;
        self.description = shopperData.description;
        self.cardno = shopperData.cardno;
        self.cardname = shopperData.cardname;
        self.cardtype = shopperData.cardtype;
        self.expirymonth = shopperData.expirymonth;
        self.expiryyear = shopperData.expiryyear;
        self.cardcvc = shopperData.cardcvc;
        self.card_issuer_bank_country_code = shopperData.card_issuer_bank_country_code;
        self.phone_no = shopperData.phone_no;
        self.customer_ref = shopperData.customer_ref;
        self.shopperData = shopperData;
        
        self.merchant_tranid = transactionData.merchant_tranid;
        //PYMT IND
        self.pymt_ind = "card_range_ind";
        self.pymt_criteria = "credit_card";
        //PYMT CRIT
        self.currencycode = transactionData.currencycode;
        
        if let namount = transactionData.amount {
            self.amount = String(namount)+".00";
        }
        self.signature = transactionData.getSignature();
        
    }
    
    public required init?(map: Map) {
        super.init(map: map)
    }
    
    
    

}

public class FaspayPaymentCreditWrapperDev:FaspayPaymentCreditDev{
    var shopperData:FaspayPaymentCreditShopperData?;
    /**
     * *
     * TODO PYMT_IND, PYMT_CRITERIA in PROD
     */
    var app:FaspayPaymentCreditConfigApp?;
    var user:FaspayUserCredit?;
    var transactionData:FaspayPaymentCreditTransactionData?;
    var billData:FaspayPaymentCreditBillData?;
    var shippingdata:FaspayPaymentCreditShippingdata?;
    var itemData:FaspayPaymentCreditItemData?;
    var domicileData:FaspayPaymentCreditDomicileData?;
    var cardData:FaspayPaymentCreditCardData?;
    public required  init(user:FaspayUserCredit,transactionData:FaspayPaymentCreditTransactionData,shopperData:FaspayPaymentCreditShopperData,app:FaspayPaymentCreditConfigApp, billData:FaspayPaymentCreditBillData,shippingdata:FaspayPaymentCreditShippingdata,itemData:FaspayPaymentCreditItemData,domicileData:FaspayPaymentCreditDomicileData,cardData:FaspayPaymentCreditCardData) {
        super.init();
        self.card_issuer_bank = cardData.card_issuer_bank;
        self.card_identity_ref_type = cardData.card_identity_ref_type;
        self.card_identity_ref = cardData.card_identity_ref;
        self.card_phone = cardData.card_phone;
        self.card_bill_addr = cardData.card_bill_addr;
        self.card_bill_addr_poscode = cardData.card_bill_addr_poscode;
        self.card_bill_addr_city = cardData.card_bill_addr_city;
        self.card_bill_addr_region = cardData.card_bill_addr_region;
        self.card_bill_addr_state = cardData.card_bill_addr_state;
        self.card_bill_addr_country_code = cardData.card_bill_addr_country_code;
        self.card_email = cardData.card_email;
        self.cardData = cardData;
        
        
        
        self.domicile_address = domicileData.domicile_address;
        self.domicile_address_city = domicileData.domicile_address_city;
        self.domicile_address_region = domicileData.domicile_address_region;
        self.domicile_address_state = domicileData.domicile_address_state;
        self.domicile_address_poscode = domicileData.domicile_address_poscode;
        self.domicile_address_country_code = domicileData.domicile_address_country_code;
        self.domicile_phone_no = domicileData.domicile_phone_no;
        self.domicileData = domicileData;
        
        
        
        self.receiver_name_for_shipping = shippingdata.receiver_name_for_shipping;
        self.shipping_address = shippingdata.shipping_address;
        self.shipping_address_city = shippingdata.shipping_address_city;
        self.shipping_address_region = shippingdata.shipping_address_region;
        self.shipping_address_state = shippingdata.shipping_address_state;
        self.shipping_address_poscode = shippingdata.shipping_address_poscode;
        self.shipping_address_country_code = shippingdata.shipping_address_country_code;
        self.shippingcost = shippingdata.shippingcost;
        self.shippingdata = shippingdata;
        
        
        self.mref1 = itemData.mref1;
        self.mref2 = itemData.mref2;
        self.mref3 = itemData.mref3;
        self.mref4 = itemData.mref4;
        self.mref5 = itemData.mref5;
        self.mref6 = itemData.mref6;
        self.mref7 = itemData.mref7;
        self.mref8 = itemData.mref8;
        self.mref9 = itemData.mref9;
        self.mref10 = itemData.mref10;
        self.itemData = itemData;
        
        
        
        self.response_type = app.response_type;
        self.return_url = app.return_url;
        self.mparam1 = app.mparam1;
        self.mparam2 = app.mparam2;
        self.frisk1 = app.frisk1;
        self.frisk2 = app.frisk2;
        self.handshake_url = app.handshake_url;
        self.handshake_param = app.handshake_param;
        self.app = app;
        
        
        self.billing_address = billData.billing_address;
        self.billing_address_city = billData.billing_address_city;
        self.billing_address_region = billData.billing_address_region;
        self.billing_address_state = billData.billing_address_state;
        self.billing_address_poscode = billData.billing_address_poscode;
        self.billing_address_country_code = billData.billing_address_country_code;
        self.billData = billData;
        
        
        self.merchantid = user.merchantId;
        self.user = user;
        
        
        self.merchant_tranid = transactionData.merchant_tranid;
        self.currencycode = transactionData.currencycode;
        if let tdata = transactionData.amount{
            self.amount = String(tdata)+".00";
        }

        
        self.user = transactionData.usr;
        self.signature = transactionData.signature;
        self.transactionData = transactionData;
        
        
        
        self.custname = shopperData.custname;
        self.custemail = shopperData.custemail;
        self.shopper_ip = shopperData.shopper_ip;
        self.description = shopperData.description;
        self.cardno = shopperData.cardno;
        self.cardname = shopperData.cardname;
        self.cardtype = shopperData.cardtype;
        self.expirymonth = shopperData.expirymonth;
        self.expiryyear = shopperData.expiryyear;
        self.cardcvc = shopperData.cardcvc;
        self.card_issuer_bank_country_code = shopperData.card_issuer_bank_country_code;
        self.phone_no = shopperData.phone_no;
        self.customer_ref = shopperData.customer_ref;
        self.shopperData = shopperData;
        
        self.merchant_tranid = transactionData.merchant_tranid;
        //PYMT IND
        //PYMT CRIT
        self.currencycode = transactionData.currencycode;
        
        if let namount = transactionData.amount {
            self.amount = String(namount)+".00";
        }
        self.signature = transactionData.getSignature();

    }
    
    public required init?(map: Map) {
        super.init(map: map)
    }
    
    
    
    
}

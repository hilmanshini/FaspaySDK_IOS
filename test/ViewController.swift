//
//  ViewController.swift
//  test
//
//  Created by hilman anwarsah on 26/06/19.
//  Copyright © 2019 hilman anwarsah. All rights reserved.
//

import UIKit
import FaspaySDK
import WebKit
class ViewController: UIViewController {
    var user : FaspayUserCredit;
    var conf :FaspayConfigCredit;
    public required init?(coder: NSCoder) {
        self.user = FaspayUserCredit();
        self.user.merchantId = "commonwealth";
        self.user.pass = "abcde";
        conf = FaspayConfigCreditDev();
        super.init(coder: coder)

    }
//    private var webView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        testInquiry()
        

    }
    func testRefund(){
        let merchant_tranId = "";
        let tranId = "";
        let amount = 100000;

            let d = RefundRequestWrapperDev(user: user, MERCHANT_TRANID: merchant_tranId, TRANSACTIONID: tranId, AMOUNT: amount, CUSTNAME: "ha@ha.com", CUSTEMAIL: "ha@ha.com", DESCRIPTION: "123123", RETURN_URL: "http://www.google.com", REFUND_AMOUNT: 100000)
            loadHtml(x: d.getHtml())
        
    }
    
    func testVoid(){
//        let e =         XMLParser;
//        e.
        let merchant_tranId = "39565014-1ED0-4933-B7C0-FC2031E0130C";
        let tranId = "84DBA1CA-051F-4CFD-A020-DDBB94498276";
        let amount = 100000;

            let d = VoidRequestWrapperDev(user: user, MERCHANT_TRANID: merchant_tranId, TRANSACTIONID: tranId, AMOUNT: amount, CUSTNAME: "haha@haha.com", CUSTEMAIL: "haha@haha.com", DESCRIPTION: "123123", RETURN_URL: "http://www.google.com")
            loadHtml(x: d.getHtml())
        
    }
    func testInquiry(){
        let tranId = "39565014-1ED0-4933-B7C0-FC2031E0130C";
        
            let d =             InquiryRequestCreditWrapper(configCredit: conf  , user: user, MERCHANT_TRANID: tranId, amount: 100000)
            loadHtml(x: d.getHtml())
        

    }
    func testCreate(){
        let uuid = UUID.init().uuidString;
        let merchantTranId = "";
        let transData = FaspayPaymentCreditTransactionData(merchant_tranid: uuid, currencycode: "IDR", amount: 100000, usr: user, signature: "")
        let shopperData = FaspayPaymentCreditShopperData(custname: "ha", custemail: "haha@haha.com", shopper_ip: "123123123", description: "123123123", cardno: "112312313", cardname: "123123", cardtype: FaspayPaymentCredit.CARD_TYPE_VISA, expirymonth: "10", expiryyear: "2020", cardcvc: "123123123", card_issuer_bank_country_code: "", phone_no: "", customer_ref: "")
        let configApp = FaspayPaymentCreditConfigApp(response_type: FaspayPaymentCredit.RESPONSE_TYPE_POST, return_url: "https://programmermiskin.chickenkiller.com/faspay/api/notify", mparam1: "", mparam2: "", frisk1: "", frisk2: "", handshake_url: "", handshake_param: "")
        let BillData = FaspayPaymentCreditBillData(billing_address: "123", billing_address_city: "123", billing_address_region: "123", billing_address_state: "123", billing_address_poscode: "123", billing_address_country_code: "ID")
        let shipData = FaspayPaymentCreditShippingdata(receiver_name_for_shipping: "5", shipping_address: "5", shipping_address_city: "5", shipping_address_region: "5", shipping_address_state: "5", shipping_address_poscode: "5", shipping_address_country_code: "5", shippingcost: "5")
        let itemData = FaspayPaymentCreditItemData(mref1: "Racun Tikus",mref2:"Bubur Ayam",mref3 :"Pil KB")
        let domData = FaspayPaymentCreditDomicileData(domicile_address: "", domicile_address_city: "", domicile_address_region: "", domicile_address_state: "", domicile_address_poscode: "", domicile_address_country_code: "", domicile_phone_no: "")
        let cardData = FaspayPaymentCreditCardData(card_issuer_bank: "", card_identity_ref_type: "", card_identity_ref: "", card_phone: "", card_bill_addr: "", card_bill_addr_poscode: "", card_bill_addr_city: "", card_bill_addr_region: "", card_bill_addr_state: "", card_bill_addr_country_code: "", card_email: "")

            let w = FaspayPaymentCreditWrapperDev(user: user, transactionData: transData, shopperData: shopperData, app: configApp, billData: BillData, shippingdata: shipData, itemData: itemData, domicileData: domData, cardData: cardData)

            if w.merchantid == nil{
                print("nil")
            } else {
                print("ndata = "+w.merchantid!);
                loadHtml(x: w.getHtml());

            }
           
        
        
    }
    func testCapture(){
        let d = CaptureRequestWrapperDev(user: user, MERCHANT_TRANID: "39565014-1ED0-4933-B7C0-FC2031E0130C", TRANSACTIONID: "84DBA1CA-051F-4CFD-A020-DDBB94498276", AMOUNT: 10000, CUSTNAME: "dddd", CUSTEMAIL: "haha@haha.com", DESCRIPTION: "1231231231331", RETURN_URL: "https://programmermiskin.chickenkiller.com/faspay/api/notify");


        
        let x = d.getHtml();
        loadHtml(x: x);

    }
    func loadHtml(x:String?){
        let preferences = WKPreferences()
        preferences.javaScriptEnabled = true
        let configuration = WKWebViewConfiguration()
        configuration.preferences = preferences
        let webView = WKWebView(frame: view.bounds, configuration: configuration)
        if let HtmlNoNull:String = x{
          //  let url = URL(string: "https://www.google.com")
            //let urlRequest = URLRequest(url: url!)
            print("DX = "+HtmlNoNull);
            // enable JS
            webView.configuration.preferences.javaScriptEnabled = true
            webView.loadHTMLString(HtmlNoNull, baseURL: Bundle.main.bundleURL);
            view.addSubview(webView)
        }
    }


}


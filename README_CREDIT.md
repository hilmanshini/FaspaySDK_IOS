# FaspaySDK_IOS_CREDIT


Faspay SDK Credit mostly use html to show form and user must fill the form


# Faspay Debit 
to begin create the base service


```swift
self.user = FaspayUserCredit();
self.user.merchantId = "test_migs_f3ds";
self.user.pass = "abcde";
conf = FaspayConfigCreditProd();
super.init(coder: coder)
```

and function to display html


```swift
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

```
# Create Payment 
create all objects
```swift
//create UUID for trans id
let uuid = UUID.init().uuidString;
let merchantTranId = "";
//create transaction data
let transData = FaspayPaymentCreditTransactionData(merchant_tranid: uuid, currencycode: "IDR", amount: 100000, usr: user, signature: "")
//create shopper data
let shopperData = FaspayPaymentCreditShopperData(custname: "ha", custemail: "haha@haha.com", shopper_ip: "123123123", description: "123123123", cardno: "112312313", cardname: "123123", cardtype: FaspayPaymentCredit.CARD_TYPE_VISA, expirymonth: "10", expiryyear: "2020", cardcvc: "123123123", card_issuer_bank_country_code: "", phone_no: "", customer_ref: "")
let configApp = FaspayPaymentCreditConfigApp(response_type: FaspayPaymentCredit.RESPONSE_TYPE_POST, return_url: "https://programmermiskin.chickenkiller.com/faspay/api/notify", mparam1: "", mparam2: "", frisk1: "", frisk2: "", handshake_url: "", handshake_param: "")
let BillData = FaspayPaymentCreditBillData(billing_address: "123", billing_address_city: "123", billing_address_region: "123", billing_address_state: "123", billing_address_poscode: "123", billing_address_country_code: "ID")
let shipData = FaspayPaymentCreditShippingdata(receiver_name_for_shipping: "5", shipping_address: "5", shipping_address_city: "5", shipping_address_region: "5", shipping_address_state: "5", shipping_address_poscode: "5", shipping_address_country_code: "5", shippingcost: "5")
let itemData = FaspayPaymentCreditItemData(mref1: "Racun Tikus",mref2:"Bubur Ayam",mref3 :"Pil KB")
let domData = FaspayPaymentCreditDomicileData(domicile_address: "", domicile_address_city: "", domicile_address_region: "", domicile_address_state: "", domicile_address_poscode: "", domicile_address_country_code: "", domicile_phone_no: "")
let cardData = FaspayPaymentCreditCardData(card_issuer_bank: "", card_identity_ref_type: "", card_identity_ref: "", card_phone: "", card_bill_addr: "", card_bill_addr_poscode: "", card_bill_addr_city: "", card_bill_addr_region: "", card_bill_addr_state: "", card_bill_addr_country_code: "", card_email: "")

let w = FaspayPaymentCreditWrapperProd(user: user, transactionData: transData, shopperData: shopperData, app: configApp, billData: BillData, shippingdata: shipData, itemData: itemData, domicileData: domData, cardData: cardData)

if w.merchantid == nil{
print("nil")
} else {
print("ndata = "+w.merchantid!);
loadHtml(x: w.getHtml());

}

```


# Refund  Payment


```swift
let merchant_tranId = "";
let tranId = "";
let amount = 100000;

let d = RefundRequestWrapperDev(user: user, MERCHANT_TRANID: merchant_tranId, TRANSACTIONID: tranId, AMOUNT: amount, CUSTNAME: "ha@ha.com", CUSTEMAIL: "ha@ha.com", DESCRIPTION: "123123", RETURN_URL: "http://www.google.com", REFUND_AMOUNT: 100000)
loadHtml(x: d.getHtml())
```

# Void Payment 


```swift
let merchant_tranId = "9CDAA63D-BBD2-4BFF-9128-10DD3B348A30";
let tranId = "75CC5428-3A2C-496C-B28C-D2DFD2F57FE6";
let amount = 100000;

let d = VoidRequestWrapperProd(user: user, MERCHANT_TRANID: merchant_tranId, TRANSACTIONID: tranId, AMOUNT: amount, CUSTNAME: "haha@haha.com", CUSTEMAIL: "haha@haha.com", DESCRIPTION: "123123", RETURN_URL: "http://www.google.com")
loadHtml(x: d.getHtml())
```


# Inquiry Payment
```swift
let tranId = "";

let d =             InquiryRequestCreditWrapper(configCredit: conf  , user: user, MERCHANT_TRANID: tranId, amount: 100000)
loadHtml(x: d.getHtml())
```



# Capture Payment


```swift
let d = CaptureRequestWrapperProd(user: user, MERCHANT_TRANID: "c0f4dbe47d27490e81a03ee771be6b47", TRANSACTIONID: "110B90DB-DA6C-4FEC-8ACD-C1DBF78A2E61", AMOUNT: 10000, CUSTNAME: "dddd", CUSTEMAIL: "haha@haha.com", DESCRIPTION: "1231231231331", RETURN_URL: "https://programmermiskin.chickenkiller.com/faspay/api/notify");



let x = d.getHtml();
loadHtml(x: x);
```

# FaspaySDK_IOS



Sdk for developing faspay API the platform that works with this SDK:

    - iOS


this sdk contains 2 parts of payment ,debit and credit, debit mostly use POST Rest API with json, all objects are wrapped
for faspay credit - __[click here ](https://github.com/hilmanshini/FaspaySDK_IOS/blob/master/README_CREDIT.md)__ - 



# Faspay Debit 
to begin create the base service


```swift

//create user
let user = FaspayUser(merchantName: "SINTESA", merchantId: "32254", userId: "bot32254", password: "p@ssw0rd", redirectUrl: "<#T##String#>")
//create config dev or prod
let config = FaspayConfigDev(withUser: user)
let service = FaspayServiceImpl(config: config)



```


# Inquiry Payment Channel

to get list of payment channel

```swift
//create callback
class callbackInquirt : FaspayInquiryServiceCallback{
    func onErrorGetPaymentChannel(e: Error) {

    }
    func onUserNotRegistered(ur: UnregisteredError) {

    }
    func onGetPaymentChannel(channel: [FaspayPaymentChannel]) {
    print(channel.count)
    }

//
service.inquiryPaymentChannel(mCallback: callbackInquirt())
```


# Create Payment
```swift
//create callback
class callback:FaspayCreateBillingServiceCallback{
    func onErrorGetPaymentResponse(e: Error) {
    print("error");

    }
    func onUserNotRegistered(ur: UnregisteredError) {
    print("unreg");
    }
    func onGetPaymentResponse(response: FaspayPaymentResponse) {
    print("get response '");
    }
}

// mock channel or get from inquiry
var mockChannel = FaspayPaymentChannel()
mockChannel.pg_code = "402"
mockChannel.pg_name = "Alpha"

//create the list of items
var items:[FaspayPayment] = []
items.append(FaspayPayment(product: "Item 1", qty: "1", amount: "100000", payment_plan: FaspayPayment.PAYMENT_PLAN_INSTALLMENT, merchant_id: config.faspayUser.merchantId, tenor: FaspayPayment.TENOR_6MONTHS))
items.append(FaspayPayment(product: "Item 2", qty: "1", amount: "100000", payment_plan: FaspayPayment.PAYMENT_PLAN_INSTALLMENT, merchant_id: config.faspayUser.merchantId, tenor: FaspayPayment.TENOR_6MONTHS))
items.append(FaspayPayment(product: "Item 3", qty: "1", amount: "100000", payment_plan: FaspayPayment.PAYMENT_PLAN_INSTALLMENT, merchant_id: config.faspayUser.merchantId, tenor: FaspayPayment.TENOR_6MONTHS))


//create bill data
let bill_data = FaspayPaymentRequestBillData(billNo: "123123", billDesc: "x", expiredDayInterval: 10, billTotal: "100000", items: items)
//create user data
let user_bill_data = FaspayPaymentRequestUserData(msisdn: "08123123", email: "hil@hil.com", terminal: String(FaspayPaymentRequestWrapper.TERMINAL_TAB_APP_ANDROID), custNo: "123123", custName: "hahaha")
//create shipping data
let user_shipping_data = FaspayPaymentRequestShippingData()

//wrap and send
if let xlet = FaspayPaymentRequestWrapper(config: config, bill_data: bill_data, pc: mockChannel, userdata: user_bill_data, shippingData: user_shipping_data) {
xlet.pay_type = String(FaspayPaymentRequestWrapper.PAY_TYPE_INSTALLMENT)
service.createBilling(mFaspayPaymentRequest: xlet, mCallback: callback())

}


```


# Inquiry payment status

```swift
class callbackStatusPayment:FaspayInquiryPaymentStatusCallback{
        func onErrorGetInquiryPaymentStatusResponse(e: Error) {
        print("error ");
        }
        func onGetInquiryPaymentStatusResponse(response: FaspayPaymentStatusResponse) {
        print("success ");
        }
        func onUserNotRegistered(ur: UnregisteredError) {
        print("unreg");
        }
}

let trxId = "8986322540000976"
let bill_no = "123123"
let user = FaspayUser(merchantName: "SINTESA", merchantId: "32254", userId: "bot32254", password: "p@ssw0rd", redirectUrl: "T##String")

let config = FaspayConfigDev(withUser: user)
let service = FaspayServiceImpl(config: config)
if let reqStatus = FaspayPaymentStatusRequestWrapper(request: "", trxId: trxId, bill_no: bill_no, config: config){
service.inqueryPaymentStatus(mRequest: reqStatus, mCallback: callbackStatusPayment())
}
```


# Cancel Payment
```swift
class callbackCancen : FaspayCancelPaymentCallback{
    func onCancelPaymentSuccess(channel: FaspayCancelPaymentResponse) {

    }
    func onUserNotRegistered(ur: UnregisteredError) {

    }
    func onErrorRequstCancelPayment(e: Error) {
    print(e)
    }
}
let trxId = "8986322540000976"
let bill_no = "123123"
let user = FaspayUser(merchantName: "SINTESA", merchantId: "32254", userId: "bot32254", password: "p@ssw0rd", redirectUrl: "T##String")

let config = FaspayConfigDev(withUser: user)
let service = FaspayServiceImpl(config: config)

let reqCancel = FaspayCancelPaymentRequestWrapper(trxId: trxId, billNo: bill_no, paymentCancel: "tttttt ", mFaspayConfig: config)
service.cancelTransaction(mFaspayCancelPaymentRequest: reqCancel, mCallback: callbackCancen())
```

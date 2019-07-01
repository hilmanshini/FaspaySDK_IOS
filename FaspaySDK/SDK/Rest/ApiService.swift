//
//  ApiServiceV2.swift
//  TestApp
//
//  Created by hilman anwarsah on 05/06/19.
//  Copyright © 2019 hilman anwarsah. All rights reserved.
//

import Foundation
//import ObjectMapper
import var CommonCrypto.CC_MD5_DIGEST_LENGTH
import func CommonCrypto.CC_MD5
import typealias CommonCrypto.CC_LONG
import ObjectMapper

import Alamofire
public protocol  ApiService {
    func sendRequestHttpPost(url:String,data:String,headers: Dictionary<String,String>,c:ApiServiceCallbackString);
    func sendRequestHttpPost(url:String,data:String,c: ApiServiceCallbackString);
    func sendRequestHttpPost(url:String,data:Data,headers: Dictionary<String,String>,c:ApiServiceCallbackString);
    func sendRequestHttpPost(url:String,data:Data,c: ApiServiceCallbackString);
}
public protocol ApiServiceCallbackString {
    func onGetResponse(data:String) ->Void ;
    func onGetError(data:Error) ->Void ;
}
public protocol ApiServiceCallbackData {
    func onGetResponse(data:String) ->Void ;
    func onGetError(data:Error) ->Void ;
}











public class ApiServiceImpl :ApiService{
    let config:FaspayConfig;
    public var errorHandlerCallback:UnregisteredErrorCallback? ;
    init(config:FaspayConfig) {
        self.config = config;
        errorHandlerCallback = nil
    }
    public     func sendRequestHttpPost(url: String, data: String, c: ApiServiceCallbackString){
        
        if let ndata = data.data(using: .utf8){
            sendRequestHttpPost(url: url, data: ndata, c: c);
        }
        
        
    }
    public     func sendRequestHttpPost(url: String, data: String, headers: Dictionary<String, String>, c: ApiServiceCallbackString) {
        if let ndata = data.data(using: .utf8){
            
            
            
            sendRequestHttpPost(url: url, data: ndata,headers:Dictionary<String,String>(), c: c)
        }
    }
    
    public     func sendRequestHttpPost(url: String, data: Data, c: ApiServiceCallbackString){
        sendRequestHttpPost(url:url, data:data, headers:Dictionary<String,String>(), c:c)
    }
    
    public     func sendRequestHttpPost(url: String, data: Data, headers: Dictionary<String, String>, c: ApiServiceCallbackString) {
        if let reqStr = String(data: data, encoding: .utf8){
            print("send ---> "+reqStr)
        }
        if let urlObj = URL(string: url){
            var request = URLRequest(url: urlObj)
            request.httpMethod = "POST"
            let headers = [ "Content-Type": "application/json" ]
            request.httpBody = data
            request.allHTTPHeaderFields = headers;
            Alamofire.request(request).responseJSON { (response:DataResponse<Any>) in
                var str:String?;
                if let data = response.response{
                    var byte = response.data!;
                    str = String(bytes: byte, encoding: .utf8)
                    if let strprint = str{
                        print("receive <---- "+strprint)
                    }
                    
                }
                if let error = response.error as Error?{
                    
                    c.onGetError(data: error);
                    return;
                }
                print("<<status>> "+response.result.description);
                switch(response.result){
                case .success:
                    var dictonary:NSDictionary?
                    
                    if let str2 = str{

                        
                        if let data = str2.data(using: String.Encoding.utf8) {
                            
                            do {
                                dictonary = try JSONSerialization.jsonObject(with: data, options: []) as? NSDictionary
                                
                                if let myDictionary = dictonary,let selCallback = self.errorHandlerCallback
                                {
                                    if(self.handleUnregistered(raw: str2, col: myDictionary, mCallbackErr: selCallback, callbackApi: c)){
                                        return;
                                    }

                                }
                            } catch let error as NSError {
                                print(error)
                            }
                        }
                        
                        
                        
//                        let x = JSONEncoder.encode([str2]);
                        c.onGetResponse(data: str2);
                    }
                case .failure(let error):
                    c.onGetError(data: error)
                    
                }
                
                
            }
        }
        
    }
    private func handleUnregistered(raw raw:String,col t:NSDictionary,mCallbackErr:UnregisteredErrorCallback ,callbackApi c:ApiServiceCallbackString) ->Bool{
        if let err =  t.object(forKey: "response_error") as? [String:AnyObject]{
            if let err_code = err["response_code"] as? String{
                if Int(err_code) == 40{
                    do{
                        if let ur:UnregisteredError = try Mapper<UnregisteredError>().map(JSONString: raw){
                            mCallbackErr.onUserNotRegistered(ur: ur)
                        }


                    }catch is Error{
                        c.onGetError(data: ErrorParse())
                    }
                    return true;

                }
            }
        }
        return false;


    }
    
    public class ErrorParse:Error{
        
    }
    private func handleError(response:DataResponse<Any>) ->String?{
        guard case let .failure(error) = response.result else { return nil }
        if let error = error as? AFError {
            switch error {
            case .invalidURL(let url):
                print("Invalid URL: \(url) - \(error.localizedDescription)")
            case .parameterEncodingFailed(let reason):
                print("Parameter encoding failed: \(error.localizedDescription)")
                print("Failure Reason: \(reason)")
            case .multipartEncodingFailed(let reason):
                print("Multipart encoding failed: \(error.localizedDescription)")
                print("Failure Reason: \(reason)")
            case .responseValidationFailed(let reason):
                print("Response validation failed: \(error.localizedDescription)")
                print("Failure Reason: \(reason)")
                
                switch reason {
                case .dataFileNil, .dataFileReadFailed:
                    print("Downloaded file could not be read")
                case .missingContentType(let acceptableContentTypes):
                    print("Content Type Missing: \(acceptableContentTypes)")
                case .unacceptableContentType(let acceptableContentTypes, let responseContentType):
                    print("Response content type: \(responseContentType) was unacceptable: \(acceptableContentTypes)")
                case .unacceptableStatusCode(let code):
                    print("Response status code was unacceptable: \(code)")
                }
            case .responseSerializationFailed(let reason):
                print("Response serialization failed: \(error.localizedDescription)")
                print("Failure Reason: \(reason)")
            }
            
            print("Underlying error: \(error.underlyingError)")
        } else if let error = error as? URLError {
            print("URLError occurred: \(error)")
        } else {
            print("Unknown error: \(error)")
        }
        return nil;
    }

}

public protocol UnregisteredErrorCallback{
    func onUserNotRegistered(ur:UnregisteredError) -> Void ;
}

//
//  FaspaySDKTests.swift
//  FaspaySDKTests
//
//  Created by hilman anwarsah on 26/06/19.
//  Copyright © 2019 hilman anwarsah. All rights reserved.
//

import XCTest
import FaspaySDK

class FaspaySDKTests: XCTestCase {

    override func setUp() {

        // Put setup code here. This method is called before the invocation of each test method in the class.

    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        let d = CaptureRequest();
        let e = d.toJSON();
        
        

        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.

        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

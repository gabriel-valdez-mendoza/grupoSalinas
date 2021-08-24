//
//  BancaDigitalTests.swift
//  BancaDigitalTests
//
//  Created by Jorge Parra on 19/08/21.
//

import XCTest
@testable import BancaDigital

class BancaDigitalTests: XCTestCase {

    
    func test_networkManager_response_NotNil(){
        let api = NetworkManager()
        api.get(callback: { response in
            XCTAssertNotNil(response)
        })
    }
    
    
    func test_networkManager_response_count_greaterzero(){
        let api = NetworkManager()
        api.get(callback: { response in
            switch response {
            case .succesfull(list: let list) :
            XCTAssertTrue(list.count>0)
            default : break
            }
        })
    }

}

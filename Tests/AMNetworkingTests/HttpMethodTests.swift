//
//  HttpMethodTests.swift
//  
//  Created by Andrew McGee on 15/09/2023.
//

import XCTest
@testable import AMNetworking

final class HttpMethodTests: XCTestCase {
    func testGetString() throws {
        // GIVEN
        let sut = HttpMethod.get
        
        // WHEN
        let result = sut.string
        
        // THEN
        XCTAssertEqual(result, "GET")
    }
    
    func testPostString() throws {
        // GIVEN
        let sut = HttpMethod.post
        
        // WHEN
        let result = sut.string
        
        // THEN
        XCTAssertEqual(result, "POST")
    }
    
    func testPutString() throws {
        // GIVEN
        let sut = HttpMethod.put
        
        // WHEN
        let result = sut.string
        
        // THEN
        XCTAssertEqual(result, "PUT")
    }
    
    func testPatchString() throws {
        // GIVEN
        let sut = HttpMethod.patch
        
        // WHEN
        let result = sut.string
        
        // THEN
        XCTAssertEqual(result, "PATCH")
    }
    
    func testDeleteString() throws {
        // GIVEN
        let sut = HttpMethod.delete
        
        // WHEN
        let result = sut.string
        
        // THEN
        XCTAssertEqual(result, "DELETE")
    }
}

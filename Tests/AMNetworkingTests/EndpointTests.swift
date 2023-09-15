//
//  EndpointTests.swift
//
//  Created by Andrew McGee on 15/09/2023.
//

import XCTest
@testable import AMNetworking

final class EndpointTests: XCTestCase {
    var sut: Endpoint!
    
    override func setUp() {
        super.setUp()
        sut = SingleEndpoint.stub
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testMakeUrl() throws {
        // WHEN
        let url = try sut.makeUrl()
        
        // THEN
        XCTAssertEqual(url, URL(string: "https://example.com/path?name=value"))
    }
    
    func testMakeUrlThrowsInvalidUrlError() throws {
        // GIVEN
        sut = SingleEndpoint.stubInvalidUrl
        var expectedError: NetworkingError?
        
        // WHEN
        do {
            _ = try sut.makeUrl()
        } catch {
            expectedError = error as? NetworkingError
        }
        
        // THEN
        XCTAssertEqual(expectedError, .invalidUrl)
    }
    
    func testMakeUrlRequest() throws {
        // WHEN
        let urlRequest = try sut.makeUrlRequest(cachePolicy: .useProtocolCachePolicy, timeoutInterval: 60)
        
        // THEN
        XCTAssertEqual(urlRequest.url, URL(string: "https://example.com/path?name=value"))
        XCTAssertEqual(urlRequest.cachePolicy, .useProtocolCachePolicy)
        XCTAssertEqual(urlRequest.timeoutInterval, 60)
        XCTAssertEqual(urlRequest.httpMethod, HttpMethod.get.string)
        XCTAssertEqual(urlRequest.allHTTPHeaderFields, ["name": "value"])
        XCTAssertEqual(urlRequest.httpBody, "data".data(using: .utf8))
    }
    
    func testDefaultValues() throws {
        // GIVEN
        sut = MockEndpoint(scheme: "scheme", host: "host", path: "path")
        
        // THEN
        XCTAssertNil(sut.queryItems)
        XCTAssertNil(sut.httpMethod)
        XCTAssertNil(sut.headerFields)
        XCTAssertNil(sut.body)
    }
}

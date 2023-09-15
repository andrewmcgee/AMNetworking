//
//  DefaultHttpClientTests.swift
//
//  Created by Andrew McGee on 15/09/2023.
//

import XCTest
@testable import AMNetworking

final class DefaultHttpClientTests: XCTestCase {
    var sut: DefaultHttpClient!
    
    override func setUpWithError() throws {
        let configuration = URLSessionConfiguration.default
        configuration.protocolClasses = [MockURLProtocol.self]
        let urlSession = URLSession(configuration: configuration)
        sut = DefaultHttpClient(urlSession: urlSession)
        try super.setUpWithError()
    }
    
    override func tearDownWithError() throws {
        sut = nil
        MockURLProtocol.requestHandler = nil
        super.tearDown()
    }

    func testPerformRequestWhenSuccess() async throws {
        // GIVEN
        MockURLProtocol.requestHandler = { request in
            guard let response = HTTPURLResponse(
                url: request.url!,
                statusCode: 200,
                httpVersion: nil,
                headerFields: nil
            ) else {
                fatalError("Unable to construct HTTPURLResponse")
            }
            return (response, .stub)
        }
        let endpoint = SingleEndpoint.stub
        
        // WHEN
        let responseData = try await sut.performRequest(to: endpoint)
        
        // THEN
        XCTAssertEqual(responseData, .stub)
    }
    
    func testPerformRequestWhenRequestError() async throws {
        // GIVEN
        MockURLProtocol.requestHandler = { request in
            throw MockError.error
        }
        let endpoint = SingleEndpoint.stub
        var expectedError: NetworkingError?
        
        // WHEN
        do {
            _ = try await sut.performRequest(to: endpoint)
        } catch {
            expectedError = error as? NetworkingError
        }
        
        // THEN
        XCTAssertEqual(expectedError, .requestError)
    }
    
    
    func testPerformRequestWhenUnexpectedResponse() async throws {
        // GIVEN
        MockURLProtocol.requestHandler = { request in
            return (URLResponse(), Data())
        }
        let endpoint = SingleEndpoint.stub
        var expectedError: NetworkingError?
        
        // WHEN
        do {
            _ = try await sut.performRequest(to: endpoint)
        } catch {
            expectedError = error as? NetworkingError
        }
        
        // THEN
        XCTAssertEqual(expectedError, .unexpectedResponse)
    }
    
    func testPerformRequestWhenResponseError() async throws {
        // GIVEN
        MockURLProtocol.requestHandler = { request in
            guard let response = HTTPURLResponse(
                url: request.url!,
                statusCode: 400,
                httpVersion: nil,
                headerFields: nil
            ) else {
                fatalError("Unable to construct HTTPURLResponse")
            }
            return (response, .stub)
        }
        let endpoint = SingleEndpoint.stub
        var expectedError: NetworkingError?
        
        // WHEN
        do {
            _ = try await sut.performRequest(to: endpoint)
        } catch {
            expectedError = error as? NetworkingError
        }
        
        // THEN
        XCTAssertEqual(expectedError, .responseError(statusCode: 400))
    }
}

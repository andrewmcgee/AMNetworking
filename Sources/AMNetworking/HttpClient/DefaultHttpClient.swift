//
//  DefaultHttpClient.swift
//  
//  Created by Andrew McGee on 14/09/2023.
//

import Foundation

public struct DefaultHttpClient: HttpClient {
    public let urlSession: URLSession
    
    public init(urlSession: URLSession = .shared) {
        self.urlSession = urlSession
    }

    public func performRequest(
        to endpoint: Endpoint,
        cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy,
        timeoutInterval: TimeInterval = 60.0
    ) async throws -> Data {
        do {
            let urlRequest = try createRequest(
                for: endpoint,
                cachePolicy: cachePolicy,
                timeoutInterval: timeoutInterval
            )
            let (data, response)  = try await perform(request: urlRequest)
            try validate(response: response)
            return data
        } catch {
            throw error
        }
    }
    
    private func createRequest(
        for endpoint: Endpoint,
        cachePolicy: URLRequest.CachePolicy,
        timeoutInterval: TimeInterval
    ) throws -> URLRequest {
        try endpoint.makeUrlRequest(cachePolicy: cachePolicy, timeoutInterval: timeoutInterval)
    }
    
    private func perform(request: URLRequest) async throws -> (Data, URLResponse) {
        do {
            return try await urlSession.data(for: request)
        } catch {
            throw NetworkingError.requestError
        }
    }
    
    private func validate(response: URLResponse) throws {
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkingError.unexpectedResponse
        }
        guard (200...299).contains(httpResponse.statusCode) else {
            throw NetworkingError.responseError(statusCode: httpResponse.statusCode)
        }
    }
}

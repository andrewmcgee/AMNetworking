//
//  HttpClient.swift
//
//  Created by Andrew McGee on 14/09/2023.
//

import Foundation

/// Defines any http client used to perform network requests by passing in any given `Endpoint`.
protocol HttpClient {
    
    /// Performs a network request for the given `Endpoint`.
    /// - Parameters:
    ///   - endpoint: The `Endpoint` for the request.
    ///   - cachePolicy: The cache policy to use for the request.
    ///   - timeoutInterval: The `TimeInterval` to be used when making the request.
    /// - Returns: The `Data` provided in the endpoint's response.
    func performRequest(
        to endpoint: Endpoint,
        cachePolicy: URLRequest.CachePolicy,
        timeoutInterval: TimeInterval
    ) async throws -> Data
}

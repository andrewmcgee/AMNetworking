//
//  HttpClient.swift
//
//  Created by Andrew McGee on 14/09/2023.
//

import Foundation

protocol HttpClient {
    func performRequest(
        to endpoint: Endpoint,
        cachePolicy: URLRequest.CachePolicy,
        timeoutInterval: TimeInterval
    ) async throws -> Data
}

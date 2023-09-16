//
//  Endpoint+Extensions.swift
//
//  Created by Andrew McGee on 15/09/2023.
//

import Foundation

// MARK: - Default values

public extension Endpoint {
    var queryItems: [String: String?]? {
        nil
    }
    
    var httpMethod: HttpMethod? {
        nil
    }
    
    var headerFields: [String: String]? {
        nil
    }
    
    var body: Data? {
        nil
    }
}

// MARK: - Helper methods

extension Endpoint {
    func makeUrl() throws -> URL {
        var components = URLComponents()
        components.scheme = scheme
        components.host = host
        components.path = path
        components.queryItems = queryItems?.map { URLQueryItem(name: $0, value: $1) }
        guard let url = components.url else {
            throw NetworkingError.invalidUrl
        }
        return url
    }
    
    func makeUrlRequest(
        cachePolicy: URLRequest.CachePolicy,
        timeoutInterval: TimeInterval
    ) throws -> URLRequest {
        let url = try makeUrl()
        var urlRequest = URLRequest(url: url, cachePolicy: cachePolicy, timeoutInterval: timeoutInterval)
        urlRequest.httpMethod = httpMethod?.string
        urlRequest.allHTTPHeaderFields = headerFields
        urlRequest.httpBody = body
        return urlRequest
    }
}

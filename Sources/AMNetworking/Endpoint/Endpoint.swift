//
//  Endpoint.swift
//
//  Created by Andrew McGee on 14/09/2023.
//

import Foundation

public protocol Endpoint {
    var scheme: String { get }
    var host: String { get }
    var path: String { get }
    var queryItems: [String: String?]? { get }
    var httpMethod: HttpMethod? { get }
    var headers: [String: String]? { get }
    var body: Data? { get }
}

public extension Endpoint {
    var queryItems: [String: String?]? {
        nil
    }
    
    var httpMethod: HttpMethod? {
        nil
    }
    
    var body: Data? {
        nil
    }
    
    var headers: [String: String]? {
        nil
    }
}

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
    
    func makeRequest(
        cachePolicy: URLRequest.CachePolicy,
        timeoutInterval: TimeInterval
    ) throws -> URLRequest {
        let url = try makeUrl()
        var urlRequest = URLRequest(url: url, cachePolicy: cachePolicy, timeoutInterval: timeoutInterval)
        urlRequest.httpMethod = httpMethod?.string
        urlRequest.allHTTPHeaderFields = headers
        urlRequest.httpBody = body
        return urlRequest
    }
}

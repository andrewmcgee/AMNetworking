//
//  Endpoint.swift
//
//  Created by Andrew McGee on 14/09/2023.
//

import Foundation

/// Encapsulates the values required to build a URL and URL request for a particular endpoint.
/// Any type adopting this protocol can be passed to an `HttpClient` to perform a request to the endpoint.
public protocol Endpoint {
    var scheme: String { get }
    var host: String { get }
    var path: String { get }
    var queryItems: [String: String?]? { get }
    var httpMethod: HttpMethod? { get }
    var headerFields: [String: String]? { get }
    var body: Data? { get }
}

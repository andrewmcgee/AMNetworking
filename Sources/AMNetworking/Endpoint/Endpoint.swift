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
    var headerFields: [String: String]? { get }
    var body: Data? { get }
}

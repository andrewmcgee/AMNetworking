//
//  SingleEndpoint.swift
//
//  Created by Andrew McGee on 15/09/2023.
//

import Foundation

public struct SingleEndpoint: Endpoint {
    public let scheme: String
    public let host: String
    public let path: String
    public let queryItems: [String: String?]?
    public let httpMethod: HttpMethod?
    public let headers: [String: String]?
    public let body: Data?
}

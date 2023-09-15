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
    public let headerFields: [String: String]?
    public let body: Data?
    
    public init(
        scheme: String,
        host: String,
        path: String,
        queryItems: [String : String?]? = nil,
        httpMethod: HttpMethod? = nil,
        headerFields: [String : String]? = nil,
        body: Data? = nil
    ) {
        self.scheme = scheme
        self.host = host
        self.path = path
        self.queryItems = queryItems
        self.httpMethod = httpMethod
        self.headerFields = headerFields
        self.body = body
    }
}

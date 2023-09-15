//
//  SingleEndpoint+Stubs.swift
//
//  Created by Andrew McGee on 15/09/2023.
//

import Foundation
@testable import AMNetworking

extension SingleEndpoint {
    static let stub = SingleEndpoint(
        scheme: "https",
        host: "example.com",
        path: "/path",
        queryItems: ["name": "value"],
        httpMethod: .get,
        headerFields: ["name": "value"],
        body: "data".data(using: .utf8)
    )
    
    static let stubInvalidUrl = SingleEndpoint(
        scheme: "https",
        host: "",
        path: "path",
        queryItems: ["name": "value"],
        httpMethod: .get,
        headerFields: ["name": "value"],
        body: "data".data(using: .utf8)
    )
}

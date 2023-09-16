//
//  HttpMethod.swift
//  
//  Created by Andrew McGee on 14/09/2023.
//

import Foundation

/// Encapsulates the http methods used when defining `Endpoint` objects to make http requests.
public enum HttpMethod {
    case get
    case post
    case put
    case patch
    case delete
    
    var string: String {
        switch self {
        case .get:
            return "GET"
        case .post:
            return "POST"
        case .put:
            return "PUT"
        case .patch:
            return "PATCH"
        case .delete:
            return "DELETE"
        }
    }
}

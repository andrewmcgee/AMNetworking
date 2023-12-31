//
//  NetworkingError.swift
//
//  Created by Andrew McGee on 14/09/2023.
//

import Foundation

/// Errors thrown by the package.
public enum NetworkingError: Error, Equatable {
    case invalidUrl
    case requestError
    case responseError(statusCode: Int)
    case unexpectedResponse
}

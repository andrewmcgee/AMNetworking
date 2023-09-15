//
//  NetworkingError.swift
//
//  Created by Andrew McGee on 14/09/2023.
//

import Foundation

public enum NetworkingError: Error {
    case requestError
    case unexpectedResponse
    case responseError(statusCode: Int)
    case invalidUrl
}

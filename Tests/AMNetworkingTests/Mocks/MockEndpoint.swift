//
//  MockEndpoint.swift
//
//  Created by Andrew McGee on 15/09/2023.
//

import Foundation
@testable import AMNetworking

struct MockEndpoint: Endpoint {
    let scheme: String
    let host: String
    let path: String
}

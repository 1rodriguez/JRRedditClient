//
//  RedditResponse.swift
//  Reddit Client
//
//  Created by Juan Rodriguez on 2020-07-31.
//  Copyright © 2020 Juan Rodriguez. All rights reserved.
//

import Foundation


struct RedditResponse: Decodable {
    var access_token: String
    var token_type: String
    var expires_in: Int
    var scope: String
    var refresh_token: String? // refresh_token only present in token retrieval, not refresh
}

//
//  RedditResponse.swift
//  Reddit Client
//
//  Created by Juan Rodriguez on 2020-07-31.
//  Copyright © 2020 Juan Rodriguez. All rights reserved.
//

import Foundation

//{
//    "access_token": Your access token,
//    "token_type": "bearer",
//    "expires_in": Unix Epoch Seconds,
//    "scope": A scope string,
//    "refresh_token": Your refresh token
//}


struct RedditResponse: Decodable {
    var access_token: String
    var token_type: String
    var expires_in: String
    var scope: String
//    var refresh_token: String?
}

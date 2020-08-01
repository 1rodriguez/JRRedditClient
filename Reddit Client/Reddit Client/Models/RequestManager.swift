//
//  AuthenticationManager.swift
//  Reddit Client
//
//  Created by Juan Rodriguez on 2020-07-31.
//  Copyright © 2020 Juan Rodriguez. All rights reserved.
//

import Foundation

fileprivate enum RequestType {
    case tokenRetrieve
    case tokenRefresh
    case other
}

fileprivate struct RequestDirector {
    var builder: RequestBuilder?
    
    init(builder: RequestBuilder) {
        self.builder = builder
    }
    
    mutating func changeBuilder(builder: RequestBuilder) {
        self.builder = builder
    }
    
    func make(type: RequestType) {
        
    }
}

fileprivate struct RequestBuilder {
//    var request: URLRequest?
//
//    init(request: URLRequest) {
//        self.request = request
//    }
}

struct RequestManager {
    
    func getIdentity() {
        let url = URL(string: "https://oauth.reddit.com/api/v1/me")!
        
        let clientToken = "586676600006-UEPWWz2BSXvKls31-dyTWMyswxs"
        let unicode = clientToken.data(using: .utf8)
        let encoded = unicode!.base64EncodedString()
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("bearer " + clientToken, forHTTPHeaderField: "Authorization")
        
        
        let session = URLSession(configuration: .default)
        let dataTask = session.dataTask(with: request) { (data, response, error) in
            if let safeData = data {
                let json = try? JSONSerialization.jsonObject(with: safeData, options: .allowFragments)
                
                if let successfulJSON = json {
                    print(successfulJSON)
                }
            }
        }
        dataTask.resume()
    }
    
    func refreshToken() {
        let url = URL(string: "https://www.reddit.com/api/v1/access_token")!
        var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
        
        components.queryItems = [
            URLQueryItem(name: "grant_type", value: "refresh_token"),
            URLQueryItem(name: "refresh_token", value: "586676600006-FCGQNR4pp-3et-5v20YaiIfD05E"),
        ]
        
        let query = components.url!.query
        
        let clientId = "jLY0sGcY8DY2iA:"
        let unicode = clientId.data(using: .utf8)
        let encoded = unicode!.base64EncodedString()
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("Basic " + encoded, forHTTPHeaderField: "Authorization")
        request.httpBody = Data(query!.utf8)
        
        let session = URLSession(configuration: .default)
        let dataTask = session.dataTask(with: request) { (data, response, error) in
            if let safeData = data {
                let json = try? JSONSerialization.jsonObject(with: safeData, options: .allowFragments)
                
                if let successfulJSON = json {
                    print(successfulJSON)
                }
            }
        }
        dataTask.resume()
    }
    
    func getToken() {
        let url = URL(string: "https://www.reddit.com/api/v1/access_token")!
        var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
        
        components.queryItems = [
            URLQueryItem(name: "grant_type", value: "authorization_code"),
            URLQueryItem(name: "code", value: "zoWaXHNVKtxB6uLq_OvcfC3GEYI"),
            URLQueryItem(name: "redirect_uri", value: "https://juanrodriguez.ca")
        ]
        
        let query = components.url!.query
        
        let clientId = "jLY0sGcY8DY2iA:"
        let unicode = clientId.data(using: .utf8)
        let encoded = unicode!.base64EncodedString()
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("Basic " + encoded, forHTTPHeaderField: "Authorization")
        request.httpBody = Data(query!.utf8)
        
        let session = URLSession(configuration: .default)
        let dataTask = session.dataTask(with: request) { (data, response, error) in
            if let safeData = data {
                let json = try? JSONSerialization.jsonObject(with: safeData, options: .allowFragments)
                
                if let successfulJSON = json {
                    print(successfulJSON)
                }
            }
        }
        dataTask.resume()
    }
    
    
}

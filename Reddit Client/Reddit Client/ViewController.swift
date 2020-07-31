//
//  ViewController.swift
//  Reddit Client
//
//  Created by Juan Rodriguez on 2020-07-30.
//  Copyright © 2020 Juan Rodriguez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        refreshToken()
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

//{
//    "access_token" = "586676600006-UIGUuNUSsnxNAsL4T7h9CNd0GzE";
//    "expires_in" = 3600;
//    "refresh_token" = "586676600006-FCGQNR4pp-3et-5v20YaiIfD05E";
//    scope = "history identity";
//    "token_type" = bearer;
//}

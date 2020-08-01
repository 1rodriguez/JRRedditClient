//
//  K.swift
//  Reddit Client
//
//  Created by Juan Rodriguez on 2020-08-01.
//  Copyright © 2020 Juan Rodriguez. All rights reserved.
//

import Foundation

struct K {
    static var clientId: String? {
        let path = Bundle.main.path(forResource: "Secrets", ofType: "plist")
        
        if let verifiedPath = path {
            let url = URL(fileURLWithPath: verifiedPath)
            
            do {
                let data = try Data(contentsOf: url)
                
                let plist = try PropertyListSerialization.propertyList(from: data,
                                                                       options: .mutableContainers,
                                                                       format: nil)
                
                let dictArray = plist as? [[String: String]]
                
                if let propertyList = dictArray {
                    let clientID = propertyList[0]["clientId"]
                    
                    return clientID
                }
            } catch {
                print(error.localizedDescription)
            }
        }
        return nil
    }
    
    static var base64Id: String? {
        if let identification = self.clientId {
            guard let unicode = identification.data(using: .utf8) else { fatalError() }
            
            let encoded = unicode.base64EncodedString()
            
            return encoded
        }
        return nil
    }
}

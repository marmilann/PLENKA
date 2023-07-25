//
//  NVUser.swift
//  PLENKA
//
//  Created by Nariman on 25.07.2023.
//

import Foundation

struct NVUser: Identifiable {
    
    var id: String
    var name: String
    var bio: String
    
    var representaton: [String: Any] {
        
        var repres = [String: Any]()
        repres["id"] = self.id
        repres["name"] = self.name
        repres["bio"] = self.bio
        
        return repres
    }
}

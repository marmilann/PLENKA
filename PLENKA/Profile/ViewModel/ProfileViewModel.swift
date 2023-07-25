//
//  ProfileViewModel.swift
//  PLENKA
//
//  Created by Nariman on 13.07.2023.
//

import SwiftUI

class ProfileViewModel: ObservableObject {
    
    @Published var profile: NVUser
    
    init(profile: NVUser) {
        self.profile = profile
    }
    
    func setProfile() {
        DatabaseService.shared.setProfile(user: self.profile) { result in
            switch result {
                
            case .success(let user):
                print(user.name)
            case .failure(let error):
                print("Ошибочка \(error.localizedDescription)")
            }
        }
    }
    
    func getProfile() {
        DatabaseService.shared.getProfile { result in
            switch result {
                
            case .success(let user):
                self.profile = user
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

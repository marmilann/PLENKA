//
//  DatabaseService.swift
//  PLENKA
//
//  Created by Nariman on 25.07.2023.
//

import Foundation
import FirebaseFirestore

class DatabaseService {
    
    static let shared = DatabaseService()
    private let db = Firestore.firestore()
    
    private var usersRef: CollectionReference {
        return db.collection("users")
    }
    
    private init() { }
    
    func setProfile(user: NVUser, completion: @escaping (Result<NVUser, Error>) -> ()) {
        
        usersRef.document(user.id).setData(user.representaton) { error in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(user))
            }
        }
    }
    
    func getProfile(complition: @escaping (Result<NVUser, Error>) -> ()) {
        usersRef.document(AuthServices.shared.currentUsers!.uid).getDocument { docSnapshot, error in
            
            guard let snap = docSnapshot else { return }
            guard let data = snap.data() else { return }
            guard let userName = data["name"] as? String else { return }
            guard let id = data["id"] as? String else { return }
            guard let bio = data["bio"] as? String else { return }
            
            let user = NVUser(id: id, name: userName, bio: bio)
            
            complition(.success(user))
        }
    }
     
}

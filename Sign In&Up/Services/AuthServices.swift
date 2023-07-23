//
//  AuthServices.swift
//  PLENKA
//
//  Created by Nariman on 21.07.2023.
//

import Foundation
import FirebaseAuth

class AuthServices {
    static let shared = AuthServices()
    private init() { }
    private let auth = Auth.auth()
    public var currentUsers: User? {
        return auth.currentUser
    }
    func signUp(email: String, password: String, completion: @escaping (Result<User, Error>) -> ()) {
        auth.createUser(withEmail: email, password: password) { result, error in
            
            if let result = result {
                completion(.success(result.user))
            } else if let error = error {
                completion(.failure(error))
            }
        }
    }
    
    
    func signIn(email: String, password: String, completion: @escaping (Result<User, Error>) -> ()) {
        auth.signIn(withEmail: email, password: password) { result, error in
            if let result =  result {
                completion(.success(result.user))
            } else if let error = error {
                completion(.failure(error))
            }
        }
        
    }
}

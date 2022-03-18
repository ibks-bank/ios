//
//  AuthService.swift
//  bank
//
//  Created by Yulia Popova on 18/3/2022.
//

import UIKit
import Alamofire

struct AuthCredentials {
    let email: String
    let password: String
    let retypePassword : String
    let username: String

}

struct AuthService {

    static let shared = AuthService()

    struct Login: Encodable {
        let email: String
        let password: String
    }
    
    struct SecondLogin: Encodable {
        let email: String
        let password: String
        let code: String
    }
    
    struct Passport: Encodable {
        let series: String
        let number: String
        let firstName: String
        let middleName: String
        let lastName: String
        let issuedBy: String
        let issuedAt: String
        let address: String
        let birthplace: String
        let birthdate: String
    }

    struct Registration: Encodable {
        let email: String
        let password: String
        let passport: Passport
    }

    func enterCode(email: String?, password: String?, code: String?, completion: @escaping (AuthResult) -> Void) {
        guard let email = email, let password = password, let code = code else {
            completion(.failure(AuthError.unknownError))
            return
        }

        let login = SecondLogin(email: email, password: password, code: code)

        AF.request("http://localhost:3011/v1/auth/submit-code",
                   method: .post,
                   parameters: login,
                   encoder: JSONParameterEncoder.default).response { result in
            debugPrint(result)

            if result.response?.statusCode == 200 {
                print("Success")
                completion(.success)
            } else {
                print(result.response?.statusCode ?? 0)
                completion(.failure(AuthError.unknownError))
            }
        }

        completion(.success)
    }
    
    func signIn(email: String?, password: String?, completion: @escaping (AuthResult) -> Void) {
        guard let email = email, let password = password else {
            completion(.failure(AuthError.unknownError))
            return
        }

        let login = Login(email: email, password: password)

        AF.request("http://localhost:3011/v1/auth/sign-in",
                   method: .post,
                   parameters: login,
                   encoder: JSONParameterEncoder.default).response { result in
            debugPrint(result)

            if result.response?.statusCode == 200 {
                print("Success")
                completion(.success)
            } else {
                print(result.response?.statusCode ?? 0)
                completion(.failure(AuthError.unknownError))
            }
        }

        completion(.success)
    }

    public func signUp(email: String?, password: String?, completion: @escaping (AuthResult) -> Void) {

            // MARK: - FIX
        
            let registration = Registration(
                email: "xxxxxxx",
                password: "xxxxxxxx",
                passport: Passport(
                    series: "2002",
                    number: "279890",
                    firstName: "hgjj",
                    middleName: "khhkj",
                    lastName: "lkjlkj",
                    issuedBy: "jhkkh",
                    issuedAt: "2022-03-17T18:06:36.414Z",
                    address: "Address",
                    birthplace: "place",
                    birthdate: "2002-03-17T18:06:36.414Z"
                )
            )
        
            AF.request("http://localhost:3011/v1/auth/sign-up",
                       method: .post,
                       parameters: registration, encoder: JSONParameterEncoder.default).response { result in
                
                debugPrint(result)
                print(result)
                
                if result.response?.statusCode == 200 {
                    print("Success")
                    completion(.success)
                } else {
                    print(result.response?.statusCode ?? 0)
                    completion(.success)
                    completion(.failure(AuthError.unknownError))
                }
            }
            return
//        }
    }
    
    
}

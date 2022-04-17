//
//  BankAccountService.swift
//  bank
//
//  Created by Yulia Popova on 16/4/2022.
//

import UIKit
import Alamofire

struct BankAccountService {

    static let shared = BankAccountService()

    struct BankAccount: Encodable {
        let currency: String
        let limit: String
        let name: String
    }
    
    struct Transaction: Encodable {
        let payee: String
        let amount: String
    }
    
    struct Transations: Encodable {
        let start: String
        let end: String
    }
    
    struct Header: Encodable {
        let token: String
    }
    
    let headers: HTTPHeaders = [
        "X-Auth-Token": token,
        "Accept": "application/json"
    ]
    
    func getTransactions(start : String, end : String, completion: @escaping (AuthResult) -> Void) {
              
        let transactionParameters = Transations(start: start, end: end)
        
        AF.request(
            "http://bank.sytes.net:3001/v1/transactions",
            method: .get,
            headers: headers
        ).response { result in
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
    
    func createBankAccount(currency: String, limit: String, name: String, completion: @escaping (AuthResult) -> Void) {

        let bankAccount = BankAccount(currency: currency, limit: limit, name: name)
                
        AF.request(
            "http://bank.sytes.net:3001/v1/accounts/create",
            method: .post,
            parameters: bankAccount,
            encoder: JSONParameterEncoder.default,
            headers: headers
        ).response { result in
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
    
    func createTransaction(payee: String, amount: String, completion: @escaping (AuthResult) -> Void) {

        let transaction = Transaction(payee: payee, amount: amount)
                
        AF.request(
            "http://bank.sytes.net:3001/v1/transactions/create",
            method: .post,
            parameters: transaction,
            encoder: JSONParameterEncoder.default,
            headers: headers
        ).response { result in
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
}

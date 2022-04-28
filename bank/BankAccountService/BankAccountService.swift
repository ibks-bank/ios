import UIKit
import Alamofire

struct BankAccountService {

    static let shared = BankAccountService()

    var bankAccounts : [BankAccountResponse] = []
    
    struct BankAccount: Encodable {
        let currency: String
        let limit: String
        let name: String
    }
    
    struct BankAccountsResponse: Decodable {
        let accounts : [BankAccountResponse]
    }
    
    struct BankAccountResponse: Decodable {
        let id: String
        let currency: String
        let limit: String
        let userID: String
    }
    
    struct Transaction: Encodable {
        let accountID: String
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
        "X-Auth-Token": UserDefaults.standard.string(forKey: "token") ?? "",
        "Accept": "application/json"
    ]
    
    func getTransactions(start : String, end : String, completion: @escaping (AuthResult) -> Void) {
                      
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
    
    func getBankAccount(accountID: String, completion: @escaping (AuthResult) -> Void) {
                      
        AF.request(
            "http://bank.sytes.net:3001/v1/accounts/" + accountID,
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
    
    mutating func getBankAccounts(completion: @escaping ([BankAccountResponse]) -> Void) {
                      
        AF.request(
            "http://bank.sytes.net:3001/v1/accounts",
            method: .get,
            headers: headers
        ).response { result in
                        
            if result.response?.statusCode == 200 {
                
                do {
                    let response = try JSONDecoder().decode(BankAccountsResponse.self, from: result.data!)
                    completion(response.accounts)
                
                } catch let error as NSError {
                    print("Failed to load: \(error.localizedDescription)")
                }
                
                completion([])
            } else {
                print(result.response?.statusCode ?? 0)
                completion([])
            }
        }
        completion([])
    }
    
    func createTransaction(accountID: String, payee: String, amount: String, completion: @escaping (AuthResult) -> Void) {

        let transaction = Transaction(accountID: accountID, payee: payee, amount: amount)
                
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

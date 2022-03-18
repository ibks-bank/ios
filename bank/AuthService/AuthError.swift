//
//  AuthError.swift
//  bank
//
//  Created by Yulia Popova on 18/3/2022.
//

import Foundation

enum AuthError {
    case invalidEmail
    case unknownError
    case serverError
}

extension AuthError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .invalidEmail:
            return NSLocalizedString("email_is_not_valid", comment: "")
        case .unknownError:
            return NSLocalizedString("server_error", comment: "")
        case .serverError:
            return NSLocalizedString("server_error", comment: "")

        }
    }
}

//
//  Strings.swift
//  bank
//
//  Created by Yulia Popova on 17/3/2022.
//

import Foundation

enum AuthStrings: String {
    case username = "auth.username"
    case email = "auth.email"
    case password = "auth.password"
    case retypePassword = "auth.retypePassword"
    
    case pasportSeries = "auth.pasportSeries"
    case pasportNumber = "auth.pasportNumber"
    
    case fullName = "auth.fullName"
    case issuedBy = "auth.issuedBy"
    case issuedAt = "auth.issuedAt"
    case address = "auth.address"
    case place = "auth.place"
    case date = "auth.date"
    
    case signUp = "auth.signUp"
    case signIn = "auth.signIn"
    case alreadySignedUp = "auth.alreadySignedUp"
    case notSignedUp = "auth.notSignedUp"
    
    // screen headers
    case headerSignIn = "auth.headerSignIn"
    case headerSignUp = "auth.headerSignUp"
    
    case signInUnsuccessful = "auth.signInUnuccellful"
    case signUpUnuccessful = "auth.signUpUnuccellful"
    case accept = "auth.accept"
    
}

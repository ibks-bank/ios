//
//  StringExtension.swift
//  bank
//
//  Created by Yulia Popova on 17/3/2022.
//

import Foundation

extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}

//
//  String+Ext.swift
//  iMusic
//
//  Created by wsa-024-23b on 17.09.21.
//

import Foundation

import Foundation

extension String {
    
    var isValidEmail: Bool {
        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPridicate = NSPredicate(format: "SELF MATCHES %@", emailFormat)
        return emailPridicate.evaluate(with: self)
    }
}


//
//  Alert.swift
//  iMusic
//
//  Created by wsa-024-23b on 17.09.21.
//

import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    let title: Text
    let message: Text
    let dismissButton: Alert.Button
}

struct AlertContext {
    static let invalidForm      = AlertItem(title: Text("Ivalid Form"),
                                       message: Text("Please ensure all fields in the form have been filled out."),
                                       dismissButton: .default(Text("OK")))
    
    static let invalidEmail     = AlertItem(title: Text("Ivalid Email"),
                                       message: Text("Please ensure your email is correct."),
                                       dismissButton: .default(Text("OK")))
    
    static let userSaveSuccess  = AlertItem(title: Text("Profile Saved"),
                                       message: Text("Your profile information was successfully saved."),
                                       dismissButton: .default(Text("OK")))
    
    static let invalidUserData  = AlertItem(title: Text("Profile Error"),
                                       message: Text("There was an error saving or retrieving your profile."),
                                       dismissButton: .default(Text("OK")))
}

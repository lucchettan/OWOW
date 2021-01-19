//
//  Constant.swift
//  WeAreMatchPlay_Kiko
//
//  Created by mac on 19/01/2021.
//

import Foundation

enum CustomError: String, Error {
    case unableToComplete   = "Unable to complete your request. Please check internet connexion"
    case invalidResponse    = "Invalid response from the server. Please try again"
    case dataInvalid        = "The data receivde from the server is invalid. Please try again."
}

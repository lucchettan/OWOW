//
//  Match.swift
//  WeAreMatchPlay_Kiko
//
//  Created by mac on 19/01/2021.
//

import Foundation

struct Match : Codable{
    let users       : [User]
    let name        : String
    let created_at  : Date // if not working Try with string
}

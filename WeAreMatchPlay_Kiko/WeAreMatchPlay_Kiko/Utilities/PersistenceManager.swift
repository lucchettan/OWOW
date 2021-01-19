//
//  PersistenceManager.swift
//  WeAreMatchPlay_Kiko
//
//  Created by mac on 19/01/2021.
//

import Foundation

enum PersistenceManager {
    static private let defaults = UserDefaults.standard
    
    static func retrieveToken() -> String? {
        guard let favoritesDatas = defaults.object(forKey: "token") as? Data else {
            return nil
        }
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase //pass from snakecase to CamelCase to fit our model variables
            let retrievedToken = try decoder.decode(String.self, from: favoritesDatas)
            return retrievedToken
        } catch {
            return nil
        }
    }
    
    static func save(token: String) {
        do {
            let encoder = JSONEncoder()
            let encodedFavorites = try encoder.encode(token)
            defaults.set(encodedFavorites, forKey: "token")
        } catch {
            print(CustomError.unableToComplete)
        }
    }
}

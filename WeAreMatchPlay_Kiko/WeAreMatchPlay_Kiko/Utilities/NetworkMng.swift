//
//  NetworkMng.swift
//  WeAreMatchPlay_Kiko
//
//  Created by mac on 19/01/2021.
//

import UIKit
import Foundation
#if canImport(FoundationNetworking)
import FoundationNetworking
#endif

class NetworkManager {
    
    static let shared   = NetworkManager()
    private let baseURL:String = "https://api.wearematchplay.com/v2/"
    
    // Authentication to refactor, saving the token in UserDefaults, and return a boolean for the view to present the alert if needed
    func authenticatePostManMethod(email: String, password: String, completion: @escaping(Result<String, Error>) -> ()){
        let semaphore = DispatchSemaphore (value: 0)
        
        // The parameter part comes from postMan to parse my api access into a JSON that i can add to my Request
        let parameters = [["key": "email","value": email,"type": "text"], ["key": "password", "value": password,"type": "text" ]] as [[String : Any]]
        let boundary = "Boundary-\(UUID().uuidString)"
        var body = ""
        for param in parameters {
            if param["disabled"] == nil {
                let paramName = param["key"]!
                body += "--\(boundary)\r\n"
                body += "Content-Disposition:form-data; name=\"\(paramName)\""
                if param["contentType"] != nil {
                    body += "\r\nContent-Type: \(param["contentType"] as! String)"
                }
                let paramType = param["type"] as! String
                if paramType == "text" {
                    let paramValue = param["value"] as! String
                    body += "\r\n\r\n\(paramValue)\r\n"
                } else {
                    let paramSrc = param["src"] as! String
                    guard let fileData = try? NSData(contentsOfFile:paramSrc, options:[]) as Data else { return }
                    let fileContent = String(data: fileData, encoding: .utf8)!
                    body += "; filename=\"\(paramSrc)\"\r\n"
                        + "Content-Type: \"content-type header\"\r\n\r\n\(fileContent)\r\n"
                }
            }
        }
        body += "--\(boundary)--\r\n";
        let postData = body.data(using: .utf8)
        
        
        // Set up the request
        var request = URLRequest(url: URL(string: "https://api.wearematchplay.com/v2/auth/login")!,timeoutInterval: Double.infinity)
        request.addValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        request.httpBody = postData
        
        // Launch the networking
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let httpResponse        = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                semaphore.signal()
                completion(.failure(CustomError.invalidResponse))
                return
            }
            
            guard let data = data else {
                print(String(describing: error))
                completion(.failure(CustomError.dataInvalid))
                semaphore.signal()
                return
            }
            guard let token = try? JSONDecoder().decode(ApiToken.self, from: data) else {
                completion(.failure(CustomError.unableToComplete))
                return
            }
            // If the operation is done successfully it result in a String Token
            completion(.success(token.api_token))
            semaphore.signal()
            return
        }
        task.resume()
        semaphore.wait()
    }
    
    
    // to edit with email, password, and token
    func fetchFollowers(token: String){
        let semaphore = DispatchSemaphore (value: 0)
        
        print("Start fetching follower")
        print(token)
        guard let url       = URL(string: "https://api.wearematchplay.com/v2/users/me/followers") else { return }
        var request         = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("Bearer\(token)", forHTTPHeaderField: "Authorization")
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print(String(describing: error))
                semaphore.signal()
                return
            }
            guard let followers = try? JSONDecoder().decode([User].self, from: data) else {
                return
            }
            print(followers)
            // for each Follower fetchAFollowerMatch and add its matches to the array FollowersMatch[Match]
            semaphore.signal()
            return
        }
        
        task.resume()
        semaphore.wait()
    }
    
    func fetchAFollowerMatch(token: String){
        let semaphore = DispatchSemaphore (value: 0)
        
        let parameters = [
        ] as [[String : Any]]
        
        let boundary = "Boundary-\(UUID().uuidString)"
        var body = ""
        for param in parameters {
            if param["disabled"] == nil {
                let paramName = param["key"]!
                body += "--\(boundary)\r\n"
                body += "Content-Disposition:form-data; name=\"\(paramName)\""
                if param["contentType"] != nil {
                    body += "\r\nContent-Type: \(param["contentType"] as! String)"
                }
                let paramType = param["type"] as! String
                if paramType == "text" {
                    let paramValue = param["value"] as! String
                    body += "\r\n\r\n\(paramValue)\r\n"
                } else {
                    let paramSrc = param["src"] as! String
                    guard let fileData = try? NSData(contentsOfFile:paramSrc, options:[]) as Data else {return }
                    let fileContent = String(data: fileData, encoding: .utf8)!
                    body += "; filename=\"\(paramSrc)\"\r\n"
                        + "Content-Type: \"content-type header\"\r\n\r\n\(fileContent)\r\n"
                }
            }
        }
        body += "--\(boundary)--\r\n";
        let postData = body.data(using: .utf8)
        
        var request = URLRequest(url: URL(string: "https://api.wearematchplay.com/v2/users/?username=pieterjan/matches")!,timeoutInterval: Double.infinity)
        request.addValue("Bearer\(token)", forHTTPHeaderField: "Authorization")
        request.addValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        
        request.httpMethod = "GET"
        request.httpBody = postData
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print(String(describing: error))
                semaphore.signal()
                return
            }
            print(String(data: data, encoding: .utf8)!)
            semaphore.signal()
        }
        
        task.resume()
        semaphore.wait()
        
    }
    
    func fetchFollowersMatch(){
        // use fetchFollowers + fetchAFollowerMatch
        
        // to populate the array of all the matches
    }
    
}

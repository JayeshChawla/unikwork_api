//
//  ApiManager.swift
//  Unikwor_Api
//
//  Created by Quick tech  on 23/10/24.
//

import Foundation

enum DataError: Error {
    case invalidURl
    case invalidResponse
    case invalidData
    case message(Error?)
}

class ApiManager {
    
    static let shared = ApiManager()
    
    func request<T: Codable>(
        modelType: T.Type,
        type: EndPointItems
    ) async throws -> T {
        
        guard let url = type.url else { throw DataError.invalidURl }
        
        var request = URLRequest(url: url)
        request.httpMethod = type.methods.rawValue
        if let parameters = type.body {
            request.httpBody = try JSONEncoder().encode(parameters)
        }
        request.allHTTPHeaderFields = type.headers
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            
            if let httpResponse = response as? HTTPURLResponse {
                guard 200 ... 299 ~= httpResponse.statusCode else {
                    throw DataError.invalidResponse
                }
            }
            
            let decodeData = try JSONDecoder().decode(modelType, from: data)
            return decodeData
        } catch {
            throw DataError.message(error)
        }
    }
}

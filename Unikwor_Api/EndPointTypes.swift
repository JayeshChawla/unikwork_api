//
//  EndPointTypes.swift
//  Unikwor_Api
//
//  Created by Quick tech  on 23/10/24.
//

import Foundation

enum HTTPMethods: String {
    case get = "GET"
    case post = "POST"
}

protocol EndPointTypes {
    var path: String { get }
    var baseURL: String { get }
    var url: URL? { get }
    var methods: HTTPMethods { get }
    var body: Encodable? { get }
    var headers: [String: String]? { get }
}

enum EndPointItems {
    case data
    case user
}
//https://unikwork.com/instagram/api/get_data.php
extension EndPointItems: EndPointTypes {
    var path: String {
        switch self {
        case .data:
            return "get_data.php"
        case .user:
            return "users"
        }
    }
    
    var baseURL: String {
        return "https://dummyjson.com/"
    }
    
    var url: URL? {
        return URL(string: "\(baseURL)\(path)")
    }
    
    var methods: HTTPMethods {
        switch self {
        case .data:
            return .get
        case .user:
            return .get
        }
    }
    
    var body: (any Encodable)? {
        return nil
    }
    
    var headers: [String : String]? {
        return nil
    }
    
    
}

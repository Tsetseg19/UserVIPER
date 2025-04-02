//
//  NetworkError.swift
//  ColorScreenVIPER
//
//  Created by Enkhtsetseg Unurbayar on 4/2/25.
//

import Foundation

enum NetworkError: Error {
    
    case invalidURL
    case invalidDataPharse
    case invalidAPIRequest
    
}


extension NetworkError: LocalizedError {
    
    var errorDescription: String?{
        
        switch self {
            
        case .invalidURL:
            return NSLocalizedString("Invalid URL ", comment: "Check URL!")
        case .invalidDataPharse:
            return NSLocalizedString("pharsing error", comment: " Invalid Json Pharse! Check Model!")
        case .invalidAPIRequest:
            return NSLocalizedString("Invalid API Request", comment: "api error")
        }
    }
}

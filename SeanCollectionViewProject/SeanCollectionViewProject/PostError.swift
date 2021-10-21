//
//  PostError.swift
//  SeanCollectionViewProject
//
//  Created by Sean Jones on 10/20/21.
//

import Foundation

enum PostError : LocalizedError{
    case thrown(Error)
    case invalidURL
    case noData
    case badData
    
    var errorDescription: String?{
        switch self{
        case .thrown(let error):
            return error.localizedDescription
        case .invalidURL:
            return "Unable to Reach Server"
    
        case .noData:
            return "Server Responded with No Data"
        case .badData:
            return "Server Responded with Bad Data"
        
        }
        
    }
}

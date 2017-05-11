//
//  MomentumRouter.swift
//  Momentum
//
//  Created by Alejandro Rodriguez on 5/11/17.
//  Copyright © 2017 ARF. All rights reserved.
//

import Foundation
import Alamofire


enum MomentumRouter: URLRequestConvertible {
    case topApplications
    
    static let baseURLString = Constants.Endpoints.BaseURL.baseURL
    
    var method: HTTPMethod {
        switch self {
        case .topApplications:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .topApplications:
            return Constants.Endpoints.TopApplications.topApplications
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = try MomentumRouter.baseURLString.asURL()
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue
        
        return urlRequest
    }
    
}

//
//  ApiPath.swift
//  StoreSearch
//
//  Created by Le Van Binh on 1/12/17.
//  Copyright © 2017 Le Van Binh. All rights reserved.
//

import Foundation
import Alamofire

struct ApiPath {
    static let endPoint = "https://itunes.apple.com"
    
    struct Search: URLConvertible {
        private var urlString: String {
            return ApiPath.endPoint + "/search?term=\(term)&entity=\(category)"
        }
        private let term: String
        private let category: String
        init(term: String, category: String = "") {
            self.term = term
            self.category = category
        }
        
        func asURL() throws -> URL {
            return try urlString.asURL()
        }
    }
}

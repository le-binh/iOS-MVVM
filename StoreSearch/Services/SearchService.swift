//
//  SearchService.swift
//  StoreSearch
//
//  Created by Le Van Binh on 1/13/17.
//  Copyright © 2017 Le Van Binh. All rights reserved.
//

import Foundation
import Alamofire

class SearchService: NSObject {
    func search(term: String, category: String, filter: ((SearchResult) -> Bool)? = nil, success: @escaping ([SearchResult]) -> Void, failure: @escaping (Error) -> Void) {
        let url = ApiPath.Search(term: term, category: category)
        print(try! url.asURL())
        Alamofire.request(url).responseArray(keyPath: "results") { (response: DataResponse<[SearchResult]>) in
            switch response.result {
            case .success(let searchResults):
                let results = filter != nil ? searchResults.filter(filter!) : searchResults
                DispatchQueue.main.async {
                    success(results)
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    failure(error)
                }
            }
        }
    }
}

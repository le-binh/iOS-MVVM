//
//  SearchResultItemViewModel.swift
//  StoreSearch
//
//  Created by Le Van Binh on 1/12/17.
//  Copyright © 2017 Le Van Binh. All rights reserved.
//

import Foundation

class SearchResultItemViewModel: NSObject {
    private let searchResult: SearchResult
    
    var name: String {
        return searchResult.name
    }
    
    var kind: String {
        return searchResult.kind.capitalized
    }
    
    var artistName: String {
        return searchResult.artistName.isEmpty ? "Unknown" : "\(searchResult.artistName) (\(kind))"
    }
    
    var artworkSmallURL: String {
        return searchResult.artworkSmallURL
    }
    
    var artworkLargeURL: String {
        return searchResult.artworkLargeURL
    }
    
    var storeURL = ""
    var currency = ""
    var price: String {
        return "\(searchResult.currency) \(searchResult.price)"
    }
    var genre = ""
    
    init(searchResult: SearchResult) {
        self.searchResult = searchResult
    }
}

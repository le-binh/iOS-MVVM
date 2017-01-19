//
//  SearchResultsViewModel.swift
//  StoreSearch
//
//  Created by Le Van Binh on 1/12/17.
//  Copyright © 2017 Le Van Binh. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper

protocol SearchResultsViewModelDelegate: NSObjectProtocol {
    func searchResultsViewModel(didChangeSearchState state: SearchResultsViewModel.SearchingState)
}

class SearchResultsViewModel: NSObject {
    enum SearchingState {
        case notSearchedYet, searching, noResults, results(Int), error(Error)
    }

    var searchingState: SearchingState = .notSearchedYet {
        didSet {
            delegate?.searchResultsViewModel(didChangeSearchState: searchingState)
        }
    }
    var count: Int {
        return searchResults.count
    }
    
    var term: String = ""
    var categoryKey: Int = 0
    
    weak var delegate: SearchResultsViewModelDelegate?
    
    private let categories = ["", "musicTrack", "software", "ebook"]
    private var category: String {
        return categories[categoryKey]
    }
    private var searchResults: [SearchResult] {
        didSet {
            searchingState = count == 0 ? .noResults : .results(count)
        }
    }

    init(searchResults: [SearchResult]) {
        self.searchResults = searchResults
    }
    
    func searchResultItemViewModel(at index: Int) -> SearchResultItemViewModel? {
        guard 0 <= index && index < count else { return nil }
        return SearchResultItemViewModel(searchResult: searchResults[index])
    }
    
    func search() {
        searchingState = .searching
        SearchService().search(term: term, category: category, success: { (results) in
            self.searchResults = results.sorted(by: { $0.0.name < $0.1.name })
        }) { (error) in
            self.searchingState = .error(error)
        }
    }
}

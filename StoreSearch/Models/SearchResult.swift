//
//  SearchResult.swift
//  StoreSearch
//
//  Created by Le Van Binh on 1/12/17.
//  Copyright © 2017 Le Van Binh. All rights reserved.
//

import UIKit
import AlamofireObjectMapper
import ObjectMapper

class SearchResult: Mappable {
    var wrapperType = ""
    var name = ""
    var artistName = ""
    var artworkSmallURL = ""
    var artworkLargeURL = ""
    var storeURL = ""
    var kind = ""
    var currency = ""
    var price = 0.0
    var genre = ""
    
    required init(map: Map) {
        
    }
    
    func mapping(map: Map) {
        wrapperType <- map["wrapperType"]
        name <- map["trackName"]
        artistName <- map["artistName"]
        artworkSmallURL <- map["artworkUrl60"]
        artworkLargeURL <- map["artworkUrl100"]
        storeURL <- map["trackViewUrl"]
        kind <- map["kind"]
        currency <- map["currency"]
        price <- map["trackPrice"]
        genre <- map["primaryGenreName"]
    }
}

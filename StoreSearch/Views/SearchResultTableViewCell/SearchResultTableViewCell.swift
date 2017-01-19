//
//  SearchResultTableViewCell.swift
//  StoreSearch
//
//  Created by Le Van Binh on 1/12/17.
//  Copyright © 2017 Le Van Binh. All rights reserved.
//

import UIKit
import AlamofireImage
import Alamofire

class SearchResultTableViewCell: UITableViewCell {
    @IBOutlet weak var artworkImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var artistNameLabel: UILabel!
    var searchResultItemViewModel: SearchResultItemViewModel! {
        didSet {
            nameLabel.text = searchResultItemViewModel.name
            artistNameLabel.text = searchResultItemViewModel.artistName
            artworkImageView.image = UIImage(named: "Placeholder.png")
            if let artworkUrl = URL(string: searchResultItemViewModel.artworkSmallURL) {
                artworkImageView.af_setImage(withURL: artworkUrl)
            }
        }
    }
    
    private lazy var selectedView: UIView = {
        let view = UIView(frame: CGRect.zero)
        view.backgroundColor = Color.R20G160B160A50
        return view
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectedBackgroundView = selectedView
    }
}

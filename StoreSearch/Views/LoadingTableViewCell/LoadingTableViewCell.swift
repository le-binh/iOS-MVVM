//
//  LoadingTableViewCell.swift
//  StoreSearch
//
//  Created by Le Van Binh on 1/13/17.
//  Copyright © 2017 Le Van Binh. All rights reserved.
//

import UIKit

class LoadingTableViewCell: UITableViewCell {
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        activityIndicatorView.startAnimating()
    }
}

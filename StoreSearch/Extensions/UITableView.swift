//
//  UITableView.swift
//  StoreSearch
//
//  Created by Le Van Binh on 1/12/17.
//  Copyright © 2017 Le Van Binh. All rights reserved.
//

import Foundation
import UIKit

extension UITableView {
    func registerNib<T: UITableViewCell>(_ aClass: T.Type) {
        let name = String(describing: aClass)
        let nib = UINib(nibName: name, bundle: nil)
        register(nib, forCellReuseIdentifier: name)
    }
    
    func dequeueCell<T: UITableViewCell>(_ aClass: T.Type, for indexPath: IndexPath) -> T {
        let name = String(describing: aClass)
        return dequeueReusableCell(withIdentifier: name, for: indexPath) as! T
    }
    
    func hideEmptyRows() {
        tableFooterView = UIView(frame: CGRect.zero)
    }
}

//
//  Navigator.swift
//  StoreSearch
//
//  Created by Le Van Binh on 1/13/17.
//  Copyright © 2017 Le Van Binh. All rights reserved.
//

import UIKit

class Navigator: NSObject {
    private weak var context: UIViewController?
    
    init(context: UIViewController) {
        self.context = context
        super.init()
    }
    
    func present(viewController: UIViewController, animated: Bool = true, completion: (() -> Void)? = nil) {
        context?.present(viewController, animated: animated, completion: completion)
    }
}

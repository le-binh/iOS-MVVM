//
//  AppDelegate.swift
//  StoreSearch
//
//  Created by Le Van Binh on 1/12/17.
//  Copyright © 2017 Le Van Binh. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        intializeWindow()
        customizeAppearance()
        
        return true
    }
    
    private func intializeWindow() {
        window = UIWindow(frame: UIScreen.main.bounds)
        let searchViewController = SearchViewController(nibName: "SearchViewController", bundle: nil)
        let searchResultsViewModel = SearchResultsViewModel(searchResults: [])
        searchViewController.searchResultsViewModel = searchResultsViewModel
        window?.rootViewController = searchViewController
        window?.makeKeyAndVisible()
        window?.backgroundColor = UIColor.white
    }
    
    private func customizeAppearance() {
        UISearchBar.appearance().barTintColor = Color.R20G160B160
        window?.tintColor = Color.R10G80B80
    }
}


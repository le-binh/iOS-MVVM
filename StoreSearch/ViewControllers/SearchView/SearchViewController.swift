//
//  SearchViewController.swift
//  StoreSearch
//
//  Created by Le Van Binh on 1/12/17.
//  Copyright © 2017 Le Van Binh. All rights reserved.
//

import UIKit

private var searchViewControllerContext = 0

class SearchViewController: BaseViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    fileprivate var navigator: Navigator!
    var searchResultsViewModel: SearchResultsViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        navigator = Navigator(context: self)
        searchResultsViewModel.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    //MARK:- IBAction
    
    @IBAction func segmentChanged(_ sender: UISegmentedControl) {
        searchResultsViewModel.categoryKey = sender.selectedSegmentIndex
        performStoreRequest()
    }
    
    private func configureTableView() {
        searchBar.delegate = self
        tableView.dataSource = self
        tableView.delegate = self
        tableView.registerNib(SearchResultTableViewCell.self)
        tableView.registerNib(NothingFoundTableViewCell.self)
        tableView.registerNib(LoadingTableViewCell.self)
        tableView.hideEmptyRows()
        tableView.rowHeight = 80
    }
    
    fileprivate func performStoreRequest() {
        searchResultsViewModel.search()
    }
    
    fileprivate func reloadTableView() {
        self.tableView.reloadData()
    }
    
    fileprivate func showNetworkErrorAlert(error: Error) {
        let alert = UIAlertController(title: Strings.Error, message: error.localizedDescription, preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: Strings.Okey, style: .default, handler: nil)
        alert.addAction(defaultAction)
        navigator.present(viewController: alert)
    }
}

//MARK:- SearchBarDelegate

extension SearchViewController: UISearchBarDelegate {
    func position(for bar: UIBarPositioning) -> UIBarPosition {
        return .topAttached
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let term = searchBar.text else { return }
        searchResultsViewModel.term = term
        searchBar.resignFirstResponder()
        performStoreRequest()
    }
}

//MARK:- UITableViewDataSource

extension SearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch searchResultsViewModel.searchingState {
        case .notSearchedYet, .error(_):
            return 0
        case .searching, .noResults:
            return 1
        case .results(let count):
            return count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch searchResultsViewModel.searchingState {
        case .searching:
            return tableView.dequeueCell(LoadingTableViewCell.self, for: indexPath)
        case .noResults:
            return tableView.dequeueCell(NothingFoundTableViewCell.self, for: indexPath)
        default:
            let cell = tableView.dequeueCell(SearchResultTableViewCell.self, for: indexPath)
            let searchResultItemViewModel = searchResultsViewModel.searchResultItemViewModel(at: indexPath.row)
            cell.searchResultItemViewModel = searchResultItemViewModel
            return cell
        }
    }
}

//MARK:- UITableViewDelegate

extension SearchViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch searchResultsViewModel.searchingState {
        case .results(_):
            let detailViewController = DetailViewController(nibName: "DetailViewController", bundle: nil)
            let searchResultItemViewModel = searchResultsViewModel.searchResultItemViewModel(at: indexPath.row)
            detailViewController.searchResultItemViewModel = searchResultItemViewModel
            navigator.present(viewController: detailViewController)
        default:
            break
        }
        
    }
}

//MARK:- SearchResultsViewModelDelegate

extension SearchViewController: SearchResultsViewModelDelegate {
    func searchResultsViewModel(didChangeSearchState state: SearchResultsViewModel.SearchingState) {
        switch state {
        case .error(let error):
            showNetworkErrorAlert(error: error)
        default:
            break
        }
        reloadTableView()
    }
}

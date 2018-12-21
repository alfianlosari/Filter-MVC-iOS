//
//  FilterListViewController.swift
//  FilterMVC
//
//  Created by Alfian Losari on 12/21/18.
//  Copyright © 2018 Alfian Losari. All rights reserved.
//

import UIKit

protocol FilterListViewControllerDelegate: class {
    
    func filterListViewController(_ controller: FilterListViewController, didSelect filter: MovieFilter)
    func filterListViewController(_ controller: FilterListViewController, didDeselect filter: MovieFilter)
    func filterListViewControllerDidClearFilters(controller: FilterListViewController)
    
}

class FilterListViewController: UITableViewController {
    
    let filters = MovieFilter.defaultFilters
    weak var delegate: FilterListViewControllerDelegate?
    var selectedFilters: Set<MovieFilter> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func clearFilter() {
        selectedFilters.removeAll()
        delegate?.filterListViewControllerDidClearFilters(controller: self)

        tableView.reloadData()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return filters.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filters[section].filters.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return filters[section].title
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let filter = filters[indexPath.section].filters[indexPath.row]
        if selectedFilters.contains(filter) {
            selectedFilters.remove(filter)
            delegate?.filterListViewController(self, didDeselect: filter)
        } else {
            selectedFilters.insert(filter)
            delegate?.filterListViewController(self, didSelect: filter)
        }
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let filter = filters[indexPath.section].filters[indexPath.row]
        
        switch filter {
        case .genre(_, let name):
            cell.textLabel?.text = name
            
        case .rating(_, let name):
            cell.textLabel?.text = name
            
        case .duration(_, let name):
            cell.textLabel?.text = name
            
        }
        
        if selectedFilters.contains(filter) {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        
        return cell
    }
    
}

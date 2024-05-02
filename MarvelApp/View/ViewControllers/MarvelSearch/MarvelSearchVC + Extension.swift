//
//  MarvelSearchVC + Extension.swift
//  MarvelApp
//
//  Created by Mahmoud on 01/05/2024.
//

import UIKit

//MARK: - MarvelSearch VC extension TableViewDataSource And UITableViewDelegate
extension MarvelSearchVC : UITableViewDataSource , UITableViewDelegate  {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return heroes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellId, for: indexPath) as! SearchHomeCell
        cell.SearchMarvelTitle.text = heroes[indexPath.row].name

        if let thumbnail = heroes[indexPath.row].thumbnail?.path , let Extension = heroes[indexPath.row].thumbnail?._extension  {
        let imageUrl = "\(thumbnail).\(Extension)"
        cell.SearchMarvelImage.loadImageUsingCacheWithUrlString(urlString: imageUrl)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        GoToDetails(index: indexPath)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func GoToDetails(index:IndexPath) {
    let MarvelDetails = MarvelDetailsVC()
    MarvelDetails.heroes = heroes[index.row]
    Present(FromController: self, ToViewController: MarvelDetails ,modalPresentation: .fullScreen, modalTransition: .crossDissolve)
    }
    
}


//MARK: - UISearchBarDelegate
extension MarvelSearchVC : UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard let SearcText = searchBar.text else { return }
        GetData(nameStartsWith: SearcText)
        SearchTableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        MarvelSearchBar.showsCancelButton = false
        Dismiss(FromController: self)
        MarvelSearchBar.text = ""
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let SearcText = searchBar.text else { return }
        searchBar.resignFirstResponder()
        GetData(nameStartsWith: SearcText)
        SearchTableView.reloadData()
    }
    
}

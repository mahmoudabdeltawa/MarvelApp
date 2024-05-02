//
//  HomeVC + Extension.swift
//  MarvelApp
//
//  Created by Mahmoud on 01/05/2024.
//

import UIKit

//MARK: - Home VC extension TableViewDataSource And UITableViewDelegate
extension HomeVC : UITableViewDataSource , UITableViewDelegate  {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return heroes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellId, for: indexPath) as! MarvelHomeCell
        cell.selectionStyle = .none
        cell.MarvelTitle.text = heroes[indexPath.row].name
        
        if let thumbnail = heroes[indexPath.row].thumbnail?.path , let Extension = heroes[indexPath.row].thumbnail?._extension  {
        let imageUrl = "\(thumbnail).\(Extension)"
        cell.MarvelImage.loadImageUsingCacheWithUrlString(urlString: imageUrl)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        GoToDetails(index: indexPath)
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
    func GoToDetails(index:IndexPath) {
    let MarvelDetails = MarvelDetailsVC()
    MarvelDetails.heroes = heroes[index.row]
    Present(FromController: self, ToViewController: MarvelDetails ,modalPresentation: .fullScreen, modalTransition: .crossDissolve)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
    if !(isLoading) && tableView.isDragging {
    MarvelTableView.addLoading(indexPath) {
    self.SetUpIndicatorView()
    self.GetData()
        
    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
    UIView.animate(withDuration: 0.5) {
    self.MarvelTableView.beginUpdates()
    self.MarvelTableView.tableFooterView = nil
    self.MarvelTableView.endUpdates()
    }
    }
        
    }
    }
    }
    
    func SetUpIndicatorView() {
    let customView = UIView(frame: CGRect(x: 0, y: 0, width: MarvelTableView.frame.width, height: MultiplierHeight(90)))
    let aiv = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.large)
    aiv.hidesWhenStopped = true
    aiv.isHidden = true
    aiv.color = .white
    aiv.startAnimating()
    aiv.translatesAutoresizingMaskIntoConstraints = false

    customView.addSubview(aiv)
    aiv.centerYAnchor.constraint(equalTo: customView.centerYAnchor).isActive = true
    aiv.centerXAnchor.constraint(equalTo: customView.centerXAnchor).isActive = true
    aiv.widthAnchor.constraint(equalToConstant: MultiplierHeight(20)).isActive = true
    aiv.heightAnchor.constraint(equalToConstant: MultiplierHeight(20)).isActive = true

    MarvelTableView.tableFooterView = customView
    }
    
}

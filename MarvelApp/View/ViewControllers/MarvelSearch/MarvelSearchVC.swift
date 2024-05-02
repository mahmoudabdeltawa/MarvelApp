//
//  MarvelSearchVC.swift
//  MarvelApp
//
//  Created by Mahmoud on 01/05/2024.
//

import UIKit

class MarvelSearchVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        initialize()
        SetupNavigationItem()
        SetupCitiesSearchBar()
        SetupSearchMarvelTableView()
        view.backgroundColor = .black
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        MarvelSearchBar.becomeFirstResponder()
    }
    
    //MARK: - Setup  NavigationItem
    func SetupNavigationItem() {
        self.navigationItem.largeTitleDisplayMode = .never
        self.navigationController?.navigationBar.barTintColor = .black
        self.navigationController?.navigationBar.backgroundColor = .black
    }
    

    //MARK: - Setup UISearchBar
    lazy var MarvelSearchBar : UISearchBar = {
        let SB = UISearchBar()
        SB.delegate = self
        SB.tintColor = .red
        SB.barTintColor = .clear
        SB.placeholder = "Search"
        SB.backgroundColor = .black
        SB.showsCancelButton = true
        SB.searchTextField.backgroundColor = .white
        SB.searchTextField.clearButtonMode = .whileEditing
        SB.translatesAutoresizingMaskIntoConstraints = false
        SB.setBackgroundImage(UIImage(), for: .any, barMetrics: .default)
        return SB
    }()

    private func SetupCitiesSearchBar() {
        view.addSubview(MarvelSearchBar)
        let constraints = [
            MarvelSearchBar.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            MarvelSearchBar.heightAnchor.constraint(equalToConstant: MultiplierHeight(50)),
            MarvelSearchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            MarvelSearchBar.widthAnchor.constraint(equalTo: view.widthAnchor,constant: 20)
        ]
        NSLayoutConstraint.activate(constraints)
    }

    
    //MARK: - Setup Search Marvel TableView
    let CellId = "CellId"
    var heroes: [ModelCharacter] = []
    lazy var SearchTableView : UITableView = {
        let tv = UITableView()
        tv.delegate = self
        tv.dataSource = self
        tv.backgroundColor = .clear
        tv.alwaysBounceVertical = true
        tv.rowHeight = MultiplierHeight(60)
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.register(SearchHomeCell.self, forCellReuseIdentifier: CellId)
        tv.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 15, right: 0)
        return tv
    }()
    
    
    private func SetupSearchMarvelTableView() {
        view.addSubview(SearchTableView)
        let constraints = [
            SearchTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            SearchTableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            SearchTableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            SearchTableView.topAnchor.constraint(equalTo: MarvelSearchBar.bottomAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
    }
}

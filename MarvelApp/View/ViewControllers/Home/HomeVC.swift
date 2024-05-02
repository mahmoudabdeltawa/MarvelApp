//
//  HomeVC.swift
//  MarvelApp
//
//  Created by Mahmoud on 01/05/2024.
//

import UIKit

class HomeVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialize()
        GetData()
        SetupNavigationItem()
        SetupMarvelTableView()
        view.backgroundColor = .black
        LoadingOverlay.shared.showOverlay(view: view)
    }
    
    //MARK: - Setup  NavigationItem
    func SetupNavigationItem() {
        self.navigationItem.largeTitleDisplayMode = .never
        self.navigationController?.navigationBar.barTintColor = .black
        self.navigationController?.navigationBar.backgroundColor = .black

        //MARK: - Setup Image icn
        let imageView = UIImageView(image: UIImage(named: "icn-nav-marvel"))
        imageView.widthAnchor.constraint(equalToConstant: MultiplierWidth(140)).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: MultiplierHeight(40)).isActive = true
        imageView.contentMode = .scaleAspectFit
        self.navigationItem.titleView = imageView
    
        //MARK: - Setup Search Bar Button
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "magnifyingglass"), style: .plain, target: self, action: #selector(SearchBarButtonAction))
        self.navigationItem.rightBarButtonItem?.tintColor = .red

    }
    
    //MARK: - Setup Search Bar Button Action
    @objc func SearchBarButtonAction() {
        Present(FromController: self, ToViewController: MarvelSearchVC())
    }
    

    //MARK: - Setup Marvel TableView
    let CellId = "CellId"
    let limit: Int = 10
    var currentOffset: Int = 0
    var isLoading: Bool = false
    var heroes: [ModelCharacter] = []
    lazy var MarvelTableView : UITableView = {
        let tv = UITableView()
        tv.delegate = self
        tv.dataSource = self
        tv.backgroundColor = .clear
        tv.alwaysBounceVertical = true
        tv.rowHeight = MultiplierHeight(200)
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.register(MarvelHomeCell.self, forCellReuseIdentifier: CellId)
        tv.contentInset = UIEdgeInsets(top: 15, left: 0, bottom: 15, right: 0)
        return tv
    }()
    
    
    private func SetupMarvelTableView() {
        view.addSubview(MarvelTableView)
        let constraints = [
            MarvelTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            MarvelTableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            MarvelTableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            MarvelTableView.topAnchor.constraint(equalTo: view.topAnchor,constant: 10)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    

}

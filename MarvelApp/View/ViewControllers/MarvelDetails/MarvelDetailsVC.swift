//
//  MarvelDetailsVC.swift
//  MarvelApp
//
//  Created by Mahmoud on 01/05/2024.
//

import UIKit


class MarvelDetailsVC: UIViewController {

    var ComicResult = [Comic]()
    var StoryResult = [Story]()
    var EventResult = [Event]()
    var SeriesResult = [Series]()
    private var url: URL? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        GetMarvelDetails()
        SetupBackgroundImage()
        SetupVisualEffectView()
        SetupDetailsMarvelTableView()
        view.backgroundColor = .black
    }
    
    //MARK: - Setup  VisualEffectView
    lazy var VisualEffectView: UIVisualEffectView = {
        let View = UIVisualEffectView(effect: UIBlurEffect(style: .dark))
        View.backgroundColor = .clear
        View.translatesAutoresizingMaskIntoConstraints = false
        return View
    }()
    
    private func SetupVisualEffectView() {
        view.addSubview(VisualEffectView)
        let constraints = [
            VisualEffectView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            VisualEffectView.leftAnchor.constraint(equalTo: view.leftAnchor),
            VisualEffectView.rightAnchor.constraint(equalTo: view.rightAnchor),
            VisualEffectView.topAnchor.constraint(equalTo: view.topAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
    }

    //MARK: - Setup  Marvel Image
    lazy var BackgroundImage : UIImageView = {
        let IV = UIImageView()
        IV.backgroundColor = .clear
        IV.contentMode = .scaleAspectFill
        IV.image = UIImage(named: "Group 26056")
        IV.translatesAutoresizingMaskIntoConstraints = false
        return IV
    }()
    
    private func SetupBackgroundImage() {
        view.addSubview(BackgroundImage)
        let constraints = [
            BackgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            BackgroundImage.leftAnchor.constraint(equalTo: view.leftAnchor),
            BackgroundImage.rightAnchor.constraint(equalTo: view.rightAnchor),
            BackgroundImage.topAnchor.constraint(equalTo: view.topAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
        
        if let thumbnail = heroes.thumbnail?.path , let Extension = heroes.thumbnail?._extension  {
        let imageUrl = "\(thumbnail).\(Extension)"
        BackgroundImage.loadImageUsingCacheWithUrlString(urlString: imageUrl)
        }
    }
    
    
    //MARK: - Setup Details Marvel TableView
    let CellId = "CellId"
    let LinksId = "LinksId"
    let HeaderId = "HeaderId"
    var heroes = ModelCharacter()
    lazy var DetailsMarvelTableView : UITableView = {
        let tv = UITableView()
        tv.delegate = self
        tv.dataSource = self
        tv.backgroundColor = .clear
        tv.alwaysBounceVertical = true
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.register(DetailsCell.self, forCellReuseIdentifier: CellId)
        tv.register(DetailsLinksCell.self, forCellReuseIdentifier: LinksId)
        tv.register(HeaderDetailsCell.self, forCellReuseIdentifier: HeaderId)
        tv.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 15, right: 0)
        return tv
    }()
    
    private func SetupDetailsMarvelTableView() {
        view.addSubview(DetailsMarvelTableView)
        let constraints = [
            DetailsMarvelTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            DetailsMarvelTableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            DetailsMarvelTableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            DetailsMarvelTableView.topAnchor.constraint(equalTo: view.topAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
    }

    


}





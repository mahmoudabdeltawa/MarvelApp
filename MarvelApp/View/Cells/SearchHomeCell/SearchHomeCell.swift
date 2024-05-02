//
//  SearchHomeCell.swift
//  MarvelApp
//
//  Created by Mahmoud on 01/05/2024.
//

import UIKit

class SearchHomeCell: UITableViewCell {
           
    //MARK: - Setup Search Marvel Image
    lazy var SearchMarvelImage : UIImageView = {
        let IV = UIImageView()
        IV.tintColor = .red
        IV.backgroundColor = .clear
        IV.contentMode = .scaleAspectFit
        IV.image = UIImage(named: "Group 26056")
        IV.translatesAutoresizingMaskIntoConstraints = false
        return IV
    }()

    
    //MARK: - Setup  Search Marvel Title
    lazy var SearchMarvelTitle : UILabel = {
        let la = UILabel()
        la.text = "Marvel Title"
        la.textColor = .white
        la.textAlignment = .left
        la.backgroundColor = .clear
        la.translatesAutoresizingMaskIntoConstraints = false
        la.font = UIFont.systemFont(ofSize: MultiplierWidth(15), weight: .black)
        return la
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
  
        
        addSubview(SearchMarvelImage)
        addSubview(SearchMarvelTitle)
        let constraints = [
        SearchMarvelImage.topAnchor.constraint(equalTo: self.topAnchor),
        SearchMarvelImage.leftAnchor.constraint(equalTo: self.leftAnchor),
        SearchMarvelImage.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        SearchMarvelImage.widthAnchor.constraint(equalTo: self.heightAnchor),
        
        SearchMarvelTitle.topAnchor.constraint(equalTo: self.topAnchor),
        SearchMarvelTitle.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        SearchMarvelTitle.rightAnchor.constraint(equalTo: self.rightAnchor ,constant: -15),
        SearchMarvelTitle.leftAnchor.constraint(equalTo: SearchMarvelImage.rightAnchor,constant: 15),
        ]
        NSLayoutConstraint.activate(constraints)
        
        contentView.isHidden = true
    }
    
    required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
    }

}







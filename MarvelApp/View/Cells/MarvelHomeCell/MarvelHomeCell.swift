//
//  MarvelHomeCell.swift
//  MarvelApp
//
//  Created by Mahmoud on 01/05/2024.
//

import UIKit

class MarvelHomeCell: UITableViewCell {
           
    //MARK: - Setup  MarvelImage
    lazy var MarvelImage : UIImageView = {
        let IV = UIImageView()
        IV.tintColor = .red
        IV.clipsToBounds = true
        IV.backgroundColor = .clear
        IV.contentMode = .scaleAspectFill
        IV.image = UIImage(systemName: "text.below.photo")
        IV.translatesAutoresizingMaskIntoConstraints = false
        return IV
    }()

    //MARK: - Setup  BackgroundMarvelTitle
    lazy var BackgroundMarvelTitle : RhomboidView = {
        let la = RhomboidView()
        la.translatesAutoresizingMaskIntoConstraints = false
        return la
    }()
    
    //MARK: - Setup  MarvelTitle
    lazy var MarvelTitle : UILabel = {
        let la = UILabel()
        la.numberOfLines = 2
        la.text = "Marvel Title"
        la.textColor = .black
        la.textAlignment = .center
        la.backgroundColor = .clear
        la.translatesAutoresizingMaskIntoConstraints = false
        la.font = UIFont.systemFont(ofSize: MultiplierWidth(15), weight: .black)
        return la
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
  
        
        addSubview(MarvelImage)
        addSubview(BackgroundMarvelTitle)
        BackgroundMarvelTitle.addSubview(MarvelTitle)
        let constraints = [
        MarvelImage.topAnchor.constraint(equalTo: self.topAnchor),
        MarvelImage.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        MarvelImage.leftAnchor.constraint(equalTo: self.leftAnchor),
        MarvelImage.rightAnchor.constraint(equalTo: self.rightAnchor),
        
        BackgroundMarvelTitle.leftAnchor.constraint(equalTo: self.leftAnchor,constant: 25),
        BackgroundMarvelTitle.heightAnchor.constraint(equalToConstant: MultiplierHeight(35)),
        BackgroundMarvelTitle.bottomAnchor.constraint(equalTo: self.bottomAnchor,constant: -25),
        BackgroundMarvelTitle.widthAnchor.constraint(equalTo: self.widthAnchor ,multiplier: 1/2.5),
        
        MarvelTitle.leftAnchor.constraint(equalTo: BackgroundMarvelTitle.leftAnchor),
        MarvelTitle.widthAnchor.constraint(equalTo: BackgroundMarvelTitle.widthAnchor),
        MarvelTitle.heightAnchor.constraint(equalTo: BackgroundMarvelTitle.heightAnchor),
        MarvelTitle.bottomAnchor.constraint(equalTo: BackgroundMarvelTitle.bottomAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
        
        contentView.isHidden = true
    }
    
    required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
    }

}






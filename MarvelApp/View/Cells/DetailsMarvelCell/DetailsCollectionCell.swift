//
//  DetailsCollectionCell.swift
//  MarvelApp
//
//  Created by Mahmoud on 01/05/2024.
//

import UIKit

class DetailsCollectionCell: UICollectionViewCell {
           
    //MARK: - Details Collection Image
    lazy var DetailsCollectionImage : UIImageView = {
        let IV = UIImageView()
        IV.tintColor = .red
        IV.clipsToBounds = true
        IV.backgroundColor = .clear
        IV.layer.shadowColor = #colorLiteral(red: 0.07832863182, green: 0.07931428403, blue: 0.07929687947, alpha: 1)
        IV.layer.shadowRadius = 3
        IV.layer.shadowOpacity = 0.3
        IV.layer.shadowOffset = .zero
        IV.contentMode = .scaleAspectFill
        IV.image = UIImage(named: "Group 26056")
        IV.translatesAutoresizingMaskIntoConstraints = false
        return IV
    }()
    
    //MARK: - Setup  Details Collection Title
    lazy var DetailsCollectionTitle : UILabel = {
        let la = UILabel()
        la.text = "Marvel \n Title"
        la.textColor = .white
        la.numberOfLines = 2
        la.textAlignment = .center
        la.backgroundColor = .clear
        la.translatesAutoresizingMaskIntoConstraints = false
        la.font = UIFont.systemFont(ofSize: MultiplierWidth(13), weight: .light)
        la.heightAnchor.constraint(equalToConstant: MultiplierHeight(30)).isActive = true
        return la
    }()
    
    
    //MARK: - Setup  Stack Items
    lazy var StackItems : UIStackView = {
        let Stack = UIStackView(arrangedSubviews: [DetailsCollectionImage,DetailsCollectionTitle])
        Stack.axis = .vertical
        Stack.spacing = 10
        Stack.alignment = .fill
        Stack.backgroundColor = .clear
        Stack.distribution = .fillProportionally
        Stack.translatesAutoresizingMaskIntoConstraints = false
        return Stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        
        addSubview(StackItems)
        let constraints = [
        StackItems.topAnchor.constraint(equalTo: self.topAnchor),
        StackItems.leftAnchor.constraint(equalTo: self.leftAnchor,constant: 8),
        StackItems.rightAnchor.constraint(equalTo: self.rightAnchor,constant: -8),
        StackItems.bottomAnchor.constraint(equalTo: self.bottomAnchor,constant: -5)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
    }

}








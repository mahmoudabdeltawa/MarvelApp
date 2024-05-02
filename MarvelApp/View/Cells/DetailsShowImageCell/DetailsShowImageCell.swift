//
//  DetailsShowImageCell.swift
//  MarvelApp
//
//  Created by Mahmoud on 01/05/2024.
//

import UIKit

class DetailsShowImageCell: UICollectionViewCell {
           
    //MARK: - Details Details Show Image
    lazy var DetailsShowImage : UIImageView = {
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
    
    //MARK: - Setup  Details Show Title
    lazy var DetailsShowTitle : UILabel = {
        let la = UILabel()
        la.text = "Marvel  Title"
        la.textColor = .white
        la.numberOfLines = 2
        la.textAlignment = .center
        la.backgroundColor = .clear
        la.translatesAutoresizingMaskIntoConstraints = false
        la.font = UIFont.systemFont(ofSize: MultiplierWidth(13), weight: .light)
        la.heightAnchor.constraint(equalToConstant: MultiplierHeight(30)).isActive = true
        return la
    }()
    
    //MARK: - Setup  Label Count
    lazy var LabelCount : UILabel = {
        let la = UILabel()
        la.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        la.textAlignment = .center
        la.backgroundColor = .clear
        la.translatesAutoresizingMaskIntoConstraints = false
        la.font = UIFont.systemFont(ofSize: MultiplierWidth(13), weight: .light)
        la.heightAnchor.constraint(equalToConstant: MultiplierHeight(25)).isActive = true
        return la
    }()
    
    
    //MARK: - Setup  Stack Items
    lazy var StackItems : UIStackView = {
        let Stack = UIStackView(arrangedSubviews: [DetailsShowImage,UIView(),DetailsShowTitle,LabelCount])
        Stack.axis = .vertical
        Stack.spacing = 20
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
        StackItems.leftAnchor.constraint(equalTo: self.leftAnchor),
        StackItems.rightAnchor.constraint(equalTo: self.rightAnchor),
        StackItems.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
    }

}









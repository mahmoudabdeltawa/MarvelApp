//
//  DetailsLinksCell.swift
//  MarvelApp
//
//  Created by Mahmoud on 01/05/2024.
//

import UIKit

protocol DetailsLinksCellDelegate {
    func DetailsLinksSelect(Cell:DetailsLinksCell)
}

class DetailsLinksCell: UITableViewCell {
    
    var Delegate :DetailsLinksCellDelegate?
    
    //MARK: - Setup  Details Label
    lazy var DetailsLabel : UILabel = {
        let Label = UILabel()
        Label.textColor = .red
        Label.text = "RELATED LINKS"
        Label.backgroundColor = .clear
        Label.isUserInteractionEnabled = true
        Label.translatesAutoresizingMaskIntoConstraints = false
        Label.font = UIFont.systemFont(ofSize: MultiplierWidth(15), weight: .bold)
        Label.heightAnchor.constraint(equalToConstant: MultiplierHeight(30)).isActive = true
        return Label
    }()
    
    
    //MARK: - Details Links Icon
    lazy var DetailsLinksIcon : UIImageView = {
        let IV = UIImageView()
        IV.tintColor = .white
        IV.clipsToBounds = true
        IV.backgroundColor = .clear
        IV.contentMode = .scaleAspectFit
        IV.isUserInteractionEnabled = true
        IV.image = UIImage(systemName: "chevron.backward")
        IV.translatesAutoresizingMaskIntoConstraints = false
        IV.transform = CGAffineTransform(rotationAngle: .pi)
        IV.widthAnchor.constraint(equalToConstant: MultiplierWidth(18)).isActive = true
        IV.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(DetailsCollectionSelect)))
        return IV
    }()
    
    @objc func DetailsCollectionSelect() {
        Delegate?.DetailsLinksSelect(Cell: self)
    }
            
    //MARK: - Setup  Search Marvel Title
    lazy var DetailsLinksTitle : UILabel = {
        let la = UILabel()
        la.textColor = .white
        la.text = "Marvel Links"
        la.textAlignment = .left
        la.backgroundColor = .clear
        la.isUserInteractionEnabled = true
        la.translatesAutoresizingMaskIntoConstraints = false
        la.font = UIFont.systemFont(ofSize: MultiplierWidth(15), weight: .black)
        la.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(DetailsCollectionSelect)))
        return la
    }()
    
    //MARK: - Setup  Stack Items horizontal
    lazy var StackItemsHorizontal : UIStackView = {
        let Stack = UIStackView(arrangedSubviews: [DetailsLinksTitle,DetailsLinksIcon])
        Stack.axis = .horizontal
        Stack.spacing = 10
        Stack.alignment = .fill
        Stack.backgroundColor = .clear
        Stack.isUserInteractionEnabled = true
        Stack.distribution = .equalSpacing
        Stack.translatesAutoresizingMaskIntoConstraints = false
        Stack.heightAnchor.constraint(equalToConstant: MultiplierHeight(22)).isActive = true
        Stack.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(DetailsCollectionSelect)))
        return Stack
    }()
    
    //MARK: - Setup  Stack vertical
    lazy var StackItemsVertical : UIStackView = {
        let Stack = UIStackView(arrangedSubviews: [DetailsLabel,StackItemsHorizontal])
        Stack.axis = .vertical
        Stack.spacing = 5
        Stack.alignment = .fill
        Stack.backgroundColor = .clear
        Stack.distribution = .equalSpacing
        Stack.isUserInteractionEnabled = true
        Stack.translatesAutoresizingMaskIntoConstraints = false
        Stack.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(DetailsCollectionSelect)))
        return Stack
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
  
        addSubview(StackItemsVertical)
        let constraints = [
            StackItemsVertical.topAnchor.constraint(equalTo: self.topAnchor,constant: 16),
            StackItemsVertical.leftAnchor.constraint(equalTo: self.leftAnchor,constant: 8),
            StackItemsVertical.rightAnchor.constraint(equalTo: self.rightAnchor,constant: -8),
            StackItemsVertical.bottomAnchor.constraint(equalTo: self.bottomAnchor,constant: -16)
        ]
        NSLayoutConstraint.activate(constraints)
        
        contentView.isHidden = true
    }
    
    required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
    }

}







//
//  HeaderDetailsCell.swift
//  MarvelApp
//
//  Created by Mahmoud on 01/05/2024.
//

import UIKit

protocol HeaderDetailsDelegate {
    func HeaderButtonBackSelect()
}

class HeaderDetailsCell: UITableViewCell {
    
    var Delegate :HeaderDetailsDelegate?

    //MARK: - Header Button Back
    lazy var HeaderButtonBack : UIImageView = {
        let IV = UIImageView()
        IV.tintColor = .white
        IV.clipsToBounds = true
        IV.backgroundColor = .clear
        IV.contentMode = .scaleAspectFill
        IV.isUserInteractionEnabled = true
        IV.image = UIImage(systemName: "chevron.backward")
        IV.translatesAutoresizingMaskIntoConstraints = false
        IV.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(HeaderButtonBackSelect)))
        return IV
    }()
    
    @objc func HeaderButtonBackSelect() {
        Delegate?.HeaderButtonBackSelect()
    }
    
    //MARK: - Header Image
    lazy var HeaderImage : UIImageView = {
        let IV = UIImageView()
        IV.tintColor = .red
        IV.clipsToBounds = true
        IV.backgroundColor = .clear
        IV.contentMode = .scaleAspectFill
        IV.image = UIImage(systemName: "text.below.photo")
        IV.translatesAutoresizingMaskIntoConstraints = false
        return IV
    }()
    
    //MARK: - Name Label
    lazy var NameLabel : UILabel = {
        let Label = UILabel()
        Label.text = "Name"
        Label.textColor = .red
        Label.backgroundColor = .clear
        Label.translatesAutoresizingMaskIntoConstraints = false
        Label.font = UIFont.systemFont(ofSize: MultiplierWidth(15), weight: .bold)
        Label.heightAnchor.constraint(equalToConstant: MultiplierHeight(25)).isActive = true
        return Label
    }()
    
    //MARK: - Header Name Label
    lazy var HeaderNameLabel : UILabel = {
        let Label = UILabel()
        Label.textColor = .white
        Label.backgroundColor = .clear
        Label.translatesAutoresizingMaskIntoConstraints = false
        Label.font = UIFont.systemFont(ofSize: MultiplierWidth(17), weight: .bold)
        Label.heightAnchor.constraint(equalToConstant: MultiplierHeight(30)).isActive = true
        return Label
    }()
    
    //MARK: - Description Label
    lazy var DescriptionLabel : UILabel = {
        let Label = UILabel()
        Label.text = "Description"
        Label.textColor = .red
        Label.backgroundColor = .clear
        Label.translatesAutoresizingMaskIntoConstraints = false
        Label.font = UIFont.systemFont(ofSize: MultiplierWidth(15), weight: .bold)
        Label.heightAnchor.constraint(equalToConstant: MultiplierHeight(25)).isActive = true
        return Label
    }()
    
    //MARK: - Header Description Label
    lazy var HeaderDescriptionLabel : UILabel = {
        let Label = UILabel()
        Label.textColor = .white
        Label.numberOfLines = 0
        Label.backgroundColor = .clear
        Label.translatesAutoresizingMaskIntoConstraints = false
        Label.font = UIFont.systemFont(ofSize: MultiplierWidth(17), weight: .bold)
        return Label
    }()
    
    //MARK: - Stack Items
    lazy var StackItems : UIStackView = {
        let Stack = UIStackView(arrangedSubviews: [NameLabel,HeaderNameLabel,DescriptionLabel,HeaderDescriptionLabel])
        Stack.axis = .vertical
        Stack.spacing = 10
        Stack.alignment = .fill
        Stack.backgroundColor = .clear
        Stack.distribution = .equalSpacing
        Stack.translatesAutoresizingMaskIntoConstraints = false
        return Stack
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        
        addSubview(HeaderImage)
        addSubview(StackItems)
        addSubview(HeaderButtonBack)
        let constraints = [
        HeaderImage.topAnchor.constraint(equalTo: self.topAnchor),
        HeaderImage.rightAnchor.constraint(equalTo: self.rightAnchor),
        HeaderImage.leftAnchor.constraint(equalTo: self.leftAnchor),
        HeaderImage.heightAnchor.constraint(equalToConstant: MultiplierHeight(280)),
            
        StackItems.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        StackItems.leftAnchor.constraint(equalTo: self.leftAnchor,constant: 8),
        StackItems.rightAnchor.constraint(equalTo: self.rightAnchor,constant: -8),
        StackItems.topAnchor.constraint(equalTo: HeaderImage.bottomAnchor,constant: 10),
        
        HeaderButtonBack.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor,constant: 15),
        HeaderButtonBack.leftAnchor.constraint(equalTo: self.leftAnchor,constant: 15),
        HeaderButtonBack.widthAnchor.constraint(equalToConstant: MultiplierWidth(22)),
        HeaderButtonBack.heightAnchor.constraint(equalToConstant: MultiplierHeight(25))
        ]
        NSLayoutConstraint.activate(constraints)
        contentView.isHidden = true
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

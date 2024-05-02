//
//  DetailsCell.swift
//  MarvelApp
//
//  Created by Mahmoud on 01/05/2024.
//

import UIKit


enum CollectionDetails {
case COMICS
case SERIES
case STORIES
case EVENTS
}


protocol MarvelDetailsDelegate {
    func DetailsCollectionSelect(Cell:DetailsCell, indexPath:IndexPath)
}

class DetailsCell: UITableViewCell {
    
    var EnumCollectionDetails : CollectionDetails?
    var Delegate:MarvelDetailsDelegate?
    
    var ComicResult = [Comic]() {
        didSet {
            DispatchQueue.main.async {
                self.DetailsCollection.reloadData()
            }
        }
    }
    
    var SeriesResult = [Series]() {
        didSet {
            DispatchQueue.main.async {
                self.DetailsCollection.reloadData()
            }
        }
    }
    
    var StoryResult = [Story]() {
        didSet {
            DispatchQueue.main.async {
                self.DetailsCollection.reloadData()
            }
        }
    }
    
    var EventResult = [Event]() {
        didSet {
            DispatchQueue.main.async {
                self.DetailsCollection.reloadData()
            }
        }
    }
    
    //MARK: - Setup  Details Label
    lazy var DetailsLabel : UILabel = {
        let Label = UILabel()
        Label.textColor = .red
        Label.backgroundColor = .clear
        Label.isUserInteractionEnabled = true
        Label.translatesAutoresizingMaskIntoConstraints = false
        Label.font = UIFont.systemFont(ofSize: MultiplierWidth(15), weight: .bold)
        return Label
    }()

    //MARK: - Setup  Details Collection
    let DetailsCollectionId = "DetailsCollectionId"
    lazy var DetailsCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = MultiplierWidth(5)
        let vc = UICollectionView(frame: .zero, collectionViewLayout: layout)
        vc.backgroundColor = .clear
        vc.dataSource = self
        vc.delegate = self
        vc.translatesAutoresizingMaskIntoConstraints = false
        vc.register(DetailsCollectionCell.self, forCellWithReuseIdentifier: DetailsCollectionId)
        vc.contentInset = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
        return vc
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear

        addSubview(DetailsLabel)
        addSubview(DetailsCollection)
        let constraints = [
        DetailsLabel.topAnchor.constraint(equalTo: self.topAnchor,constant: 15),
        DetailsLabel.heightAnchor.constraint(equalToConstant: MultiplierWidth(25)),
        DetailsLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 8),
        DetailsLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -8),
        
        DetailsCollection.leadingAnchor.constraint(equalTo: self.leadingAnchor),
        DetailsCollection.trailingAnchor.constraint(equalTo: self.trailingAnchor),
        DetailsCollection.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5),
        DetailsCollection.topAnchor.constraint(equalTo: DetailsLabel.bottomAnchor, constant: 10)
        ]
        NSLayoutConstraint.activate(constraints)
        
        contentView.isHidden = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension DetailsCell: UICollectionViewDelegate, UICollectionViewDataSource ,UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch EnumCollectionDetails {
        case .COMICS:
            DetailsLabel.text = "COMICS"
            return ComicResult.count
        case .SERIES:
            DetailsLabel.text = "SERIES"
            return SeriesResult.count
        case .STORIES:
            DetailsLabel.text = "STORIES"
            return StoryResult.count
        case .EVENTS:
            DetailsLabel.text = "EVENTS"
            return EventResult.count
        default:
            return 0
        }
        
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch EnumCollectionDetails {
        case .COMICS:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DetailsCollectionId,for: indexPath) as! DetailsCollectionCell
            cell.DetailsCollectionTitle.text = ComicResult[indexPath.item].title

            if let thumbnail = ComicResult[indexPath.row].thumbnail?.path , let Extension = ComicResult[indexPath.row].thumbnail?._extension  {
            let imageUrl = "\(thumbnail).\(Extension)"
            cell.DetailsCollectionImage.loadImageUsingCacheWithUrlString(urlString: imageUrl)
            }
            
            return cell
        case .SERIES:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DetailsCollectionId,for: indexPath) as! DetailsCollectionCell
            cell.DetailsCollectionTitle.text = SeriesResult[indexPath.item].title

            if let thumbnail = SeriesResult[indexPath.row].thumbnail?.path , let Extension = SeriesResult[indexPath.row].thumbnail?._extension  {
            let imageUrl = "\(thumbnail).\(Extension)"
            cell.DetailsCollectionImage.loadImageUsingCacheWithUrlString(urlString: imageUrl )
            }
            return cell
        case .STORIES:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DetailsCollectionId,for: indexPath) as! DetailsCollectionCell
            cell.DetailsCollectionTitle.text = StoryResult[indexPath.item].title

            if let thumbnail = StoryResult[indexPath.row].thumbnail?.path , let Extension = StoryResult[indexPath.row].thumbnail?._extension  {
            let imageUrl = "\(thumbnail).\(Extension)"
            cell.DetailsCollectionImage.loadImageUsingCacheWithUrlString(urlString: imageUrl )
            }
            return cell
        case .EVENTS:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DetailsCollectionId,for: indexPath) as! DetailsCollectionCell
            cell.DetailsCollectionTitle.text = EventResult[indexPath.item].title

            if let thumbnail = EventResult[indexPath.row].thumbnail?.path , let Extension = EventResult[indexPath.row].thumbnail?._extension  {
            let imageUrl = "\(thumbnail).\(Extension)"
            cell.DetailsCollectionImage.loadImageUsingCacheWithUrlString(urlString: imageUrl )
            }
            return cell
        default:
            return UICollectionViewCell()
        }
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width / 3, height: collectionView.frame.height)
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        Delegate?.DetailsCollectionSelect(Cell: self, indexPath: indexPath)
    }
    
}




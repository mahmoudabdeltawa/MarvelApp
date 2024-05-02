//
//  DetailsShowImageVC.swift
//  MarvelApp
//
//  Created by Mahmoud on 01/05/2024.
//

import UIKit

class DetailsShowImageVC: UIViewController {

    var Title: String? = ""
    var willDisplayIndex = 0
    var ComicResult = [Comic]()
    var SeriesResult = [Series]()
    var StoryResult = [Story]()
    var EventResult = [Event]()
    var EnumCollectionDetails : CollectionDetails?
    override func viewDidLoad() {
        super.viewDidLoad()
        ScrollItem()
        SetupButtonBack()
        SetupDetailsImage()
        view.backgroundColor =  #colorLiteral(red: 0.1617141664, green: 0.1756418347, blue: 0.1944068968, alpha: 1)
    }

    //MARK: - Header Button Back
    lazy var ButtonBack : UIButton = {
        let Button = UIButton()
        Button.tintColor = .white
        Button.backgroundColor = #colorLiteral(red: 0.1160394028, green: 0.1160394028, blue: 0.1160394028, alpha: 1)
        Button.translatesAutoresizingMaskIntoConstraints = false
        Button.setImage(UIImage(systemName: "xmark"), for: .normal)
        Button.addTarget(self, action: #selector(HeaderButtonBackSelect), for: .touchUpInside)
        return Button
    }()
    
    @objc func HeaderButtonBackSelect() {
        Dismiss(FromController: self)
    }
    
    private func SetupButtonBack() {
        view.addSubview(ButtonBack)
        let constraints = [
            ButtonBack.widthAnchor.constraint(equalToConstant: MultiplierWidth(40)),
            ButtonBack.heightAnchor.constraint(equalTo: ButtonBack.widthAnchor),
            ButtonBack.rightAnchor.constraint(equalTo: view.rightAnchor,constant: -20),
            ButtonBack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 15)
        ]
        NSLayoutConstraint.activate(constraints)
    }

    //MARK: - Setup Marvel Details Image
    let DetailsImageId = "DetailsImageId"
    lazy var DetailsImage: FSPagerView = {
        let View = FSPagerView()
        View.delegate = self
        View.isInfinite = true
        View.dataSource = self
        View.isScrollEnabled = true
        View.backgroundColor = .clear
        View.collectionView.ContentInsetLeft = 0
        View.interitemSpacing = MultiplierWidth(8)
        View.translatesAutoresizingMaskIntoConstraints = false
        View.transformer = FSPagerViewTransformer(type: .linear)
        View.register(DetailsShowImageCell.self, forCellWithReuseIdentifier: DetailsImageId)
        View.itemSize = CGSize(width: view.frame.width - MultiplierWidth(60), height: view.frame.height - MultiplierHeight(200))
        return View
    }()
    
    private func SetupDetailsImage() {
        view.addSubview(DetailsImage)
        let constraints = [
            DetailsImage.leftAnchor.constraint(equalTo: view.leftAnchor),
            DetailsImage.rightAnchor.constraint(equalTo: view.rightAnchor),
            DetailsImage.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: -50),
            DetailsImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 100)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    func ScrollItem() {
        Task {
            await scrollToItem()
        }
    }
    
    func scrollToItem() async {
    DispatchQueue.main.async {
    if let index = self.ComicResult.firstIndex(where: { $0.title == self.Title }) {
    let indexPath = IndexPath(item: index, section: 0)
    self.DetailsImage.scrollToItem(at: indexPath.item, animated: false)
    }
    }
    }
}

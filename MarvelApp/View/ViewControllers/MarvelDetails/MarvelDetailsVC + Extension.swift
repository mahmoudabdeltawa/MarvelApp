//
//  MarvelDetailsVC + Extension.swift
//  MarvelApp
//
//  Created by Mahmoud on 01/05/2024.
//

import UIKit

//MARK: - MarvelDetails VC extension TableViewDataSource And UITableViewDelegate
extension MarvelDetailsVC : UITableViewDataSource , UITableViewDelegate , HeaderDetailsDelegate , MarvelDetailsDelegate , DetailsLinksCellDelegate  {
                
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5 + (heroes.urls?.count ?? 0)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: HeaderId, for: indexPath) as! HeaderDetailsCell
            cell.selectionStyle = .none
            cell.Delegate = self
            
            
            cell.HeaderNameLabel.text = heroes.name
            cell.HeaderDescriptionLabel.text = heroes.description

            if let thumbnail = heroes.thumbnail?.path , let Extension = heroes.thumbnail?._extension  {
            let imageUrl = "\(thumbnail).\(Extension)"
            cell.HeaderImage.loadImageUsingCacheWithUrlString(urlString: imageUrl)
            }
            
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: CellId, for: indexPath) as! DetailsCell
            cell.selectionStyle = .none
            cell.Delegate = self
            cell.ComicResult = ComicResult
            cell.EnumCollectionDetails = .COMICS
            cell.DetailsLabel.isHidden = ComicResult.count != 0 ? false:true
            
            return cell
            
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: CellId, for: indexPath) as! DetailsCell
            cell.selectionStyle = .none
            cell.Delegate = self
            cell.SeriesResult = SeriesResult
            cell.EnumCollectionDetails = .SERIES
            cell.DetailsLabel.isHidden = SeriesResult.count != 0 ? false:true
            return cell
            
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: CellId, for: indexPath) as! DetailsCell
            cell.selectionStyle = .none
            cell.Delegate = self
            cell.StoryResult = StoryResult
            cell.EnumCollectionDetails = .STORIES
            cell.DetailsLabel.isHidden = StoryResult.count != 0 ? false:true
            return cell
            
        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: CellId, for: indexPath) as! DetailsCell
            cell.selectionStyle = .none
            cell.Delegate = self
            cell.EventResult = EventResult
            cell.EnumCollectionDetails = .EVENTS
            cell.DetailsLabel.isHidden = EventResult.count != 0 ? false:true
            return cell
        
        default:
            if indexPath.row > 4 {
            let cell = tableView.dequeueReusableCell(withIdentifier: LinksId, for: indexPath) as! DetailsLinksCell
            cell.Delegate = self
            cell.selectionStyle = .none
            cell.DetailsLabel.isHidden = indexPath.row == 5 ? false : true
            cell.DetailsLinksTitle.text = heroes.urls?[indexPath.row - 5].type
                
            return cell
            }else{
            return UITableViewCell()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return UITableView.automaticDimension
        case 1:
            return ComicResult.count != 0 ? 300 : 0
        case 2:
            return SeriesResult.count != 0 ? 300 : 0
        case 3:
            return StoryResult.count != 0 ? 300 : 0
        case 4:
            return EventResult.count != 0 ? 300 : 0
            
        default:
            return UITableView.automaticDimension
        }
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
    func HeaderButtonBackSelect() {
        Dismiss(FromController: self)
    }
    
    func DetailsLinksSelect(Cell: DetailsLinksCell) {
        if let indexPath = DetailsMarvelTableView.indexPath(for: Cell) {
            if let url = heroes.urls?[indexPath.row - 5].url {
                OpenUrl(url: url)
            }
        }
    }
    
    @objc func OpenUrl(url:String) {
    guard let url = URL(string:url) else{return}
    let application = UIApplication.shared
    if application.canOpenURL(url) {
    application.open(url, options: [:])
    return
    }
    }
    
    func DetailsCollectionSelect(Cell:DetailsCell, indexPath: IndexPath) {
        if let index = DetailsMarvelTableView.indexPath(for: Cell) {
        let DetailsShowImage = DetailsShowImageVC()
            switch index.item {
            case 1:
                DetailsShowImage.ComicResult = ComicResult
                DetailsShowImage.EnumCollectionDetails = .COMICS
                DetailsShowImage.willDisplayIndex = indexPath.item
                DetailsShowImage.Title = ComicResult[indexPath.item].title
                Present(FromController: self, ToViewController: DetailsShowImage)
            case 2:
                DetailsShowImage.SeriesResult = SeriesResult
                DetailsShowImage.EnumCollectionDetails = .SERIES
                DetailsShowImage.willDisplayIndex = indexPath.item
                DetailsShowImage.Title = SeriesResult[indexPath.item].title
                Present(FromController: self, ToViewController: DetailsShowImage)
            case 3:
                DetailsShowImage.StoryResult = StoryResult
                DetailsShowImage.EnumCollectionDetails = .STORIES
                DetailsShowImage.willDisplayIndex = indexPath.item
                DetailsShowImage.Title = StoryResult[indexPath.item].title
                Present(FromController: self, ToViewController: DetailsShowImage)
            case 4:
                DetailsShowImage.EventResult = EventResult
                DetailsShowImage.EnumCollectionDetails = .EVENTS
                DetailsShowImage.willDisplayIndex = indexPath.item
                DetailsShowImage.Title = EventResult[indexPath.item].title
                Present(FromController: self, ToViewController: DetailsShowImage)
            default:
                break
            }
        }
    }
    
}





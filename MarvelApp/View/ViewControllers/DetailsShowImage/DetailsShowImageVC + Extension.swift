//
//  DetailsShowImageVC + Extension.swift
//  MarvelApp
//
//  Created by Mahmoud on 01/05/2024.
//

import UIKit

//MARK: - DetailsShowImage VC extension TableViewDataSource And UITableViewDelegate
extension DetailsShowImageVC : FSPagerViewDelegate, FSPagerViewDataSource  {
        
    func numberOfItems(in pagerView: FSPagerView) -> Int {
        switch EnumCollectionDetails {
        case .COMICS:
            return ComicResult.count
        case .SERIES:
            return SeriesResult.count
        case .STORIES:
            return StoryResult.count
        case .EVENTS:
            return EventResult.count
        default:
            return 0
        }
    }
    
    func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> UICollectionViewCell {
    switch EnumCollectionDetails {
        case .COMICS:
        let cell = pagerView.dequeueReusableCell(withReuseIdentifier: DetailsImageId, at: index) as! DetailsShowImageCell
        cell.clipsToBounds = true
        cell.backgroundColor = .clear
        cell.DetailsShowTitle.text = ComicResult[index].title
        cell.LabelCount.text = "\(willDisplayIndex) / \(ComicResult.count)"

        if let thumbnail = ComicResult[index].thumbnail?.path , let Extension = ComicResult[index].thumbnail?._extension  {
        let imageUrl = "\(thumbnail).\(Extension)"
        cell.DetailsShowImage.loadImageUsingCacheWithUrlString(urlString: imageUrl )
        }
            
        return cell
        case .SERIES:
        let cell = pagerView.dequeueReusableCell(withReuseIdentifier: DetailsImageId, at: index) as! DetailsShowImageCell
        cell.clipsToBounds = true
        cell.backgroundColor = .clear
        cell.DetailsShowTitle.text = SeriesResult[index].title
        cell.LabelCount.text = "\(willDisplayIndex) / \(SeriesResult.count)"
        
        if let thumbnail = SeriesResult[index].thumbnail?.path , let Extension = SeriesResult[index].thumbnail?._extension  {
        let imageUrl = "\(thumbnail).\(Extension)"
        cell.DetailsShowImage.loadImageUsingCacheWithUrlString(urlString: imageUrl )
        }
        return cell
        case .STORIES:
        let cell = pagerView.dequeueReusableCell(withReuseIdentifier: DetailsImageId, at: index) as! DetailsShowImageCell
        cell.clipsToBounds = true
        cell.backgroundColor = .clear
        cell.DetailsShowTitle.text = StoryResult[index].title
        cell.LabelCount.text = "\(willDisplayIndex) / \(StoryResult.count)"

        if let thumbnail = StoryResult[index].thumbnail?.path , let Extension = StoryResult[index].thumbnail?._extension  {
        let imageUrl = "\(thumbnail).\(Extension)"
        cell.DetailsShowImage.loadImageUsingCacheWithUrlString(urlString: imageUrl )
        }
        return cell
        case .EVENTS:
        let cell = pagerView.dequeueReusableCell(withReuseIdentifier: DetailsImageId, at: index) as! DetailsShowImageCell
        cell.clipsToBounds = true
        cell.backgroundColor = .clear
        cell.DetailsShowTitle.text = EventResult[index].title
        cell.LabelCount.text = "\(willDisplayIndex) / \(EventResult.count)"

        if let thumbnail = EventResult[index].thumbnail?.path , let Extension = EventResult[index].thumbnail?._extension  {
        let imageUrl = "\(thumbnail).\(Extension)"
        cell.DetailsShowImage.loadImageUsingCacheWithUrlString(urlString: imageUrl )
        }
        return cell
        default:
            return UICollectionViewCell()
        }
    }
    
    func pagerView(_ pagerView: FSPagerView, willDisplay cell: UICollectionViewCell, forItemAt index: Int) {
        willDisplayIndex = index + 1
    }
    

}

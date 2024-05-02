//
//  ImageView + Extensions.swift
//  MarvelApp
//
//  Created by Mahmoud on 01/05/2024.
//

import UIKit

let imageCache = NSCache<NSString,UIImage>()

extension UIImageView {
    
    func loadImageUsingCacheWithUrlString(urlString:String , wallDeadline: TimeInterval = 0.2) {
        
        self.image = UIImage(named: "Group 26056")
    // check cache for image first
        if let cachedImage = imageCache.object(forKey: urlString as NSString) {
            self.image = cachedImage
            return
        }
        
        //otherwise fire off a new download
        let url = URL(string: urlString)
        URLSession.shared.dataTask(with: url!, completionHandler: {(data,response,error) in
            //download hit an error so lets return out
            if error != nil {
            print(error!)
            self.image = UIImage(named: "Group 26056")
            return
            }
            

            if let downloaded = data , let downloadedimage = UIImage(data: downloaded) {
            imageCache.setObject(downloadedimage, forKey: urlString as NSString)
            DispatchQueue.main.asyncAfter(wallDeadline: .now() + wallDeadline) {
            self.image = downloadedimage
            }
               
            }
        }).resume()
    }
    
}



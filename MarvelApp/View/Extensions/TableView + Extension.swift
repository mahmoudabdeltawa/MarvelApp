//
//  TableView + Extension.swift
//  MarvelApp
//
//  Created by Mahmoud on 01/05/2024.
//

import UIKit

extension UITableView {
    
    func addLoading(_ indexPath:IndexPath, closure: @escaping (() -> Void)){
    if let lastVisibleIndexPath = self.indexPathsForVisibleRows?.last {
    if indexPath == lastVisibleIndexPath && indexPath.row == self.numberOfRows(inSection: 0) - 1 {
    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
    closure()
    }
    }
    }
    }

}


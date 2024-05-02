//
//  Date.swift
//  MarvelApp
//
//  Created by Mahmoud on 01/05/2024.
//

import Foundation

extension Date {
    static var currentTimeStamp: String {
        return String(Date().timeIntervalSince1970 * 1000)
    }
}

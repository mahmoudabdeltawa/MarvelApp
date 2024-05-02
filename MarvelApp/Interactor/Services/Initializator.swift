//
//  Initializator.swift
//  MarvelApp
//
//  Created by Mahmoud on 01/05/2024.
//

import Foundation

final class Initializator: Serviceable {

    init() { }
    
    func initialize() {
        // Network
        OpenAPIClientAPI.requestBuilderFactory = MarvelRequestBuilderFactory()
    }
}

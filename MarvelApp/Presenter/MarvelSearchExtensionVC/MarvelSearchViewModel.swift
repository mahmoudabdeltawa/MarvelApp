//
//  MarvelSearchViewModel.swift
//  MarvelApp
//
//  Created by Mahmoud on 01/05/2024.
//

import UIKit

extension MarvelSearchVC {
    
    // Function to fetch characters collection based on the name starting with provided string
    func GetData(nameStartsWith: String? = nil) {
        Task {
            try await charactersCollection(nameStartsWith: nameStartsWith)
        }
    }
    
    // Function to initialize network settings
    func initialize() {
        // Network
        OpenAPIClientAPI.requestBuilderFactory = MarvelRequestBuilderFactory()
    }
    
    // Function to fetch characters collection asynchronously
    func charactersCollection(nameStartsWith: String? = nil) async throws {
        do {
            heroes.removeAll() // Remove existing heroes data
            self.SearchTableView.reloadData() // Reload the table view to reflect the changes
            
            // Fetch characters collection from the API
            let data = try await PublicAPI.getCharactersCollection(nameStartsWith: nameStartsWith, limit: 10, offset: 0)
            
            // Check if data is available
            guard let characters = data.data?.results else { return }
            
            // Append fetched characters to the heroes array
            for item in characters {
                heroes.append(item)
            }
            
            // Reload the table view to reflect the updated data
            self.SearchTableView.reloadData()
        } catch {
            print("error occured: \(error)") // Print error if any occurs
        }
    }
    
}


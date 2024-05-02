//  HomeViewModel.swift
//  MarvelApp
//
//  Created by Mahmoud on 01/05/2024.
//

import UIKit

extension HomeVC {
    
    // Function to fetch characters collection asynchronously
    func GetData() {
        Task {
            try await charactersCollection()
        }
    }
    
    // Function to initialize network settings
    func initialize() {
        // Network
        OpenAPIClientAPI.requestBuilderFactory = MarvelRequestBuilderFactory()
    }
    
    // Function to fetch characters collection from the API
    // Parameters:
    // - nameStartsWith: String to filter characters by name (optional)
    func charactersCollection(nameStartsWith: String? = nil) async throws {
        do {
            isLoading = true // Set loading state to true
            
            // Fetch characters collection from the API with specified parameters
            let data = try await PublicAPI.getCharactersCollection(nameStartsWith: nameStartsWith, limit: limit, offset: currentOffset)
            
            // Check if data is available
            guard let characters = data.data?.results else { return }
            
            // Hide loading overlay
            LoadingOverlay.shared.hideOverlayView()
            
            // Iterate over fetched characters and append them to the heroes array
            for item in characters {
                self.currentOffset += 1
                heroes.append(item)
                isLoading = false // Set loading state to false
                self.MarvelTableView.reloadData() // Reload the table view to reflect the updated data
            }
        } catch {
            isLoading = false // Set loading state to false in case of error
            print("error occured: \(error)") // Print error message
        }
    }
    
}

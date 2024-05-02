//
//  MarvelDetailsViewModel.swift
//  MarvelApp
//
//  Created by Mahmoud on 02/05/2024.
//

import Foundation


extension MarvelDetailsVC {
        
        // Function to fetch details of Marvel heroes
        func GetMarvelDetails() {
            initialize() // Initialize network
            
            let dispatchGroup = DispatchGroup() // Create a DispatchGroup to track multiple async tasks
            
            // Load data from comics
            if let comics = heroes.comics?.items {
                for comic in comics {
                    if let URI = comic.resourceURI, let id = Int(URL(string: URI)?.lastPathComponent ?? "") {
                        dispatchGroup.enter() // Enter the DispatchGroup before starting each task
                        GetDataComic(id, dispatchGroup: dispatchGroup) // Fetch comic details
                    }
                }
            }
            
            // Load data from series
            if let series = heroes.series?.items {
                for seriesItem in series {
                    if let URI = seriesItem.resourceURI, let id = Int(URL(string: URI)?.lastPathComponent ?? "") {
                        dispatchGroup.enter()
                        GetDataSeries(id, dispatchGroup: dispatchGroup) // Fetch series details
                    }
                }
            }
            
            // Load data from stories
            if let stories = heroes.stories?.items {
                for story in stories {
                    if let URI = story.resourceURI, let id = Int(URL(string: URI)?.lastPathComponent ?? "") {
                        dispatchGroup.enter()
                        GetDataStory(id, dispatchGroup: dispatchGroup) // Fetch story details
                    }
                }
            }
            
            // Load data from events
            if let events = heroes.events?.items {
                for event in events {
                    if let URI = event.resourceURI, let id = Int(URL(string: URI)?.lastPathComponent ?? "") {
                        dispatchGroup.enter()
                        GetDataEvent(id, dispatchGroup: dispatchGroup) // Fetch event details
                    }
                }
            }
            
            // When all tasks finish, reload the table view
            dispatchGroup.notify(queue: .main) {
                self.DetailsMarvelTableView.reloadData() // Reload table view after all tasks are completed
            }
        }
        
        // Function to fetch details of a comic with a given ID
        func GetDataComic(_ id: Int, dispatchGroup: DispatchGroup) {
            Task {
                defer { dispatchGroup.leave() } // Leave the DispatchGroup after task completion
                do {
                    let data = try await PublicAPI.getComicIndividual(comicId: id) // Fetch comic details from API
                    guard let result = data.data?.results else { return }
                    for item in result {
                        ComicResult.append(item) // Add comic details to the result array
                    }
                } catch {
                    print("error occured: \(error)") // Print error if any occurs
                }
            }
        }
        
        // Function to fetch details of a series with a given ID
        func GetDataSeries(_ id: Int, dispatchGroup: DispatchGroup) {
            Task {
                defer { dispatchGroup.leave() }
                do {
                    let data = try await PublicAPI.getSeriesIndividual(seriesId: id)
                    guard let result = data.data?.results else { return }
                    for item in result {
                        SeriesResult.append(item)
                    }
                } catch {
                    print("error occured: \(error)")
                }
            }
        }
        
        // Function to fetch details of a story with a given ID
        func GetDataStory(_ id: Int, dispatchGroup: DispatchGroup) {
            Task {
                defer { dispatchGroup.leave() }
                do {
                    let data = try await PublicAPI.getStoryIndividual(storyId: id)
                    guard let result = data.data?.results else { return }
                    for item in result {
                        StoryResult.append(item)
                    }
                } catch {
                    print("error occured: \(error)")
                }
            }
        }
        
        // Function to fetch details of an event with a given ID
        func GetDataEvent(_ id: Int, dispatchGroup: DispatchGroup) {
            Task {
                defer { dispatchGroup.leave() }
                do {
                    let data = try await PublicAPI.getEventIndividual(eventId: id)
                    guard let result = data.data?.results else { return }
                    for item in result {
                        EventResult.append(item)
                    }
                } catch {
                    print("error occured: \(error)")
                }
            }
        }
        
        // Function to initialize network settings
        func initialize() {
            OpenAPIClientAPI.requestBuilderFactory = MarvelRequestBuilderFactory() // Set up network
        }
        
}


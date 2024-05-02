//
//  CharacterCollectionTests.swift
//  MarvelAppTests
//
//  Created by Mahmoud on 02/05/2024.
//

import XCTest
@testable import MarvelApp

class CharacterCollectionTests: XCTestCase {

    func testCharactersCollection() {
        let viewController = HomeVC()
        let expectedCharactersCount = 5 
        

        viewController.GetData()
        XCTAssertEqual(viewController.heroes.count, expectedCharactersCount, "Characters count is not as expected")
    }
    
    
    func testCharactersCollectionError() async {
        let viewController = await HomeVC()
    
        do {
            let mockErrorData: Data? = nil
            let mockResponse = HTTPURLResponse(url: URL(string: "https://example.com")!, statusCode: 500, httpVersion: nil, headerFields: nil)
     
            let data = try await PublicAPI.getCharactersCollection(nameStartsWith: nil, limit: 5, offset: 0)
            guard let characters = data.data?.results else { return }
            for item in characters {
            print(item.name ?? "")
            }
        } catch {
            XCTAssertNotNil(error, "Error should not be nil")
        }
    }
}

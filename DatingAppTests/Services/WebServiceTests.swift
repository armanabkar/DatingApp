//
//  WebServiceTests.swift
//  DatingAppTests
//
//  Created by Arman Abkar on 12/12/21.
//

import XCTest
@testable import DatingApp

class WebServiceTests: XCTestCase {
    
    var webService: API = WebService.shared
    
    func test_start() async throws {
        let responseCode = try await webService.startServer()
        XCTAssertEqual(responseCode, 200)
    }
    
    func test_fetchCharacters() async throws {
        let characters = try await webService.fetchCharacters()
        XCTAssertEqual(characters.count, 75)
    }
    
    func test_fetchSuggestions() async throws {
        let suggestions = try await webService.fetchSuggestions()
        XCTAssertEqual(suggestions.count, 75)
    }
    
}

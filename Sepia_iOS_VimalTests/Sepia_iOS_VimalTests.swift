//
//  Sepia_iOS_VimalTests.swift
//  Sepia_iOS_VimalTests
//
//  Created by Vimal on 15/11/22.
//

import XCTest
@testable import Sepia_iOS_Vimal

final class Sepia_iOS_VimalTests: XCTestCase {

    var sut: PetListViewModel?
    var useCase = petListUseCases()
    override func setUpWithError() throws {
        sut = PetListViewModel(useCases:useCase)
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        sut = nil
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testLoadPlist() {
        sut?.petListUseCase.getPetListData()
    }
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

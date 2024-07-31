//
//  CleanArchitectureTests.swift
//  CleanArchitectureTests
//
//  Created by mind on 06/03/24.
//

import XCTest
@testable import CleanArchitecture

final class ProductUseCaseTests: XCTestCase {

    var productUseCaseMock: ProductUseCase!
    var mockAPIManager: MockApiManager!

    override func setUpWithError() throws {
        mockAPIManager = MockApiManager()
        productUseCaseMock = ProductUseCaseMockImpl(apiManager: mockAPIManager)
    }

    override func tearDownWithError() throws {
        productUseCaseMock = nil
        mockAPIManager = nil
    }

    func testFetchProduct() {
        let expectation = XCTestExpectation(description: "Fetch products")
            
        productUseCaseMock.fetchProduct { (products, error) in
            XCTAssertNil(error, "Error fetching products: \(String(describing: error))")
            XCTAssertNotNil(products, "Products should not be nil")
            XCTAssertEqual(products?.count, 2, "Expected 3 products")
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5.0)
    }
    
    func testAddProduct() {
            let expectation = XCTestExpectation(description: "Add product")
                        
            let newProduct = AddProduct(id: 1, title: "car")
        productUseCaseMock.addProduct(product: newProduct) { (addedProduct, error) in
                XCTAssertNil(error, "Error adding product: \(String(describing: error))")
                XCTAssertNotNil(addedProduct, "Added product should not be nil")
                XCTAssertEqual(addedProduct?.id, newProduct.id, "IDs should match")
                XCTAssertEqual(addedProduct?.title, newProduct.title, "title should match")
                expectation.fulfill()
            }
            
            wait(for: [expectation], timeout: 5.0)
        }
}

import XCTest
@testable import CleanArchitecture

class MockApiManager:APIManager {
    
    override
    func request<T>(modelType: T.Type, type: EndPointType, completion: @escaping ResultHandler<T>) where T : Decodable, T : Encodable {
        
        if modelType == [Product].self {
            let products = [
                Product(id: 1, title: "Bag", price: 123.5, description: "beautiful big bags", category: "bags", image: "https:www.google.com", rating: Rate(rate: 4.5, count: 1)),
                Product(id: 1, title: "Bag", price: 123.5, description: "beautiful big bags", category: "bags", image: "https:www.google.com", rating: Rate(rate: 4.5, count: 1)),
            ]
            
            completion(.success(products as! T))

        }
        
        else if modelType == AddProduct.self {
            let addedProduct = AddProduct(id: 1, title: "car")
            completion(.success(addedProduct as! T))
        }
        
        else {
            completion(.failure(NSError(domain: "TestError", code: 500, userInfo: nil) as! DataError))
        }
    }
}


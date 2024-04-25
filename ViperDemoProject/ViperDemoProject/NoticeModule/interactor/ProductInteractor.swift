//
//  ProductInteractor.swift
//  ViperDemoProject
//
//  Created by BeLocum-6 on 23/04/24.
//

import Foundation
class ProductInteractor :PresenterToInteractorProtocol {
    
    var presenter: InteractorToPresenterProtocol?

    func fetchProduct() {
        let task = URLSession.shared.dataTask(with: URLRequest(url: URL(string: "https://dummyjson.com/products")!)) { data, response, error in
            if error == nil {
                do {
                    if let productsData = try JSONDecoder().decode(ProductMain_Model.self, from: data!) as? ProductMain_Model {
//                        success(productsData)
                        self.presenter?.productFetchedSuccess(productModelArray: productsData.products ?? [Products]())
                    }else{
//                        fail(NSError(domain: "Data Parsing Error!", code: 401))
                        self.presenter?.productFetchFailed()
                    }
                } catch {
//                    fail(NSError(domain: "Data Error!", code: 500))
                    self.presenter?.productFetchFailed()
                }
            }else{
//                fail(error as NSError?)
                self.presenter?.productFetchFailed()
            }
        }
        task.resume()
    }
    
    
}

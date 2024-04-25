//
//  ProductPresenter.swift
//  ViperDemoProject
//
//  Created by BeLocum-6 on 23/04/24.
//

import Foundation
import UIKit

class ProductPresenter:ViewToPresenterProtocol {
    var view: PresenterToViewProtocol?
    var interactor: PresenterToInteractorProtocol?
    var router: PresenterToRouterProtocol?
    
    func startFetchingProduct() {
        interactor?.fetchProduct()
    }
    
    func showMovieController(navigationController: UINavigationController) {
        router?.pushToMovieScreen(navigationConroller: navigationController)
    }
    
}

extension ProductPresenter : InteractorToPresenterProtocol {
    
    func productFetchedSuccess(productModelArray: [Products]) {
        view?.showProduct(productArray: productModelArray)
    }
    
    func productFetchFailed() {
        view?.showError()
    }
    
}

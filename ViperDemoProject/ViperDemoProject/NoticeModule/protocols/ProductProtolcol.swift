//
//  ProductProtolcol.swift
//  ViperDemoProject
//
//  Created by BeLocum-6 on 23/04/24.
//

import Foundation
import UIKit

protocol ViewToPresenterProtocol {
    
    var view: PresenterToViewProtocol? {get set}
    var interactor: PresenterToInteractorProtocol? {get set}
    var router: PresenterToRouterProtocol? {get set}
    func startFetchingProduct()
    func showMovieController(navigationController:UINavigationController)

}

protocol PresenterToViewProtocol {
    func showProduct(productArray:[Products])
    func showError()
}

protocol PresenterToRouterProtocol {
    static func createModule()-> ProductListVC
    func pushToMovieScreen(navigationConroller:UINavigationController)
}

protocol PresenterToInteractorProtocol {
    var presenter:InteractorToPresenterProtocol? {get set}
    func fetchProduct()
}

protocol InteractorToPresenterProtocol {
    func productFetchedSuccess(productModelArray:[Products])
    func productFetchFailed()
}

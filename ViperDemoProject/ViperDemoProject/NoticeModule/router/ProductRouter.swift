//
//  ProductRouter.swift
//  ViperDemoProject
//
//  Created by BeLocum-6 on 23/04/24.
//

import Foundation
import UIKit

class ProductRouter:PresenterToRouterProtocol{
    
    
    static func createModule() -> ProductListVC {
        let view = mainstoryboard.instantiateViewController(withIdentifier: "ProductListVC") as! ProductListVC
        
        var presenter: ViewToPresenterProtocol & InteractorToPresenterProtocol = ProductPresenter()
        var interactor: PresenterToInteractorProtocol = ProductInteractor()
        let router:PresenterToRouterProtocol = ProductRouter()
        
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        view.presentor = presenter

        return view
    }
    
    static var mainstoryboard:UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
    
    func pushToMovieScreen(navigationConroller: UINavigationController) {
        let moviewModue = ProductRouter.mainstoryboard.instantiateViewController(withIdentifier: "ProductDetailVC") as! ProductDetailVC
        navigationConroller.pushViewController(moviewModue, animated: true)
    }
    
    
}

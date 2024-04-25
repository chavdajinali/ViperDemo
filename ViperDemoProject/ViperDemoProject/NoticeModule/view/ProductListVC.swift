//
//  ProductListVC.swift
//  ViperDemoProject
//
//  Created by BeLocum-6 on 23/04/24.
//

import UIKit

class ProductListVC: UIViewController {
    
    var presentor : ViewToPresenterProtocol?

    
    @IBOutlet weak var tblProductList:UITableView!
    
    
    var productList = [Products]()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Product-Module"
        presentor?.startFetchingProduct()
        
        tblProductList.delegate = self
        tblProductList.dataSource = self
        tblProductList?.translatesAutoresizingMaskIntoConstraints = false
        tblProductList.register(UINib(nibName: "ProductCell", bundle: nil), forCellReuseIdentifier: "ProductCell")

    }
    
}

extension ProductListVC : PresenterToViewProtocol {
    func showProduct(productArray: [Products]) {
        self.productList = productArray
        DispatchQueue.main.async { [weak self] in
            self?.tblProductList.reloadData()
        }
    }
    func showError() {
        let alert = UIAlertController(title: "Alert", message: "Problem Fetching Notice", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)

    }
}

extension ProductListVC : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.productList.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblProductList.dequeueReusableCell(withIdentifier: "ProductCell") as? ProductCell
        cell?.SetupData(product: self.productList[indexPath.row])
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        presentor?.showMovieController(navigationController: navigationController!)
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}

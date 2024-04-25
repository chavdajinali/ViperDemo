//
//  ProductCell.swift
//  ViperDemoProject
//
//  Created by BeLocum-6 on 23/04/24.
//

import UIKit

class ProductCell: UITableViewCell {

    @IBOutlet weak var lblID:UILabel!
    @IBOutlet weak var lblTitle:UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func SetupData(product:Products){
        lblID.text = "\(product.id ?? 0)"
        lblTitle.text = product.title
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

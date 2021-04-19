//
//  ProductCell.swift
//  ShoppingList
//
//  Created by ilomidze on 18.04.21.
//

import UIKit

class ProductCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
    
    var product: ProductData!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        product = ProductData()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func initCell(product: ProductData) {
        self.product = product
        updateCell()
    }
    
    func updateCell() {
        nameLabel.text = product.productName
        quantityLabel.text = String(product.productQuant)
    }
    
    @IBAction func PlusButtonAction(_ sender: Any) {
        product.productQuant += 1
        updateCell()
    }
    
    @IBAction func MinusButtonAction(_ sender: Any) {
        if product.productQuant > 1 {
            product.productQuant -= 1
            updateCell()
        }

    }
    
}

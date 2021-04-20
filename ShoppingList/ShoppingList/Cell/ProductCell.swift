//
//  ProductCell.swift
//  ShoppingList
//
//  Created by ilomidze on 18.04.21.
//

import UIKit

public protocol coreDataUpdateDelegate: class {
    func updateCoreDataQuant(index: Int, quantity: Int)
}

class ProductCell: UITableViewCell {

    var delegate: coreDataUpdateDelegate?
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
    
    var product: ProductData!
    var index: Int!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        product = ProductData()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func initCell(product: ProductData, index: Int) {
        self.product = product
        self.index = index
        updateCell()
    }

    
    func updateCell() {
        nameLabel.text = product.productName
        quantityLabel.text = String(product.productQuant)
        self.delegate?.updateCoreDataQuant(index: index, quantity: product.productQuant)
    }
    
    @IBAction func PlusButtonAction(_ sender: Any) {
        product.productQuant += 1
//        self.delegate?.updateCoreDataQuant(index: index, quantity: product.productQuant)
        updateCell()
    }
    
    @IBAction func MinusButtonAction(_ sender: Any) {
        if product.productQuant > 1 {
            product.productQuant -= 1
            updateCell()
        }

    }
    
}

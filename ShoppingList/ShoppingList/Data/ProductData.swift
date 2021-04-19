//
//  ProductData.swift
//  ShoppingList
//
//  Created by ilomidze on 19.04.21.
//

import Foundation


class ProductData {
    var productName: String
    var productQuant: Int
    
    init() {
        self.productName = "Product"
        self.productQuant = 1
    }
    
    init(productName: String, productQuant: Int) {
        self.productName = productName
        self.productQuant = productQuant
    }
}

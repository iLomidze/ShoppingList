//
//  TableViewController.swift
//  ShoppingList
//
//  Created by ilomidze on 18.04.21.
//

import Foundation
import UIKit

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shoppingList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCell", for: indexPath) as? ProductCell else { return UITableViewCell() }
        
        cell.initCell(product: shoppingList[indexPath.row], index: indexPath.row)
        cell.delegate = self
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            shoppingList.remove(at: indexPath.row)
            removeCoreDataElem(index: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .left)
        }
    }
    
}

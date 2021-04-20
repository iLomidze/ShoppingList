//
//  ViewController.swift
//  ShoppingList
//
//  Created by ilomidze on 18.04.21.
//

import UIKit
import CoreData


class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addButton: UIBarButtonItem!
    @IBOutlet weak var clearListButton: UIBarButtonItem!
    
    var appDelegate: AppDelegate!
    var managedContext: NSManagedObjectContext!
    var shoppingList = [ProductData]()

    var productCoreData: [NSManagedObject] = []
//    var prodQuantCoreData
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "ProductCell", bundle: nil), forCellReuseIdentifier: "ProductCell")
        
        
        
        appDelegate = (UIApplication.shared.delegate as! AppDelegate)
        managedContext = appDelegate.persistentContainer.viewContext

        fetchCoreData()
    }

    
    @objc func clearList() {
        shoppingList = []
        clearCoreData()
        tableView.reloadData()
    }
    
    @IBAction func addButtonAction(_ sender: Any) {
        let ac = UIAlertController(title: "Product", message: "Name of the product", preferredStyle: .alert)
        ac.addTextField(configurationHandler: nil)
        
        ac.addAction(UIAlertAction(title: "Cancel", style: .default, handler: nil))
        ac.addAction(UIAlertAction(title: "Add", style: .default, handler: { [weak self] _ in
            guard let productName = ac.textFields?[0].text else { return }
            
            let product = ProductData(productName: productName, productQuant: 1)
            self?.shoppingList.append(product)
            self?.saveInCoreData(product: product)
            self?.tableView.reloadData()
        }))
        present(ac, animated: true, completion: nil)
    }
    
    @IBAction func clearButtonAction(_ sender: Any) {
        let ac = UIAlertController(title: "Clear The List", message: "Do you really want to clear the list?", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Cancel", style: .default, handler: nil))
        ac.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: { [weak self] _ in
            self?.tableView.reloadData()
            print("Shopping List Cleared")
            self?.clearList()
        }))
        present(ac, animated: true, completion: nil)
    }
    
}


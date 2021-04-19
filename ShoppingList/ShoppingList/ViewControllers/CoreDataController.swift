//
//  CoreDataController.swift
//  ShoppingList
//
//  Created by ilomidze on 19.04.21.
//

import Foundation
import CoreData
import UIKit


extension ViewController {
    
    func saveInCoreData(product: ProductData) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
          }

          
          // 1
          let managedContext = appDelegate.persistentContainer.viewContext
          
          // 2
          let entityProduct = NSEntityDescription.entity(forEntityName: "Product", in: managedContext)!

          let productCore = NSManagedObject(entity: entityProduct, insertInto: managedContext)

          // 3
        productCore.setValue(product.productName, forKeyPath: "name")
        productCore.setValue(product.productQuant, forKeyPath: "quantity")

          // 4
          do {
            try managedContext.save()
//            people.append(person)
          } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
          }
    }
    
    
    func fetchCoreData() {
        //1
          guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
              return
          }
          
          let managedContext =
            appDelegate.persistentContainer.viewContext
          
          //2
          let fetchRequest =
            NSFetchRequest<NSManagedObject>(entityName: "Product")
          
          //3
          do {
            productCoreData = try managedContext.fetch(fetchRequest)
            print(productCoreData[0].value(forKey: "name") as? String)
          } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
          }
    }
    
}

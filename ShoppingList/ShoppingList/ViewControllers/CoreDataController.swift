//
//  CoreDataController.swift
//  ShoppingList
//
//  Created by ilomidze on 19.04.21.
//

import Foundation
import CoreData
import UIKit


extension ViewController: coreDataUpdateDelegate {
    
    func updateCoreDataQuant(index: Int, quantity: Int) {
        updateCoreDataAttrivuteQuantity(index: index, quantity: quantity)
    }
    
    
    func saveInCoreData(product: ProductData) {
          
          let entityProduct = NSEntityDescription.entity(forEntityName: "NewProduct", in: managedContext)!

          let productCore = NSManagedObject(entity: entityProduct, insertInto: managedContext)

        productCore.setValue(product.productName, forKeyPath: "name")
        productCore.setValue(product.productQuant, forKeyPath: "quantity")

          do {
            try managedContext.save()
            productCoreData.append(productCore)
          } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
          }
    }
    
    
    func fetchCoreData() {
          
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "NewProduct")
          
        do {
            productCoreData = try managedContext.fetch(fetchRequest)
            for item in productCoreData {
                let product = ProductData(productName: item.value(forKeyPath: "name") as! String, productQuant: item.value(forKeyPath: "quantity") as! Int)
                shoppingList.append(product)
            }
          } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
          }
    }
    
    func clearCoreData() {
        
        // Create Fetch Request
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "NewProduct")

        // Create Batch Delete Request
        let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)

        do {
            try managedContext.execute(batchDeleteRequest)

        } catch {
            print("Cannot Clear The Core Data")
        }
    }
    
    func removeCoreDataElem(index: Int) {
        managedContext.delete(productCoreData[index])
        productCoreData.remove(at: index)
        do {
          try managedContext.save()
        } catch let error as NSError {
          print("Could not remove element. \(error), \(error.userInfo)")
        }
        
    }
    
    func updateCoreDataAttrivuteQuantity(index: Int, quantity: Int) {
        productCoreData[index].setValue(quantity, forKey: "quantity")
        do {
          try managedContext.save()
        } catch let error as NSError {
          print("Could not update. \(error), \(error.userInfo)")
        }
    }
    
}

//
//  DatabaseManager.swift
//  CoreData 1
//
//  Created by Chandan Mondal on 24/11/24.
//

import Foundation
import UIKit
import CoreData

class DatabaseManager {
    
    static var shared = DatabaseManager()
    let contex = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
    
    //MARK: Save data in database.....
    func saveData(object: [String : String]){
        let student = NSEntityDescription.insertNewObject(forEntityName: "Students", into: contex!) as! Students
        student.name = object["name"]
        student.city = object["city"]
        student.address = object["address"]
        student.phoneNumber = object["phoneNumber"]
        do {
            try contex?.save()
        } catch {
            print("Data is not save!!")
        }
    }
    
    
    //MARK: Fetch data from Database...
    func fetchData() -> [Students] {
        var student = [Students]()
        let fetchData = NSFetchRequest<NSManagedObject>(entityName: "Students")
        do {
            student = try contex?.fetch(fetchData) as! [Students]
        } catch {
            print("Cannot get data from database!!")
        }
        return student
    }
    
    
    //MARK: Delet data from database...
    func deletData(indx: Int) -> [Students] {
        var student = fetchData()
        contex?.delete(student[indx])
        student.remove(at: indx)
        do{
            try contex?.save()
        } catch {
            print("Cannot delet data!!")
        }
        return student
    }
    
    
    //MARK: Edit Database...
    func editData(object: [String : String], indx: Int) {
        var student = fetchData()
        student[indx].name = object["name"]
        student[indx].city = object["city"]
        student[indx].address = object["address"]
        student[indx].phoneNumber = object["phoneNumber"]
        do{
            try contex?.save()
        } catch {
            print("Data cannot edit!!")
        }
    }
    
}

//
//  Auto.swift
//  EjemploCoreData
//
//  Created by Nicolás Gebauer on 22-06-15.
//  Copyright (c) 2015 Nicolás Gebauer. All rights reserved.
//

import Foundation
import CoreData

/** Class that represents a `Car` object that is saved in the database.
- Parameter manufacturer: The manufacterer of the `Car`.
- Parameter model: The model of the `Car`.
- Parameter year: The year the `Car` was made.
- Parameter mileage: The amount of kilometers that the `Car` has travelled.
- Parameter owner: The owner (`Contact`) of the `Car`.
- Parameter licencePlateString: The string of the licence plate of the `Car`.

- Author: Nicolás Gebauer.
- Date: 22-06-15.
- Copyright: © 2015 Nicolás Gebauer.
- SeeAlso: [Website](http://nicogeb.github.io/EjemploCoreData/).
*/
class Car: NSManagedObject {

    @NSManaged var manufacturer: String
    @NSManaged var model: String
    @NSManaged var year: String
    @NSManaged var mileage: NSNumber
    @NSManaged var owner: Contact?
    @NSManaged var licencePlateString: String

    
    /** Creates a new `Car` in the database and returns it.
    - Parameter moc: The managed object context of the database.
    - Parameter manufacturer: The manufacterer of the `Car`.
    - Parameter model: The model of the `Car`.
    - Parameter year: The year the `Car` was made.
    - Parameter mileage: The amount of kilometers that the `Car` has travelled.
    
    - Author: Nicolás Gebauer.
    - Date: 22-06-15.
    - Copyright: © 2015 Nicolás Gebauer.
    - SeeAlso: [Website](http://nicogeb.github.io/EjemploCoreData/).
    */
    class func new(moc: NSManagedObjectContext, manufacturer:String, model:String, year:String, mileage:Int) -> Car {
        let newCar = NSEntityDescription.insertNewObjectForEntityForName("Car", inManagedObjectContext: moc) as! EjemploCoreData.Car
        
        newCar.manufacturer = manufacturer
        newCar.model = model
        newCar.year = year
        newCar.mileage = mileage
        
        return newCar
    }
    
    /** Eliminates the ownershipd of this car (nullifies `owner`).
    
    - Author: Nicolás Gebauer.
    - Date: 22-06-15.
    - Copyright: © 2015 Nicolás Gebauer.
    - SeeAlso: [Website](http://nicogeb.github.io/EjemploCoreData/).
    */
    func eliminarDueno() {
        owner = nil
    }
    
    /** Sets the ownership of this car.
    - Parameter contact: The `Contact` that will be the `owner` of this `Car`.
    
    - Author: Nicolás Gebauer.
    - Date: 22-06-15.
    - Copyright: © 2015 Nicolás Gebauer.
    - SeeAlso: [Website](http://nicogeb.github.io/EjemploCoreData/).
    */
    func asignarDueno(contact:Contact) {
        owner = contact
    }
    
    /** The licencePlate of the `Car` object being accesed.
    - Parameter newValue: The new `String` value of the licencePlate
    
    - Author: Nicolás Gebauer.
    - Date: 22-06-15.
    - Copyright: © 2015 Nicolás Gebauer.
    - SeeAlso: [Website](http://nicogeb.github.io/EjemploCoreData/).
    */
    var licencePlate: String {
        get { return licencePlateString }
        set { licencePlateString = newValue }
    }
}

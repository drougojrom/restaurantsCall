//
//  Restaurant.swift
//  FoodPin
//
//  Created by Roman Ustiantcev on 14/05/16.
//  Copyright © 2016 Roman Ustiantcev. All rights reserved.
//

import Foundation

class Restaurant {

    var name = ""
    var type = ""
    var location = ""
    var telephoneNumber = ""
    var image = ""
    var isVisited =  false
    
    init(name: String, type: String, location: String, telephoneNumber: String, image: String, isVisited: Bool){
    
        self.name = name
        self.type = type
        self.location = location
        self.telephoneNumber = telephoneNumber
        self.image = image
        self.isVisited = isVisited
        
    }



}
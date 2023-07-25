//
//  NutritionInfo File.swift
//  Restaurent Menu
//
//  Created by Harshit Agarwal on 22/07/23.
//

import Foundation

struct NutritionalInfo: Codable, Comparable { //NutrionInfo file data structure
    
    static func < (lhs: NutritionalInfo, rhs: NutritionalInfo) -> Bool { //Funtion Overloading
        Int(lhs.calories!) <  Int(rhs.calories!)
    }
    
    var name: String
    let calories: Double?
    let serving_size_g: Double?
    let fat_total_g: Double?
    let fat_saturated_g: Double?
    let protein_g: Double?
    let sodium_mg: Double?
    let potassium_mg: Double?
    let cholesterol_mg: Double?
    let carbohydrates_total_g: Double?
    let fiber_g: Double?
    let sugar_g: Double?
}

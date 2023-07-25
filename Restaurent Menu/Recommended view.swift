//
//  Recommended view.swift
//  Restaurent Menu
//
//  Created by Harshit Agarwal on 23/07/23.
//

import SwiftUI

struct Recommended_view: View {
    
    var recommendationMetrics: String// Represents the selected nutritional category
    @State private var nutritionInfo = [NutritionalInfo]()
    @State private var sortedItemList = [item]()// Represents the list of sorted food items

    enum NutritionalCategory: String {     // Enumeration to represent different nutritional categories
            case lowCalorie = "lowCalorie"
            case lowFats = "lowFats"
            case highProtein = "highProtein"
            case highFiber = "highFiber"
        }

    // Function to convert a string to NutritionalCategory
    func categoryFromString(_ categoryString: String) -> NutritionalCategory? {
            return NutritionalCategory(rawValue: categoryString)
        }
    
    // Function to sort the nutritional items based on the selected category
    func sortedItems(for category: NutritionalCategory) -> [(type: Double, items: [NutritionalInfo])] {
        var keyPath: KeyPath<NutritionalInfo, Double?>!
        var comparison: (Double, Double) -> Bool

        switch category {
        case .lowCalorie:
            keyPath = \.calories
            comparison = (<)
        case .lowFats:
            keyPath = \.fat_total_g
            comparison = (<)
        case .highProtein:
            keyPath = \.protein_g
            comparison = (>)
        case .highFiber:
            keyPath = \.fiber_g
            comparison = (>)
        }

        let groupedItems = Dictionary(grouping: nutritionInfo) { item in
            item[keyPath: keyPath] ?? 0
        }

        let sortedKeys = groupedItems.keys.sorted(by: comparison ) // Sort the keys
        
        

        return sortedKeys.map { key in
            (type: key, items: groupedItems[key]!)
        }
    }
    
    // Function to populate the sortedItemList with the top 5 food items based on the selected category
    func populateSortedItemList(for category: NutritionalCategory) { //Link the NutritionInfo to foodItems
        var count = 5//To save Only top 5 results
        for itemGroup in sortedItems(for: category) {
            for x in itemGroup.items {
                if(count > 0){
                    if let index = items.firstIndex(where: { $0.name.lowercased() == x.name }) {
                        sortedItemList.append(items[index])
                        count = count - 1
                    }
                }
            }
        }
    }
    
    var body: some View {
        ScrollView {
            ForEach(sortedItemList, id: \.name) { list in
                NavigationLink{
                    sheetView(selectedCard: list)
                }label: {
                    CardView(name: list.name,price: list.price,link: list.link)
                }
            }
        }
        .frame(maxWidth: .infinity)
        .background(Color(red: 255/255, green: 250/255, blue: 0/255))
        .onAppear{
            //File:- an attempt to load and decode the data from selected file is made.
            do {
                guard let fileUrl = Bundle.main.url(forResource: "NutritionInfo", withExtension: "json") else {
                    print("File not found 1")
                    return
                }
                let data = try Data(contentsOf: fileUrl)
                nutritionInfo = try JSONDecoder().decode([NutritionalInfo].self, from: data)
                print("Success")
                
            } catch {
                print("Error: \(error)")
            }
            
            // Populate the sortedItemList based on the selected nutritional category
            if let category = categoryFromString(recommendationMetrics) {
                    populateSortedItemList(for: category)
            }
        }
    }
}

struct Recommended_view_Previews: PreviewProvider {
    static var previews: some View {
        Recommended_view(recommendationMetrics: "lowCalorie")
    }
}

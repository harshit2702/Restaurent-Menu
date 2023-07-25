//
//  Recommended view.swift
//  Restaurent Menu
//
//  Created by Harshit Agarwal on 23/07/23.
//

import SwiftUI

struct Recommended_view: View {
    var recommendationMetrics: String
    
    @State private var nutritionInfo = [NutritionalInfo]()
    

    enum NutritionalCategory: String {
            case lowCalorie = "lowCalorie"
            case lowFats = "lowFats"
            case highProtein = "highProtein"
            case highFiber = "highFiber"
        }

    
    func categoryFromString(_ categoryString: String) -> NutritionalCategory? {
            return NutritionalCategory(rawValue: categoryString)
        }
    
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


   @State private var sortedItemList = [item]()
    
    
    func populateSortedItemList(for category: NutritionalCategory) {
        var count = 5
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

//
//  sheetView.swift
//  Restaurent Menu
//
//  Created by Harshit Agarwal on 22/07/23.
//

import SwiftUI

struct sheetView: View {
    var selectedCard: item?
    @State private var foodName = ""
    @State private var nutritionInfo = [NutritionalInfo]()
    @State private var nutrition: NutritionalInfo?

    var body: some View {
        ZStack {
            Circle()
                .frame(minWidth: 450, maxWidth: .infinity)
                .foregroundColor(Color(red: 255/255, green: 250/255, blue: 0/255))
                .offset(y: 400)
            VStack {
                ZStack {
                    AsyncImage(url: URL(string: selectedCard?.link ?? "" ), scale: 3){image in
                        image
                            .resizable()
                            .scaledToFill()
                            .clipShape(Circle())
                            .frame(width: 250,height: 250)
                    } placeholder: {
                        ZStack{
                            Circle()
                                .fill(.gray)
                                .frame(width: 245,height: 245)
                            Circle()
                                .fill(.white)
                                .frame(width: 240,height: 240)
                            Image(systemName: "fork.knife")
                                .foregroundColor(.black)
                                .font(.system(size: 108))
                        }
                    }
                }
                Spacer(minLength: 20)
                Text(selectedCard!.name)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Spacer(minLength: 20)
                Text("Nutrients Info")
                    .font(.title2)
                    .fontWeight(.bold)
                ScrollView {
                    VStack(alignment: .leading){
                        Group{
                            Text("Calories: \(String(format: "%.2f", nutrition?.calories ?? 0))")
                            Text("Serving Size: \(String(format: "%.2f", nutrition?.serving_size_g ?? 0) ) g")
                            Text("Total Fat: \(String(format: "%.2f", nutrition?.fat_total_g ?? 0) ) g")
                            Text("Saturated Fat: \(String(format: "%.2f", nutrition?.fat_saturated_g ?? 0)) g")
                            Text("Protein: \(String(format: "%.2f", nutrition?.protein_g ?? 0) ) g")
                            Text("Sodium: \(String(format: "%.2f", nutrition?.sodium_mg ?? 0) ) mg")
                            Text("Potassium: \(String(format: "%.2f", nutrition?.potassium_mg ?? 0) ) mg")
                            Text("Cholesterol: \(String(format: "%.2f", nutrition?.cholesterol_mg ?? 0) ) mg")
                            Text("Total Carbohydrates: \(String(format: "%.2f", nutrition?.carbohydrates_total_g ?? 0)) g")
                            Text("Fiber: \(String(format: "%.2f", nutrition?.fiber_g ?? 0)) g")
                        }
                        Text("Sugar: \(String(format: "%.2f", nutrition?.sugar_g ?? 0)) g")
                    }
                    .font(.title2)
                }
            }
            VStack{
                Spacer()
                HStack{
                    Spacer()
                    ZStack {
                        Rectangle()
                            .frame(width: 180,height: 50)
                        Text("Add to Cart  ₹\(selectedCard!.price)/- ")
                            .foregroundColor(.white)
                            .font(.headline)
                        .fontWeight(.bold)
                    }
                }
            }
            .padding(.trailing,50)
        }
        .onAppear{
            do {
                guard let fileUrl = Bundle.main.url(forResource: "NutritionInfo", withExtension: "json") else {
                    print("File not found 1")
                    return
                }
                let data = try Data(contentsOf: fileUrl)
                nutritionInfo = try JSONDecoder().decode([NutritionalInfo].self, from: data)
                
            } catch {
                print("Error: \(error)")
            }
            
            self.foodName = selectedCard!.name
            let index = nutritionInfo.firstIndex(where: { item in
                item.name == foodName.lowercased()
            })
            print(index as Any)
            if(index != nil){
                nutrition = nutritionInfo[index!]
            }
        }

    }
}

struct sheetView_Previews: PreviewProvider {
    static var previews: some View {
        sheetView(selectedCard: item(name: "Kadhai Paneer", price: 340, type: "Main Course", link: "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.K6_nKzXzZV83ODIuzt2wEQHaE8%26pid%3DApi&f=1&ipt=6808198a52610f94fea5fe50f9ca1dcb7222c21b177f2f736d76c0d2cbdb7e9a&ipo=images"))
    }
}

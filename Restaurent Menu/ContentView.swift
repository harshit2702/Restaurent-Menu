//
//  ContentView.swift
//  Restaurent Menu
//
//  Created by Harshit Agarwal on 21/07/23.
//

import SwiftUI
class Order: ObservableObject{
    @Published var name = ""
    @Published var quantity = 0
    @Published var price = 0
    @Published var type = ""
    @Published var link = ""
    
    var cost: Double{
        return Double(quantity * price)
    }
}
struct item: Identifiable{
    var id = UUID()
    let name: String
    let price: Int
    let type: String
    let link: String
}

let items: [item] = [
    item(name: "Masala Dosa", price: 180, type: "Main Course", link: "https://apollosugar.com/wp-content/uploads/2018/12/Masala-Dosa.jpg"),
    item(name: "Raj Kachori",price: 140,type: "Snack", link: "https://i.pinimg.com/originals/0a/af/c2/0aafc27b19f013d2d81e74a4a9a333ae.jpg"),
    item(name: "Rasmalai 2Pcs", price: 119, type: "Sweet", link: "https://wwsadosaw.archanaskitchen.com/images/archanaskitchen/1-Author/moumita.malla-gmail.com/traditional_rasmalai_recipe.jpg"),
    item(name: "Chole Bhature", price: 170, type: "Main Course", link: "https://2.bp.blogspot.com/-OU_L_dlS_G0/Wx9rVpMKeVI/AAAAAAAAAEE/lL6pyCPBVoQkBxbpYZg9wRt6-Lce51C7ACLcBGAs/s1600/imperial%2Binn.jpg"),
    item(name: "Samosa", price: 24, type: "Snack", link: "http://www.zedamagazine.com/wp-content/uploads/2018/06/Indian-Food-Samosa-Dish-HD-Wallpapers.jpg"),
    item(name: "Jalebi In Ghee", price: 175, type: "Sweet", link: "https://www.dealsshutter.com/blog/wp-content/uploads/2021/01/2.jpg"),
    item(name: "Kadhai Paneer", price: 340, type: "Main Course", link: "http://1.bp.blogspot.com/_GlkYxavu-Ts/StVnaw3GCJI/AAAAAAAAARM/2b3PenJbX7g/w1200-h630-p-k-no-nu/kadhai-paneer1.JPG"),
    item(name: "Paneer Butter Masala", price: 340, type: "Main Course", link: "https://i.ytimg.com/vi/8ZSYiMFOTE8/maxresdefault.jpg"),
    item(name: "Gulab Jamun", price: 200, type: "Sweet", link: "https://i2.wp.com/yourfoodfantasy.com/wp-content/uploads/2016/12/gulab-jamun-recipe-yourfoodfantasy-com.jpg?fit=2896%2C1944&ssl=1"),
    item(name: "Kaju Katli", price: 300, type: "Sweet", link: "https://5.imimg.com/data5/XQ/VB/MY-28856529/kaju-katli-500x500.jpg"),
    item(name: "Roti", price: 20,  type: "Bread",link: ""),
    item(name: "Missi Roti", price: 49,   type: "Bread",link: ""),
    item(name: "Butter Roti", price: 26,   type: "Bread",link: ""),
    item(name: "Plain Naan", price: 45,   type: "Bread",link: ""),
    item(name: "Butter Naan", price: 55,   type: "Bread",link: ""),
    item(name: "Garlic Naan", price: 70,   type: "Bread",link: ""),
    item(name: "Stuffed Naan", price: 80,   type: "Bread",link: "")
]

struct ContentView: View {
    
    func sortedItems() -> [(type: String, items: [item])] {
            let groupedItems = Dictionary(grouping: items) { item in
                item.type
            }
            let sortedKeys = groupedItems.keys.sorted(by: >) // Sort the keys alphabetically
            return sortedKeys.map { key in
                (type: key, items: groupedItems[key]!)
            }
        }
    
    //@State var selectedCard: item?
    
    var body: some View {
        NavigationStack{
            ZStack {
                    Circle()
                        .frame(minWidth: 450, maxWidth: .infinity)
                        .foregroundColor(Color(red: 255/255, green: 250/255, blue: 0/255))
                        .offset(y: -400)
                ScrollView{
                    
                    HStack{
                        VStack(alignment: .leading){
                            Text("         Good Food.")
                            Text("         Fast Delivery.")
                        }
                        .font(.title)
                        .fontWeight(.bold)
                        Spacer()
                    }
                    VStack (alignment: .leading){
                        Section("Nutrition Diet") {
                            HStack{
                                GeometryReader{ geo in
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 20)
                                            .fill(.clear)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 20)
                                                    .stroke(Color.black, lineWidth: 2)
                                            )
                                        NavigationLink{
                                            Recommended_view(recommendationMetrics: "lowCalorie")
                                        }
                                        label:{
                                            Text("Low Calorie")
                                                .font(.callout)
                                        }
                                    }
                                    .frame(width: geo.size.width / 5)
                                    .offset(x: geo.size.width / 25)
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 20)
                                            .fill(.clear)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 20)
                                                    .stroke(Color.black, lineWidth: 2)
                                            )
                                        NavigationLink{
                                            Recommended_view(recommendationMetrics: "lowFats")
                                        }label:{
                                            Text("Low Fats")
                                                .font(.callout)
                                        }
                                    }
                                    .frame(width: geo.size.width / 5)
                                    .offset(x: 2 * geo.size.width / 25 + geo.size.width / 5)
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 20)
                                            .fill(.clear)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 20)
                                                    .stroke(Color.black, lineWidth: 2)
                                            )
                                        NavigationLink{
                                            Recommended_view(recommendationMetrics: "highProtein")
                                        }label:{
                                            Text("Protein rich")
                                                .font(.callout)
                                        }
                                    }
                                    .frame(width: geo.size.width / 5)
                                    .offset(x: 3 *  geo.size.width / 25 + 2 * geo.size.width / 5)

                                    ZStack {
                                        RoundedRectangle(cornerRadius: 20)
                                            .fill(.clear)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 20)
                                                    .stroke(Color.black, lineWidth: 2)
                                            )
                                        NavigationLink{
                                            Recommended_view(recommendationMetrics: "highFiber")
                                        }label:{
                                            Text("Fiberous")
                                                .font(.callout)
                                        }
                                    }
                                    .frame(width: geo.size.width / 5)
                                    .offset(x: 4 * geo.size.width / 25 + 3 * geo.size.width / 5)
                                }
                            }
                            .frame(height: 60)
                        }
                        .font(.system(size: 18, weight: .bold))
                        .padding(.horizontal,40)
                    }
                    VStack(alignment: .leading){
                        Spacer(minLength: 30)
                        ForEach(sortedItems(),id: \.type) { section in
                            Section(header: Text(section.type)){
                                ScrollView(.horizontal,showsIndicators: false){
                                    HStack{
                                        ForEach(section.items){item in
                                            NavigationLink{
                                                sheetView(selectedCard: item)
                                            }
                                            label:{
                                                CardView(name: item.name, price: item.price, link: item.link)
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        
                    }
                    .font(.system(size: 18, weight: .bold))
                    .padding(.horizontal,40)
                }
            }
            .edgesIgnoringSafeArea(.top)
            .padding()
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading){
                    VStack(alignment: .leading){
                        HStack{
                            Image(systemName: "house.fill")
                                .foregroundColor(Color(red: 236/255, green: 205/255, blue: 109/255))
                            Text("Home")
                                .font(.title2)
                                .fontWeight(.bold)
                        }
                        Text("Addree of user shown here")
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing){
                    Button{
                        
                    }label: {
                        ZStack{
                            Circle()
                                .fill(.gray)
                                .frame(width: 45,height: 45)
                            Circle()
                                .fill(.white)
                                .frame(width: 40,height: 40)
                            Image(systemName: "person.fill")
                                .foregroundColor(.black)
                                .font(.title2)
                        }
                    }
                    
        
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

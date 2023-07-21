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


struct ContentView: View {
    let items: [item] = [
        item(name: "Masala Dosa", price: 180, type: "Main Course", link: "https://apollosugar.com/wp-content/uploads/2018/12/Masala-Dosa.jpg"),
        item(name: "Raj Kachori",price: 140,type: "Snack", link: "https://i.pinimg.com/originals/0a/af/c2/0aafc27b19f013d2d81e74a4a9a333ae.jpg"),
        item(name: "Rasmalai 2Pcs", price: 119, type: "Sweet", link: "https://www.archanaskitchen.com/images/archanaskitchen/1-Author/moumita.malla-gmail.com/traditional_rasmalai_recipe.jpg"),
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
    
    func sortedItems() -> [(type: String, items: [item])] {
            let groupedItems = Dictionary(grouping: items) { item in
                item.type
            }
            let sortedKeys = groupedItems.keys.sorted(by: <) // Sort the keys alphabetically
            return sortedKeys.map { key in
                (type: key, items: groupedItems[key]!)
            }
        }
    
    
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
                    VStack(alignment: .leading){
                        Spacer(minLength: 30)
                        Section("Recommended"){
                            ScrollView(.horizontal,showsIndicators: false){
                                HStack {
                                    CardView(name: "Masala Dosa", price: 180, link: "https://apollosugar.com/wp-content/uploads/2018/12/Masala-Dosa.jpg")
                                    CardView(name: "Raj Kachori",price: 140,link: "https://i.pinimg.com/originals/0a/af/c2/0aafc27b19f013d2d81e74a4a9a333ae.jpg")
                                    CardView(name: "Rasmalai 2Pcs", price: 119, link: "https://www.archanaskitchen.com/images/archanaskitchen/1-Author/moumita.malla-gmail.com/traditional_rasmalai_recipe.jpg")
                                    CardView(name: "Chole Bhature", price: 170, link: "https://2.bp.blogspot.com/-OU_L_dlS_G0/Wx9rVpMKeVI/AAAAAAAAAEE/lL6pyCPBVoQkBxbpYZg9wRt6-Lce51C7ACLcBGAs/s1600/imperial%2Binn.jpg")
                                    CardView(name: "Samosa", price: 24, link: "http://www.zedamagazine.com/wp-content/uploads/2018/06/Indian-Food-Samosa-Dish-HD-Wallpapers.jpg")
                                    CardView(name: "Jalebi In Ghee", price: 175, link: "https://www.dealsshutter.com/blog/wp-content/uploads/2021/01/2.jpg")
                                    CardView(name: "Kadhai Paneer", price: 340, link: "http://1.bp.blogspot.com/_GlkYxavu-Ts/StVnaw3GCJI/AAAAAAAAARM/2b3PenJbX7g/w1200-h630-p-k-no-nu/kadhai-paneer1.JPG")
                                    CardView(name: "Paneer Butter Masala", price: 340, link: "https://i.ytimg.com/vi/8ZSYiMFOTE8/maxresdefault.jpg")
                                    CardView(name: "Gulab Jamun", price: 200, link: "https://i2.wp.com/yourfoodfantasy.com/wp-content/uploads/2016/12/gulab-jamun-recipe-yourfoodfantasy-com.jpg?fit=2896%2C1944&ssl=1")
                                    CardView(name: "Kaju Katli", price: 300, link: "https://5.imimg.com/data5/XQ/VB/MY-28856529/kaju-katli-500x500.jpg")
                                }
                            }
                        }
                        ForEach(sortedItems(),id: \.type) { section in
                            Section(header: Text(section.type)){
                                ScrollView(.horizontal,showsIndicators: false){
                                    HStack{
                                        ForEach(section.items){item in
                                            CardView(name: item.name, price: item.price, link: item.link)
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
struct CardView: View {
    @State var name = " Shahi paneer "
    @State var price = 350
    @State var link = "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.K6_nKzXzZV83ODIuzt2wEQHaE8%26pid%3DApi&f=1&ipt=6808198a52610f94fea5fe50f9ca1dcb7222c21b177f2f736d76c0d2cbdb7e9a&ipo=images"
        
    var body: some View {
        VStack{
            ZStack{
                RoundedRectangle(cornerRadius: 20)
                    .frame(height: 175)
                    .offset(y: 23)
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color(red: 250/255, green: 240/155, blue: 211/255))
                    .frame(height: 170)
                    .offset(y: 22)
                VStack{
                    Text(name)
                        .font(.title3)
                        .fontWeight(.bold)
                        .frame(width: 140,height: 70)
                    HStack{
                        Spacer()
                        Text("INR \(price)")
                    }
                    .font(.title2)
                    .fontWeight(.bold)
                    .offset(x:-10,y: 10)

                    
            
                        
                }
                .offset(y: 45)

                ZStack {
                    AsyncImage(url: URL(string: link), scale: 3){image in
                        image
                            .resizable()
                            .scaledToFill()
                            .clipShape(Circle())
                            .frame(width: 100,height: 100)
                            .offset(y: -60)
                    } placeholder: {
                        ZStack{
                            Circle()
                                .fill(.gray)
                                .frame(width: 45,height: 45)
                            Circle()
                                .fill(.white)
                                .frame(width: 40,height: 40)
                            Image(systemName: "fork.knife")
                                .foregroundColor(.black)
                                .font(.title2)
                        }
                        .offset(y: -60)
                    }
                }
                
            }
            .frame(width: 150,height: 225)
        }
        .padding(.horizontal)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

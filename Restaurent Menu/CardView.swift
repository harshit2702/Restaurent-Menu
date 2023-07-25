//
//  CardView.swift
//  Restaurent Menu
//
//  Created by Harshit Agarwal on 22/07/23.
//

import SwiftUI

struct CardView: View {
    @State var name = " Shahi paneer "
    @State var price = 350
    @State var link = "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.K6_nKzXzZV83ODIuzt2wEQHaE8%26pid%3DApi&f=1&ipt=6808198a52610f94fea5fe50f9ca1dcb7222c21b177f2f736d76c0d2cbdb7e9a&ipo=images"
        
    var body: some View {
        VStack{
            ZStack{
                // Background RoundedRectangle with a small offset for shadow effect
                RoundedRectangle(cornerRadius: 20)
                    .frame(height: 175)
                    .offset(y: 23)
                
                // RoundedRectangle to represent the card's main content
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color(red: 250/255, green: 240/155, blue: 211/255))
                    .frame(height: 170)
                    .offset(y: 22)
                
                VStack{
                    // Text displaying the name of the item
                    Text(name)
                        .font(.title3)
                        .fontWeight(.bold)
                        .frame(width: 140,height: 70)
                    HStack{
                        Spacer()
                        // Text displaying the price of the item with INR symbol
                        Text("INR \(price)")
                    }
                    .font(.title2)
                    .fontWeight(.bold)
                    .offset(x:-10,y: 10)
                }
                .offset(y: 45)
                
                // AsyncImage to display the item's image
                ZStack {
                    AsyncImage(url: URL(string: link), scale: 3){image in
                        image
                            .resizable()
                            .scaledToFill()
                            .clipShape(Circle())
                            .frame(width: 100,height: 100)
                            .offset(y: -60)
                    } placeholder: {
                        // Placeholder image when the actual image is loading
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
        .foregroundColor(.black)
        .padding(.horizontal)
        
    }
}

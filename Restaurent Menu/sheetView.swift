//
//  sheetView.swift
//  Restaurent Menu
//
//  Created by Harshit Agarwal on 22/07/23.
//

import SwiftUI

struct sheetView: View {
    var selectedCard: item?
    var body: some View {
        ZStack {
            Circle()
                .frame(minWidth: 450, maxWidth: .infinity)
                .foregroundColor(Color(red: 255/255, green: 250/255, blue: 0/255))
                .offset(y: 400)
            VStack {
                Text(selectedCard?.name ?? "Food Name")
                    .font(.largeTitle)
                    .fontWeight(.bold)
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
            }
        }
    }
}

struct sheetView_Previews: PreviewProvider {
    static var previews: some View {
        sheetView()
    }
}

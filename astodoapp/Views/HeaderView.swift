//
//  HeaderView.swift
//  astodoapp
//
//  Created by asdirector on 14.12.2023.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        // Header
        ZStack{
            Image("astodologo")
                .resizable()
                .frame(width: 100 , height: 100)
            Text("AS TODOLIST")
                .font(.system(size: 24))
                .fontWeight(.bold)
                .padding(.top,140)
            
                
        }.padding(.top,100)
    }
}

#Preview {
    HeaderView()
}

//
//  BigButtonView.swift
//  astodoapp
//
//  Created by asdirector on 14.12.2023.
//

import SwiftUI

struct BigButton: View {
    
    let title : String
    let action : () -> Void
    
    var body: some View {
        Button(action: action, label: {
            /*@START_MENU_TOKEN@*/
            ZStack {
                RoundedRectangle(cornerRadius: 5)
                    .foregroundStyle(.primary)
                Text(title)
                    .foregroundStyle(.white)
                
                
            }/*@END_MENU_TOKEN@*/
        })
        .frame(height: 50)
        .padding(.horizontal)
        
    }
}

#Preview {
    BigButton(title: "Button Title", action: {})
}

//
//  ProfileView.swift
//  astodoapp
//
//  Created by asdirector on 14.12.2023.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewViewModel()
    
    init (){}
    
    var body: some View {
        NavigationView{
            VStack{
                
                if let user = viewModel.user{
                    
                    profile(user: user)
                    
                    }else {
                        Text("Profil Yükleniyor...")
                    
                }
                
            
//                 Logut işlemi yapılacak
                BigButton(title:"Çıkış Yap"){
                    viewModel.logout()
                    
                }
            }
            .navigationTitle("Profil")
        }
        .onAppear{
            viewModel.fetchUser()
        }
    }
    @ViewBuilder
    func profile (user: User) -> some View {
        Image(systemName: "person.circle")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundColor(.blue)
            .frame(width: 125, height: 125, alignment: .center)
        
        VStack{
            HStack{
                Text("İsim:")
                Text(user.name)
    
            }
            HStack{
                Text("Email:")
                Text(user.email)
            }
            HStack{
                Text("Kayıt Tarihi:")
                Text("\(Date(timeIntervalSince1970: user.joined).formatted(date:.abbreviated,time: .shortened))")
            }
        }
    }
}

#Preview {
    ProfileView()
}

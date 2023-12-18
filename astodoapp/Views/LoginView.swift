//
//  LoginView.swift
//  astodoapp
//
//  Created by asdirector on 14.12.2023.
//

import SwiftUI

struct LoginView: View {
    
//    @State var email = ""
//    @State var password = ""
    
    @StateObject var viewModel = LoginViewViewModel()

    var body: some View {
       
        NavigationStack {
            VStack{
             
                // Header
             HeaderView()
                // Form - email - password - button
                Form {
                    if !viewModel.errorMessage.isEmpty{
                        Text(viewModel.errorMessage)
                            .foregroundStyle(.red)
                    }
                    TextField("Email Adresi Girin", text : $viewModel.email)
                        .autocorrectionDisabled()
                        .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                    SecureField("Şifre Girin", text: $viewModel.password)
                    
                }.frame(height: 200)
                
              BigButton(title: "Giriş Yapın", action: {
                  viewModel.login()
              })
                
                Spacer()
                
                // Footer - Don't you have an Account ?
                VStack{
                    Text ("Yeni misiniz?")
                    NavigationLink("Hesap Oluşturun",destination: RegisterView())
                }
                .padding(.bottom, 180)
            }
        }
        
    }
}

#Preview {
    LoginView()
}

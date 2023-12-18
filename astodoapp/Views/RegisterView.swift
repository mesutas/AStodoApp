//
//  RegisterView.swift
//  astodoapp
//
//  Created by asdirector on 14.12.2023.
//

import SwiftUI

struct RegisterView: View {
    
    @StateObject var viewModel = RegisterViewViewModel()
    
    var body: some View {
        NavigationStack{
            VStack{
                //Header
                HeaderView()
                
                //Register
                Form {
                    
                    Section(header: Text("Kayıt Formu")) {
                        if !viewModel.errorMessage.isEmpty{
                            Text(viewModel.errorMessage)
                                .foregroundStyle(.red)
                        }
                        TextField("Tam Adınız",text: $viewModel.name)
                            .autocorrectionDisabled()
                        TextField("Email Adresi Girin", text: $viewModel.email)
                            .autocorrectionDisabled()
                            .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                        SecureField("Şifre Girin",text: $viewModel.password)
                    }
                }
                .frame(height: 230)
                
             BigButton(title: "Kayıt Olun", action: {
                 
                 viewModel.register()
             })
                Spacer()
           
            }
        }
    }
}

#Preview {
    RegisterView()
}

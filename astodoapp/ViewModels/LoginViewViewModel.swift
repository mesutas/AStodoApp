//
//  LoginViewViewModel.swift
//  astodoapp
//
//  Created by asdirector on 14.12.2023.
//

import Foundation
import FirebaseAuth

class LoginViewViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init() {}
    
    func login (){
        guard validate() else {
            return
        }
        Auth.auth().signIn(withEmail: email, password: password)
        
    }
    
    
    
    func validate() -> Bool{
        
        errorMessage = ""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
                !password.trimmingCharacters(in: .whitespaces).isEmpty
        else {
            errorMessage = "Lütfen Tüm Alanları Doldurun!"
            return false
        }
        guard email.contains("@") && email.contains (".") else {
            errorMessage = "Lütfen geçerli bir email adresi girin!"
            return false
        }
        return true
        
    }
  
    
    
    
}

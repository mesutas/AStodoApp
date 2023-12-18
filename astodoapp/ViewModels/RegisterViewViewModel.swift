//
//  RegisterViewViewModel.swift
//  astodoapp
//
//  Created by asdirector on 14.12.2023.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore


class RegisterViewViewModel: ObservableObject{
    @Published var name = ""
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init (){}
    
    func register () {
        guard validate() else {
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password){
            [weak self] result , error in
            guard let userId = result?.user.uid else {
                return
            }
            // İnser metodu çağrılacak.
            self?.insertUserRecord(id: userId)
        }
        
    }
    private func insertUserRecord(id:String){
        let newUser = User(id: id, name: name, email: email, joined: Date().timeIntervalSince1970)
        
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(id)
            .setData(newUser.asDictionary())
    }
    
    private func validate () -> Bool {
        errorMessage = ""
        
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty,
              !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Lütfen Tüm Alanları Doldurun!"
            return false
        }
        guard email.contains("@") && email.contains(".") else {
            errorMessage = "Lütfen geçerli mail adresi giriniz!"
            return false
        }
        
        guard password.count >= 6 else {
            errorMessage = "Lütfen Şifrenizde en az 6 karakter kullanın!"
            return false
        }
        
        return true
    }
}

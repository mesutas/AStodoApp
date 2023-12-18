//
//  ToDoListViewViewModel.swift
//  astodoapp
//
//  Created by asdirector on 14.12.2023.
//

import Foundation
import FirebaseFirestore
class ToDoListViewViewModel: ObservableObject {
    @Published var showingNewItemView = false 
    
    private var userId: String
    
    init(userId: String){
        
        self.userId = userId
    }
    
    /// Delete to do list item
    /// - Parameter id : item id to delete
    
    func delete(id: String){
        let db = Firestore.firestore()
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(id)
            .delete()
        
    }
}

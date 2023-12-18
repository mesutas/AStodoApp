//
//  ContentView.swift
//  astodoapp
//
//  Created by asdirector on 14.12.2023.
//


import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewViewModel()
    
    var body: some View {
        if viewModel.isSignedIn, !viewModel.currenUserId.isEmpty{
            accountView
          
           
        }else {
            LoginView()
        }
        
 
    }
    @ViewBuilder
    var accountView: some View {
        TabView {
            ToDoListView(userId:viewModel.currenUserId)
                .tabItem {
                    Label("Görevler", systemImage:"house")
                }
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.circle")
                }
        }
    }
}

#Preview {
    MainView()
}

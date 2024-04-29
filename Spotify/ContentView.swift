//
//  ContentView.swift
//  Spotify
//
//  Created by Akmalkhon on 29/04/24.
//

import SwiftUI
import SwiftfulUI
import SwiftfulRouting


struct ContentView: View {
    
    @State private var users: [User] = []
    @State private var products: [Product] = []
    
    var body: some View {
        
        List {
            ForEach(users) { user in
                Text(user.firstName)
            } 
        }
        .task {
            await getData()
        }
        
    }
    
    private func getData() async {
        do {
            users = try await DatabaseHelper().getUsers()
            products = try await DatabaseHelper().getProducts()
        }
        catch {
            
        }
    }
    
}

#Preview {
    ContentView()
}

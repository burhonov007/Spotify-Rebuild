//
//  DatabaseHelper.swift
//  Spotify
//
//  Created by Akmalkhon on 29/04/24.
//

import Foundation

struct DatabaseHelper {
    
    static var shared = DatabaseHelper()
    
    func getProducts() async throws -> [Product] {
        guard let url = URL(string: "https://dummyjson.com/products") else {
            throw URLError(.badURL)
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let products = try JSONDecoder().decode(ProductArray.self, from: data)
        return products.products
    }
    
    func getUsers() async throws -> [User] {
        guard let url = URL(string: "https://dummyjson.com/users") else {
            throw URLError(.badURL)
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let user = try JSONDecoder().decode(UserArray.self, from: data)
        return user.users 
    }
    
}

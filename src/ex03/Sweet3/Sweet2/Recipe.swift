//
//  Recipe.swift
//  Sweet2
//
//  Created by Ибрагим on 19.03.2023.
//

import Foundation

struct Recipe: Decodable, Identifiable {
    let id: Int
    let image: String
    let title: String
    let description: String
    let ingredients: [String]
    let steps: [String]
}

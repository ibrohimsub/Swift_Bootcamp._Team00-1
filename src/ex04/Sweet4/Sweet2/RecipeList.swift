//
//  RecipeList.swift
//  Sweet2
//
//  Created by Ибрагим on 19.03.2023.
//

import SwiftUI

struct RecipeList: View {
    @State private var recipes = [Recipe]()
    
    var body: some View {
        NavigationView {
            List(recipes) { recipe in
                NavigationLink(destination: RecipeView(recipe: recipe)) {
                    HStack {
                        Image(recipe.image)
                            .resizable()
                            .frame(width: 70, height: 50)
                            .cornerRadius(9)
                        VStack(alignment: .leading) {
                            Text(recipe.title)
                                .font(.headline)
                            Text(recipe.description)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                    }
                }
                .background(
                                Image("background")
                                    .resizable()
                                    .scaledToFill()
                                    .edgesIgnoringSafeArea(.all)
                            )
            }
            .navigationBarTitle("Recipes")
        }
        .onAppear {
            loadData()
        }
    }
    
    func loadData() {
        guard let url = Bundle.main.url(forResource: "recipes", withExtension: "json") else {
            fatalError("Unable to find recipes.json")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Unable to load data: recipes.json")
        }
        
        let decoder = JSONDecoder()
        
        do {
            let decoded = try decoder.decode([Recipe].self, from: data)
            DispatchQueue.main.async {
                self.recipes = decoded
            }
        } catch {
            fatalError("Failed to decode recipes.json: \(error.localizedDescription)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeList()
    }
}

//
//  RecipeView.swift
//  Sweet2
//
//  Created by Ибрагим on 19.03.2023.
//

import SwiftUI

struct RecipeView: View {
    var recipe: Recipe
    
    var body: some View {
        ScrollView {
            VStack {
                Image(recipe.image)
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(10)
                
                Text(recipe.title)
                    .font(.largeTitle)
//                    .foregroundColor(.white)
                
                Text(recipe.description)
                    .padding()
                    .multilineTextAlignment(.center)
//                    .foregroundColor(.white)
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("Ingredients")
                        .font(.headline)
//                        .foregroundColor(.white)
                    
                    ForEach(recipe.ingredients, id: \.self) { ingredient in
                        Text("• " + ingredient)
//                            .foregroundColor(.white)
                    }
                    
                    Text("\nSteps of Cooking")
                        .font(.headline)
//                        .foregroundColor(.white)
                    
                    ForEach(recipe.steps, id: \.self) { step in
                        Text("‣ " + step)
//                            .foregroundColor(.white)
                    }
                }
                .padding()
            }
            .navigationBarTitle(Text(recipe.title), displayMode: .inline)
        }
//        .background(Color.black)
    }
}

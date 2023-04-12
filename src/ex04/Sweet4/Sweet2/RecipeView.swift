//
//  RecipeView.swift
//  Sweet2
//
//  Created by Ибрагим on 19.03.2023.
//

import SwiftUI

struct RecipeView: View {
    var recipe: Recipe
    
    @State private var expandedStep: Int?
    
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                Image(recipe.image)
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(10)
                
                Text(recipe.title)
                    .font(.largeTitle)
                
                Text(recipe.description)
                    .multilineTextAlignment(.center)
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("Ingredients")
                        .font(.headline)
                    
                    ForEach(recipe.ingredients, id: \.self) { ingredient in
                        Text("• " + ingredient)
                    }
                    
                    Text("\nSteps of Cooking")
                        .font(.headline)
                    
                    ForEach(recipe.steps.indices, id: \.self) { index in
                        Button(action: {
                            withAnimation {
                                expandedStep = expandedStep == index ? nil : index
                            }
                        }) {
                            ZStack {
                                RoundedRectangle(cornerRadius: 8)
                                    .foregroundColor(Color.gray.opacity(0.1))
                                
                                HStack(alignment: .top, spacing: 10) {
                                    Text("Step \(index + 1)")
                                        .bold()
                                    Text(recipe.steps[index])
                                        .lineLimit(expandedStep == index ? nil : 1)
                                }
                                .foregroundColor(.primary)
                                .padding(.vertical, 5)
                                .padding(.horizontal, 10)
                            }
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
                .padding()
            }
            .navigationBarTitle(Text(recipe.title), displayMode: .inline)
            .background(
                            Image("background")
                                .resizable()
                                .scaledToFill()
                                .edgesIgnoringSafeArea(.all)
                        )
        }
    }
}

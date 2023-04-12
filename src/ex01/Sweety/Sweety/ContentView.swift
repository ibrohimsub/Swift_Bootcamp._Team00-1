//
//  ContentView.swift
//  Sweety
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
                    .foregroundColor(.white)
                
                Text(recipe.title)
                    .font(.largeTitle)
                    .foregroundColor(.white)
                
                Text(recipe.description)
                    .padding()
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                
                VStack(alignment: .leading) {
                    Text("Ingredients")
                        .font(.headline)
                        .foregroundColor(.white)
                    
                    Text(recipe.ingredients)
                        .padding(.bottom)
                        .foregroundColor(.white)
                    
                    Text("Steps of Cooking")
                        .font(.headline)
                        .foregroundColor(.white)
                    
                    ForEach(recipe.steps, id: \.self) { step in
                        Text("- " + step)
                            .foregroundColor(.white)
                    }
                }
                .padding()
            }
            .navigationBarTitle(Text(recipe.title), displayMode: .inline)
        }
    }
}

struct ContentView: View {
    var body: some View {
        NavigationView {
            RecipeView(recipe: Recipe(image: "chocolate-cake", title: "Chocolate Lava Cake", description: "A decadent and rich chocolate dessert that's sure to impress.", ingredients: "• 1/2 cup (1 stick or 113g) unsalted butter\n• 4 ounces (113g) semisweet chocolate\n• 1/2 cup (100g) granulated sugar\n• 2 eggs\n• 2 egg yolks\n• 1/3 cup (42g) all-purpose flour\n• Pinch of salt\n• Butter and cocoa powder for preparing the ramekins", steps: [
                "Preheat the oven to 425°F (218°C).",
                "Grease four 6-ounce (170g) ramekins with butter and dust with cocoa powder, shaking out any excess.",
                "Melt 1/2 cup (1 stick or 113g) of unsalted butter and 4 ounces (113g) of semisweet chocolate in a double boiler or in the microwave in 30-second intervals, stirring between each interval.",
                "Whisk in 1/2 cup (100g) of granulated sugar, 2 eggs, and 2 egg yolks until well combined.",
                "Stir in 1/3 cup (42g) of all-purpose flour and a pinch of salt until just combined.",
                "Divide the batter evenly between the prepared ramekins.",
                "Bake for 12-14 minutes, until the edges are set but the center is still slightly jiggly.",
                "Remove from the oven and let cool for 1-2 minutes.",
                "Carefully run a knife around the edges of the ramekins to loosen the cakes.",
                "Invert the ramekins onto plates and serve warm, garnished with powdered sugar or whipped cream if desired."
            ]))
            .background(Color.black)
        }
    }
}

struct Recipe {
    let image: String
    let title: String
    let description: String
    let ingredients: String
    let steps: [String]
}

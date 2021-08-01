//
//  recipeSearch.swift
//  recipesApp
//
//  Created by ahmed elbasha on 27/07/2021.
//  Copyright © 2021 ahmed elbasha. All rights reserved.
//
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let reciepeDetails = try? newJSONDecoder().decode(ReciepeDetails.self, from: jsonData)
import Foundation

// MARK: - ReciepeDetails
struct RecipeSearch: Codable {
    let from, to, count: Int?
    let links: ReciepeDetailsLinks?
    var hits: [Hit]?

    enum CodingKeys: String, CodingKey {
        case from, to, count
        case links = "_links"
        case hits
    }
}

struct ReciepeDetails: Codable {
    let recipe: Recipe?
    let links: Links?

    enum CodingKeys: String, CodingKey {
        case recipe
        case links = "_links"
    }
}
// MARK: - Links
struct Links: Codable {
    let linksSelf: SelfClass?

    enum CodingKeys: String, CodingKey {
        case linksSelf = "self"
    }
}

// MARK: - SelfClass
struct SelfClass: Codable {
    let href: String?
    let title: String?
}


// MARK: - Hit
struct Hit: Codable {
    let recipe: Recipe?
    let links: HitLinks?

    enum CodingKeys: String, CodingKey {
        case recipe
        case links = "_links"
    }
}

// MARK: - HitLinks
struct HitLinks: Codable {
    let linksSelf: Next?

    enum CodingKeys: String, CodingKey {
        case linksSelf = "self"
    }
}

// MARK: - Next
struct Next: Codable {
    let href: String?
    let title: Title?
}

enum Title: String, Codable {
    case nextPage = "Next page"
    case titleSelf = "Self"
}

// MARK: - Recipe
struct Recipe: Codable {
    let uri: String?
    let label: String?
    let image: String?
    let source: String?
    let url: String?
    let shareAs: String?
    let yield: Double?
    let dietLabels: [String]?
    let healthLabels: [String]?
    let cautions: [String]?
    let ingredientLines: [String]?
    let ingredients: [Ingredient]?
    let calories, totalWeight: Double?
    let totalTime: Int?
    let cuisineType: [String]?
    let mealType: [String]?
    let dishType: [String]?
    let totalNutrients, totalDaily: [String: Total]?
    let digest: [Digest]?
}

//enum Caution: String, Codable {
//    case fodmap = "FODMAP"
//    case soy = "Soy"
//    case sulfites = "Sulfites"
//}

enum DietLabel: String, Codable {
    case balanced = "Balanced"
    case highFiber = "High-Fiber"
    case lowCarb = "Low-Carb"
    case lowSodium = "Low-Sodium"
}

// MARK: - Digest
struct Digest: Codable {
    let label: Label?
    let tag: String?
    let schemaOrgTag: SchemaOrgTag?
    let total: Double?
    let hasRDI: Bool?
    let daily: Double?
    let unit: Unit?
    let sub: [Digest]?
}

enum Label: String, Codable {
    case calcium = "Calcium"
    case carbs = "Carbs"
    case carbsNet = "Carbs (net)"
    case cholesterol = "Cholesterol"
    case energy = "Energy"
    case fat = "Fat"
    case fiber = "Fiber"
    case folateEquivalentTotal = "Folate equivalent (total)"
    case folateFood = "Folate (food)"
    case folicAcid = "Folic acid"
    case iron = "Iron"
    case magnesium = "Magnesium"
    case monounsaturated = "Monounsaturated"
    case niacinB3 = "Niacin (B3)"
    case phosphorus = "Phosphorus"
    case polyunsaturated = "Polyunsaturated"
    case potassium = "Potassium"
    case protein = "Protein"
    case riboflavinB2 = "Riboflavin (B2)"
    case saturated = "Saturated"
    case sodium = "Sodium"
    case sugarAlcohols = "Sugar alcohols"
    case sugars = "Sugars"
    case sugarsAdded = "Sugars, added"
    case thiaminB1 = "Thiamin (B1)"
    case trans = "Trans"
    case vitaminA = "Vitamin A"
    case vitaminB12 = "Vitamin B12"
    case vitaminB6 = "Vitamin B6"
    case vitaminC = "Vitamin C"
    case vitaminD = "Vitamin D"
    case vitaminE = "Vitamin E"
    case vitaminK = "Vitamin K"
    case water = "Water"
    case zinc = "Zinc"
}

enum SchemaOrgTag: String, Codable {
    case carbohydrateContent = "carbohydrateContent"
    case cholesterolContent = "cholesterolContent"
    case fatContent = "fatContent"
    case fiberContent = "fiberContent"
    case proteinContent = "proteinContent"
    case saturatedFatContent = "saturatedFatContent"
    case sodiumContent = "sodiumContent"
    case sugarContent = "sugarContent"
    case transFatContent = "transFatContent"
}

enum Unit: String, Codable {
    case empty = "%"
    case g = "g"
    case kcal = "kcal"
    case mg = "mg"
    case µg = "µg"
}

// MARK: - Ingredient
struct Ingredient: Codable {
    let text: String?
    let weight: Double?
    let foodCategory: String?
    let foodID: String?
    let image: String?

    enum CodingKeys: String, CodingKey {
        case text, weight, foodCategory
        case foodID = "foodId"
        case image
    }
}

enum MealType: String, Codable {
    case brunch = "brunch"
    case lunchDinner = "lunch/dinner"
}

// MARK: - Total
struct Total: Codable {
    let label: Label?
    let quantity: Double?
    let unit: Unit?
}

// MARK: - ReciepeDetailsLinks
struct ReciepeDetailsLinks: Codable {
    let next: Next?
}

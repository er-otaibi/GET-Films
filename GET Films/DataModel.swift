//
//  DataModel.swift
//  GET Films
//
//  Created by Mac on 16/05/1443 AH.
//
// This file was generated from JSON Schema using codebeautify, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome1 = try Welcome1(json)

import Foundation

// MARK: - People
struct People : Codable{
    let count: Int
    let next, previous: String?
    let results: [ResultPeople]
}

// MARK: - Result
struct ResultPeople : Codable {
    
    let name, height, mass, hairColor: String
    let skinColor, eyeColor, birthYear: String
    let homeworld: String
    let gender : String
    let films, species, vehicles, starships: [String]
    let created, edited: String
    let url: String
    
    enum CodingKeys: String, CodingKey {
            case name , height , mass
            case hairColor = "hair_color"
            case skinColor = "skin_color"
            case eyeColor = "eye_color"
            case birthYear =  "birth_year"
            case homeworld , gender
            case films, species, vehicles, starships
            case created, edited
            case url
        }
    

}
// MARK: - Film
struct Film : Codable {
    let count: Int
    let next, previous: String?
    let results: [ResultFilm]
}

// MARK: - Result
struct ResultFilm : Codable{
    let title: String
    let episodeID: Int
    let openingCrawl, director, producer, releaseDate: String
    let characters, planets, starships, vehicles: [String]
    let species: [String]
    let created, edited: String
    let url: String
    
    
    enum CodingKeys: String, CodingKey {
            case title
            case episodeID = "episode_id"
            case openingCrawl = "opening_crawl"
            case director, producer
            case releaseDate = "release_date"
            case characters, planets, starships, vehicles, species, created, edited, url
        }
}

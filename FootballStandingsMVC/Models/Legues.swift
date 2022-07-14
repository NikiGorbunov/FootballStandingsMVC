//
//  Legues.swift
//  FootballStandingsMVC
//
//  Created by Никита Горбунов on 13.07.2022.
//

import Foundation

// MARK: - Leagues
struct Leagues: Decodable {
    let status: Bool
    let data: [League]
}

struct League: Decodable {
    let id: String
    let name: String
    let slug: String
    let abbr: String
    let logos: LeagueLogos
}

struct LeagueLogos: Decodable {
    let light: String
    let dark: String
}

// MARK: - Seasons
struct SeasonsResponse: Decodable {
    let status: Bool
    let data: Seasons
}

struct Seasons: Decodable {
    let name: String
    let desc: String
    let abbreviation: String
    let seasons: [Season]
}

struct Season: Decodable {
    let year: Int
    let startDate: String
    let endDate: String
    let displayName: String
    let types: [SeasonType]
}

struct SeasonType: Decodable {
    let id: String
    let name: String
    let abbreviation: String
    let startDate: String
    let endDate: String
    let hasStandings: Bool
}

// MARK: - Standings




// MARK: - Link
enum Link: String {
    case allLeagues = "https://api-football-standings.azharimm.site/leagues"
    case seasonsAvailable = "https://api-football-standings.azharimm.site/leagues/eng.1/seasons"
    case standings = "https://api-football-standings.azharimm.site/leagues/eng.1/standings?season=2020&sort=asc"
}

//
//  NetworkManager.swift
//  FootballStandingsMVC
//
//  Created by Никита Горбунов on 14.07.2022.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
}

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchLeagues(from url: String?, with completion: @escaping(Leagues) -> Void) {
        guard let url = URL(string: url ?? "") else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            do {
                let league = try JSONDecoder().decode(Leagues.self, from: data)
                DispatchQueue.main.async {
                    completion(league)
                }
            } catch let error {
                print(error)
            }
            
        }.resume()
    }
    
    func fetchSeasons(from url: String?, with completion: @escaping(SeasonsResponse) -> Void) {
        guard let url = URL(string: url ?? "") else { return }

        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }

            do {
                let seasons = try JSONDecoder().decode(SeasonsResponse.self, from: data)
                DispatchQueue.main.async {
                    completion(seasons)
                }
            } catch let error {
                print(error)
            }

        }.resume()
    }
}

class ImageManager {
    static var shared = ImageManager()
    
    private init() {}
    
    func fetchImage(from url: URL, completion: @escaping(Data, URLResponse) -> Void) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, let response = response else {
                print(error?.localizedDescription ?? "No error description")
                return
            }

            guard url == response.url else { return }
            
            DispatchQueue.main.async {
                completion(data, response)
            }
            
        }.resume()
    }
}

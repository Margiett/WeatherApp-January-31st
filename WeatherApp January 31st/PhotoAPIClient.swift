//
//  PhotoAPIClient.swift
//  WeatherApp January 31st
//
//  Created by Margiett Gil on 1/31/20.
//  Copyright © 2020 Margiett Gil. All rights reserved.
//

import Foundation

struct PhotoAPIClient {
    static func getPhotoJournals(for search: String, completion: @escaping (Result<[Picture], AppError>) -> () ) {
        
        let searchQuery = search.lowercased().addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
        
        let endpointURL = "https://pixabay.com/api/?key=\(Secrets.pixaBayKey)&q=\(searchQuery ?? "dogs")"
        
        guard let url = URL(string: endpointURL) else {
            completion(.failure(.badURL(endpointURL)))
            return
        }
        
        let request = URLRequest(url: url)
        
        NetworkHelper.shared.performDataTask(with: request) { (result) in
            switch result {
            case .failure(let appError):
                completion(.failure(.networkClientError(appError)))
            case .success(let data):
                do {
                    let results = try JSONDecoder().decode(PictureHits.self, from: data)
                    completion(.success(results.hits))
                } catch {
                    completion(.failure(.decodingError(error)))
                }
            }
        }
    }
}

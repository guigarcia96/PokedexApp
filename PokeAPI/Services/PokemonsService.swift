//
//  PokemonsService.swift
//  PokeAPI
//
//  Created by Guilherme Moraes on 25/02/21.
//

import Foundation

class PokemonsService{
    
    func getPokemonsList(completion: @escaping (Result<Pokemons, Error>) -> Void) {
        
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon?offset=0&limit=30") else {
            completion(.failure(NSError(domain: "", code: 404, userInfo: nil)))
            return
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        
        let session = URLSession.shared.dataTask(with: urlRequest) { data, response, err in
            
            let httpResponse = response as? HTTPURLResponse
            let statusCode = httpResponse?.statusCode ?? 400
            
            guard let data = data else {
                let error = NSError(domain: "Data not sent or response", code: statusCode, userInfo: nil)
                DispatchQueue.main.async { completion(.failure(error)) }
                return
            }
            
            if let error = err as NSError? {
                if error.code != NSURLErrorCancelled {
                    DispatchQueue.main.async { completion(.failure(error)) }
                }
                return
            }
            
            guard let response = httpResponse, 200..<300 ~= response.statusCode else {
                let error = NSError(domain: "Data not sent or response is not in the range [200,299]", code: statusCode, userInfo: nil)
                DispatchQueue.main.async { completion(.failure(error)) }
                return
            }
            
            guard let decodedData = try? JSONDecoder().decode(Pokemons.self, from: data) else {
                let error = NSError(domain: "Error while decoding the result", code: 0, userInfo: nil)
                DispatchQueue.main.async { completion(.failure(error)) }
                return
            }
            DispatchQueue.main.async { completion(.success(decodedData)) }
        }
        session.resume()
    }
    
    func getPokemonsList(url: String, completion: @escaping (Result<Pokemons, Error>) -> Void) {
        
        guard let url = URL(string: url) else {
            completion(.failure(NSError(domain: "", code: 404, userInfo: nil)))
            return
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        
        let session = URLSession.shared.dataTask(with: urlRequest) { data, response, err in
            
            let httpResponse = response as? HTTPURLResponse
            let statusCode = httpResponse?.statusCode ?? 400
            
            guard let data = data else {
                let error = NSError(domain: "Data not sent or response", code: statusCode, userInfo: nil)
                DispatchQueue.main.async { completion(.failure(error)) }
                return
            }
            
            if let error = err as NSError? {
                if error.code != NSURLErrorCancelled {
                    DispatchQueue.main.async { completion(.failure(error)) }
                }
                return
            }
            
            guard let response = httpResponse, 200..<300 ~= response.statusCode else {
                let error = NSError(domain: "Data not sent or response is not in the range [200,299]", code: statusCode, userInfo: nil)
                DispatchQueue.main.async { completion(.failure(error)) }
                return
            }
            
            guard let decodedData = try? JSONDecoder().decode(Pokemons.self, from: data) else {
                let error = NSError(domain: "Error while decoding the result", code: 0, userInfo: nil)
                DispatchQueue.main.async { completion(.failure(error)) }
                return
            }
            DispatchQueue.main.async { completion(.success(decodedData)) }
        }
        session.resume()
    }
   
    
    
}

//
//  NetworkManager.swift
//  ColorScreenVIPER
//
//  Created by Enkhtsetseg Unurbayar on 4/2/25.
//

import Foundation

class NetworkManager: NetworkProtocol{
    
    

    func fetchData<T>(from url: URL) async throws -> T where T : Decodable {
        
        let (data, response) = try await URLSession.shared.data(from : url)
        
        guard let httpresponse = response as? HTTPURLResponse,
              (200...299).contains(httpresponse.statusCode)
        else {
            throw NetworkError.invalidURL
        }
        
        let decoder = JSONDecoder()
        do{
            let decodedData = try decoder.decode(T.self, from: data)
            return decodedData
        } catch {
            throw NetworkError.invalidDataPharse
        }
    }
    
    
}

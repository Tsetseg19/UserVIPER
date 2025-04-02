//
//  NetworkProtocol.swift
//  ColorScreenVIPER
//
//  Created by Enkhtsetseg Unurbayar on 4/2/25.
//

import Foundation

// Async Await Generic code!!!

protocol NetworkProtocol {
    
    func fetchData<T: Decodable>(from url: URL) async throws  -> T
}

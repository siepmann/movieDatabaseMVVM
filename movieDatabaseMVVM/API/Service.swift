//
//  Service.swift
//  movieDatabaseMVVM
//
//  Created by Guilherme Siepmann on 24/04/2018.
//  Copyright © 2018 Guilherme Siepmann. All rights reserved.
//

import Foundation

// Works as an interface for the Service class.
protocol ServiceProtocol {
    func getPopularMovies(page: Int, completion: @escaping ((MoviesEntity?) -> Void))
    func getMovieDetail(movieId: Int, completion: @escaping ((MovieDetail?) -> Void))
}

class Service: ServiceProtocol {
    enum Endpoint: String {
        case popular = "/popular"
        case detail = "/"
        
        private var fullPath: String {
            return "\(Config.baseMovieURL)\(self.rawValue)"
        }
        
        private var url: URL {
            guard let url = URL(string: fullPath) else {
                fatalError("Cannot create an URL with the path: \(fullPath)")
            }
            
            return url
        }
        
        private func createURLComponents(_ urlComponent: String = "") -> URLComponents? {
            var currentURL = self.url
            if !urlComponent.isEmpty {
                currentURL = URL(string: self.url.absoluteString + urlComponent)!
            }
            
            var components = URLComponents(url: currentURL, resolvingAgainstBaseURL: true)
            
            // Taking into consideration that all request will need the api_key as a parameter.
            let queryItems = [URLQueryItem(name: "api_key", value: Config.apiKey)]
            components?.queryItems = queryItems
            
            return components
        }
        
        func getURLRequest(urlComponent: String = "") -> URLRequest {
            guard let components = createURLComponents(urlComponent), let _url = components.url else {
                fatalError("Cannot create an URL")
            }
            
            return URLRequest(url: _url)
        }
        
        func getURLRequest(withParams params: [String: String]) -> URLRequest {
            guard var components = createURLComponents() else {
                fatalError("Cannot create an URL")
            }
            
            components.queryItems = components.queryItems! +
                params.flatMap { URLQueryItem(name: $0.key, value: $0.value) }
            
            guard let _url = components.url else {
                fatalError("Cannot create an URL with the params: \(params)")
            }
            
            return URLRequest(url: _url)
        }
    }
    
    /// A instance of URLSession with a custom configuration
    private lazy var manager: URLSession = {
        let configuration = URLSessionConfiguration.default
        configuration.waitsForConnectivity = true
        configuration.timeoutIntervalForRequest = 10.0
        
        return URLSession(configuration: configuration)
    }()
    
}

// MARK: Service + Movies

extension Service {
    func getPopularMovies(page: Int, completion: @escaping ((MoviesEntity?) -> Void)) {
        let requestURL = Endpoint.popular.getURLRequest(withParams: ["page" : "\(page)"])
        
        let session = manager.dataTask(with: requestURL) { (data, response, error) in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            
            completion(try? MoviesEntity(from: data))
        }
        
        session.resume()
    }
    
    func getMovieDetail(movieId: Int, completion: @escaping ((MovieDetail?) -> Void)) {
        let requestURL = Endpoint.detail.getURLRequest(urlComponent: "\(movieId)")
        
        let session = manager.dataTask(with: requestURL) { (data, response, error) in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            
            completion(try? MovieDetail(from: data))
        }
        
        session.resume()
    }
}

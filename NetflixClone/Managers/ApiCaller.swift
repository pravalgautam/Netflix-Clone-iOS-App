//
//  ApiCaller.swift
//  NetflixClone
//
//  Created by Praval Gautam on 11/02/24.
//

import Foundation

enum Section : Int {
    case Trendingmovies = 0
    case TrendingTv = 1
    case Popular = 2
    case Upcoming = 3
    case TopRated = 4
}

class ApiCaller{
    static let shared = ApiCaller()
    
    struct constants{
        static let api  = "a5be053c6687ced4daff25c4f85b62e7"
        static let baseUrl = "https://api.themoviedb.org"
    }
    
    enum apiError: Error{
        case failedToGetData
    }
    
    func getTrendingMovies(completion: @escaping (Result<[Title], Error>) ->Void){
     
 
        guard  let url =  URL(string: "\(constants.baseUrl)/3/trending/movie/day?api_key=\(constants.api)") else {return}
        let task =  URLSession.shared.dataTask(with: url) { data,_, error in
            guard let data  = data ,error == nil else{
                return
            }
            do{
                let results =  try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))

            }
            catch{
                completion(.failure(apiError.failedToGetData))
            }
        }
        task.resume()
    }
    
    
    func getTrendingTv(completion: @escaping (Result<[Title], Error>) ->Void){
        guard  let url =  URL(string: "\(constants.baseUrl)/3/trending/tv/day?api_key=\(constants.api)") else {return}
        let task =  URLSession.shared.dataTask(with: url) { data,_, error in
            guard let data  = data ,error == nil else{
                return
            }
            do{
                let results =  try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))

            }
            catch{
             print(error)
            }
        }
        task.resume()
    }
    
    
    func getUpcomingMovies(completion: @escaping (Result<[Title], Error>) -> Void) {
        guard let url = URL(string: "\(constants.baseUrl)/3/movie/upcoming?api_key=\(constants.api)&language=en-US&page=1") else {return}
          let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
              guard let data = data, error == nil else {
                  return
              }
              
              do {
                  let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                  completion(.success(results.results))
              } catch {
                  print(error.localizedDescription)
              }

          }
          task.resume()
      }
    func getPopular(completion: @escaping (Result<[Title], Error>) -> Void) {
        guard let url = URL(string: "\(constants.baseUrl)/3/movie/popular?api_key=\(constants.api)&language=en-US&page=1") else {return}
           let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
               guard let data = data, error == nil else {
                   return
               }
               
               do {
                   let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                   print(results)
                   completion(.success(results.results))
               } catch {
                   print(error.localizedDescription)
               }
           }
           
           task.resume()
       }
       
       func getTopRated(completion: @escaping (Result<[Title], Error>) -> Void) {
           guard let url = URL(string: "\(constants.baseUrl)/3/movie/top_rated?api_key=\(constants.api)&language=en-US&page=1") else {return }
           let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
               guard let data = data, error == nil else {
                   return
               }
               
               do {
                   let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                   completion(.success(results.results))

               } catch {
                   print(error.localizedDescription)
               }

           }
           task.resume()
       }
    
    func getDiscoverMovies(completion: @escaping (Result<[Title], Error>) -> Void) {
          guard let url = URL(string: "\(constants.baseUrl)/3/discover/movie?api_key=\(constants.api)&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1&with_watch_monetization_types=flatrate") else {return }
          let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
              guard let data = data, error == nil else {
                  return
              }
              
              do {
                  let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                  completion(.success(results.results))

              } catch {
                  completion(.failure(apiError.failedToGetData))
              }

          }
          task.resume()
      }
      
       
//       func search(with query: String, completion: @escaping (Result<[Title], Error>) -> Void) {
//           
//           guard let query = query.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else {return}
//           guard let url = URL(string: "\(constants.baseUrl)/3/search/movie?api=\(constants.api)&query=\(query)") else {
//               return
//           }
//           
//           let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
//               guard let data = data, error == nil else {
//                   return
//               }
//               
//               do {
//                   let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
//                   completion(.success(results.results))
//
//               } catch {
//                   completion(.failure(apiError.failedToGetData))
//               }
//
//           }
//           task.resume()
//       }
//       
//       
//       func getMovie(with query: String, completion: @escaping (Result<VideoElement, Error>) -> Void) {
//           
//
//           guard let query = query.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else {return}
//           guard let url = URL(string: "\(constants.YoutubebaseUrl)q=\(query)&key=\(constants.Youtubeapi)") else {return}
//           let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
//               guard let data = data, error == nil else {
//                   return
//               }
//               
//               do {
//                   let results = try JSONDecoder().decode(YoutubeSearchResponse.self, from: data)
//                   
//                   completion(.success(results.items[0]))
//                   
//
//               } catch {
//                   completion(.failure(error))
//                   print(error.localizedDescription)
//               }
//
//           }
//           task.resume()
//       }
       
   
}
//\(constants.baseUrl)/3/discover/movie?include_adult=false&include_video=false&language=en-US&page=1&sort_by=popularity.desc


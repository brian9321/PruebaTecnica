//
//  ViewModel.swift
//  vlBitcoin
//
//  Created by Brian Aboytes Morales on 07/09/21.
//

import Foundation

final class ViewModel {
    
    let url = "https://api.blockchain.com/v3/exchange/tickers/"
    let token = "eyJhbGciOiJFUzI1NiIsInR5cCI6IkFQSSJ9.eyJhdWQiOiJtZXJjdXJ5IiwidWlkIjoiOGZmN2M0YTQtYjkwYy00Njg5LTk1ZGMtMzM4ZTdlYmM3ZTA2IiwiaXNzIjoiYmxvY2tjaGFpbiIsInJkbyI6dHJ1ZSwiaWF0IjoxNjMwOTc1OTM3LCJqdGkiOiJjZmI0MGE5NS1jNjQ1LTQzYWMtYWIwMS1lM2QyNGNiNjhlMjkiLCJzZXEiOjQ3MzMyNDQsIndkbCI6ZmFsc2V9.IEeHapPu/+aPNyRLzFqTx66xbc2XTEj0rorhLehHMKjWAz1HY75nChQSui9HqAJFnlZhYpiFmL6n3F6hr8bNgaY=https://api.blockchain.com/v3/exchange/tickers/BTC-USD?X-API-Token=eyJhbGciOiJFUzI1NiIsInR5cCI6IkFQSSJ9.eyJhdWQiOiJtZXJjdXJ5IiwidWlkIjoiOGZmN2M0YTQtYjkwYy00Njg5LTk1ZGMtMzM4ZTdlYmM3ZTA2IiwiaXNzIjoiYmxvY2tjaGFpbiIsInJkbyI6dHJ1ZSwiaWF0IjoxNjMwOTc1OTM3LCJqdGkiOiJjZmI0MGE5NS1jNjQ1LTQzYWMtYWIwMS1lM2QyNGNiNjhlMjkiLCJzZXEiOjQ3MzMyNDQsIndkbCI6ZmFsc2V9.IEeHapPu/+aPNyRLzFqTx66xbc2XTEj0rorhLehHMKjWAz1HY75nChQSui9HqAJFnlZhYpiFmL6n3F6hr8bNgaY="
    
     func executeApi(moneda: String, bitcoinCompletionHandler: @escaping (ResponseData?, Error?) -> Void){
        let UrlSession = URLSession.shared
        let url = URL(string: url + "BTC-" + moneda + "?X-API-Token=" + token)
        
        let task = UrlSession.dataTask(with: url!){ data, response, error in
            
            guard let data = data, error == nil else {
                print("Error en la peticion")
                return
            }
            
            var results: ResponseData?
            do {
                results = try JSONDecoder().decode(ResponseData.self, from: data)
                bitcoinCompletionHandler(results, nil)
                
            }
            catch {
                print("Error en la peticion \(error.localizedDescription)")
            }
            
           /* guard let json = results else {
                return
            }*/
            
            //print(json.price_24h)
        }
        
        task.resume()
    }
    
}



import Foundation

protocol CoinManagerDelegate {
    
    func updateUI(price: Double)
    
}

struct CoinManager {
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = "YOUR_API_KEY_HERE"
    
    let currencyArray = ["BTC", "AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    
    var delegate: CoinManagerDelegate?
    
    func getCoinPrice(for currency: String) {
        let string = "https://rest.coinapi.io/v1/exchangerate/BTC/\(currency)?apikey=0F001115-D37C-414E-9D23-0CE52601A953"
        performRequest(with: string)
        
    }
    
    func performRequest(with url: String) {
        
        let urlString = URL(string: url)
        
        let session = URLSession(configuration: .default)
        
        let task = session.dataTask(with: urlString!) { Data, Response, Error in
            
            if Error == nil {
                
                if let httpResponse = Response as? HTTPURLResponse {
                    if httpResponse.statusCode == 200 {
                        
                        if let safeData = Data {
                            
                            let decoder = JSONDecoder()
                            do {
                                let decodedData = try decoder.decode(CoinData.self, from: safeData)
                                delegate?.updateUI(price: decodedData.rate)
                                
                            } catch {
                                print(error.localizedDescription)
                            }
                            
                        }
                        
                    } else {
                        print("Response code not 200, it is \(httpResponse.statusCode)")
                    }
                }
                
            } else {
                print(Error?.localizedDescription ?? "An eror occured")
            }
            
        }
        task.resume()
        
    }
}

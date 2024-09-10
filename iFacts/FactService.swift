import Foundation

// Define the structure of the fact response from the API
struct Fact: Codable {
    let text: String
}

class FactService {
    // Function to fetch a random fact from the API
    func fetchRandomFact(completion: @escaping (Result<String, Error>) -> Void) {
        guard let url = URL(string: "https://uselessfacts.jsph.pl/random.json?language=en") else {
            completion(.failure(NSError(domain: "Invalid URL", code: 1, userInfo: nil)))
            return
        }
        
        // Create a URL session data task to fetch data
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "No data", code: 1, userInfo: nil)))
                return
            }
            
            do {
                // Decode the JSON response into the Fact struct
                let factResponse = try JSONDecoder().decode(Fact.self, from: data)
                completion(.success(factResponse.text))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}

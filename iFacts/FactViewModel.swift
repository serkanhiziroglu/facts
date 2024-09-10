import Foundation

class FactViewModel: ObservableObject {
    @Published var currentFact = "Tap the button to see a fact!"
    @Published var favorites: [String] = []
    
    func fetchNewFact() {
        guard let url = URL(string: "https://uselessfacts.jsph.pl/api/v2/facts/random") else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                print("Error fetching fact: \(error)")
                return
            }
            
            guard let data = data else { return }
            
            do {
                let result = try JSONDecoder().decode(FactResponse.self, from: data)
                DispatchQueue.main.async {
                    self.currentFact = result.text
                }
            } catch {
                print("Error decoding fact: \(error)")
            }
        }.resume()
    }
    
    func addToFavorites() {
        if !favorites.contains(currentFact) {
            favorites.append(currentFact)
        }
    }
}

import Foundation

class FactViewModel: ObservableObject {
    @Published var currentFact = "Tap the button to see a fact!"
    private let factService = FactService()
    
    func fetchNewFact() {
        factService.fetchRandomFact { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let fact):
                    self?.currentFact = fact
                case .failure(let error):
                    self?.currentFact = "Failed to fetch fact: \(error.localizedDescription)"
                }
            }
        }
    }
}

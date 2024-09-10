import SwiftUI

struct FavoritesView: View {
    @Binding var favorites: [String]
    
    var body: some View {
        NavigationView {
            List {
                if favorites.isEmpty {
                    Text("No favorites added yet.")
                        .foregroundColor(.gray)
                } else {
                    ForEach(favorites, id: \.self) { fact in
                        Text(fact)
                            .padding()
                    }
                }
            }
            .navigationTitle("Favorites")
        }
    }
}

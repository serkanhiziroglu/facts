import SwiftUI

struct FactView: View {
    var currentFact: String
    
    var body: some View {
        Text(currentFact)
            .font(.title)
            .padding()
            .multilineTextAlignment(.center)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.blue.opacity(0.1))
            .cornerRadius(10)
            .padding()
    }
}

struct FactView_Previews: PreviewProvider {
    static var previews: some View {
        FactView(currentFact: "This is a sample fact for preview.")
    }
}

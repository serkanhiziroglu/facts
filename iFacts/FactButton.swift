import SwiftUI

struct FactButton: View {
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text("New Fact")
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
        }
    }
}

struct FactButton_Previews: PreviewProvider {
    static var previews: some View {
        FactButton(action: {})
    }
}

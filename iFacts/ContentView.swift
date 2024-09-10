import SwiftUI

struct ContentView: View {
    @State private var currentFact = "Tap the button to see a fact!"
    
    // Sample facts
    let facts = [
        "The Great Wall of China is not visible from space with the naked eye.",
        "A group of flamingos is called a 'flamboyance'.",
        "The shortest war in history lasted 38 minutes.",
        "Honeybees can recognize human faces.",
        "The world's oldest known living tree is over 5,000 years old."
    ]
    
    var body: some View {
        VStack(spacing: 20) {
            Text("iFacts")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top)
            
            Spacer()
            
            FactView(currentFact: currentFact)
            
            Spacer()
            
            FactButton(action: {
                currentFact = facts.randomElement() ?? currentFact
            })
            .padding(.bottom)
        }
    }
}

#Preview {
    ContentView()
}

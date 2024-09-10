import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = FactViewModel()
    
    var body: some View {
        VStack(spacing: 20) {
            Text("iFacts")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top)
            
            Spacer()
            
            FactView(currentFact: viewModel.currentFact)
            
            Spacer()
            
            FactButton(action: viewModel.fetchNewFact)
                .padding(.bottom)
        }
        .onAppear(perform: viewModel.fetchNewFact)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

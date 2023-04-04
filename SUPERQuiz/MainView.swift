//
//  MainVIew.swift
//  SUPERQuiz
//
//  Created by Sebastian Mraz on 30/03/2023.
//

import SwiftUI

struct MainView: View {
    
    // MARK: - Body
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                appTitle()
                actionButton(navigationLink: NavigationLink("PLAY") {
                    GameView(viewModel: GameViewModel())
                })
                actionButton(navigationLink: NavigationLink("RURES") { RulesView() })
                actionButton(navigationLink: NavigationLink("ABOUT APP") { AboutAppView() })
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("pozadie"))
        }
    }

}

// MARK: - Components

private extension MainView {
    
    func appTitle() -> some View {
        Text("SUPER")
            .bold()
            .italic()
            .font(.largeTitle)
            .foregroundColor(.accentColor)
        + Text("-Quiz")
            .bold()
            .font(.largeTitle)
    }
    
    func actionButton(navigationLink: some View) -> some View {
        navigationLink
            .frame(maxWidth: .infinity, maxHeight: 20)
            .bold()
            .font(.title2)
            .padding(.horizontal, 20)
            .foregroundColor(.black)
    }
    
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

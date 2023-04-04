//
//  GameView.swift
//  SUPERQuiz
//
//  Created by Sebastian Mraz on 30/03/2023.
//

import SwiftUI

struct GameView: View {
    
    @ObservedObject var viewModel: GameViewModel
    
    // MARK: - Body
    
    var body: some View {
        ZStack {
            VStack(spacing: 20) {
                Text(viewModel.allLevels.levels[LevelManager.instance.currentLevel].question)
                    .bold()
                    .font(.largeTitle)
                
                ForEach(
                    viewModel.allLevels.levels[LevelManager.instance.currentLevel].options,
                    id: \.self
                ) { option in
                    optionButton(text: option) {
                        viewModel.validate(option: option)
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("pozadie"))
            
            resultDialog(messageText: "WIN", buttonText: "NEXT LEVEL") {
                viewModel.nextLevel()
                viewModel.hideDialog()
            }
            .opacity(
                viewModel.showDialog && viewModel.levelState == .win
                ? 1
                : 0
            )
            .animation(.spring(), value: viewModel.showDialog && viewModel.levelState == .win)
            
            resultDialog(messageText: "LOOSE", buttonText: "TRY AGAIN") {
                viewModel.hideDialog()
            }
            .opacity(viewModel.showDialog && viewModel.levelState == .loose ? 1 : 0)
            .animation(.spring(), value: viewModel.showDialog && viewModel.levelState == .loose)
        }

    }
      
}

// MARK: - Components

private extension GameView {
    
    func optionButton(text: String, action: @escaping () -> Void) -> some View {
        Button {
            action()
        } label: {
            Text(text)
                .frame(maxWidth: .infinity, maxHeight: 20)
                .bold()
                .font(.title2)
                .padding(.vertical, 20)
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .foregroundColor(.white)
                )
                .padding(.horizontal, 20)
        }
        .foregroundColor(.black)
        .disabled(viewModel.showDialog)
    }
    
    func resultDialog(messageText: String, buttonText: String, action: @escaping () -> Void) -> some View {
        VStack {
            Text(messageText)
                .font(.largeTitle)
                .bold()
            
            if viewModel.levelState == .loose || (!viewModel.isWin && viewModel.levelState == .win){
                Button {
                    action()
                } label: {
                    Text(buttonText)
                        .frame(maxWidth: .infinity, maxHeight: 20)
                        .bold()
                        .font(.title2)
                        .padding(.vertical, 20)
                        .background(
                            RoundedRectangle(cornerRadius: 8)
                                .foregroundColor(Color("pozadie"))
                        )
                        .padding(.horizontal, 20)
                }
                .foregroundColor(.black)
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 8)
                .foregroundColor(.white)
        )
        .padding()
        .shadow(radius: 100)
    }
        
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(viewModel: .init())
    }
}

//
//  GameViewModel.swift
//  SUPERQuiz
//
//  Created by Sebastian Mraz on 30/03/2023.
//

import Foundation

class GameViewModel: ObservableObject {
    
    @Published private(set) var allLevels: Levels = Levels()
    @Published private(set) var levelState: LevelState = .notResolved
    @Published private(set) var showDialog: Bool = false
    @Published private(set) var isWin: Bool
    
    init() {
        isWin = LevelManager.instance.currentLevel >= 2
    }
    
    func validate(option: String) {
        let actualLevel = allLevels.levels[LevelManager.instance.currentLevel]
        if let optionIndex = actualLevel.options.firstIndex(of: option) {
            if optionIndex == actualLevel.correctOptionIndex {
                changeLevelState(newState: .win)
                changeDialogState(newDialogState: true)
            } else {
                changeLevelState(newState: .loose)
                changeDialogState(newDialogState: true)
            }
        } else {
            changeLevelState(newState: .notResolved)
        }
    }
    
    func hideDialog() {
        changeDialogState(newDialogState: false)
    }
    
    func nextLevel() {
        if LevelManager.instance.currentLevel < 2 {
            LevelManager.instance.currentLevel += 1
            if LevelManager.instance.currentLevel == 2 {
                isWin = true
            }
        } else {
            isWin = true
        }
    }
    
    func changeLevelState(newState: LevelState) {
        levelState = newState
    }
    
    func changeDialogState(newDialogState: Bool) {
        showDialog = newDialogState
    }
    
}

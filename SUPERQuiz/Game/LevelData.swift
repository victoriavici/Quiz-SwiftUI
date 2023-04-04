//
//  Level.swift
//  SUPERQuiz
//
//  Created by Sebastian Mraz on 30/03/2023.
//

import Foundation

struct Level {
    
    let question: String
    let options: [String]
    let correctOptionIndex: Int
    
}

struct Levels {
    
    let levels: [Level] = [
        .init(
            question: "Urobi Michal bakalarku",
            options: [
                "ANO",
                "NIE"
            ],
            correctOptionIndex: 0
        ),
        .init(
            question: "Urobi Andrej audiny",
            options: [
                "ANO",
                "NIE",
                "Andrej je Ruky"
            ],
            correctOptionIndex: 2
        ),
        .init(
            question: "Aky je vztah medzi Uchom a Borovickou",
            options: [
                "ANO",
                "NIE",
                "MOZNO",
                "Slovnaftka"
            ],
            correctOptionIndex: 3
        ),
    ]
    
}

enum LevelState {
    
    case notResolved
    case win
    case loose
    
}

//
//  ScoreKeeper.swift
//  BunnyLove
//
//  Created by Shane Zatezalo on 3/24/16.
//  Copyright © 2016 Lottadot LLC. All rights reserved.
//

import Foundation

/// This class will manage the score keeping.p
class ScoreKeeper {
    
    private var positiveVotes: Int = 0
    private var negativeVotes: Int = 0
    
    func upVote() {
        positiveVotes += 1
    }
    
    func downVote() {
        negativeVotes += 1
    }
    
    func score() -> (positive: Int, negative: Int) {
        return (positiveVotes, negativeVotes)
    }
    
}

//
//  BunnyProvider.swift
//  BunnyLove
//
//  Created by Shane Zatezalo on 3/24/16.
//  Copyright © 2016 Lottadot LLC. All rights reserved.
//

import UIKit

struct Bunny {
    var filename: String
    
    var description : String {
        return "Bunny with name:\(filename)"
    }
}

/// This class will provide Bunnies.
class BunnyProvider {
    
    var nextProvidedAtIndex:Int = 0
    var bunnies:[Bunny] = []
    
    init() {
        let bunny1 = Bunny.init(filename: "Bunny1")
        let bunny2 = Bunny.init(filename: "Bunny2")
        let bunny3 = Bunny.init(filename: "Bunny3")
        let bunny4 = Bunny.init(filename: "Bunny4")
        let bunny5 = Bunny.init(filename: "Bunny5")
        let bunny6 = Bunny.init(filename: "Bunny6")
        let bunny7 = Bunny.init(filename: "Bunny7")
        let bunny8 = Bunny.init(filename: "Bunny8")
        
        bunnies.append(bunny1)
        bunnies.append(bunny2)
        bunnies.append(bunny3)
        bunnies.append(bunny4)
        bunnies.append(bunny5)
        bunnies.append(bunny6)
        bunnies.append(bunny7)
        bunnies.append(bunny8)
    }
    
    func nextBunnyImage() -> UIImage? {
        if nextProvidedAtIndex >= bunnies.count {
            return nil
        }
        
        guard let bunny:Bunny = bunnies[nextProvidedAtIndex], let filename:String = bunny.filename, let image = UIImage.init(named: filename) else {
            return nil
        }
        
        nextProvidedAtIndex = (nextProvidedAtIndex == bunnies.count) ? 0 : nextProvidedAtIndex + 1
        
        return image
    }
}

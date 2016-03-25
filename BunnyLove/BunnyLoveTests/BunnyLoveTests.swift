//
//  BunnyLoveTests.swift
//  BunnyLoveTests
//
//  Created by Shane Zatezalo on 3/24/16.
//  Copyright © 2016 Lottadot LLC. All rights reserved.
//

import XCTest
@testable import BunnyLove

class BunnyLoveTests: XCTestCase {
    
    func test01BunnyProviderHasBunnies() {
        let bunnyProvider = BunnyProvider.init()
        XCTAssertTrue(bunnyProvider.bunnies.count > 0)
    }
    
    func test0FirstBunny() {
        let bunnyProvider = BunnyProvider.init()
        
        let bunny1 = bunnyProvider.bunnies.first
        XCTAssertEqual(bunny1?.filename, "Bunny1")
    }
    
}

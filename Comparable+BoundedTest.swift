//
//  Comparable+BoundedTest.swift
//
//  Created by Dmitriy Ignatyev on 17/01/2019.
//  Copyright © 2019 Dmitriy Ignatyev. All rights reserved.
//

import XCTest

final class ComparableBoundedTest: XCTestCase {
    
    func testBounding() {
        
        // --- Normal Cases ---
        
        // Positive Bounds
        // Между граничными значениями
        XCTAssertEqual(0.001.boundedWith(0, 1), 0.001)
        XCTAssertEqual(0.5.boundedWith(0, 1), 0.5)
        XCTAssertEqual(0.999.boundedWith(0, 1), 0.999)
        
        // Равно граничному значению
        XCTAssertEqual(0.0.boundedWith(0, 1), 0)
        XCTAssertEqual(1.0.boundedWith(0, 1), 1)
        
        // Выходит за граничные значения
        XCTAssertEqual((-0.001).boundedWith(0, 1), 0)
        XCTAssertEqual(1.001.boundedWith(0, 1), 1)
        
        // NegativeBounds
        // Между граничными значениями
        XCTAssertEqual((-0.5).boundedWith(-1.0, 1), -0.5)
        XCTAssertEqual(0.5.boundedWith(-1.0, 1), 0.5)
        
        // Равно граничному значению
        XCTAssertEqual((-1.0).boundedWith(-1.0, 1), -1)
        XCTAssertEqual(1.0.boundedWith(-1.0, 1), 1)
        
        // Выходит за граничные значения
        XCTAssertEqual((-1.001).boundedWith(-1.0, 1), -1)
        XCTAssertEqual(1.001.boundedWith(-1.0, 1), 1)
        
        // --- Corner Cases ---
        
        // 1. lowerBound == upperBound
        XCTAssertEqual(0.5.boundedWith(1, 1), 1)
        XCTAssertEqual(0.5.boundedWith(0, 0), 0)
        XCTAssertEqual(0.5.boundedWith(0.5, 0.5), 0.5)
        XCTAssertEqual(0.5.boundedWith(-1, -1), -1)
        
        // 2. rhs < lhs
        // Между граничными значениями
        XCTAssertEqual(0.001.boundedWith(1, 0), 0.001)
        XCTAssertEqual(0.5.boundedWith(1, 0), 0.5)
        XCTAssertEqual(0.999.boundedWith(1, 0), 0.999)
        
        // Равно граничному значению
        XCTAssertEqual(0.0.boundedWith(1, 0), 0)
        XCTAssertEqual(1.0.boundedWith(1, 0), 1)
        
        // Выходит за граничные значения
        XCTAssertEqual((-0.001).boundedWith(1, 0), 0)
        XCTAssertEqual(1.001.boundedWith(1, 0), 1)
        
        // NegativeBounds
        // Между граничными значениями
        XCTAssertEqual((-0.5).boundedWith(1, -1.0), -0.5)
        XCTAssertEqual(0.5.boundedWith(1, -1.0), 0.5)
        
        // Равно граничному значению
        XCTAssertEqual((-1.0).boundedWith(1, -1.0), -1)
        XCTAssertEqual(1.0.boundedWith(1, -1.0), 1)
        
        // Выходит за граничные значения
        XCTAssertEqual((-1.001).boundedWith(1, -1.0), -1)
        XCTAssertEqual(1.001.boundedWith(1, -1.0), 1)
    }
}

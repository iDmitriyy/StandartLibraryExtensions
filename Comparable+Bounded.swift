//
//  Comparable+BoundedTest.swift
//
//  Created by Dmitriy Ignatyev on 17/01/2019.
//  Copyright © 2019 Dmitriy Ignatyev. All rights reserved.
//

extension Comparable {
     /**
     boundedWith(_ lhs: Self, _ rhs: Self)
     
     Возвращает значение, ораниченное верхним или нижним пороговым значением.
     
     lhs и rhs могут быть заданы в проивзольном порядке, т.е не обязательно по возрастанию
     
     Например, когда lhs == 0, а rhs == 1 то:
     - Если value == 0.5, то вернется 0.5, т.к оно не выходит за границы порогвых значений.
     - Если value < 0, то вернется 0 (нижнияя граница)
     - Если value > 1, то вернется 1 (верхняя граница).
     */
    func boundedWith(_ lhs: Self, _ rhs: Self) -> Self {
        
        guard lhs != rhs else { return lhs }
        
        var lower = lhs
        var upper = rhs
        
        if rhs < lhs {
            swap(&lower, &upper)
        }
        
        return min(upper, max(self, lower))
    }
}

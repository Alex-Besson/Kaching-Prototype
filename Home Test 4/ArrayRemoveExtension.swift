//
//  ArrayRemoveExtension.swift
//  Home Test 4
//
//  Created by Alexander Besson on 2015-10-26.
//  Copyright © 2015 Alexander Besson. All rights reserved.
//

import Foundation

extension RangeReplaceableCollectionType where Generator.Element : Equatable {
    mutating func removeObject(object : Generator.Element) {
        if let index = self.indexOf(object) {
            self.removeAtIndex(index)
        }
    }
}
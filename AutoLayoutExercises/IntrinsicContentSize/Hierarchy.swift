//
//  Hierarchy.swift
//  AutoLayoutExercises
//
//  Created by Dominik Personal on 10/12/2017.
//  Copyright © 2017 Dominik Olędzki. All rights reserved.
//

import Foundation

struct Hierarchy<Element> {
    let value: Element
    let children: [Hierarchy]
}

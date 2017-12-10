//
//  StringHierarchyViewController.swift
//  AutoLayoutExercises
//
//  Created by Dominik Personal on 10/12/2017.
//  Copyright © 2017 Dominik Olędzki. All rights reserved.
//

import UIKit

class StringHierarchyViewController: UIViewController {
    @IBOutlet weak var hierarchyView: StringHierarchyView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hierarchyView.model =
            .init(value: "~", children: [
                .init(value: "Applications", children: [
                    .init(value: "Xcode", children: []),
                    .init(value: "Sketch", children: []),
                    .init(value: "Starcraft II", children: [])
                    ]),
                .init(value: "Desktop", children: [
                    .init(value: "Screen Shot 2017-11-25 at 02.17.42", children: [])
                    ]),
                .init(value: "Documents", children: [
                    .init(value: "Projects", children: [
                        .init(value: "AutoLayoutExercises", children:  [])
                        ])
                    ])
                ])
    }
}

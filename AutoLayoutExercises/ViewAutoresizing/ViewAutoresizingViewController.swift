//
//  ViewAutoresizingViewController.swift
//  AutoLayoutExercises
//
//  Created by Dominik Olędzki on 19/11/2017.
//

import UIKit

class ViewAutoresizingViewController: UIViewController {
    @IBOutlet weak var headerView: HeaderView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let place = Place(name: "Pico Ruivo", image: UIImage(named: "HeaderImage")!)
        headerView.setup(with: place)
    }
}

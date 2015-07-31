//
//  DetailViewController.swift
//  FruitsDiet
//
//  Created by Ravi Shankar on 30/07/15.
//  Copyright (c) 2015 Ravi Shankar. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    var fruit: Fruit?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let fruit = fruit {
            navigationItem.title = fruit.name?.capitalizedString
            imageView.image = UIImage(named: fruit.name!.lowercaseString)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

//
//  AdminViewController.swift
//  BahamaAirLoginScreen
//
//  Created by Stellar Mobile on 16/09/19.
//  Copyright © Oct 2019 Razeware LLC. All rights reserved.
//

import UIKit

class AdminViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let items = ["Circulars","Newsletter","Messages","Notifications"]
        let segmentedControl = UISegmentedControl(items:items)
        let frame = UIScreen.main.bounds
        segmentedControl.frame = CGRect(x: frame.minX + 10, y: frame.minY + 90,
                                        width: frame.width - 20, height: 50)
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.addTarget(self, action: #selector(HomeViewController.indexChanged(_:)), for: .valueChanged)
        segmentedControl.layer.cornerRadius = 10.0
        segmentedControl.backgroundColor = .blue
        segmentedControl.tintColor = .white
        
        self.view.addSubview(segmentedControl)
        
        // Do any additional setup after loading the view.
    }
    
    @objc func indexChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex{
        case 0:
            print("Whats New")
            
        case 1:
            print("Calendar")
            
           
            
        case 2:
            print("Messages")
            
            
        case 3:
            print("Notifications")
            
            
        default:
            break
        }
    }
}

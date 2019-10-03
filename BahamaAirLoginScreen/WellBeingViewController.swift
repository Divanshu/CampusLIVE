//
//  WellBeingViewController.swift
//  BahamaAirLoginScreen
//
//  Created by Stellar Mobile on 16/09/19.
//  Copyright © 2019 Razeware LLC. All rights reserved.
//

import UIKit

class WellBeingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let segmentedControl = TTSegmentedControl()
        segmentedControl.allowChangeThumbWidth = false
        segmentedControl.frame = CGRect(x: 10, y: 90, width: 80, height: 50)
        segmentedControl.didSelectItemWith = { (index, title) -> () in
            print("Selected item \(index)")
        }
        view.addSubview(segmentedControl)
        view.backgroundColor = UIColor.white

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

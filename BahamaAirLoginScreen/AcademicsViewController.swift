//
//  AcademicsViewController.swift
//  BahamaAirLoginScreen
//
//  Created by Stellar Mobile on 16/09/19.
//  Copyright © 2019 Razeware LLC. All rights reserved.
//

import UIKit
import WebKit

class AcademicsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, WKUIDelegate {
  
    private let myArray: NSArray = ["First","Second","Third"]
    private var myTableView: UITableView!
    
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Num: \(indexPath.row)")
        print("Value: \(myArray[indexPath.row])")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath as IndexPath)
        let image : UIImage = UIImage(named: "admin.png")!
        cell.imageView?.image = image
        cell.textLabel!.text = "\(myArray[indexPath.row])"
        return cell
    }
    
}

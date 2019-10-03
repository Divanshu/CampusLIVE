//
//  HomeViewController.swift
//  BahamaAirLoginScreen
//
//  Created by Stellar Mobile on 16/09/19.
//  Copyright © Oct 2019 Razeware LLC. All rights reserved.
//

import UIKit
import WebKit
import 	ScalingCarousel

class CodeCell: ScalingCarouselCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // Initialize the mainView property and add it to the cell's contentView
        
        mainView = UIView(frame: contentView.bounds)
        contentView.addSubview(mainView)
        mainView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mainView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            mainView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            mainView.topAnchor.constraint(equalTo: contentView.topAnchor),
            mainView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
            ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, WKUIDelegate, ACTabScrollViewDelegate, ACTabScrollViewDataSource  {
    
    @IBOutlet weak var tabScrollView: ACTabScrollView!
    
    var contentViews: [UIView] = []
    
    private let myArray: NSArray = ["First Message","Second Message","Third Message"]
    private let myArrayNotifications: NSArray = ["First Message","Second Message","Third Message"]
    private var myTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // set ACTabScrollView, all the following properties are optional
        tabScrollView.defaultPage = 3
        tabScrollView.arrowIndicator = true
        
        tabScrollView.delegate = self
        tabScrollView.dataSource = self
                
        // set navigation bar appearance
        if let navigationBar = self.navigationController?.navigationBar {
            navigationBar.isTranslucent = false
            navigationBar.tintColor = UIColor.white
            navigationBar.barTintColor = UIColor(red: 129.0 / 255, green: 90.0 / 255, blue: 232.0 / 255, alpha: 1)
            navigationBar.titleTextAttributes = NSDictionary(object: UIColor.white, forKey: NSAttributedString.Key.foregroundColor as NSCopying) as? [NSAttributedString.Key : AnyObject]
            navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
            navigationBar.shadowImage = UIImage()
        }
        
        UIApplication.shared.statusBarStyle = UIStatusBarStyle.lightContent
        
        let items = ["Whats New","Calender","Messages","Notifications"]
        let segmentedControl = UISegmentedControl(items:items)
        let frame = UIScreen.main.bounds
        segmentedControl.frame = CGRect(x: frame.minX + 10, y: frame.minY + 90,
                                        width: frame.width - 20, height: 50)
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.addTarget(self, action: #selector(HomeViewController.indexChanged(_:)), for: .valueChanged)
        segmentedControl.layer.cornerRadius = 10.0
        segmentedControl.backgroundColor = .blue
        segmentedControl.tintColor = .gray
        
    //   self.view.addSubview(segmentedControl)
        
        let view1 = UIView(frame: CGRect.init(x: 0, y: 0, width: 50, height: 50))
        view1.backgroundColor = .white
        let labelV1 = UILabel(frame: CGRect(x: 0, y: 0, width: 150, height: 15))
        labelV1.textAlignment = NSTextAlignment.center
        labelV1.font = labelV1.font.withSize(10)
        labelV1.text = "Latest Updates"
        let imageNameLU = "LatestUpdate.png"
        let imageLU = UIImage(named: imageNameLU)
        let imageViewLU = UIImageView(image: imageLU!)
        imageViewLU.frame = CGRect(x: 5, y: 30, width: 350, height: 180)
        view1.addSubview(labelV1)
        view1.addSubview(imageViewLU)
        
        let view2 = UIView(frame: CGRect.init(x: 0, y: 0, width: 50, height: 50))
        view2.backgroundColor = .white
        let barHeight: CGFloat = UIApplication.shared.statusBarFrame.size.height
                      let displayWidth: CGFloat = self.view.frame.width
                      let displayHeight: CGFloat = self.view.frame.height
       myTableView = UITableView(frame: CGRect(x: 0, y: 0, width: displayWidth, height: displayHeight - barHeight))
                 myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "MyCell")
                 myTableView.dataSource = self
                 myTableView.delegate = self
       view2.addSubview(myTableView)
        
        let view3 = UIView(frame: CGRect.init(x: 0, y: 0, width: 50, height: 50))
        view3.backgroundColor = .white
        
    
        myTableView = UITableView(frame: CGRect(x: 0, y: 0, width: displayWidth, height: displayHeight - barHeight))
                  myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "MyCell")
                  myTableView.dataSource = self
                  myTableView.delegate = self
        view3.addSubview(myTableView)
        
        let view4 = UIView(frame: CGRect.init(x: 0, y: 0, width: 50, height: 50))
        view4.backgroundColor = .white
        myTableView = UITableView(frame: CGRect(x: 0, y: 0, width: displayWidth, height: displayHeight - barHeight))
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "MyCell")
        myTableView.dataSource = self
        myTableView.delegate = self
        view4.addSubview(myTableView)
        
        let view5 = UIView(frame: CGRect.init(x: 0, y: 0, width: 50, height: 50))
        view5.backgroundColor = .gray
        myTableView = UITableView(frame: CGRect(x: 0, y: 0, width: displayWidth, height: displayHeight - barHeight))
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "MyCell")
        myTableView.dataSource = self
        myTableView.delegate = self
        view5.addSubview(myTableView)

        let view6 = UIView(frame: CGRect.init(x: 0, y: 0, width: 50, height: 50))
        view6.backgroundColor = .white

        let view7 = UIView(frame: CGRect.init(x: 0, y: 0, width: 50, height: 50))
        view7.backgroundColor = .white

        contentViews.append(view1)
        contentViews.append(view2)
        contentViews.append(view3)
        contentViews.append(view4)
        contentViews.append(view5)
        contentViews.append(view6)
        contentViews.append(view7)
        
        
        addCarousel()
        
        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.white
        
    }

    
    // MARK: ACTabScrollViewDelegate
    func tabScrollView(_ tabScrollView: ACTabScrollView, didChangePageTo index: Int) {
        
    }
    
    func tabScrollView(_ tabScrollView: ACTabScrollView, didScrollPageTo index: Int) {
    }
    
    // MARK: ACTabScrollViewDataSource
    func numberOfPagesInTabScrollView(_ tabScrollView: ACTabScrollView) -> Int {
        return NewsCategory.allValues().count
    }
    
    func tabScrollView(_ tabScrollView: ACTabScrollView, tabViewForPageAtIndex index: Int) -> UIView {
        // create a label
        let label = UILabel()
        label.text = String(describing: NewsCategory.allValues()[index]).uppercased()
        if #available(iOS 8.2, *) {
            label.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.thin)
        } else {
            label.font = UIFont.systemFont(ofSize: 16)
        }
        label.textColor = UIColor(red: 77.0 / 255, green: 79.0 / 255, blue: 84.0 / 255, alpha: 1)
        label.textAlignment = .center
        
        // if the size of your tab is not fixed, you can adjust the size by the following way.
        label.sizeToFit() // resize the label to the size of content
        label.frame.size = CGSize(width: label.frame.size.width + 28, height: label.frame.size.height + 36) // add some paddings
        
        return label
    }
    
    func tabScrollView(_ tabScrollView: ACTabScrollView, contentViewForPageAtIndex index: Int) -> UIView {
        return contentViews[index]
    }

    @objc func indexChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex{
        case 0:
            print("Whats New")
            
        case 1:
            print("Calendar")
            
            let webView = WKWebView(frame: CGRect(x: 0, y: 200, width: self.view.frame.size.width, height: self.view.frame.size.height))
            self.view.addSubview(webView)
            let url = URL(string: "https://www.youtube.com/watch?v=695PN9xaEhs")
            webView.load(URLRequest(url: url!))
            
            
            let frame = UIScreen.main.bounds
            
            let myWhatsNewView = UIView(frame: CGRect(x: frame.minX + 10, y: frame.minY + 200, width: frame.width - 20, height: 300))
            
            
            // Setter for the Background Color
            
            myWhatsNewView.backgroundColor = UIColor.clear
            
            // Adding Rounded Corners to the UIView
            
            myWhatsNewView.layer.cornerRadius=25
            
            // Adding Borders
            
            myWhatsNewView.layer.borderWidth=4
            
            // Change UIView Border Color to Red
            
            myWhatsNewView.layer.borderColor = UIColor.red.cgColor
            
            // Add UIView as a SubView
            
            //        self.view.addSubview(myWhatsNewView)
            
        case 2:
            print("Messages")
            
            let webView = WKWebView(frame: CGRect(x: 0, y: 200, width: self.view.frame.size.width, height: self.view.frame.size.height))
            self.view.addSubview(webView)
            let url = URL(string: "https://www.youtube.com/watch?v=695PN9xaEhs")
            webView.load(URLRequest(url: url!))
            
        case 3:
            print("Notifications")
            
            let barHeight: CGFloat = UIApplication.shared.statusBarFrame.size.height
            let displayWidth: CGFloat = self.view.frame.width
            let displayHeight: CGFloat = self.view.frame.height
            
            myTableView = UITableView(frame: CGRect(x: 0, y: 200, width: displayWidth, height: displayHeight - barHeight))
            myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "MyCell")
            myTableView.dataSource = self
            myTableView.delegate = self
            self.view.addSubview(myTableView)
            
        default:
            break
        }
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
    
    
    @objc func handleSwipes(_ sender:UISwipeGestureRecognizer)
    {
        if (sender.direction == .left)
        {
            print("Swipe Left")
            
            // show the view from the right side
        }
        
        if (sender.direction == .right)
        {
            print("Swipe Right")
            
            // show the view from the left side
        }
    }
    
    // MARK: - Properties (Private)
    fileprivate var scalingCarousel: ScalingCarouselView!
    
    // MARK: - Lifecycle
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        if scalingCarousel != nil {
            scalingCarousel.deviceRotated()
        }
    }
    
    // MARK: - Configuration
    
    private func addCarousel() {
        
        let frame = CGRect(x: 0, y: 100, width: 0, height: 0)
        scalingCarousel = ScalingCarouselView(withFrame: frame, andInset: 30)
        scalingCarousel.dataSource = self
        scalingCarousel.delegate = self
        scalingCarousel.translatesAutoresizingMaskIntoConstraints = false
        scalingCarousel.backgroundColor = .clear
        
        scalingCarousel.register(CodeCell.self, forCellWithReuseIdentifier: "cell")
        
        view.addSubview(scalingCarousel)
        
        // Constraints
        scalingCarousel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1).isActive = true
        scalingCarousel.heightAnchor.constraint(equalToConstant: 260).isActive = true
        scalingCarousel.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scalingCarousel.topAnchor.constraint(equalTo: view.topAnchor, constant: 350).isActive = true
    }
}

extension HomeViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 25
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        
        if let scalingCell = cell as? ScalingCarouselCell {
            
            var items = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25"]

            
            
       //     scalingCell.label.text = self.items[indexPath.item]
            scalingCell.mainView.backgroundColor = .lightGray


        }
        DispatchQueue.main.async {
            cell.setNeedsLayout()
            cell.layoutIfNeeded()
        }
        
        return cell
    }
}

extension HomeViewController: UICollectionViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        //scalingCarousel.didScroll()
    }
    
}



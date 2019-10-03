//
//  MockData.swift
//  ACTabScrollView
//
//  Created by Azure Chen on 5/21/16.
//  Copyright © 2016 AzureChen. All rights reserved.
//

import UIKit

class MockData {

    static let newsArray = [
        News(id: 1, category: .WhatsNew, title: "Gr. 1 A Schedule Effective Sept 15 Sept 16' 2019 Published by Hiba H Hijazi Approved by Taghrid Moughnieh"),
        News(id: 2, category: .Calendar, title: "Horaire de classe - EB1 A Sep 16' 2019 Published by Carine Harb Kadri Approved by Taghrid Moughnieh"),
        News(id: 3, category: .Messages, title: "Horaire de classe - EB1 D Sep 16'2019 Published by Carine Harb Kadrin Approved by Taghrid Moughnieh"),
        News(id: 4, category: .Messages, title: "Horaire de classe - EB2 B Sep 16'2019 Published by Carine Harb Kadrin Approved by Taghrid Moughnieh"),
        News(id: 5, category: .WhatsNew, title: "Horaire de classe - EB2 C Sep 16'2019 Published by Carine Harb Kadrin Approved by Taghrid Moughnieh"),
        News(id: 6, category: .Notifications, title: "Horaire de classe - EB2 D Sep 16'2019 Published by Carine Harb Kadrin Approved by Taghrid Moughnieh"),
        News(id: 7, category: .Misc, title: "Horaire de classe - EB1 B Sep 16'2019 Published by Carine Harb Kadrin Approved by Taghrid Moughnieh"),
        News(id: 8, category: .Calendar, title: "Horaire de classe - EB1 C Sep 16'2019 Published by Carine Harb Kadrin Approved by Taghrid Moughnieh"),
        News(id: 9, category: .WhatsNew, title: "Horaire de classe - EB2 A Sep 16'2019 Published by Carine Harb Kadrin Approved by Taghrid Moughnieh"),
        News(id: 10, category: .Calendar, title: "Horaire de classe - EB3 D Sep 16'2019 Published by Carine Harb Kadrin Approved by Taghrid Moughnieh"),
        News(id: 11, category: .Messages, title: "Horaire de classe - EB3 B Sep 16'2019 Published by Carine Harb Kadrin Approved by Taghrid Moughnieh"),
        News(id: 12, category: .Messages, title: "Horaire de classe - EB4 A Sep 16'2019 Published by Carine Harb Kadrin Approved by Taghrid Moughnieh"),
        News(id: 13, category: .Messages, title: "Horaire de classe - EB4 B Sep 16'2019 Published by Carine Harb Kadrin Approved by Taghrid Moughnieh"),
        News(id: 14, category: .WhatsNew, title: "Horaire de classe - EB2 C Sep 16'2019 Published by Carine Harb Kadrin Approved by Taghrid Moughnieh"),
        News(id: 15, category: .Notifications, title: "Horaire de classe - EB4 C Sep 16'2019 Published by Carine Harb Kadrin Approved by Taghrid Moughnieh"),
        News(id: 16, category: .Misc, title: "Horaire de classe - EB5 A Sep 16'2019 Published by Carine Harb Kadrin Approved by Taghrid Moughnieh"),
        News(id: 17, category: .Calendar, title: "Horaire de classe - EB5 B Sep 16'2019 Published by Carine Harb Kadrin Approved by Taghrid Moughnieh"),
        News(id: 18, category: .WhatsNew, title: "Horaire de classe - EB6 A Sep 16'2019 Published by Carine Harb Kadrin Approved by Taghrid Moughnieh"),
        News(id: 19, category: .Calendar, title: "Horaire de classe - EB6 B Sep 16'2019 Published by Carine Harb Kadrin Approved by Taghrid Moughnieh"),
        News(id: 20, category: .Messages, title: "Horaire de classe - EB3 B Sep 16'2019 Published by Carine Harb Kadrin Approved by Taghrid Moughnieh"),
        News(id: 21, category: .Notifications, title: "Horaire de classe - EB3 C Sep 16'2019 Published by Carine Harb Kadrin Approved by Taghrid Moughnieh"),
    ]
    
}

enum NewsCategory {
    case WhatsNew
    case Calendar
    case Messages
    case all
    case Notifications
    case Misc
    
    static func allValues() -> [NewsCategory] {
        return [.WhatsNew, .Calendar, .Messages, .all, .Notifications, Misc]
    }
}

struct News {
    let id: Int
    let category: NewsCategory
    let title: String
}

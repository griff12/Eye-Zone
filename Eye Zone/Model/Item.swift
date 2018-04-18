//
//  Item.swift
//  Eye Zone
//
//  Created by Griffin Christenson on 4/17/18.
//  Copyright © 2018 Eye Zone. All rights reserved.
//

import Foundation
import RealmSwift

class Item: Object {
    
    @objc dynamic var title: String = ""
    @ objc dynamic var done: Bool = false
}

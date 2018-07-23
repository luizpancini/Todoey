//
//  Items.swift
//  Todoey
//
//  Created by Luiz Santos on 7/23/18.
//  Copyright © 2018 Luiz Santos. All rights reserved.
//

import Foundation
import RealmSwift

class Items: Object {
    @objc dynamic var title: String = ""
    @objc dynamic var done: Bool = false
    @objc dynamic var dateCreated: Date?
    var parentCategory = LinkingObjects(fromType: Category.self, property: "items")
}

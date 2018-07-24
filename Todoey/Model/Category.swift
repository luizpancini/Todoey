//
//  Category.swift
//  Todoey
//
//  Created by Luiz Santos on 7/23/18.
//  Copyright © 2018 Luiz Santos. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object {
    @objc dynamic var name: String = ""
    @objc dynamic var color: String = "2ecc71"
    let items = List<Items>()
}

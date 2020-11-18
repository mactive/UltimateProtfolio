//
//  Item-CoreDataHelpers.swift
//  UltimateProtfolio
//
//  Created by Qian Meng on 2020/10/27.
//

import Foundation

extension Item {
    var itemTitle: String {
        title ?? "New Item"
    }
    
    var itemDetail: String {
        detail ?? ""
    }
    
    var itemCreationDate: Date {
        createionDate ?? Date()
    }
    
    static var example: Item {
        let controller = DataController(inMemory: true)
        let viewContext = controller.container.viewContext
        let item = Item(context: viewContext)
        item.title = "Example Item"
        item.detail = "This is a example item"
        item.priority = 3
        item.createionDate = Date()
        return item
    }
}

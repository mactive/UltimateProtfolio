//
//  UltimateProtfolioApp.swift
//  UltimateProtfolio
//
//  Created by Qian Meng on 2020/10/26.
//

import SwiftUI

@main
struct UltimateProtfolioApp: App {
    
    @StateObject var dataController: DataController
    
    init() {
        let dataController = DataController()
        _dataController = StateObject(wrappedValue: dataController)
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
                .environmentObject(dataController)
        }
    }
}

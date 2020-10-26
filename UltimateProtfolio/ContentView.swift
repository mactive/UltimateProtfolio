//
//  ContentView.swift
//  UltimateProtfolio
//
//  Created by Qian Meng on 2020/10/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            ProjectView(showClosedProject: false)
                .tabItem {
                    Image(systemName: "list.bullet")
                    Text("Open")
                }
            ProjectView(showClosedProject: true)
                .tabItem {
                    Image(systemName: "checkmark")
                    Text("Closed")
                }

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var dataController = DataController.preview

    static var previews: some View {
        ContentView()
            .environment(\.managedObjectContext, dataController.container.viewContext)
            .environmentObject(dataController)
    }
}

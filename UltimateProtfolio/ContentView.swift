//
//  ContentView.swift
//  UltimateProtfolio
//
//  Created by Qian Meng on 2020/10/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ProjectView(showClosedProject: false)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

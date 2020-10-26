//
//  ProjectView.swift
//  UltimateProtfolio
//
//  Created by Qian Meng on 2020/10/26.
//

import SwiftUI

struct ProjectView: View {
    let showClosedProject: Bool
    let projects: FetchRequest<Project>
    
    init(showClosedProject: Bool = false) {
        self.showClosedProject = showClosedProject
        self.projects = FetchRequest<Project>(
            entity: Project.entity(),
            sortDescriptors: [NSSortDescriptor(keyPath: \Project.creationDate, ascending: false)],
            predicate: NSPredicate(format: "closed = %d", showClosedProject))
    }
    
    var body: some View {
        NavigationView{
            List{
                ForEach(projects.wrappedValue) { project in
                    Section(header: Text(project.title ?? "")) {
                        ForEach(project.items?.allObjects as? [Item] ?? []) {
                            item in
                            Text(item.title ?? "")
                        }
                    }
                }
            }
            .listStyle(InsetGroupedListStyle())
            .navigationTitle(showClosedProject ? "Closed Projects" : "Open Projects")
        }
    }
}

struct ProjectView_Previews: PreviewProvider {
    static var dataController = DataController.preview
    static var previews: some View {
        ProjectView(showClosedProject: false)
            .environment(\.managedObjectContext, dataController.container.viewContext)
            .environmentObject(dataController)
    }
}

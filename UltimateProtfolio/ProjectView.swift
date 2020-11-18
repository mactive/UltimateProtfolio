//
//  ProjectView.swift
//  UltimateProtfolio
//
//  Created by Qian Meng on 2020/10/26.
//

import SwiftUI

struct ProjectView: View {
    static let openedTag: String? = "opened"
    static let closedTag: String? = "closed"
    
    let showClosedProject: Bool
    let projects: FetchRequest<Project>
    let formatter: DateFormatter
    
    init(showClosedProject: Bool = false) {
        self.showClosedProject = showClosedProject
        self.projects = FetchRequest<Project>(
            entity: Project.entity(),
            sortDescriptors: [NSSortDescriptor(keyPath: \Project.creationDate, ascending: false)],
            predicate: NSPredicate(format: "closed = %d", showClosedProject))
        self.formatter = DateFormatter()
        self.formatter.dateFormat = "HH:mm:ss"

    }
    
    var body: some View {
        NavigationView{
            List{
                ForEach(projects.wrappedValue) { project in
                    


                    Section(
                        header: Text("\(project.projectTitle) - \(self.formatter.string(from: project.projectCreationDate))")) {
                        ForEach(project.projectItems) {
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

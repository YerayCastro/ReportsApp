//
//  ContentView.swift
//  ReportesApp
//
//  Created by Yery Castro on 13/3/23.
//

import SwiftUI
import CoreData


struct ContentView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(entity: Autos.entity(), sortDescriptors: []) var result: FetchedResults<Autos>
    
    @StateObject var imp = ImportarCSV()
    @StateObject var export = ExportarCSV()
    @StateObject var html = ExportarHTML()
    @StateObject var pdf = ExportarPDF()
    
    var body: some View {
        VStack{
            Button {
                imp.importData(context: viewContext)
            } label: {
                Text("Importar datos")
            }
            
            ShareLink("Exportar CSV", item: export.exportarCSV(context: viewContext)!)
            ShareLink("Exportar HTML", item: html.exportHTML(context: viewContext)!)
            ShareLink("Exportar PDF", item: pdf.render(context: viewContext))
            
            /*List{
                ForEach(result) { item in
                    HStack{
                        Text(item.marca ?? "")
                        Text(item.modelo ?? "")
                    }
                }
            }*/

        }
    }
}

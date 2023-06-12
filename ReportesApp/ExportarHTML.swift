//
//  ExportarHTML.swift
//  ReportesApp
//
//  Created by Yery Castro on 13/3/23.
//

import Foundation
import CoreData

class ExportarHTML : ObservableObject {
    
    func exportHTML(context: NSManagedObjectContext) -> URL? {
        let fetchRequest: NSFetchRequest<Autos> = Autos.fetchRequest()
        var html = "<html><body>"
        
        do{
            let data = try context.fetch(fetchRequest)
            
            for item in data {
                html += "<p>\(item.marca ?? ""): \(item.modelo ?? "")</p>"
            }
            html += "</body></html>"
        }catch{
            print("Error al crear html")
            return nil
        }
        
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let fileUrl = dir.appendingPathComponent("file.html")
            do{
                try html.write(to: fileUrl, atomically: true, encoding: .utf8)
                return fileUrl
            }catch{
                print("error en html")
            }
        }
        return nil
    }
    
}

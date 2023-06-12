//
//  ExportarCSV.swift
//  ReportesApp
//
//  Created by Yery Castro on 13/3/23.
//

import Foundation
import CoreData

class ExportarCSV: ObservableObject {
    
    
    func exportarCSV(context: NSManagedObjectContext) -> URL? {
        let fileName = "data.csv"
        let path = URL(filePath: NSTemporaryDirectory()).appendingPathComponent(fileName)
        
        let fetchRequest: NSFetchRequest<Autos> = Autos.fetchRequest()
        let data = try! context.fetch(fetchRequest)
        
        var csvText = "id,marca,modelo,color\n"
        
        for item in data{
            let newLine = "\(item.id ?? ""),\(item.marca ?? ""),\(item.modelo ?? ""),\(item.color ?? "")\n"
            csvText.append(newLine)
        }
        
        do{
            try csvText.write(to: path, atomically: true, encoding: .utf8)
            return path
        }catch{
            print("Error al crear csv")
            return nil
        }
    }
    
}

//
//  ImportarCSV.swift
//  ReportesApp
//
//  Created by Yery Castro on 13/3/23.
//

import Foundation
import CoreData

class ImportarCSV: ObservableObject {
    
    func importData(context: NSManagedObjectContext){
        let fileUrl = Bundle.main.url(forResource: "MOCK_DATA", withExtension: "csv")!
        let data = try! String(contentsOf: fileUrl, encoding: .utf8)
        let rows = data.components(separatedBy: .newlines)
        for row in rows {
            let columns = row.components(separatedBy: ",")
            if columns.count >= 4{
                let newAuto = Autos(context: context)
                newAuto.setValue(columns[0], forKey: "id")
                newAuto.setValue(columns[1], forKey: "marca")
                newAuto.setValue(columns[2], forKey: "modelo")
                newAuto.setValue(columns[3], forKey: "color")
            }
        }
        try! context.save()
        print("Guardó")
    }
}

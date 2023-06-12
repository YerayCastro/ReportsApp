//
//  ExportarPDF.swift
//  ReportesApp
//
//  Created by Yery Castro on 13/3/23.
//

import Foundation
import CoreData
import PDFKit
import SwiftUI

@MainActor

class ExportarPDF: ObservableObject {
    
    func render(context: NSManagedObjectContext) -> URL {
        let fetchRequest: NSFetchRequest<Autos> = Autos.fetchRequest()
        let data = try! context.fetch(fetchRequest)
        
        let renderer = ImageRenderer(content:
        VStack{
            Text("Autos")
            ForEach(data){ item in
                HStack{
                    Text(item.modelo ?? "")
                    Text(item.color ?? "")
                }
            }
        }
                                     
        )
        let url = URL.documentsDirectory.appending(path: "reporte.pdf")
        
        renderer.render{ size, context in
            var box = CGRect(x: 0, y: 0, width: size.width, height: size.height)
            
            guard let pdf = CGContext(url as CFURL, mediaBox: &box, nil) else { return }
            pdf.beginPDFPage(nil)
            context(pdf)
            
            pdf.endPDFPage()
            pdf.closePDF()
        }
        return url
    }
    
    
}

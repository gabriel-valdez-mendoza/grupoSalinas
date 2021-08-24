//
//   NSAttributedString+stringFromHtml.swift
//  BancaDigital
//
//  Created by Jorge Parra on 22/08/21.
//

import Foundation
extension NSAttributedString{
    func stringFromHtml(string: String) -> NSAttributedString? {
    do {
        let utf8 = string.data(using: String.Encoding.utf8, allowLossyConversion: true)
        if let data = utf8 {
            let hmlString = try NSAttributedString(data: data,
                                             options: [NSAttributedString.DocumentReadingOptionKey.documentType : NSAttributedString.DocumentType.html],
                                             documentAttributes: nil)
            return hmlString
        }
    } catch {
    }
    return nil
    }
}

//
//  ImageView+imageFromUrl.swift
//  BancaDigital
//
//  Created by Jorge Parra on 22/08/21.
//

import UIKit
extension UIImageView {
    func imageFromUrl(url : URL) throws {
        do{
            let imageData: Data = try Data(contentsOf: url)
            image = UIImage(data: imageData)
        }catch{
            print("error")
        }
    }
}

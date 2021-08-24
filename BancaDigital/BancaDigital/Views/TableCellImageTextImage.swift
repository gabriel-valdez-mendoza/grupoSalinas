//
//  TableCellImageTextImage.swift
//  BancaDigital
//
//  Created by Jorge Parra on 20/08/21.
//

import UIKit

class TableCellImageTextImage: UITableViewCell {

    @IBOutlet var imageIcon: UIImageView!
   
    @IBOutlet var imageRightSide: UIImageView!
    @IBOutlet var label: UILabel!
    
    
    static let identifier = "TableCellImageTextImage"
       
    static func nib() -> UINib{
           return UINib(nibName: "TableCellImageTextImage", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
}



extension TableCellImageTextImage {
    func setupCell(with data : ImageTextAndImageModel){
        
        do{
            guard let url = URL(string: data.urlStringLeftImage)  else {return}
            try imageView?.imageFromUrl(url: url)
        }catch{
            print("error")
        }
        
        label.text = data.text
        
    }
}




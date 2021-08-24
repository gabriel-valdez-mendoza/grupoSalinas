//
//  ViewController.swift
//  BancaDigital
//
//  Created by Jorge Parra on 19/08/21.
//

import UIKit

class ViewController: UITabBarController  {

    override func viewDidLoad() {
        super.viewDidLoad()
        setTabs()
        
        // Do any additional setup after loading the view.
        
    }

    private func setTabs(){
     self.viewControllers?.removeAll()
        self.viewControllers = [FactoryBuilder.createTableviewModule(tuppleData: (title: "Shows", typeOfCall: 0) ),FactoryBuilder.createTableviewModule(tuppleData: (title: "Favorites", typeOfCall: 1))]
    }
}


extension UIViewController {
    
    func errorNetwork() {
        // Declare Alert message
        DispatchQueue.main.async {
        let dialogMessage = UIAlertController(title: "Oops, algo salió mal!" , message: "Ocurrió un error al consultar el servicio. ¿Quieres intentar nuevamente?", preferredStyle: .alert)
       
        // Create OK button with action handler
        let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
            print("Ok button tapped")
        })
        
        // Create Cancel button with action handlder
        let cancel = UIAlertAction(title: "Cancelar", style: .cancel) { (action) -> Void in
            print("Cancel button tapped")
        }
        
        //Add OK and Cancel button to dialog message
        dialogMessage.addAction(ok)
        dialogMessage.addAction(cancel)
        dialogMessage.updateViewConstraints()
        // Present dialog message to user
        self.showDetailViewController(dialogMessage, sender: self)
        }
    }
    
    
    func deleteShow(callback: @escaping (Bool) -> Void ) {
        // Declare Alert message
        DispatchQueue.main.async {
        let dialogMessage = UIAlertController(title: "Borrar de favoritos!" , message: " Presiona ok para confirmar o cancelar la eliminación del catálogo de favoritos?", preferredStyle: .alert)
       
        // Create OK button with action handler
        let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
            callback(true)
        })
        
        // Create Cancel button with action handlder
        let cancel = UIAlertAction(title: "Cancelar", style: .cancel) { (action) -> Void in
            callback(false)
        }
        
        //Add OK and Cancel button to dialog message
        dialogMessage.addAction(ok)
        dialogMessage.addAction(cancel)
        dialogMessage.updateViewConstraints()
        // Present dialog message to user
        self.showDetailViewController(dialogMessage, sender: self)
        }
    }
    
    
}

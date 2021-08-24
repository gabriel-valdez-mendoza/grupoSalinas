//
//  TableFactory.swift
//  BancaDigital
//
//  Created by Jorge Parra on 21/08/21.
//

import Foundation
import UIKit
class FactoryBuilder {
    
    static func createTableviewModule(tuppleData:(title:String, typeOfCall: Int)) -> UIViewController {
        
       

            let navController = Tablestoryboard.instantiateViewController(withIdentifier: "navTableID")
            
        
            if let view = navController.children.first as? TableViewProtocol {
                
            let interactor : TableInteractorInputProtocol     =  TableInteractor()
            let router : TableWireframeProtocol =  TableWireframe()
           
            let presenter: TablePresenterProtocol & TableInteractorOutputProtocol = TablePresenter()

        
                
                router.viewController = navController
                view.tabTitle = tuppleData
                view.presenter = presenter
                presenter.view = view
                presenter.wireFrame = router
                presenter.interactor = interactor
                interactor.presenter = presenter
             
                navController.title = tuppleData.title
                
                return navController

    }
                return UIViewController()

        }


       static var Tablestoryboard: UIStoryboard {
            return UIStoryboard(name: "Table", bundle: Bundle.main)
        }
}







//
//  DetailFactory.swift
//  BancaDigital
//
//  Created by Jorge Parra on 22/08/21.
//

import UIKit
class DetailFactory {
    
    //If you dont want to pass data from a VIPER-X Module to another remove tha param data_to_pass from the function
    static func createModuleDetailFactory(with data_to_pass: FavoriteShows) -> UIViewController {
        let navController = Detailstoryboard.instantiateViewController(withIdentifier: "nav_detail")
        if let view = navController.children.first as? DetailViewProtocol {

        let interactor : DetailInteractorInputProtocol  =  DetailInteractor()
        let router : DetailWireframeProtocol =  DetailWireframe()

        let presenter: DetailPresenterProtocol & DetailInteractorOutputProtocol = DetailPresenter()
            
            view.favoriteShow = data_to_pass
            view.presenter = presenter
            presenter.view = view
            presenter.wireFrame = router
            presenter.interactor = interactor
            interactor.presenter = presenter
            
             return navController
            
        }
            return UIViewController()
    }


   static var Detailstoryboard: UIStoryboard {
        return UIStoryboard(name: "Detail", bundle: Bundle.main)
    }
}







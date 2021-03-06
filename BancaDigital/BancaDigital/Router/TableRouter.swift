//
//  TableRouter.swift
//  BancaDigital
//
//  Created Jorge Parra on 21/08/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  Template generated by Carlos Torres
//

import UIKit

class TableWireframe: TableWireframeProtocol {
    

    weak var viewController: UIViewController?

    func callDetail(with show: FavoriteShows) {
        guard let vc =  viewController else {fatalError()}
        vc.showDetailViewController(DetailFactory.createModuleDetailFactory(with: show), sender: vc)
   
    }

}

//
//  FavoriteShows+CoreDataProperties.swift
//  BancaDigital
//
//  Created by Jorge Parra on 22/08/21.
//


import CoreData
import Foundation
extension FavoriteShows : Identifiable {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FavoriteShows> {
        return NSFetchRequest<FavoriteShows>(entityName: "FavoriteShows")
    }
    @NSManaged public var id: Int64
    @NSManaged public var externals: String?
    @NSManaged public var summary: String?
    @NSManaged public var image: String?
    @NSManaged public var name: String?

}

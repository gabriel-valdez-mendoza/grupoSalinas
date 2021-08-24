//
//  CoreDataManager.swift
//  BancaDigital
//
//  Created by Jorge Parra on 22/08/21.
//
import UIKit
import CoreData


protocol CoreDataCrudPrototol {
    func saveFavoriteShows(show: APIShowsResponseElement)
    func fetchFavoriteShows() throws -> [FavoriteShows]
    func deleteFavoriteShows(objectToRemove: FavoriteShows) -> Bool

}

class CoreDataManager : CoreDataCrudPrototol{

  
    
    static let shared = CoreDataManager()
    let favoriteShowsObject = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    func saveFavoriteShows(show: APIShowsResponseElement) {
     //   DispatchQueue.main.async(execute: { [weak self] in
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "FavoriteShows", in: managedContext)!
        
        let favoriteShowsObject = NSManagedObject(entity: entity, insertInto: managedContext)
        
        favoriteShowsObject.setValue(show.id, forKeyPath: "id")
        favoriteShowsObject.setValue(show.externals.imdb, forKey: "externals")
        favoriteShowsObject.setValue(show.image.medium, forKey: "image"  )
        favoriteShowsObject.setValue(show.name, forKey: "name" )
        favoriteShowsObject.setValue(show.summary, forKey: "summary" )
            
            do{
                try managedContext.save()
            }catch let error as NSError{
                print("Could not save. \(error.userInfo)")
            }
     //   })
        
    
    }
    
    func fetchFavoriteShows()throws -> [FavoriteShows]  {
        let request = NSFetchRequest<FavoriteShows>(entityName: "FavoriteShows")
        request.returnsObjectsAsFaults = false
        return  try favoriteShowsObject.fetch(request)
    }
    @discardableResult
    func deleteFavoriteShows(objectToRemove: FavoriteShows) -> Bool {
      
        self.favoriteShowsObject.delete(objectToRemove)
        do{
            try self.favoriteShowsObject.save()
        }catch let error {
            print("error \(error.localizedDescription)")
            return false
        }
        return true
    }
    
    
    
    
    
    
    func deleteFavoriteShows(withId id: Int) {
        // fetchRequest for FavoriteShows
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "FavoriteShows")
        
        // by id which is the forKeyPath
        fetchRequest.predicate = NSPredicate(format: "id == %@", "\(id)")
        
        // deleteRequest
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        do {
            try favoriteShowsObject.execute(deleteRequest)
        } catch let error as NSError {
            print("Could not delete. \(error), \(error.userInfo)")
        }
        // saves
        do {
            try favoriteShowsObject.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
        
    }
    
    
    
    
    
    
}

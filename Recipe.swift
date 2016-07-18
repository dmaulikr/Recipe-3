//
//  Recipe.swift
//  Recipez
//
//  Created by Tobias Gozzi on 06.07.16.
//  Copyright © 2016 Tobias Gozzi. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class Recipe: NSManagedObject {

    func setRecipieImg(image: UIImage) {
        let data = UIImagePNGRepresentation(image)
        self.image = data
    }
    
    func getRecipeImg() -> UIImage {
        let image = UIImage(data: self.image!)!
        return image
    }
    
}

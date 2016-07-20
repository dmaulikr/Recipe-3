//
//  CreateRecipeVC.swift
//  Recipez
//
//  Created by Tobias Gozzi on 18.07.16.
//  Copyright © 2016 Tobias Gozzi. All rights reserved.
//

import UIKit
import CoreData

class CreateRecipeVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var recipeTitle: UITextField!
    @IBOutlet weak var recipeIngredients: UITextField!
    @IBOutlet weak var recipeSteps: UITextField!
    @IBOutlet weak var recipeImg: UIImageView!
    @IBOutlet weak var addRecipeBtn: UIButton!

    var imgPicker: UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imgPicker = UIImagePickerController()
        imgPicker.delegate = self
        recipeImg.layer.cornerRadius = 4.0
        recipeImg.clipsToBounds = true
    }
    
    
    @IBAction func addImage(sender: AnyObject!) {
        presentViewController(imgPicker, animated: true, completion: nil)
    }
    
    @IBAction func createRecipe(sender: AnyObject!) {
        if let title = recipeTitle.text where title != "" {
            
            let app = UIApplication.sharedApplication().delegate as! AppDelegate
            let context = app.managedObjectContext
            let entity = NSEntityDescription.entityForName("Recipe", inManagedObjectContext: context)!
            let recipe = Recipe(entity: entity, insertIntoManagedObjectContext: context)
            
            recipe.title = title
            recipe.ingredients = recipeIngredients.text
            recipe.steps = recipeSteps.text
            recipe.setRecipieImg(recipeImg.image!)
            
            context.insertObject(recipe)
            
            do {
               try context.save()
            } catch {
                print("ManagedObjects Error")
            }
            
        }
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        
        imgPicker.dismissViewControllerAnimated(true, completion: nil)
        recipeImg.image = image
    }

}
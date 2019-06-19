//
//  detailViewController.swift
//  ToDoList
//
//  Created by Aidan on 6/11/19.
//  Copyright © 2019 Aidan Lilani. All rights reserved.
//

import UIKit

class detailViewController: UIViewController {

    
    
    @IBOutlet weak var toDoField: UITextField!
   
    
    
    @IBOutlet weak var saveBarButton: UIBarButtonItem!
    
    
    
    
    @IBOutlet weak var toDoNoteView: UITextView!
     var toDoItem: String?
    var toDoNoteItem: String?
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let toDoItem = toDoItem {
            toDoField.text = toDoItem
            self.navigationItem.title = "Edit to do item"
        } else {
            self.navigationItem.title = "New to do item"
        }
        if let toDoNoteItem = toDoNoteItem {
            toDoNoteView.text = toDoNoteItem
        }
            enabledDIsableSaveButton()
            toDoField.becomeFirstResponder()
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "UnwindFromSave" {
            toDoItem = toDoField.text
            toDoNoteItem = toDoNoteView.text
        }
    }
    
    
    @IBAction func toDoFieldChanged(_ sender: UITextField) {
       enabledDIsableSaveButton()
    }
    
    
    func enabledDIsableSaveButton() {
        if let toDoLength = toDoField.text?.count {
            saveBarButton.isEnabled = true
        } else {
            saveBarButton.isEnabled = false
        }
    }
    
    @IBAction func cancelPressed(_ sender: UIBarButtonItem) {
        let isPresentingInAddMode = presentingViewController is UINavigationController
        if isPresentingInAddMode {
            dismiss(animated: true, completion: nil)
        } else {
            navigationController?.popViewController(animated: true)
        }
        
        
        
    }
    
    
    
    
    
    
    
}

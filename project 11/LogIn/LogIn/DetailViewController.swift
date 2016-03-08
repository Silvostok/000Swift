//
//  DetailViewController.swift
//  LogIn
//
//  Created by Miguel Angel Rubio Caballero on 07/03/16.
//  Copyright © 2016 MiguelRubio. All rights reserved.
//

import UIKit
import CoreData

class DetailViewController: UIViewController, UITextViewDelegate {
  
  let ManagedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
  
  @IBOutlet weak var textView: UITextView!
  
  var note: Note? = nil
  
  var detailItem: AnyObject? {
    didSet {
      self.configureView()
    }
  }
  
  func configureView() {
    
    if let detail: Note = self.detailItem as? Note {
      if let detailTextView = self.textView {
        detailTextView.text = detail.noteText
      }
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.configureView()
    
  }
  
  func textViewDidEndEditing( textView: UITextView) {
    
    if let detail: Note = self.detailItem as? Note {
      if let detailTextView = self.textView {
        detail.noteText = detailTextView.text
      }
    }
    do {
      try ManagedObjectContext!.save()
    } catch {
      print("nothing saved.")
    }
    
  }
  
  
  
}

//
//  ViewController.swift
//  TableDeleteRow
//
//  Created by Miguel Angel Rubio Caballero on 18/02/16.
//  Copyright © 2016 MiguelRubio. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
  
  @IBOutlet weak var tableView: UITableView!
  var icons: [Icon]
  
  
  
  required init?(coder aDecoder: NSCoder) {
    icons = [Icon]()
    
    let row1Icon = Icon(title: "CD", subtitle: "For my CD collection", imageName: "icons_01")
    icons.append(row1Icon)
    let row2Icon = Icon(title: "Headphone", subtitle: "To listen my music", imageName: "icons_02")
    icons.append(row2Icon)
    let row3Icon = Icon(title: "Microphone", subtitle: "To sing karaoke!", imageName: "icons_03")
    icons.append(row3Icon)
    let row4Icon = Icon(title: "PlugIn", subtitle: "I have a lot at home", imageName: "icons_04")
    icons.append(row4Icon)
    let row5Icon = Icon(title: "Earplugs", subtitle: "Listen in silent", imageName: "icons_05")
    icons.append(row5Icon)
    let row6Icon = Icon(title: "Music", subtitle: "I can't without", imageName: "icons_06")
    icons.append(row6Icon)
    let row7Icon = Icon(title: "Tape", subtitle: "Recording dreaming", imageName: "icons_07")
    icons.append(row7Icon)
    let row8Icon = Icon(title: "Synthesizer", subtitle: "To play all the day", imageName: "icons_08")
    icons.append(row8Icon)
    let row9Icon = Icon(title: "iPod", subtitle: "Many kind of formats", imageName: "icons_09")
    icons.append(row9Icon)
    let row10Icon = Icon(title: "Box", subtitle: "I have two in my house", imageName: "icons_10")
    icons.append(row10Icon)
    let row11Icon = Icon(title: "Guitar", subtitle: "For playing all the evening", imageName: "icons_11")
    icons.append(row11Icon)
    let row12Icon = Icon(title: "Volume", subtitle: "Put it louder", imageName: "icons_12")
    icons.append(row12Icon)
    
    
    super.init(coder: aDecoder)
  }
  
  

  override func viewDidLoad() {
    super.viewDidLoad()
    
    navigationItem.rightBarButtonItem = editButtonItem()
    
    automaticallyAdjustsScrollViewInsets = false
    
  }


}


extension ViewController: UITableViewDataSource, UITableViewDelegate {
  
  
  
  override func setEditing(editing: Bool, animated: Bool) {
    
    super.setEditing(editing, animated: animated)
    if editing {
      tableView.setEditing(true, animated: true)
    } else {
      tableView.setEditing(false, animated: true)
    }
    
  }
  
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return icons.count
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("IconCell", forIndexPath: indexPath)
  
    let icon = icons[indexPath.row]
    
    cell.textLabel?.text = icon.title
    cell.detailTextLabel?.text = icon.subtitle
    
    if let imageView = cell.imageView, iconImage = icon.image {
      imageView.image = iconImage
    }
    
  
  
  return cell
}
  
  
  
  
  
  func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
    
    if editingStyle == .Delete {
      
    icons.removeAtIndex(indexPath.row)
     //tableView.reloadData()
      tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
    }
    
    
  }
  
  
  
  
  
  
  
  

}
//
//  SearchViewController.swift
//  NSURLSession
//
//  Created by Miguel Angel Rubio Caballero on 23/02/16.
//  Copyright © 2016 MiguelRubio. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
  
  @IBOutlet weak var tableView: UITableView!
  @IBOutlet weak var searchBar: UISearchBar!
  
  var searchResults = [Track]()
  
  let defaultSession = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration())
  var dataTask: NSURLSessionDataTask?
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.tableFooterView = UIView()
  }
  
  
  
  // MARK: Handling Search Results
  
  // This helper method helps parse response JSON NSData into an array of Track objects.
  func updateSearchResults(data: NSData?) {
    searchResults.removeAll()
    do {
      if let data = data, response = try NSJSONSerialization.JSONObjectWithData(data, options:NSJSONReadingOptions(rawValue:0)) as? [String: AnyObject] {
        
        // Get the results array
        if let array: AnyObject = response["results"] {
          for trackDictonary in array as! [AnyObject] {
            if let trackDictonary = trackDictonary as? [String: AnyObject], previewUrl = trackDictonary["previewUrl"] as? String {
              // Parse the search result
              let name = trackDictonary["trackName"] as? String
              let artist = trackDictonary["artistName"] as? String
              searchResults.append(Track(name: name, artist: artist, previewUrl: previewUrl))
              //print("\(array)")
            } else {
              print("Not a dictionary")
            }
          }
        } else {
          print("Results key not found in dictionary")
        }
      } else {
        print("JSON Error")
      }
    } catch let error as NSError {
      print("Error parsing results: \(error.localizedDescription)")
    }
    
    dispatch_async(dispatch_get_main_queue()) {
      self.tableView.reloadData()
      self.tableView.setContentOffset(CGPointZero, animated: false)
    }
  }
  
  
  // MARK: Keyboard dismissal
  
  func dismissKeyboard() {
    searchBar.resignFirstResponder()
  }
}




extension SearchViewController: UITableViewDataSource {
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return searchResults.count
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("TrackCell", forIndexPath: indexPath) as! TrackCell
    
    let track = searchResults[indexPath.row]
    
    //    cell.textLabel?.text = track.name
    //    cell.detailTextLabel?.text = track.artist
    
    cell.titleLabel.text = track.name
    cell.artistLabel.text = track.artist
    
    return cell
  }
  
}


extension SearchViewController: UITableViewDelegate {
  
  func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
    return 62.0
  }
  
}


extension SearchViewController: UISearchBarDelegate {
  
  func searchBarSearchButtonClicked(searchBar: UISearchBar) {
    dismissKeyboard()
    if !searchBar.text!.isEmpty {
      if dataTask != nil {
        dataTask?.cancel()
      }
      UIApplication.sharedApplication().networkActivityIndicatorVisible = true
      let expectedCharSet = NSCharacterSet.URLQueryAllowedCharacterSet()
      let searchTerm = searchBar.text!.stringByAddingPercentEncodingWithAllowedCharacters(expectedCharSet)!
      let url = NSURL(string: "https://itunes.apple.com/search?media=music&entity=song&term=\(searchTerm)")
      dataTask = defaultSession.dataTaskWithURL(url!) {
        data, response, error in
        dispatch_async(dispatch_get_main_queue()) {
          UIApplication.sharedApplication().networkActivityIndicatorVisible = false
        }
        if let error = error {
          print(error.localizedDescription)
        } else if let httpResponse = response as? NSHTTPURLResponse {
          if httpResponse.statusCode == 200 {
            self.updateSearchResults(data)
          }
        }
      }
      dataTask?.resume()
    }
  }
  
  
  func positionForBar(bar: UIBarPositioning) -> UIBarPosition {
    return .TopAttached
  }
  
}


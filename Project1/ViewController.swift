//
//  ViewController.swift
//  Project1
//
//  Created by bharat venna on 30/10/23.
//

import UIKit

class ViewController: UITableViewController {
    
    var pictures = [String]()
    var sortedArray = [String]()
     
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Super View"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasPrefix("nssl") {
                pictures.append(item)
            }
        }
        
        sortedArray = pictures.sorted()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = sortedArray[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            vc.selectedImage = sortedArray[indexPath.row]
            vc.totalPictures = sortedArray.count
            vc.currentPicture = indexPath.item + 1
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}


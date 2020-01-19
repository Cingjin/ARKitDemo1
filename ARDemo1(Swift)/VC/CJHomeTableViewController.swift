//
//  CJHomeTableViewController.swift
//  ARDemo1(Swift)
//
//  Created by Anmo on 2020/1/17.
//  Copyright © 2020 com.Cingjin. All rights reserved.
//

import UIKit

class CJHomeTableViewController: UITableViewController {
    
    // MARK: - Getter&&Setter
    var titleArr:[String] = ["平面检测","人脸检测","物体识别"]
    
    
    
    // MARK: - liftCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.cj_baseSet()
  
    }
    

    // MARK: - baseSet
    
    func cj_baseSet() {
        
        self.title = "ARKitDemo1"
        self.tableView .register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return self.titleArr.count
        
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        if cell == nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        }
        cell.textLabel?.text = self.titleArr[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.cj_vcPresent(tag: indexPath.row)
        tableView.reloadData()
        
    }
    
    // MARK: - Private
    func cj_vcPresent(tag:Int) {
        
          switch tag {
            
          case 0:
            self.navigationController?.pushViewController(CJWorldTrackingViewController(), animated: false)
            break
          
          case 1:
            self.navigationController?.pushViewController(CJFaceTrackingViewController(), animated: false)
            break
            
          case 2:
            self.navigationController?.pushViewController(CJImageRecognizeViewController(), animated: false)
            break
        
          default:
            break
        }
    }
}

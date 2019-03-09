//
//  ListViewController.swift
//  CustomAlert_ios
//
//  Created by 박정훈 on 09/03/2019.
//  Copyright © 2019 swift. All rights reserved.
//

import Foundation
import UIKit

class ListViewController : UITableViewController{
    
    var delegate: MapAlertViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.preferredContentSize.height = 220
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel!.text = "\(indexPath.row) 번째 옵션"
        cell.textLabel!.font = UIFont.systemFont(ofSize: 13)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.delegate?.didSelectRowAt(indexPath: indexPath)
    }
}

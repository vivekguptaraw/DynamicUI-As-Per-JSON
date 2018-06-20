//
//  NCCachingTableViewController.swift
//  DynamicUIDemo
//
//  Created by Vivek Gupta on 19/06/18.
//  Copyright © 2018 Vivek Gupta. All rights reserved.
//

import UIKit

class NCCachingTableViewController: UIViewController {
    var tableView: UITableView!
    let array = arrayImages
    let identifier = "NCCachingTableViewCell"
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView = UITableView()
        var frm = self.view.frame
        frm.origin = CGPoint(x: 0, y: 0)
        frm.size = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - self.navigationController!.navigationBar.frame.height - 20)
        tableView.frame = frm
        self.view.addSubview(tableView)
        //tableView.estimatedRowHeight = 999
        tableView.rowHeight = 200
        tableView.register(UINib(nibName: identifier, bundle: nil), forCellReuseIdentifier: identifier)
        tableView.dataSource = self
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension NCCachingTableViewController: UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! NCCachingTableViewCell
        cell.updateData(localUrl: array[indexPath.row], shouldReload: false)
        return cell
    }
}



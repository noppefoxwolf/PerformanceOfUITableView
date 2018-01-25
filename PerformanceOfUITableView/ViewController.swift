//
//  ViewController.swift
//  PerformanceOfUITableView
//
//  Created by Tomoya Hirano on 2018/01/26.
//  Copyright © 2018年 Tomoya Hirano. All rights reserved.
//

import UIKit

final class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  @IBOutlet weak var tableView: UITableView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.delegate = self
    tableView.dataSource = self
    tableView.register(MoltedTableViewCell.self, forCellReuseIdentifier: "cell")
    // 効：removeFromSuperViewすることでvisibleCells分のviewが減らせる
    tableView.separatorStyle = .none
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 1000
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    // 象：selectedになったセルにはlayerが１枚増えている
  }
}


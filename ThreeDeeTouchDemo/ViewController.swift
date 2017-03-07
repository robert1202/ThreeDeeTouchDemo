//
//  ViewController.swift
//  ThreeDeeTouchDemo
//
//  Created by fly on 2017/3/7.
//  Copyright © 2017年 Fly. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UIViewControllerPreviewingDelegate {

    let screenBounds = UIScreen.main.bounds
    let tableview = UITableView.init(frame: CGRect.zero, style: .plain)
    var dataSource = [String]()

    //MARK:- LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        for i in 1...20 {
            dataSource.append(String(i))
        }
        configTableView()
        tableview.reloadData()
        //
        self.registerForPreviewing(with: self, sourceView: self.view)
    }
    
    func configTableView() {
        tableview.rowHeight = 60
        tableview.frame = screenBounds
        tableview.delegate = self
        tableview.dataSource = self
        tableview.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: "CellID")
        view.addSubview(tableview)
    }

    //MARK:- UITableViewDelegate,UITableViewDataSource
    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "CellID", for: indexPath)
        cell.textLabel?.text = dataSource[indexPath.row]
        return cell
    }
    
    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableview.deselectRow(at: indexPath, animated: true)
        
    }

    //MARK:- UIViewControllerPreviewingDelegate

    @available(iOS 9.0, *)
    public func previewingContext(_ previewingContext: UIViewControllerPreviewing, commit viewControllerToCommit: UIViewController) {
        self.show(viewControllerToCommit, sender: self)
    }
    
    @available(iOS 9.0, *)
    public func previewingContext(_ previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
        let previewVC = ShowPreviewingVC()
        previewVC.view.backgroundColor = UIColor.red
        
        previewVC.preferredContentSize = CGSize.init(width: 320, height: 400)
        previewingContext.sourceRect = getSourceRect(location: location)
        return previewVC
    }
    
    func getSourceRect(location: CGPoint) -> CGRect {
        let indexPath = tableview.indexPathForRow(at: location)
        if indexPath == nil {
            return CGRect.zero
        }
        let cell = tableview.cellForRow(at: indexPath!)
        if cell == nil {
            return CGRect.zero
        }
        let rect =  self.view.convert(cell!.frame, from: self.view)
        return rect
    }
}


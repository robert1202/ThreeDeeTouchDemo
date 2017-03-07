//
//  ShowPreviewingVC.swift
//  ThreeDeeTouchDemo
//
//  Created by fly on 2017/3/7.
//  Copyright © 2017年 Fly. All rights reserved.
//

import UIKit

class ShowPreviewingVC: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension ShowPreviewingVC {
    override var previewActionItems: [UIPreviewActionItem]{
        let deleteAction =  UIPreviewAction(title: "删除",
                                        style: .destructive,
                                            handler: {
                                                (previewAction,viewController) in
                                                NSLog("Delete")
                                                
        })
        
        let doneAction = UIPreviewAction(title: "完成",
                                         style: .default,
                                         handler: {
                                            (previewActin, viewController) in
                                            NSLog("Done")
        })
        
        return [doneAction, deleteAction]
    }
    
}


//
//  ShortcutTouchExtents.swift
//  ThreeDeeTouchDemo
//
//  Created by fly on 2017/3/7.
//  Copyright © 2017年 Fly. All rights reserved.
//

import UIKit
import Foundation

extension AppDelegate{
    //最多四个，优先显示info.plst里的UIApplicationShortcutItems
    func creatShortcutTouchItem() {
        let firstItem = itemWithIconName(type: "com.moxina.first", title: "第一个", imageName: "showItemIconOne")
        let secondItem = itemWithIconName(type: "com.moxina.second", title: "第二个", imageName: "showItemIconTwo")
        let thirdItem = itemWithIconName(type: "com.moxina.third", title: "第三个", imageName: "showItemIconThree")

        UIApplication.shared.shortcutItems = [firstItem,secondItem,thirdItem]
    }
    
    func isLanuchFromShortcutTouch(launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        //如果是从快捷选项标签启动app，则根据不同标识执行不同操作，然后返回NO，防止调用- (void)application:(UIApplication *)application performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem completionHandler:(void (^)(BOOL))completionHandler
        let shortcutItem = launchOptions?[UIApplicationLaunchOptionsKey.shortcutItem]
        if shortcutItem == nil{
            print("不存在ShortcutItem")
            return false
        }
        let item = shortcutItem as? UIApplicationShortcutItem
        if item != nil{
            showAlertView(title: "程序第一次启动", content: item!.localizedTitle)
        }
        return true
    }
    
    func application(_ application: UIApplication, performActionFor shortcutItem: UIApplicationShortcutItem, completionHandler: @escaping (Bool) -> Void) {
        
        showAlertView(title: "程序未被杀死", content: shortcutItem.localizedTitle)
        
        completionHandler(true)
    }
    
    func showAlertView(title: String?, content: String?) {
        let alertVC = UIAlertController.init(title: title, message: content, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "取消", style: UIAlertActionStyle.cancel, handler: nil)
        let okAction = UIAlertAction(title: "好的", style: UIAlertActionStyle.default, handler: nil)
        alertVC.addAction(cancelAction)
        alertVC.addAction(okAction)
        
        let rootVC = UIApplication.shared.keyWindow?.rootViewController
        rootVC?.present(alertVC, animated: true, completion:nil)
    }
    
    func itemWithIconName(type: String,title: String,imageName: String) -> UIApplicationShortcutItem {
        let icon = UIApplicationShortcutIcon.init(templateImageName: imageName)
        let item = UIApplicationShortcutItem.init(type: type, localizedTitle: title, localizedSubtitle: "", icon: icon, userInfo: nil)
        return item
    }
}

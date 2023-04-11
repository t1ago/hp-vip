//
//  MemberListQuickActionWorker.swift
//  hp-vip
//
//  Created by Tiago Henrique Piantavinha on 31/03/23.
//

import Foundation
import UIKit

protocol MemberListQuickActionWorkerLogic: AnyObject {
    func addShortcut(houseName: String)
}

class MemberListQuickActionWorker: MemberListQuickActionWorkerLogic {
    func addShortcut(houseName: String) {
        var shortcutItens = UIApplication.shared.shortcutItems ?? []
        let typeName = "house.\(houseName)"
        
        for (index, item) in shortcutItens.enumerated() {
            if item.type == typeName {
                shortcutItens.remove(at: index)
                break
            }
        }
        
        let item = UIApplicationShortcutItem(type: typeName,
                                             localizedTitle: houseName,
                                             localizedSubtitle: "",
                                             icon: nil)
        shortcutItens.append(item)
        UIApplication.shared.shortcutItems = shortcutItens
    }
}

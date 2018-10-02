//
//  UITableViewExtensions.swift
//  MovieDatabase
//
//  Created by Bjarke Hesthaven Søndergaard on 24/09/2018.
//  Copyright © 2018 Trifork A/S. All rights reserved.
//

//import UIKit
//
//extension UITableView {
//    func registerCell<T: UITableViewCell>(_ cellClass: T.Type, suffix: String? = nil) {
//        let reuseIdentifier = cellClass.identifier + (suffix ?? "")
//        self.register(cellClass, forCellReuseIdentifier: reuseIdentifier)
//    }
//    
//    func registerHeaderFooter<T: UITableViewHeaderFooterView>(_ headerClass: T.Type) {
//        let reuseIdentifier = headerClass.identifier
//        self.register(headerClass, forHeaderFooterViewReuseIdentifier: reuseIdentifier)
//    }
//    
//    func dequeueReusableCell<T: UITableViewCell>(withClass cellClass: T.Type, for indexPath: IndexPath, suffix: String? = nil) -> UITableViewCell {
//        let reuseIdentifier = cellClass.identifier + (suffix ?? "")
//        return self.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
//    }
//}
//
//extension UITableViewCell {
//    static var identifier: String {
//        return String(describing: self)
//    }
//}
//
//extension UITableViewHeaderFooterView {
//    static var identifier: String {
//        return String(describing: self)
//    }
//}

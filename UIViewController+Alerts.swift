//  UIViewController+Alerts.swift
//
//  UIViewController.swift
//  Shimano
//
//  Created by Zesium on 2/12/19.
//  Copyright © 2019 Myler Media. All rights reserved.
//

import UIKit

extension UIViewController {

    func showOkAlert(
        title: String? = nil,
        message: String,
        confirmation: (() -> Void)? = nil,
        completion: (() -> Void)? = nil) {

        let okAlert = UIAlertController(title: title, message: message, preferredStyle: .alert)

        okAlert.addAction(UIAlertAction(title: NSLocalizedString("Ok", comment: ""), style: .default, handler: { _ in
            confirmation?()
        }))
        self.present(okAlert, animated: true, completion: completion)
    }
    
    func showCancelOrYesAlert(
        title: String? = nil,
        message: String,
        yesHandler: @escaping (() -> Void),
        noHandler: (() -> Void)? = nil,
        completion: (() -> Void)? = nil) {

        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: NSLocalizedString("Cancel", comment: ""), style: .cancel, handler: { _ in
            noHandler?()
        }))
        alert.addAction(UIAlertAction(title: NSLocalizedString("Ok", comment: ""), style: .default, handler: { _ in
                yesHandler()
            }))

        self.present(alert, animated: true, completion: completion)
    }

    func makeAlert(
        withTitle title: String?,
        withMessage message: String? = nil,
        style: UIAlertController.Style = .actionSheet,
        sourceView: UIView) -> UIAlertController {

        let alert = UIAlertController(title: title, message: message, preferredStyle: style)
        alert.popoverPresentationController?.sourceView = sourceView
        alert.popoverPresentationController?.sourceRect = CGRect(
            x: (view.bounds.size.width) / 2,
            y: (view.bounds.size.height) / 2, width: 1.0, height: 1.0)
        return alert
    }

    
    public static func addAction(
        forAlert alert: UIAlertController,
        withTitle title: String?,
        style: UIAlertAction.Style,
        handler: ((UIAlertAction) -> Void)? = nil) {
        let action = UIAlertAction(title: title, style: style, handler: handler)
        alert.addAction(action)
    }

}

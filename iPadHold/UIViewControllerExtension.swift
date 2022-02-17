//
//  UIViewControllerExtension.swift
//  iPadHold
//
//  Created by CHIH HAO LIN on 2022/2/17.
//

import UIKit

extension UIViewController: UIPopoverPresentationControllerDelegate {
    public func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        UIModalPresentationStyle.none
    }

    public func popoverPresentationControllerShouldDismissPopover(_ popoverPresentationController: UIPopoverPresentationController) -> Bool {
        true
    }

    func showPopover(_ nextVC: UIViewController, size: CGSize, arch: UIView, direction: UIPopoverArrowDirection) {
        nextVC.modalPresentationStyle = .popover
        nextVC.popoverPresentationController?.delegate = self
        nextVC.popoverPresentationController?.sourceView = arch
        nextVC.popoverPresentationController?.sourceRect = arch.bounds
        nextVC.preferredContentSize = size
        nextVC.popoverPresentationController?.permittedArrowDirections = direction
        present(nextVC, animated: true, completion: nil)
    }

    func showPopover(_ nextVC: UIViewController, size: CGSize, barItem: UIBarButtonItem, direction: UIPopoverArrowDirection) {
        nextVC.modalPresentationStyle = .popover
        nextVC.popoverPresentationController?.delegate = self
        nextVC.popoverPresentationController?.barButtonItem = barItem
        nextVC.preferredContentSize = size
        nextVC.popoverPresentationController?.permittedArrowDirections = direction
        present(nextVC, animated: true, completion: nil)
    }
}

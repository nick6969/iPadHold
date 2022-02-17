//
//  PopoverKeyboardVC.swift
//  iPadHold
//
//  Created by CHIH HAO LIN on 2022/2/17.
//

import UIKit

final class PopoverKeyboardVC: UIViewController {
    
    private let textField: UITextField = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = .purple
        view.addSubview(textField)
        textField
            .mLayChainCenterXY()
            .mLayChain(size: CGSize(width: 200, height: 100))
            .backgroundColor = .green
    }
}

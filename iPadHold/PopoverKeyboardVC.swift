//
//  PopoverKeyboardVC.swift
//  iPadHold
//
//  Created by CHIH HAO LIN on 2022/2/17.
//

import UIKit

final class PopoverKeyboardVC: UIViewController {
    
    private let textField: UITextField = UITextField()
    // ref: https://developer.apple.com/documentation/uikit/uipopoverpresentationcontrollerdelegate/1622326-popoverpresentationcontroller
    private let noteLabel: UILabel = {
        let label: UILabel = UILabel()
        label.font = .systemFont(ofSize: 18)
        label.textColor = .white
        label.numberOfLines = 0
        label.text = "如果遇到這個問題，就只能請設計這個畫面不要用 popover 的，或者是自定義 inputView"
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = .purple
        view.addSubview(textField)
        view.addSubview(noteLabel)
        textField
            .mLayChainCenterXY()
            .mLayChain(size: CGSize(width: 200, height: 100))
            .backgroundColor = .green
        noteLabel
            .mLayChain(.width, .equal, textField)
            .mLayChain(.centerX, .equal, textField)
            .mLayChain(.bottom, .equal, textField, .top, constant: -8)
    }
}

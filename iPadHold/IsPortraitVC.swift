//
//  IsPortraitVC.swift
//  iPadHold
//
//  Created by CHIH HAO LIN on 2022/2/17.
//

import UIKit

final class IsPortraitVC: UIViewController {

    private let textLabel: UILabel = {
        let label: UILabel = UILabel()
        label.font = .systemFont(ofSize: 30)
        label.textColor = .red
        return label
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        updateText()
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(textLabel)
        textLabel.mLayChainCenterXY()
        updateText()
    }
    
    private func updateText() {
        textLabel.text = SystemInfo.isPortrait ? "直式" : "橫式"
    }
}

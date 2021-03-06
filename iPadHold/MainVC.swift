//
//  MainVC.swift
//  iPadHold
//
//  Created by CHIH HAO LIN on 2022/2/17.
//

import UIKit

enum TalkType: Int, CaseIterable {
    case orientationSelected = 1000
    case actionSheetCrash
    case actionSheetCancelButtonDisappear
    case popoverCenterIssue
    case popoverKeyboardSizeIssue
    case isPortrait
}

private extension TalkType {
    var title: String {
        switch self {
        case .orientationSelected:
            return "轉向方向設定不明確"
        case .actionSheetCrash:
            return "ActionSheet Crash"
        case .actionSheetCancelButtonDisappear:
            return "ActionSheet Cancel Button Disappear"
        case .popoverCenterIssue:
            return "Popover 置中轉向跑版"
        case .popoverKeyboardSizeIssue:
            return "Popover 鍵盤出現 大小變化"
        case .isPortrait:
            return "畫面是否是在 Portrait 樣式"
        }
    }
}

final class MainVC: UIViewController {
    
    private lazy var stackView: UIStackView = {
        let stackView: UIStackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.spacing = 20
        stackView.distribution = .fillEqually
        for type in TalkType.allCases {
            stackView.addArrangedSubview(getButton(type))
        }
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
        
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        
        func fixPopoverCenterIssue() {
            if let popoverPresentationController = self.presentedViewController?.popoverPresentationController,
               popoverPresentationController.permittedArrowDirections == .init(rawValue: 0),
               let sourceBounds: CGRect = popoverPresentationController.sourceView?.bounds {
                popoverPresentationController.sourceRect = sourceBounds
            }
        }
        
        coordinator.animate { _ in
            fixPopoverCenterIssue()
        }
    }

}

extension MainVC {
    
    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(stackView)
        stackView
            .mLayChainCenterXY()
            .mLayChain(.width, 300)
    }

    private func getButton(_ type: TalkType) -> UIButton {
        let button: UIButton = UIButton()
        button.titleLabel?.numberOfLines = 0
        button.setTitle(type.title, for: .normal)
        button.addTarget(self, action: #selector(didTap(type:)), for: .touchUpInside)
        button.backgroundColor = .red
        button.mLayChain(.height, 80)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 24
        button.tag = type.rawValue
        return button
    }
    
}

extension MainVC {
    
    @objc
    private func didTap(type button: UIButton) {
        guard let type = TalkType(rawValue: button.tag) else { return }
        switch type {
        case .orientationSelected:
            let alert: UIAlertController = UIAlertController(title: "how to fix it.", message: "手工修改 project file and info.plist, XDD.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            alert.popoverPresentationController?.sourceView = button
            alert.popoverPresentationController?.sourceRect = button.bounds
            present(alert, animated: true, completion: nil)
        case .actionSheetCrash:
            let alert: UIAlertController = UIAlertController(title: "Crash", message: "ActionSheet", preferredStyle: .actionSheet)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            alert.popoverPresentationController?.sourceView = button
            alert.popoverPresentationController?.sourceRect = button.bounds
            present(alert, animated: true, completion: nil)
        case .actionSheetCancelButtonDisappear:
            let alert: UIAlertController = UIAlertController(title: "Crash", message: "ActionSheet", preferredStyle: .actionSheet)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            alert.addAction(UIAlertAction(title: "I'm Cancel Button", style: .cancel, handler: nil))
            alert.popoverPresentationController?.sourceView = button
            alert.popoverPresentationController?.sourceRect = button.bounds
            present(alert, animated: true, completion: nil)
        case .popoverCenterIssue:
            showPopover(PopoverCenterVC(), size: CGSize(width: 200, height: 600), arch: view, direction: .init(rawValue: 0))
        case .popoverKeyboardSizeIssue:
            showPopover(PopoverKeyboardVC(), size: CGSize(width: 200, height: 600), arch: view, direction: .init(rawValue: 0))
        case .isPortrait:
            navigationController?.pushViewController(IsPortraitVC(), animated: true)
        }
    }

}

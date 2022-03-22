//
//  FirstView.swift
//  MVVMApplication
//
//  Created by Vadim Marchenko on 22.03.2022.
//

import Foundation
import UIKit
import SnapKit
import CombineCocoa

final class FirstView: BaseView {
    
    let actionButton = UIButton()

    override func makeUI() {
        backgroundColor = .yellow
        makeActionButtonUI()
    }
    
    private func makeActionButtonUI() {
        addSubview(actionButton)
        actionButton.setTitle("Log out", for: .normal)
        actionButton.backgroundColor = .blue
        actionButton.snp.makeConstraints { make in
            make.centerY.leading.trailing.equalToSuperview()
                .inset(Dimension.biggerMaring)

        }
    }
}

//
//  HomeViewController.swift
//  TossClone
//
//  Created by yeongwoocho on 2022/07/04.
//

import UIKit

final class HomeViewController: UIViewController {
    
    private lazy var logoView: UIStackView = {
        let logoImage = UIImage(named: "toss")
        let button = UIButton()
        button.setImage(logoImage, for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        let spacer = UIView()
        let stack = UIStackView(arrangedSubviews: [button, spacer])
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        return stack
    }()

    private lazy var plusBarItem: UIBarButtonItem = {
        let config = UIImage.SymbolConfiguration(pointSize: 0, weight: .medium)
        let chatImage = UIImage(systemName: "plus", withConfiguration: config)
        let chatBarItem = UIBarButtonItem(image: chatImage,
                                          style: .plain,
                                          target: self,
                                          action: #selector(plusButtonTapHandler))
        chatBarItem.tintColor = .systemGray
        return chatBarItem
    }()

    private lazy var chatBarItem: UIBarButtonItem = {
        let chatImage = UIImage(systemName: "message.fill")
        let chatBarItem = UIBarButtonItem(image: chatImage,
                                          style: .plain,
                                          target: self,
                                          action: #selector(chatButtonTapHandler))
        chatBarItem.tintColor = .systemGray
        return chatBarItem
    }()

    private lazy var bellBarItem: UIBarButtonItem = {
        let bellImage = UIImage(systemName: "bell.fill")
        let bellBarItem = UIBarButtonItem(image: bellImage,
                                          style: .plain,
                                          target: self,
                                          action: #selector(bellButtonTapHandler))
        bellBarItem.tintColor = .systemGray
        return bellBarItem
    }()

    override func loadView() {
        self.view = UIView()
        
        configureView()
        setNavigationItem()
    }
}

extension HomeViewController {
    
    private func configureView() {
        guard let view = self.view else { return }
        
        view.backgroundColor = .systemBackground
    }
    
    private func setNavigationItem() {
        navigationItem.titleView = logoView
        navigationItem.rightBarButtonItems = [bellBarItem, chatBarItem, plusBarItem]
    }

    @objc
    func plusButtonTapHandler() {
    }

    @objc
    func chatButtonTapHandler() {
    }

    @objc
    func bellButtonTapHandler() {
    }

}

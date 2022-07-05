//
//  HomeViewController.swift
//  TossClone
//
//  Created by yeongwoocho on 2022/07/04.
//

import UIKit

final class HomeViewController: UIViewController {

    private let logoImageView: UIImageView = {
        let image = UIImage(named: "toss")
        let imageView = UIImageView(image: image)
        imageView.frame = CGRect(x: 0, y: 0, width: 0, height: 20)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private let plusBarItem: UIBarButtonItem = {
        let config = UIImage.SymbolConfiguration(pointSize: 0, weight: .medium)
        let chatImage = UIImage(systemName: "plus", withConfiguration: config)
        let chatBarItem = UIBarButtonItem(image: chatImage,
                                          style: .plain,
                                          target: HomeViewController.self,
                                          action: #selector(plusButtonTapHandler))
        chatBarItem.tintColor = .systemGray
        return chatBarItem
    }()

    private let chatBarItem: UIBarButtonItem = {
        let chatImage = UIImage(systemName: "message.fill")
        let chatBarItem = UIBarButtonItem(image: chatImage,
                                          style: .plain,
                                          target: HomeViewController.self,
                                          action: #selector(chatButtonTapHandler))
        chatBarItem.tintColor = .systemGray
        return chatBarItem
    }()

    private let bellBarItem: UIBarButtonItem = {
        let bellImage = UIImage(systemName: "bell.fill")
        let bellBarItem = UIBarButtonItem(image: bellImage,
                                          style: .plain,
                                          target: HomeViewController.self,
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
        navigationItem.titleView = logoImageView
        navigationItem.rightBarButtonItems = [bellBarItem, chatBarItem, plusBarItem]
    }

    @objc func plusButtonTapHandler() {
    }

    @objc func chatButtonTapHandler() {
    }

    @objc func bellButtonTapHandler() {
    }

}

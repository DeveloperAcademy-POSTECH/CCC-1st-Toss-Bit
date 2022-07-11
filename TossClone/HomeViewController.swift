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
    
    private lazy var contentScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .systemBackground
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    
    private lazy var contentStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [tossBankView, assetView, consumptionView, collectionView, lastView])
        stack.axis = .vertical
        stack.alignment = .fill
        stack.spacing = 15
        return stack
    }()
    
    private lazy var tossBankView: UIView = {
        let view = UIView()
        view.backgroundColor = ColorStyle.contentView.color
        view.layer.cornerRadius = 20
        return view
    }()
    
    private lazy var tossBankTitleView: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var tossBankTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "토스뱅크"
        label.font = UIFont.systemFont(ofSize: 22.0, weight: .heavy)
        return label
    }()
    
    private lazy var tossBankTitleImageButton: UIButton = {
        let button = UIButton()
        let image = UIImage(systemName: "chevron.right")
        button.setImage(image, for: .normal)
        button.tintColor = .darkGray
        return button
    }()
    
    private lazy var tossBankContentsView: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var tossBankContentsImageView: UIImageView = {
        let image = UIImage(systemName: "bell.fill")
        let imageView = UIImageView(image: image)
        return imageView
    }()
    
    private lazy var tossBankContentsTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "7월 1일 대출 규제 변경"
        label.font = UIFont.systemFont(ofSize: 14.0, weight: .regular)
        return label
    }()
    
    private lazy var tossBankContentsDescriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "내 한도가 올랐는지 확인하기"
        label.font = UIFont.systemFont(ofSize: 18.0, weight: .bold)
        return label
    }()
    
    private lazy var assetView: UIView = {
        let view = UIView()
        view.backgroundColor = ColorStyle.contentView.color
        view.layer.cornerRadius = 20
        return view
    }()
    
    private lazy var consumptionView: UIView = {
        let view = UIView()
        view.backgroundColor = ColorStyle.contentView.color
        view.layer.cornerRadius = 20
        return view
    }()
    
    private lazy var collectionView: UIView = {
        let view = UIView()
        view.backgroundColor = ColorStyle.contentView.color
        view.layer.cornerRadius = 20
        return view
    }()
    
    private lazy var lastView: UIView = {
        let view = UIView()
        return view
    }()
    
    override func loadView() {
        self.view = UIView()
        
        configureView()
        configureAddSubViews()
        configureConstraints()
        
        setNavigationItem()
    }
}

extension HomeViewController {
    
    private func configureView() {
        guard let view = self.view else { return }
        
        view.backgroundColor = .systemBackground
    }
    
    private func configureAddSubViews() {
        guard let view = self.view else { return }
        
        view.addSubview(contentScrollView)
        
        contentScrollView.addSubview(contentStackView)
        
        configureAddSubViewsTossBank()
    }
    
    private func configureConstraints() {
        guard let view = self.view else { return }
        
        contentScrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentScrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            contentScrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            contentScrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            contentScrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        contentStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentStackView.topAnchor.constraint(equalTo: contentScrollView.topAnchor, constant: 16),
            contentStackView.leadingAnchor.constraint(equalTo: contentScrollView.leadingAnchor, constant: 16),
            contentStackView.trailingAnchor.constraint(equalTo: contentScrollView.trailingAnchor, constant: -16),
            contentStackView.bottomAnchor.constraint(equalTo: contentScrollView.bottomAnchor),
            contentStackView.widthAnchor.constraint(equalTo: contentScrollView.widthAnchor, constant: -32)
        ])
        
        configureConstraintsTossBank()
        
        assetView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            assetView.heightAnchor.constraint(equalToConstant: 250)
        ])
        
        consumptionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            consumptionView.heightAnchor.constraint(equalToConstant: 250)
        ])
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.heightAnchor.constraint(equalToConstant: 200)
        ])
        
        lastView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            lastView.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    private func setNavigationItem() {
        navigationItem.titleView = logoView
        navigationItem.rightBarButtonItems = [bellBarItem, chatBarItem, plusBarItem]
    }

    @objc func plusButtonTapHandler() {}

    @objc func chatButtonTapHandler() {}

    @objc func bellButtonTapHandler() {}

}

extension HomeViewController {
    
    private func configureAddSubViewsTossBank() {
        tossBankView.addSubview(tossBankTitleView)
        tossBankView.addSubview(tossBankContentsView)
        
        tossBankTitleView.addSubview(tossBankTitleLabel)
        tossBankTitleView.addSubview(tossBankTitleImageButton)
        
        tossBankContentsView.addSubview(tossBankContentsImageView)
        tossBankContentsView.addSubview(tossBankContentsTitleLabel)
        tossBankContentsView.addSubview(tossBankContentsDescriptionLabel)
    }
    
    private func configureConstraintsTossBank() {
        tossBankView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tossBankView.heightAnchor.constraint(equalToConstant: 150)
        ])
        
        tossBankTitleView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tossBankTitleView.topAnchor.constraint(equalTo: tossBankView.topAnchor),
            tossBankTitleView.leadingAnchor.constraint(equalTo: tossBankView.leadingAnchor),
            tossBankTitleView.trailingAnchor.constraint(equalTo: tossBankView.trailingAnchor),
            tossBankTitleView.heightAnchor.constraint(equalToConstant: 65)
        ])
        
        tossBankTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tossBankTitleLabel.centerYAnchor.constraint(equalTo: tossBankTitleView.centerYAnchor, constant: 5),
            tossBankTitleLabel.leadingAnchor.constraint(equalTo: tossBankTitleView.leadingAnchor, constant: 20)
        ])
        
        tossBankTitleImageButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tossBankTitleImageButton.centerYAnchor.constraint(equalTo: tossBankTitleView.centerYAnchor),
            tossBankTitleImageButton.trailingAnchor.constraint(equalTo: tossBankTitleView.trailingAnchor, constant: -20)
        ])
        
        tossBankContentsView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tossBankContentsView.topAnchor.constraint(equalTo: tossBankTitleView.bottomAnchor),
            tossBankContentsView.leadingAnchor.constraint(equalTo: tossBankView.leadingAnchor),
            tossBankContentsView.trailingAnchor.constraint(equalTo: tossBankView.trailingAnchor),
            tossBankContentsView.bottomAnchor.constraint(equalTo: tossBankView.bottomAnchor)
        ])
        
        tossBankContentsImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tossBankContentsImageView.centerYAnchor.constraint(equalTo: tossBankContentsView.centerYAnchor, constant: -5),
            tossBankContentsImageView.leadingAnchor.constraint(equalTo: tossBankContentsView.leadingAnchor, constant: 25),
            tossBankContentsImageView.widthAnchor.constraint(equalToConstant: 40),
            tossBankContentsImageView.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        tossBankContentsTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tossBankContentsTitleLabel.topAnchor.constraint(equalTo: tossBankContentsImageView.topAnchor),
            tossBankContentsTitleLabel.leadingAnchor.constraint(equalTo: tossBankContentsImageView.trailingAnchor, constant: 20),
            tossBankContentsTitleLabel.trailingAnchor.constraint(equalTo: tossBankContentsView.trailingAnchor, constant: -20)
        ])
        
        tossBankContentsDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tossBankContentsDescriptionLabel.topAnchor.constraint(equalTo: tossBankContentsTitleLabel.bottomAnchor, constant: 5),
            tossBankContentsDescriptionLabel.leadingAnchor.constraint(equalTo: tossBankContentsTitleLabel.leadingAnchor),
            tossBankContentsDescriptionLabel.trailingAnchor.constraint(equalTo: tossBankContentsTitleLabel.trailingAnchor)
        ])
    }
    
}

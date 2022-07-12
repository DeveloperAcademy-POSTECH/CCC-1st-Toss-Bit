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
    
    private lazy var assetTitleView: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var assetTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "자산"
        label.font = UIFont.systemFont(ofSize: 22.0, weight: .heavy)
        return label
    }()
    
    private lazy var assetTitleImageButton: UIButton = {
        let button = UIButton()
        let image = UIImage(systemName: "chevron.right")
        button.setImage(image, for: .normal)
        button.tintColor = .darkGray
        return button
    }()
    
    private lazy var assetTopContentsView: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var assetTopContentsImageView: UIImageView = {
        let image = UIImage(systemName: "circle.fill")
        let imageView = UIImageView(image: image)
        return imageView
    }()
    
    private lazy var assetTopContentsTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "자유저축예금"
        label.font = UIFont.systemFont(ofSize: 14.0, weight: .regular)
        return label
    }()
    
    private lazy var assetTopContentsDescriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "9,948원"
        label.font = UIFont.systemFont(ofSize: 18.0, weight: .bold)
        return label
    }()
    
    private lazy var assetTopContentsButton: UIButton = {
        let button = UIButton()
        button.setTitle("송금", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14.0, weight: .regular)
        button.backgroundColor = .systemGray5
        button.layer.cornerRadius = 5
        return button
    }()
    
    private lazy var dividerView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray5
        return view
    }()
    
    private lazy var assetBottomContentsView: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var assetBottomContentsImageView: UIImageView = {
        let image = UIImage(systemName: "circle.fill")
        let imageView = UIImageView(image: image)
        return imageView
    }()
    
    private lazy var assetBottomContentsTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "포인트·페이 머니"
        label.font = UIFont.systemFont(ofSize: 14.0, weight: .regular)
        return label
    }()
    
    private lazy var assetBottomContentsDescriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "잔액·내역 불러오기"
        label.font = UIFont.systemFont(ofSize: 18.0, weight: .bold)
        return label
    }()
    
    private lazy var consumptionView: UIView = {
        let view = UIView()
        view.backgroundColor = ColorStyle.contentView.color
        view.layer.cornerRadius = 20
        return view
    }()
    
    private lazy var consumptionTitleView: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var consumptionTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "소비"
        label.font = UIFont.systemFont(ofSize: 22.0, weight: .heavy)
        return label
    }()
    
    private lazy var consumptionTopContentsView: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var consumptionTopContentsImageView: UIImageView = {
        let image = UIImage(systemName: "rectangle.fill")
        let imageView = UIImageView(image: image)
        return imageView
    }()
    
    private lazy var consumptionTopContentsTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "이번 달 쓴 금액"
        label.font = UIFont.systemFont(ofSize: 14.0, weight: .regular)
        return label
    }()
    
    private lazy var consumptionTopContentsDescriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "0원"
        label.font = UIFont.systemFont(ofSize: 18.0, weight: .bold)
        return label
    }()
    
    private lazy var consumptionTopContentsButton: UIButton = {
        let button = UIButton()
        button.setTitle("내역", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14.0, weight: .regular)
        button.backgroundColor = .systemGray5
        button.layer.cornerRadius = 5
        return button
    }()
    
    private lazy var consumptionBottomContentsView: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var consumptionBottomContentsImageView: UIImageView = {
        let image = UIImage(systemName: "rectangle.fill")
        let imageView = UIImageView(image: image)
        return imageView
    }()
    
    private lazy var consumptionBottomContentsTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "실적, 혜택도 알려드려요"
        label.font = UIFont.systemFont(ofSize: 14.0, weight: .regular)
        return label
    }()
    
    private lazy var consumptionBottomContentsDescriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "신한카드 쓴 금액 보기"
        label.font = UIFont.systemFont(ofSize: 18.0, weight: .bold)
        return label
    }()
    
    private lazy var consumptionBottomContentsButton: UIButton = {
        let button = UIButton()
        let image = UIImage(systemName: "chevron.right")
        button.setImage(image, for: .normal)
        button.tintColor = .darkGray
        return button
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
    
    private lazy var lastLeftLabel: UILabel = {
        let label = UILabel()
        label.text = "금액 숨기기"
        return label
    }()
    
    private lazy var lastMiddleLabel: UILabel = {
        let label = UILabel()
        label.text = "|"
        return label
    }()
    
    private lazy var lastRightLabel: UILabel = {
        let label = UILabel()
        label.text = "자산 추가"
        return label
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
        configureAddSubViewsAsset()
        configureAddSubViewsConsumption()
        configureAddSubViewsLast()
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
        configureConstraintsAsset()
        configureConstraintsConsumption()
        
        consumptionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            consumptionView.heightAnchor.constraint(equalToConstant: 250)
        ])
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.heightAnchor.constraint(equalToConstant: 200)
        ])
        
        configureConstraintsLast()
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

extension HomeViewController {
    
    private func configureAddSubViewsAsset() {
        assetView.addSubview(assetTitleView)
        assetView.addSubview(assetTopContentsView)
        assetView.addSubview(dividerView)
        assetView.addSubview(assetBottomContentsView)
        
        assetTitleView.addSubview(assetTitleLabel)
        assetTitleView.addSubview(assetTitleImageButton)
        
        assetTopContentsView.addSubview(assetTopContentsImageView)
        assetTopContentsView.addSubview(assetTopContentsTitleLabel)
        assetTopContentsView.addSubview(assetTopContentsDescriptionLabel)
        assetTopContentsView.addSubview(assetTopContentsButton)
        
        assetBottomContentsView.addSubview(assetBottomContentsImageView)
        assetBottomContentsView.addSubview(assetBottomContentsTitleLabel)
        assetBottomContentsView.addSubview(assetBottomContentsDescriptionLabel)
    }
    
    private func configureConstraintsAsset() {
        assetView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            assetView.heightAnchor.constraint(equalToConstant: 250)
        ])
        
        assetTitleView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            assetTitleView.topAnchor.constraint(equalTo: assetView.topAnchor),
            assetTitleView.leadingAnchor.constraint(equalTo: assetView.leadingAnchor),
            assetTitleView.trailingAnchor.constraint(equalTo: assetView.trailingAnchor),
            assetTitleView.heightAnchor.constraint(equalToConstant: 65)
        ])
        
        assetTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            assetTitleLabel.centerYAnchor.constraint(equalTo: assetTitleView.centerYAnchor, constant: 5),
            assetTitleLabel.leadingAnchor.constraint(equalTo: assetTitleView.leadingAnchor, constant: 20)
        ])
        
        assetTitleImageButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            assetTitleImageButton.centerYAnchor.constraint(equalTo: assetTitleView.centerYAnchor),
            assetTitleImageButton.trailingAnchor.constraint(equalTo: assetTitleView.trailingAnchor, constant: -20)
        ])
        
        assetTopContentsView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            assetTopContentsView.topAnchor.constraint(equalTo: assetTitleView.bottomAnchor),
            assetTopContentsView.leadingAnchor.constraint(equalTo: assetView.leadingAnchor),
            assetTopContentsView.trailingAnchor.constraint(equalTo: assetView.trailingAnchor),
            assetTopContentsView.heightAnchor.constraint(equalToConstant: 92)
        ])
        
        assetTopContentsImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            assetTopContentsImageView.centerYAnchor.constraint(equalTo: assetTopContentsView.centerYAnchor, constant: -5),
            assetTopContentsImageView.leadingAnchor.constraint(equalTo: assetTopContentsView.leadingAnchor, constant: 25),
            assetTopContentsImageView.widthAnchor.constraint(equalToConstant: 40),
            assetTopContentsImageView.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        assetTopContentsTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            assetTopContentsTitleLabel.topAnchor.constraint(equalTo: assetTopContentsImageView.topAnchor),
            assetTopContentsTitleLabel.leadingAnchor.constraint(equalTo: assetTopContentsImageView.trailingAnchor, constant: 20),
            assetTopContentsTitleLabel.trailingAnchor.constraint(equalTo: assetTopContentsView.trailingAnchor, constant: -20)
        ])
        
        assetTopContentsDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            assetTopContentsDescriptionLabel.topAnchor.constraint(equalTo: assetTopContentsTitleLabel.bottomAnchor, constant: 5),
            assetTopContentsDescriptionLabel.leadingAnchor.constraint(equalTo: assetTopContentsTitleLabel.leadingAnchor),
            assetTopContentsDescriptionLabel.trailingAnchor.constraint(equalTo: assetTopContentsTitleLabel.trailingAnchor)
        ])
        
        assetTopContentsButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            assetTopContentsButton.centerYAnchor.constraint(equalTo: assetTopContentsImageView.centerYAnchor),
            assetTopContentsButton.trailingAnchor.constraint(equalTo: assetTopContentsView.trailingAnchor, constant: -20),
            assetTopContentsButton.widthAnchor.constraint(equalTo: assetTopContentsButton.heightAnchor, multiplier: 2)
            
        ])
        
        dividerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            dividerView.topAnchor.constraint(equalTo: assetTopContentsView.bottomAnchor),
            dividerView.leadingAnchor.constraint(equalTo: assetTopContentsImageView.leadingAnchor),
            dividerView.trailingAnchor.constraint(equalTo: assetTopContentsButton.trailingAnchor),
            dividerView.heightAnchor.constraint(equalToConstant: 1)
        ])
        
        assetBottomContentsView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            assetBottomContentsView.topAnchor.constraint(equalTo: dividerView.bottomAnchor),
            assetBottomContentsView.leadingAnchor.constraint(equalTo: assetView.leadingAnchor),
            assetBottomContentsView.trailingAnchor.constraint(equalTo: assetView.trailingAnchor),
            assetBottomContentsView.bottomAnchor.constraint(equalTo: assetView.bottomAnchor)
        ])
        
        assetBottomContentsImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            assetBottomContentsImageView.centerYAnchor.constraint(equalTo: assetBottomContentsView.centerYAnchor, constant: -5),
            assetBottomContentsImageView.leadingAnchor.constraint(equalTo: assetBottomContentsView.leadingAnchor, constant: 25),
            assetBottomContentsImageView.widthAnchor.constraint(equalToConstant: 40),
            assetBottomContentsImageView.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        assetBottomContentsTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            assetBottomContentsTitleLabel.topAnchor.constraint(equalTo: assetBottomContentsImageView.topAnchor),
            assetBottomContentsTitleLabel.leadingAnchor.constraint(equalTo: assetBottomContentsImageView.trailingAnchor, constant: 20),
            assetBottomContentsTitleLabel.trailingAnchor.constraint(equalTo: assetBottomContentsView.trailingAnchor, constant: -20)
        ])
        
        assetBottomContentsDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            assetBottomContentsDescriptionLabel.topAnchor.constraint(equalTo: assetBottomContentsTitleLabel.bottomAnchor, constant: 5),
            assetBottomContentsDescriptionLabel.leadingAnchor.constraint(equalTo: assetBottomContentsTitleLabel.leadingAnchor),
            assetBottomContentsDescriptionLabel.trailingAnchor.constraint(equalTo: assetBottomContentsTitleLabel.trailingAnchor)
        ])
    }
    
}

extension HomeViewController {
    
    private func configureAddSubViewsConsumption() {
        consumptionView.addSubview(consumptionTitleView)
        consumptionView.addSubview(consumptionTopContentsView)
        consumptionView.addSubview(consumptionBottomContentsView)
        
        consumptionTitleView.addSubview(consumptionTitleLabel)
        
        consumptionTopContentsView.addSubview(consumptionTopContentsImageView)
        consumptionTopContentsView.addSubview(consumptionTopContentsTitleLabel)
        consumptionTopContentsView.addSubview(consumptionTopContentsDescriptionLabel)
        consumptionTopContentsView.addSubview(consumptionTopContentsButton)
        
        consumptionBottomContentsView.addSubview(consumptionBottomContentsImageView)
        consumptionBottomContentsView.addSubview(consumptionBottomContentsTitleLabel)
        consumptionBottomContentsView.addSubview(consumptionBottomContentsDescriptionLabel)
        consumptionBottomContentsView.addSubview(consumptionBottomContentsButton)
    }
    
    private func configureConstraintsConsumption() {
        consumptionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            consumptionView.heightAnchor.constraint(equalToConstant: 250)
        ])
        
        consumptionTitleView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            consumptionTitleView.topAnchor.constraint(equalTo: consumptionView.topAnchor),
            consumptionTitleView.leadingAnchor.constraint(equalTo: consumptionView.leadingAnchor),
            consumptionTitleView.trailingAnchor.constraint(equalTo: consumptionView.trailingAnchor),
            consumptionTitleView.heightAnchor.constraint(equalToConstant: 65)
        ])
        
        consumptionTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            consumptionTitleLabel.centerYAnchor.constraint(equalTo: consumptionTitleView.centerYAnchor, constant: 5),
            consumptionTitleLabel.leadingAnchor.constraint(equalTo: consumptionTitleView.leadingAnchor, constant: 20)
        ])
        
        consumptionTopContentsView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            consumptionTopContentsView.topAnchor.constraint(equalTo: consumptionTitleView.bottomAnchor),
            consumptionTopContentsView.leadingAnchor.constraint(equalTo: consumptionView.leadingAnchor),
            consumptionTopContentsView.trailingAnchor.constraint(equalTo: consumptionView.trailingAnchor),
            consumptionTopContentsView.heightAnchor.constraint(equalToConstant: 92)
        ])
        
        consumptionTopContentsImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            consumptionTopContentsImageView.centerYAnchor.constraint(equalTo: consumptionTopContentsView.centerYAnchor, constant: -5),
            consumptionTopContentsImageView.leadingAnchor.constraint(equalTo: consumptionTopContentsView.leadingAnchor, constant: 25),
            consumptionTopContentsImageView.widthAnchor.constraint(equalToConstant: 40),
            consumptionTopContentsImageView.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        consumptionTopContentsTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            consumptionTopContentsTitleLabel.topAnchor.constraint(equalTo: consumptionTopContentsImageView.topAnchor),
            consumptionTopContentsTitleLabel.leadingAnchor.constraint(equalTo: consumptionTopContentsImageView.trailingAnchor, constant: 20),
            consumptionTopContentsTitleLabel.trailingAnchor.constraint(equalTo: consumptionTopContentsView.trailingAnchor, constant: -20)
        ])
        
        consumptionTopContentsDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            consumptionTopContentsDescriptionLabel.topAnchor.constraint(equalTo: consumptionTopContentsTitleLabel.bottomAnchor, constant: 5),
            consumptionTopContentsDescriptionLabel.leadingAnchor.constraint(equalTo: consumptionTopContentsTitleLabel.leadingAnchor),
            consumptionTopContentsDescriptionLabel.trailingAnchor.constraint(equalTo: consumptionTopContentsTitleLabel.trailingAnchor)
        ])
        
        consumptionTopContentsButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            consumptionTopContentsButton.centerYAnchor.constraint(equalTo: consumptionTopContentsImageView.centerYAnchor),
            consumptionTopContentsButton.trailingAnchor.constraint(equalTo: consumptionTopContentsView.trailingAnchor, constant: -20),
            consumptionTopContentsButton.widthAnchor.constraint(equalTo: consumptionTopContentsButton.heightAnchor, multiplier: 2)
            
        ])
        
        consumptionBottomContentsView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            consumptionBottomContentsView.topAnchor.constraint(equalTo: consumptionTopContentsView.bottomAnchor),
            consumptionBottomContentsView.leadingAnchor.constraint(equalTo: consumptionView.leadingAnchor),
            consumptionBottomContentsView.trailingAnchor.constraint(equalTo: consumptionView.trailingAnchor),
            consumptionBottomContentsView.bottomAnchor.constraint(equalTo: consumptionView.bottomAnchor)
        ])
        
        consumptionBottomContentsImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            consumptionBottomContentsImageView.centerYAnchor.constraint(equalTo: consumptionBottomContentsView.centerYAnchor, constant: -5),
            consumptionBottomContentsImageView.leadingAnchor.constraint(equalTo: consumptionBottomContentsView.leadingAnchor, constant: 25),
            consumptionBottomContentsImageView.widthAnchor.constraint(equalToConstant: 40),
            consumptionBottomContentsImageView.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        consumptionBottomContentsTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            consumptionBottomContentsTitleLabel.topAnchor.constraint(equalTo: consumptionBottomContentsImageView.topAnchor),
            consumptionBottomContentsTitleLabel.leadingAnchor.constraint(equalTo: consumptionBottomContentsImageView.trailingAnchor, constant: 20),
            consumptionBottomContentsTitleLabel.trailingAnchor.constraint(equalTo: consumptionBottomContentsView.trailingAnchor, constant: -20)
        ])
        
        consumptionBottomContentsDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            consumptionBottomContentsDescriptionLabel.topAnchor.constraint(equalTo: consumptionBottomContentsTitleLabel.bottomAnchor, constant: 5),
            consumptionBottomContentsDescriptionLabel.leadingAnchor.constraint(equalTo: consumptionBottomContentsTitleLabel.leadingAnchor),
            consumptionBottomContentsDescriptionLabel.trailingAnchor.constraint(equalTo: consumptionBottomContentsTitleLabel.trailingAnchor)
        ])
        
        consumptionBottomContentsButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            consumptionBottomContentsButton.centerYAnchor.constraint(equalTo: consumptionBottomContentsImageView.centerYAnchor),
            consumptionBottomContentsButton.trailingAnchor.constraint(equalTo: consumptionBottomContentsView.trailingAnchor, constant: -20),
            consumptionBottomContentsButton.widthAnchor.constraint(equalTo: consumptionBottomContentsButton.heightAnchor, multiplier: 2)
            
        ])
    }
    
}

extension HomeViewController {
    
    private func configureAddSubViewsLast() {
        lastView.addSubview(lastLeftLabel)
        lastView.addSubview(lastMiddleLabel)
        lastView.addSubview(lastRightLabel)
    }
    
    private func configureConstraintsLast() {
        lastView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            lastView.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        lastMiddleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            lastMiddleLabel.centerXAnchor.constraint(equalTo: lastView.centerXAnchor),
            lastMiddleLabel.centerYAnchor.constraint(equalTo: lastView.centerYAnchor)
        ])
        
        lastLeftLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            lastLeftLabel.centerYAnchor.constraint(equalTo: lastMiddleLabel.centerYAnchor),
            lastLeftLabel.trailingAnchor.constraint(equalTo: lastMiddleLabel.leadingAnchor, constant: -20)
        ])
        
        lastRightLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            lastRightLabel.centerYAnchor.constraint(equalTo: lastMiddleLabel.centerYAnchor),
            lastRightLabel.leadingAnchor.constraint(equalTo: lastMiddleLabel.trailingAnchor, constant: 20)
        ])
    }
    
}

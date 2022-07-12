//
//  CollectionViewCell.swift
//  TossClone
//
//  Created by yeongwoocho on 2022/07/12.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    static let identifier = "CollectionViewCell"
    
    private let subTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        label.textAlignment = .left
        return label
    }()
    
    private let mainTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        label.textAlignment = .left
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    private let imageIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.backgroundColor = .clear
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initView()
    }
    
    required init(coder: NSCoder) {
        fatalError("init error")
    }
    
    func initView() {
        self.contentView.backgroundColor = ColorStyle.contentView.color
        self.contentView.layer.cornerRadius = 15
        for item in [subTitle, mainTitle, imageIcon] {
            self.contentView.addSubview(item)
        }
        subTitle.anchor(top: contentView.safeAreaLayoutGuide.topAnchor, right: nil, bottom: nil, left: contentView.safeAreaLayoutGuide.leftAnchor, padding: .init(top: 10, left: 10, bottom: 0, right: 0), size: .init(width: 100, height: 12))
        mainTitle.anchor(top: subTitle.safeAreaLayoutGuide.bottomAnchor, right: nil, bottom: nil, left: contentView.safeAreaLayoutGuide.leftAnchor, padding: .init(top: 5, left: 10, bottom: 0, right: 0), size: .init(width: 100, height: 40))
        imageIcon.anchor(top: mainTitle.bottomAnchor, right: contentView.safeAreaLayoutGuide.rightAnchor, bottom: nil, left: nil, padding: .init(top: 5, left: 0, bottom: 0, right: 20), size: .init(width: 30, height: 30))
    }
    
    func configure(_ data: CellData) {
        self.subTitle.text = data.subtitle
        self.mainTitle.text = data.mainTitle
        if !data.imageName.isEmpty {
            self.imageIcon.image = UIImage(named: data.imageName)
        }
    }

}

extension UIView {
    
    func anchor(top: NSLayoutYAxisAnchor?,
                right: NSLayoutXAxisAnchor?,
                bottom: NSLayoutYAxisAnchor?,
                left: NSLayoutXAxisAnchor?,
                padding: UIEdgeInsets = .zero,
                size: CGSize = .zero) {
        translatesAutoresizingMaskIntoConstraints = false
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: padding.top).isActive = true
        }
        if let right = right {
            rightAnchor.constraint(equalTo: right, constant: -padding.right).isActive = true
        }
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom).isActive = true
        }
        if let left = left {
            leftAnchor.constraint(equalTo: left, constant: padding.left).isActive = true
        }
        if size.width != 0 {
            widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }
        if size.height != 0 {
            heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
    }
    
}

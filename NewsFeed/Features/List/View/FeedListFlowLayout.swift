//
//  FeedListFlowLayout.swift
//  NewsFeed
//
//  Created by Rafael de Paula on 09/10/18.
//  Copyright © 2018 Rafael de Paula. All rights reserved.
//

import UIKit

class FeedListFlowLayout: UICollectionViewFlowLayout {
    
    enum DeviceType {
        case iPad
        case iPhone
    }
    
    fileprivate var deviceType: DeviceType = .iPhone
    
    var itemHeight: CGFloat {
        switch self.deviceType {
        case .iPad: return (self.collectionView!.bounds.width * 0.8 / 2)
        case .iPhone: return self.collectionView!.bounds.width * 0.8
        }
    }
    
    var itemWidth: CGFloat {
        switch self.deviceType {
        case .iPad: return (self.collectionView!.bounds.width / 2) - 40
        case .iPhone: return self.collectionView!.bounds.width - 35
        }
    }
    
    override init() {
        super.init()
        
    }
    
    convenience init(device: DeviceType) {
        self.init()
        self.deviceType = device
        self.setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        self.minimumLineSpacing = 30
        self.scrollDirection = .vertical
        
        switch self.deviceType {
        case .iPad: self.sectionInset = UIEdgeInsets(top: 20, left: 25, bottom: 0, right: 25)
        case .iPhone: self.sectionInset = UIEdgeInsets(top: 20, left: 5, bottom: 0, right: 5)
        }
    }
    
    override var itemSize: CGSize {
        set { self.itemSize = CGSize(width: self.itemWidth, height: self.itemHeight) }
        get { return CGSize(width: self.itemWidth, height: self.itemHeight) }
    }
    
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint) -> CGPoint {
        return self.collectionView!.contentOffset
    }
}


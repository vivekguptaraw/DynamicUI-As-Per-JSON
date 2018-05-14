//
//  HRScrollTableView.swift
//  DynamicUIDemo
//
//  Created by Vivek Gupta on 11/05/18.
//  Copyright © 2018 Vivek Gupta. All rights reserved.
//



import UIKit
import CoreData
@objc protocol HRScrollDelegate: NSObjectProtocol {
    
    @objc optional func tableView(_ tableView: UITableView, headerAtSection: Int)->UIView
    @objc optional func numberOfSectionsInTableView(_ tableView: UITableView) -> Int
    @objc optional func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    @objc optional func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat
    @objc optional func tableView(_ tableView: UITableView,willdisplayCellVG cell: UITableViewCell, indexPath: IndexPath)
    
    func tableView(_ tableView: UITableView, atIndexPath: IndexPath)->UITableViewCell
    func tableView(_ tableView: UITableView, heightAtIndexPath: IndexPath)->CGFloat
    
    @objc optional func tableView(_ tableView: UITableView, didSelectIndexPath indexPath: IndexPath)
    
    //MARK: CollectionView delegates
    
    @objc optional func collectionView(_ collectionView: UICollectionView, numberOfItemsInSectionVG section: Int) -> Int
    
    @objc optional func numberOfSections(in collectionViewVG: UICollectionView) -> Int
    
    @objc optional func collectionView(_ collectionView: UICollectionView, cellForItemAtVG indexPath: IndexPath) -> UICollectionViewCell
    @objc optional func collectionView(_ collectionView: UICollectionView, didSelectVGItemAt indexPath: IndexPath)
    
}

@objc protocol HorizontalScrollDelegate: NSObjectProtocol {
    func scrollViewDidScroll(SV: UIScrollView)
}
class HRScrollTableView: UIView, UITableViewDelegate, UITableViewDataSource, NSFetchedResultsControllerDelegate {
    
    var leftTable: UITableView   = UITableView()
    var rightTable: UITableView   = UITableView()
    var scrollView: UIScrollView  = UIScrollView()
    
    var shadowView: UIView        = UIView()
    
    weak var horizontalScroll: HorizontalScrollDelegate?
    
    weak var delegate: HRScrollDelegate?
    
    var leftTableWidth: CGFloat   = 125
    var rightTableWidth: CGFloat   = 660
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.leftTable.tableFooterView = UIView(frame: CGRect(origin: CGPoint.zero, size: CGSize(width: self.leftTable.frame.width, height: 1)))
        self.rightTable.tableFooterView = UIView(frame: CGRect(origin: CGPoint.zero, size: CGSize(width: self.rightTable.frame.width, height: 1)))
        
        self.leftTable.tag  = 2300
        self.rightTable.tag = 2388
        
        self.leftTable.showsHorizontalScrollIndicator   = false
        self.rightTable.showsHorizontalScrollIndicator  = false
        self.scrollView.showsVerticalScrollIndicator    = false
        self.leftTable.showsVerticalScrollIndicator     = false
        self.leftTable.showsVerticalScrollIndicator     = false
        self.scrollView.showsHorizontalScrollIndicator  = true
        
        self.rightTable.separatorInset   = UIEdgeInsets.zero
        if self.rightTable.responds(to: #selector(getter: UIView.layoutMargins)) {
            self.rightTable.layoutMargins    = UIEdgeInsets.zero
        }
        self.leftTable.separatorInset   = UIEdgeInsets.zero
        if self.leftTable.responds(to: #selector(getter: UIView.layoutMargins)) {
            self.leftTable.layoutMargins    = UIEdgeInsets.zero
        }
        self.scrollView.bounces     = true
        self.leftTable.frame        = CGRect(origin: CGPoint.zero, size: CGSize(width: self.leftTableWidth, height: self.frame.height))
        
        
        self.scrollView.frame = CGRect(x: leftTable.frame.maxX, y: 0, width: self.frame.width - leftTable.frame.width, height: self.frame.height)
        self.addSubview(scrollView)
        
        self.rightTable.frame = CGRect(origin: CGPoint.zero, size: CGSize(width: self.rightTableWidth, height: self.frame.height))
        self.scrollView.addSubview(rightTable)
        
        self.scrollView.contentSize = CGSize(width: self.rightTable.frame.width, height: self.scrollView.frame.height)
        
        self.leftTable.delegate     = self
        self.rightTable.delegate    = self
        self.leftTable.dataSource   = self
        self.rightTable.dataSource  = self
        self.scrollView.delegate    = self
        
        self.reloadTables()
        self.addSubview(leftTable)
        self.addSubview(shadowView)
        shadowView.frame = CGRect(x: leftTable.frame.width - 1, y: leftTable.frame.origin.y, width: 1, height: leftTable.frame.height)
    }
    
    func reloadTables () {
        self.leftTable.reloadData()
        self.rightTable.reloadData()
    }
    
    // MARK: - UITableview Delegate/Datasource
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if (scrollView.isEqual(self.scrollView)) {
            if let del = self.horizontalScroll {
                del.scrollViewDidScroll(SV: scrollView)
            }
        }else if (scrollView.isEqual(self.leftTable)) {
            self.rightTable.contentOffset = scrollView.contentOffset
        }else {
            self.leftTable.contentOffset = scrollView.contentOffset
        }
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        if let delegate: HRScrollDelegate = self.delegate  {
            if (delegate.responds(to: #selector(HRScrollDelegate.numberOfSectionsInTableView(_:))) == true) {
                return delegate.numberOfSectionsInTableView!(tableView)
            }
        }
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let delegate: HRScrollDelegate = self.delegate  {
            if (delegate.responds(to: #selector(HRScrollDelegate.tableView(_:numberOfRowsInSection:))) == true) {
                return delegate.tableView!(tableView, numberOfRowsInSection: section)
            }
        }
        return 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return self.delegate!.tableView(tableView, atIndexPath: indexPath)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.selectionStyle                     = UITableViewCellSelectionStyle.none
        cell.separatorInset                     = UIEdgeInsets.zero
        if cell.responds(to: #selector(getter: UIView.layoutMargins)) {
            cell.preservesSuperviewLayoutMargins    = false
            cell.layoutMargins                      = UIEdgeInsets.zero
        }
        if let delegate: HRScrollDelegate = self.delegate  {
            if (delegate.responds(to: #selector(HRScrollDelegate.tableView(_:willdisplayCellVG:indexPath:))) == true){
                delegate.tableView!(tableView, willdisplayCellVG: cell, indexPath: indexPath)
            }
        }
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.delegate!.tableView(tableView, heightAtIndexPath: indexPath)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if let delegate: HRScrollDelegate = self.delegate  {
            if (delegate.responds(to: #selector(HRScrollDelegate.tableView(_:headerAtSection:))) == true) {
                return delegate.tableView!(tableView, headerAtSection: section)
            }
        }
        return nil
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if let delegate: HRScrollDelegate = self.delegate  {
            if (delegate.responds(to: #selector(HRScrollDelegate.tableView(_:heightForHeaderInSection:))) == true) {
                return delegate.tableView!(tableView, heightForHeaderInSection: section)
            }
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let delegate: HRScrollDelegate = self.delegate  {
            if (delegate.responds(to: #selector(HRScrollDelegate.tableView(_:didSelectIndexPath:))) == true) {
                return delegate.tableView!(tableView, didSelectIndexPath: indexPath)
            }
        }
    }
    
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        self.rightTable.beginUpdates()
        self.leftTable.beginUpdates()
    }
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        switch type {
        case NSFetchedResultsChangeType.insert:
            self.leftTable.insertRows(at: [newIndexPath!], with: UITableViewRowAnimation.fade)
            self.rightTable.insertRows(at: [newIndexPath!], with: UITableViewRowAnimation.fade)
            
        case NSFetchedResultsChangeType.update:
            self.leftTable.reloadRows(at: [indexPath!], with: UITableViewRowAnimation.fade)
            self.rightTable.reloadRows(at: [indexPath!], with: UITableViewRowAnimation.fade)
        case .move:
            self.leftTable.deleteRows(at: [indexPath!], with: UITableViewRowAnimation.fade)
            self.leftTable.insertRows(at: [newIndexPath!], with: UITableViewRowAnimation.fade)
            self.rightTable.deleteRows(at: [indexPath!], with: UITableViewRowAnimation.fade)
            self.rightTable.insertRows(at: [newIndexPath!], with: UITableViewRowAnimation.fade)
            
        case .delete:
            self.leftTable.deleteRows(at: [indexPath!], with: UITableViewRowAnimation.fade)
            self.rightTable.deleteRows(at: [indexPath!], with: UITableViewRowAnimation.fade)
            
        }
    }
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        self.rightTable.endUpdates()
        self.leftTable.endUpdates()
    }
    
    func applyRightShadowToLeftTable(){
        let contentInset = UIEdgeInsetsMake(0, 0, 0, 0)
        let shadowPathOnlyRight = UIEdgeInsetsInsetRect(CGRect(x: 1, y: shadowView.frame.origin.y, width: 5, height: shadowView.frame.height), contentInset)
        let path = UIBezierPath.init(rect: shadowPathOnlyRight)
        shadowView.layer.shadowPath = path.cgPath
        shadowView.layer.shadowColor = UIColor.black.cgColor
        shadowView.layer.shadowOffset = CGSize(width: 0, height: 0)
        shadowView.layer.shadowOpacity = 0.3
        shadowView.layer.shadowRadius = 3.0
        shadowView.layer.masksToBounds = false
    }
}

extension HRScrollTableView: UICollectionViewDelegate, UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let delegate: HRScrollDelegate = self.delegate  {
            if (delegate.responds(to: #selector(HRScrollDelegate.collectionView(_:numberOfItemsInSectionVG:))) == true){
                return delegate.collectionView!(collectionView, numberOfItemsInSectionVG: section)
            }
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return self.delegate!.collectionView!(collectionView, cellForItemAtVG: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.delegate!.collectionView!(collectionView, didSelectVGItemAt: indexPath)
        
    }
    
}


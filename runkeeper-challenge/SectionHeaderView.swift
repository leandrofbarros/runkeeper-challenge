//
//  SectionHeaderView.swift
//  runkeeper-challenge
//
//  Created by Leandro Falbo Barros on 2021-11-14.
//

import UIKit

class SectionHeaderView: UICollectionReusableView {
    @IBOutlet weak var titleSectionLabel: UILabel!
    @IBOutlet weak var medalQtyLabel: UILabel!
    
    func cellInit(titleSection: String, medalQty: String) {
        
        self.titleSectionLabel.text = titleSection
        self.medalQtyLabel.text = medalQty
    }
    
}

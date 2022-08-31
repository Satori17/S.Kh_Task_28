//
//  HeaderView.swift
//  S.Kh_Task_28
//
//  Created by Saba Khitaridze on 31.08.22.
//

import UIKit

class HeaderView: UIView {

   //MARK: - IBOutlets
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var weekDaysLabel: UILabel!
 
    //MARK: - Object Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initHeaderView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initHeaderView()
    }
    
    //MARK: - Methods
    
    private func initHeaderView() {
        let nib = UINib(nibName: "HeaderView", bundle: nil)
        nib.instantiate(withOwner: self, options: nil)
        contentView.frame = bounds
        contentView.clipsToBounds = true
        addSubview(contentView)
    }
}

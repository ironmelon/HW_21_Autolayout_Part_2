//
//  ChessViewController.swift
//  HW_21_Autolayout_Part_2
//
//  Created by Oleg Dynnikov on 9/20/18.
//  Copyright © 2018 Oleg Dynnikov. All rights reserved.
//

import UIKit

class ChessViewController: UIViewController {

    @IBOutlet private weak var lcWidthChessView: NSLayoutConstraint!
    let sideOffset: CGFloat = 20.0

    override func viewDidLoad() {
        super.viewDidLoad()
        lcWidthChessView.constant = view.bounds.width - sideOffset * 2
    }
}

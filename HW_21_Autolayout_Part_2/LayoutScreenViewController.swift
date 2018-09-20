//
//  LayoutScreenViewController.swift
//  HW_21_Autolayout_Part_2
//
//  Created by Oleg Dynnikov on 9/13/18.
//  Copyright © 2018 Oleg Dynnikov. All rights reserved.
//

import UIKit

class LayoutScreenViewController: UIViewController {

    @IBOutlet private weak var distanceSlider: UISlider!
    @IBOutlet private weak var topMarginTextField: UITextField!
    @IBOutlet private weak var lcLeftMargin: NSLayoutConstraint!
    @IBOutlet private weak var lcRightMargin: NSLayoutConstraint!
    @IBOutlet private weak var lcTopMargin: NSLayoutConstraint!
    @IBOutlet private weak var colorsViewsContainer: UIView!
    
    let heightViewsAndConstraints: CGFloat = 20.0 + 20.0 + 110.0 + 20.0 + 100.0 + 10.0 + 60.0 + 20.0
    let constraintColorsViewContainer: Float = 20.0
    let widthColorView: Float = 80.0
    let minValueSlider: Float = 10.0
    let maxValueSlider: Float = 110.0

    //MARK: -
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    //MARK: -
    private func setupView() {
        distanceSlider.minimumValue = minValueSlider
        distanceSlider.maximumValue = maxValueSlider
        distanceSlider.value = Float(lcLeftMargin.constant + lcRightMargin.constant)
        topMarginTextField.delegate = self
        topMarginTextField.keyboardType = .numbersAndPunctuation
    }

    private func hideKeyboard() {
        view.endEditing(true)
    }

    private func updateDownMargin() {
        guard let margin = Float(topMarginTextField.text!) else { return }
        if margin <= Float(self.view.bounds.height - heightViewsAndConstraints) && margin >= 0 {
            lcTopMargin.constant = CGFloat(margin + constraintColorsViewContainer)
            UIView.animate(withDuration: 0.5) {
                self.view.layoutIfNeeded()
            }
        }
    }

    private func calculateConstraintConstant() -> CGFloat {
        let width = Float(colorsViewsContainer.bounds.width)
        return CGFloat(width - (distanceSlider.value + widthColorView * 2)) / 2
    }

    //MARK: - Actions
    @IBAction private func distanceValueChanged(_ sender: Any) {
        lcLeftMargin.constant = calculateConstraintConstant()
        lcRightMargin.constant = calculateConstraintConstant()
    }

    @IBAction private func setupButton(_ sender: Any) {
        updateDownMargin()
    }

    @IBAction private func backToFirstScreen(_ sender: UIStoryboardSegue) {}
}

//MARK: - Extensions
extension LayoutScreenViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        hideKeyboard()
        updateDownMargin()
        return true
    }
}

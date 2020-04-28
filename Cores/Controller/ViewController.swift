//
//  ViewController.swift
//  Cores
//
//  Created by Johan Kovalsikoski on 26/04/20.
//  Copyright © 2020 Johan Kovalsikoski. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - IBOutlet

    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var colorView: UIView! {
        didSet {
            colorView.layer.cornerRadius = CGFloat(16)
        }
    }
    @IBOutlet weak var randomButton: UIButton! {
        didSet {
            randomButton.layer.borderWidth = CGFloat(2)
            randomButton.layer.borderColor = UIColor.black.cgColor
            randomButton.layer.cornerRadius = CGFloat(16)
        }
    }
    
    //MARK: - Variables
    
    private let randomNumber = {
        () -> Float in return Float(Int.random(in: 0 ... 255))
    }
    
    private var redValue: Float = 0.0
    private var greenValue: Float = 0.0
    private var blueValue: Float = 0.0

    
    //MARK: - IBAction
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        if sender == redSlider {
            redValue = sender.value
        } else if sender == greenSlider {
            greenValue = sender.value
        } else if sender == blueSlider {
            blueValue = sender.value
        }
        changeColorView()
    }
    
    @IBAction func randomButtonTouched(_ sender: UIButton) {
        redValue = randomNumber()
        greenValue = randomNumber()
        blueValue = randomNumber()
        changeColorView()
        changeSliderPosition()
    }
    
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - Functions

    private func changeColorView() {
        let divider: Float = 255
        colorView.backgroundColor = UIColor.init(red: CGFloat(redValue/divider), green: CGFloat(greenValue/divider), blue: CGFloat(blueValue/divider), alpha: CGFloat(1))
    }
    
    private func changeSliderPosition() {
        redSlider.value = redValue
        greenSlider.value = greenValue
        blueSlider.value = blueValue
    }

}


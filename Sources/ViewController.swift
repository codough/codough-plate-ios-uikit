//
//  ViewController.swift
//  CodoughUIKitSample
//
//  Created by Eimer on 2020/11/16.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = label.text?.appending("\n(\(environmentName))")
    }
}

//
//  ViewController.swift
//  MVVM Example
//
//  Created by Арсентий Халимовский on 10.05.2023.
//

import UIKit

// MARK: View
class GreetingViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet var greetingLabel: UILabel!
    
    // MARK: - Private Properties
    
    private var viewModel: GreetingViewModelProtocol! {
        didSet {
            viewModel.greetingDidChange = { [unowned self]viewModel in
                self.greetingLabel.text = viewModel.greeting
            }
        }
    }
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // initialisation of our Model and ViewModel
        let person = Person(name: "Tim", surname: "Cook")
        viewModel = GreetingViewModel(person: person)
    }

    // MARK: - IBActions
    
    @IBAction func showGreetingPressed() {
        // ask Model to change greeting label
        viewModel.showGreeting()
    }

}


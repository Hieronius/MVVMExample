//
//  ViewModel.swift
//  MVVM Example
//
//  Created by Арсентий Халимовский on 10.05.2023.
//

import Foundation

// Public interface for ViewModel
protocol GreetingViewModelProtocol: AnyObject {
    // get - mean we can only get data from this property and can't change it
    var greeting: String { get }
    // this closure should grab GreetingViewModel
    var greetingDidChange: ((GreetingViewModelProtocol) -> Void)? { get set }
    init(person: Person)
    func showGreeting()
    }

// MARK: ViewModel
// why we won't use extension i don't know
class GreetingViewModel: GreetingViewModelProtocol {
    var greeting: String {
        didSet {
            greetingDidChange?(self)
        }
    }
    
    var greetingDidChange: ((GreetingViewModelProtocol) -> Void)?
    
    private let person: Person
    
    required init(person: Person) {
        self.person = person
    }
    
    func showGreeting() {
        greeting = "Hello, \(person.name) \(person.surname)"
    }
    
}
    

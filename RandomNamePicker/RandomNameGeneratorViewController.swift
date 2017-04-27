//
//  RandomNameGeneratorViewController.swift
//  RandomNamePicker
//
//  Created by Dominic's Macbook Pro on 27/4/17.
//  Copyright © 2017 King7Dom. All rights reserved.
//

import UIKit

class RandomNameGeneratorViewController: UIViewController {
    
    // MARK: - Property
    
    // MARK: View
    
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var profileImageView: UIImageView!
    @IBOutlet private weak var peopleCardView: UIView!
    @IBOutlet private weak var actionButton: UIButton!
    
    // MARK: Model
    
    private(set) var people = [Person]()

    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupPeople()
        setupView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        guard let firstPerson = people.first else { return }
        transition(
            to: firstPerson,
            options: [.transitionFlipFromRight, .repeat])
    }

    // MARK: - View Setup
    
    private func setupPeople() {
        people.append(Person(name: "Akhil"))
        people.append(Person(name: "Bruno"))
        people.append(Person(name: "Carlo"))
        people.append(Person(name: "Faizal"))
        people.append(Person(name: "Razvan"))
        people.append(Person(name: "Sanal"))
        people.append(Person(name: "Tim"))
    }
    
    private func setupView() {
        if let firstPerson = people.first {
            nameLabel.text = firstPerson.name
            profileImageView.image = UIImage(named: firstPerson.profilePictureName)
        }
        actionButton.setTitle("Pick name", for: .normal)
    }
    
    // MARK: - Transition
    
    private func transition(to person: Person, duration: TimeInterval = 0.5, options: UIViewAnimationOptions, completion: ((Bool) -> Void)? = nil) {
        UIView.transition(
            with: peopleCardView,
            duration: duration,
            options: options,
            animations: { 
                self.nameLabel.text = person.name
                self.profileImageView.image = UIImage(named: person.profilePictureName) },
            completion: completion)
    }
}

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

    private var timer: Timer?
    
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
        nameLabel.text = "Lucky Team Member"
        profileImageView.image = UIImage(named: "Akhil")
        actionButton.setTitle("Pick a name", for: .normal)
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

    // MARK: - Action

    @IBAction func didTouchUpInside(_ sender: UIButton) {
        toggleGenerator()
    }

    // MARK: - Random Name Generator

    func toggleGenerator() {
        timer == nil ? startGenerator() : stopGenerator()
    }

    func stopGenerator() {
        timer?.invalidate()
        timer = nil
        actionButton.setTitle("Pick a name", for: .normal)
    }

    func startGenerator() {
        timer?.invalidate() // Invalidate any existing timer
        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { timer in
            self.timer = timer
            self.transition(
                to: self.randomPerson(fromPeople: self.people),
                options: [.transitionFlipFromRight])
        }
        actionButton.setTitle("Stop", for: .normal)
    }

    private func randomPerson(fromPeople people: [Person]) -> Person {
        return people[Int(arc4random_uniform(UInt32(people.count)))]
    }
}

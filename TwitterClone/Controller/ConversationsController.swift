//
//  ConversationsController.swift
//  TwitterClone
//
//  Created by Miks Freibergs on 10/02/2021.
//

import UIKit

class ConversationsController: UIViewController {
    
    // MARK: - Properties
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK: - Helpers
    
    func configureUI() {
        view.backgroundColor = .white
        navigationItem.title = "Messages"
    }
}

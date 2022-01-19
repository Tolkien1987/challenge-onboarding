//
//  ViewController.swift
//  OnboardingChallenge
//
//  Created by Rodrigo Borges on 29/09/21.
//

import UIKit

final class ListViewController: UIViewController {

    private lazy var listView: ListView = {

        return ListView()
    }()

    private let service = Service()

    init() {
        super.init(nibName: nil, bundle: nil)

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {

        self.view = self.listView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.fetchList()
    }

    private func fetchUser() {
        
        self.service.fetchUser("devpass-tech") {user in
            print(user)
            
        }
    }
    
    private func fetchList() {

        self.service.fetchList("devpass-tech") { repositories in

            print(repositories?.first?.name)
            print(repositories?.first?.owner.avatarUrl)
        }
    }
}


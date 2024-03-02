//
//  ICredsViewModel.swift
//  Creds
//
//  Created by Dhanajit Kapali on 02/03/24.
//  Copyright © 2024 orgName. All rights reserved.
//

import Foundation
import shared

class ICredsViewModel: ObservableObject {
    
    private let credsViewModel = CredsViewModel()
    @Published var credList = [CreditDebitModel]()
    
    init() {
        onStartOberving()
        credsViewModel.getCredList()
    }
    
    func onStartOberving() {
        credsViewModel.credList.subscribe { credList in
            self.credList = credList as! [CreditDebitModel]
            print(credList)
        }
        
//        personalityTestViewModel?.getQuesState.subscribe(
//            onCollect: { state in
//                if let state = state {
//                    self.personalityTestViewModelQuestionAnswer = state
//                    self.progressAmount = Double(state.questionId) + 1
//                    if state.selectedOption == -1 {
//                        self.selectedOption = false
//                    } else {
//                        self.selectedOption = true
//                    }
//                }
//            }
//        )
    }
    
}

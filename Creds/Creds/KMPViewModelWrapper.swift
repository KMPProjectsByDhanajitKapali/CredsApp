//
//  KMMWrapper.swift
//  Creds
//
//  Created by Dhanajit Kapali on 11/01/24.
//  Copyright © 2024 orgName. All rights reserved.
//

import Foundation
import shared

class KMPViewModelWrapper<States: AnyObject, Events: AnyObject, Actions: AnyObject>: ObservableObject {
    //var viewmodel: IFlowViewModel?
    @Published var state: States?

//    init(event: (Events?) -> Void) {
//        viewmodel = nil
//        state = viewmodel?.initialState as? States
//        event(nil)
//    }
//    
//    init(viewmodel: IFlowViewModel?, events: @escaping ((Events?) -> Void)) {
//        self.viewmodel = viewmodel
//        state = viewmodel?.initialState as? States
//        
//        if let stateHolder = viewmodel?.stateHolder, let eventHolder = viewmodel?.eventHolder {
//            CommonFlow<States>(origin: stateHolder as Flow).watch { newState in
//                self.state = newState
//            }
//            
//            CommonFlow<Events>(origin: eventHolder as Flow).watch { newEvent in
//                events(newEvent)
//                if newEvent != nil {
//                    viewmodel?.onEventConsumed()
//                    self.getEvents(event: newEvent)
//                }
//            }
//        } else {
//            state = nil
//            events(nil)
//        }
//    }
//
//    func add(action: Actions) {
//        if let viewmodel = viewmodel {
//            viewmodel.add(action: action)
//        }
//    }
//    
//    func getEvents(event: Events?) {
//    }
}


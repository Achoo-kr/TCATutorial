//
//  TCA_Simple_tutorialApp.swift
//  TCA_Simple_tutorial
//
//  Created by 추현호 on 2023/04/19.
//

import SwiftUI
import ComposableArchitecture

@main
struct TCA_Simple_tutorialApp: App {
    
    let counterStore = Store(initialState: CounterState(), reducer: counterReducer, environment: CounterEnvironment())
    
    var body: some Scene {
        WindowGroup {
            CounterView(store: counterStore)
        }
    }
}

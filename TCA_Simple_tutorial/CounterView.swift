//
//  ContentView.swift
//  TCA_Simple_tutorial
//
//  Created by 추현호 on 2023/04/19.
//

import SwiftUI
import ComposableArchitecture

//도메인 + 상태
struct CounterState: Equatable {
    var count = 0
}

//도메인 + 액션
enum CounterAction: Equatable {
        case addCount //카운트 더하는 액션
        case subtractCount //카운트 빼는 액션
}

struct CounterEnvironment {
    
}

// 리듀서 스테이트, 액션, 인바이론먼트를 받아서 이펙트로 내보냄
let counterReducer = Reducer<CounterState, CounterAction, CounterEnvironment> { state, action, environment in
    // 들어온 액션에 따라 상태를 변경
    switch action {
    case .addCount:
        state.count += 1
        return Effect.none // 아무것도 반환 안하겠다
    case .subtractCount:
        state.count -= 1
        return Effect.none
    }
    
}

struct CounterView: View {
    
    let store: Store<CounterState, CounterAction>
    
    var body: some View {
        //스토어를 받고 할 수 있는 옵저버블이 되는 애 (뷰랑 스토어를 연결시켜주는 애)
        WithViewStore(self.store) { viewStore in
            VStack{
                Text("count: \(viewStore.state.count)")
                    .padding()
                HStack{
                    Button("더하기", action: { viewStore.send(.addCount) })
                    Button("빼기", action: { viewStore.send(.subtractCount) })
                }
            }
        }
    }
    
}


//struct CounterView_Previews: PreviewProvider {
//    static var previews: some View {
//        CounterView()
//    }
//}

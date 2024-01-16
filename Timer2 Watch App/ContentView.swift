//
//  ContentView.swift
//  Timer2 Watch App
//
//  Created by MsMacM on 2024/01/16.
//

import SwiftUI

struct ContentView: View {
    @State var count = 0
    @State var timer: Timer?
    @State var timerfl = false
//    タイマーが起動しているかどうかのフラグを入れた。開始ボタンを連続で押すとおかしくなることを防ぐ
    var body: some View {
        VStack {
            Text("\(count)")
                .font(.largeTitle)
                .padding()
            Button(action: {
                if timerfl == false {
                    timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true){_ in
                        self.count += 1
                    }
                    timerfl = true
                }
            }){
                Text("開始")
            }
            Button(action: {
                if let unWrapedtimer = timer {
//                    値があるか調べる必要があるか？
                    if unWrapedtimer.isValid == true {
                        unWrapedtimer.invalidate()
                        timerfl = false
                    }
                }
            }){
                Text("ストップ")
            }
            Button(action: {
                if let unWrapedtimer2 = timer {
//                    ここでは調べてないが、エラー無しに動く
                        unWrapedtimer2.invalidate()
                        count = 0
                    timerfl = false
                }
            }){
                Text("reset")
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

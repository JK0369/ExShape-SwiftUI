//
//  ContentView.swift
//  ExShape
//
//  Created by 김종권 on 2022/10/09.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    MyCircle()
      .inset(by: 20)
      .frame(width: 120, height: 120)
      .foregroundColor(.blue)
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}

struct MyCircle: Shape, InsettableShape {
  private var insetValue = 0.0
  
  func path(in rect: CGRect) -> Path {
    var path = Path()
    path.addArc(
      center: CGPoint(x: rect.midX, y: rect.midY), // 중심
      radius: rect.width / 2 - insetValue, // 반지름
      startAngle: Angle.degrees(180), // 시작 위치
      endAngle: Angle.degrees(-180), // 끝 위치
      clockwise: true // true - 시계 방향, false - 반시계 방향
    )
    return path
  }
  
  func inset(by amount: CGFloat) -> some InsettableShape {
    var myCircle = self
    myCircle.insetValue = amount
    return myCircle
  }
}

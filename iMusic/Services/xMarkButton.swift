//
//  xMarkButton.swift
//  iMusic
//
//  Created by wsa-024-23b on 17.09.21.
//

import SwiftUI

struct xMarkButton: View {
    
    @Binding var isShowingDetail: Bool
    
    var body: some View {
        HStack {
            Spacer()
            Button {
                isShowingDetail = false
            } label: {
                ZStack {
                    Circle()
                        .frame(width: 30, height: 30)
                        .foregroundColor(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)))
                        .opacity(0.6)
                    
                    Image(systemName: "xmark")
                        .imageScale(.small)
                        .frame(width: 44, height: 44)
                        .foregroundColor(.black)
                }
            }
            .padding()
        }
    }
}

struct xMarkButton_Previews: PreviewProvider {
    static var previews: some View {
        xMarkButton(isShowingDetail: .constant(false))
    }
}

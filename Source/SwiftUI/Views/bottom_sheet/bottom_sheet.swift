//
//  bottom_sheet.swift
//  personalEncyclopedia
//
//  Created by Hugo Silva on 26/11/23.
//

import SwiftUI

struct bottom_sheet: View {
    @State var showSheet = false
    
    var body: some View {
        ZStack {
            Button {
                withAnimation(.linear(duration: 0.3)) {
                    showSheet.toggle()
                }
            } label: {
                Text("Open")
            }

            if showSheet {
                BottomSheet(showSheet: $showSheet)
            }
        }
    }
}

struct BottomSheet: View {
    @State var animateSheet = false
    @Binding var showSheet: Bool
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.6)
            
            VStack {
                Spacer()
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.white)
                }
                .frame(maxHeight: animateSheet ? 350 : 0)
                .overlay(alignment: .topTrailing) {
                    Button {
                        withAnimation(.linear(duration: 0.2)) {
                            animateSheet.toggle()
                            showSheet.toggle()
                        }
                    } label: {
                        Image(systemName: "xmark")
                            .font(.title2)
                    }
                    .padding()
                }
            }
        }
        .edgesIgnoringSafeArea(.vertical)
        .onAppear {
            withAnimation(.linear(duration: 0.2)) {
                animateSheet = true
            }
        }
    }
}

struct bottom_sheet_Previews: PreviewProvider {
    static var previews: some View {
        bottom_sheet()
    }
}

//
//  tab_view_with_pagination.swift
//  personalEncyclopedia
//
//  Created by Hugo Silva on 26/11/23.
//

import SwiftUI

struct tab_view_with_pagination: View {
    @State var tabItem = 0
    
    var body: some View {
        VStack(spacing: 50) {
            TabView(selection: $tabItem) {
                item.tag(0)
                item.tag(1)
                item.tag(2)
                item.tag(3)
            }
            .tabViewStyle(.page)
            .frame(height: 500, alignment: .top)
            .onAppear {
                setupCirclesColor()
            }
            
            HStack(spacing: 48) {
                Button {
                    withAnimation(.linear(duration: 1)) {
                        tabItem = tabItem > 0 ? tabItem - 1 : 3
                    }
                } label: {
                    Text("Previous")
                }
                Button {
                    withAnimation(.linear(duration: 1)) {
                        tabItem = tabItem < 3 ? tabItem + 1 : 0
                    }
                } label: {
                    Text("Next")
                }
            }
        }
    }
}

extension tab_view_with_pagination {
    var item: some View {
        VStack {
            Image("spiderman")
                .resizable()
                .scaledToFit()
            Spacer()
        }
    }
    func setupCirclesColor() {
        UIPageControl.appearance().currentPageIndicatorTintColor = .blue
        UIPageControl.appearance().pageIndicatorTintColor = UIColor.black.withAlphaComponent(0.2)
    }
}

struct tab_view_with_pagination_Previews: PreviewProvider {
    static var previews: some View {
        tab_view_with_pagination()
    }
}

//
//  swiftUI_inside_uiKit_view.swift
//  personalEncyclopedia
//
//  Created by Hugo Silva on 26/11/23.
//

import SwiftUI

class swiftUI_inside_uiKit_viewModel: ObservableObject {
    var first: (() -> Void)?
    var second: (() -> Void)?
    var third: (() -> Void)?
}

struct swiftUI_inside_uiKit_view: View {
    @StateObject var viewModel: swiftUI_inside_uiKit_viewModel
    
    var body: some View {
        VStack {
            Button {
                viewModel.first?()
            } label: {
                Text("First")
            }
            Button {
                viewModel.second?()
            } label: {
                Text("Second")
            }
            Button {
                viewModel.third?()
            } label: {
                Text("Third")
            }
        }
    }
}

struct swiftUI_inside_uiKit_view_Previews: PreviewProvider {
    static var previews: some View {
        swiftUI_inside_uiKit_view(viewModel: swiftUI_inside_uiKit_viewModel())
    }
}

//
//  receiving_generic_params.swift
//  personalEncyclopedia
//
//  Created by Hugo Silva on 26/11/23.
//

import SwiftUI

struct receiving_generic_params<Content: View, T: Identifiable>: View {
    var list: [T]
    var content: (T) -> Content
    
    var body: some View {
        Text("Hello, World!")
    }
}

struct receiving_generic_params_Previews: PreviewProvider {
    static var previews: some View {
        receiving_generic_params(list: [fileModel]()) { fileModel in
            Text("testing")
        }
    }
}

fileprivate struct fileModel: Identifiable {
    var id: String
    var name: String
    var age: Int
}

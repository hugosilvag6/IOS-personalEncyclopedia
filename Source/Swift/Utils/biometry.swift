//
//  biometry.swift
//  personalEncyclopedia
//
//  Created by Hugo Silva on 26/11/23.
//

import SwiftUI
import LocalAuthentication

struct biometry: View {
    @State var oldDomain: Data?
    
    var body: some View {
        Button {
            useBiometry()
        } label: {
            Text("Usar biometria")
        }
    }
}

extension biometry {
    func useBiometry() {
        let context = LAContext()
        var error: NSError?
        
        guard context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) else {
            print("DEBUG:HUGO device não tem biometria OU usuário não deu permissão")
            return
        }
        
        context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Login") { success, err in
            if let err { print("DEBUG:HUGO \(err)") }
            if success {
                print("DEBUG:HUGO sucesso")
            } else {
                print("DEBUG:HUGO falha")
            }
        }
    }
    private func getBiometricType() -> LABiometryType {
        let authContext = LAContext()
        _ = authContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil)
        switch authContext.biometryType {
        case .touchID:
            return .touchID
        case .faceID:
            return .faceID
        default:
            return .none
        }
    }
}

struct biometry_Previews: PreviewProvider {
    static var previews: some View {
        biometry()
    }
}

//
//  SearchAlert.swift
//  TikTok Stats Profile
//
//  Created by Arrinal Sholifadliq on 06/03/21.
//

import SwiftUI

struct SearchAlert: View {
    
    let screenSize = UIScreen.main.bounds
    var title: String = ""
    @Binding var isShown: Bool
    @Binding var text: String
    var onDone: (String) -> Void = { _ in }
    var onCancel: () -> Void = { }
    
    
    var body: some View {
    
        VStack(spacing: 20) {
            Text(title)
                .font(.headline)
                .padding(.top, 10)
                .foregroundColor(.black)
            Text("Fill the username below")
                .foregroundColor(.black)
            TextField("tiktok", text: $text)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            
            HStack(spacing: 20) {
                Button("Cancel") {
                    self.isShown = false
                    self.onCancel()
                    endEditing()
                }
                Divider()
                    .frame(width: 50)
                Button("Search") {
                    self.isShown = false
                    self.onDone(self.text)
                    self.text = ""
                    endEditing()
                }
            }
        }
        .padding()
        .frame(width: screenSize.width * 0.7, height: screenSize.height * 0.25)
        .background(Color(#colorLiteral(red: 0.9268686175, green: 0.9416290522, blue: 0.9456014037, alpha: 1)))
        .clipShape(RoundedRectangle(cornerRadius: 20.0, style: .continuous))
        .offset(y: isShown ? 0 : screenSize.height)
        .animation(.spring())

    }
    
    private func endEditing() {
            UIApplication.shared.endEditing()
        }
}


extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

struct SearchAlert_Previews: PreviewProvider {
    static var previews: some View {
        SearchAlert(title: "Add Item", isShown: .constant(true), text: .constant(""))
    }
}

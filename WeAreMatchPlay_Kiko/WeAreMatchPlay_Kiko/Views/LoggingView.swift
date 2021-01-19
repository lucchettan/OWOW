//
//  LoggingView.swift
//  WeAreMatchPlay_Kiko
//
//  Created by mac on 19/01/2021.
//

import SwiftUI

struct loggingView: View {
    
    @State var mailInput     = ""
    @State var passwordInput = ""
    @State var wrongLogIn    = false
    @State var alertMessage  = "Check your log in"
    @Binding var isLoggedIn : Bool
    @State var token : String?
    
    var body: some View {
        ZStack{
            BackGroundWhite()
            VStack {
                Spacer()
                Text("WAMP")
                    .font(.system(size: 60))
                    .bold()
                    .foregroundColor(Color(#colorLiteral(red: 0.8872029185, green: 0.7698594928, blue: 0.6743299365, alpha: 1)))
                    .padding(.bottom, UIScreen.main.bounds.height * 0.05)
                ZStack{
                    VStack(spacing: 10){
                        Text("We Are Match Play!")
                            .bold()
                            .foregroundColor(Color(#colorLiteral(red: 0.8770468831, green: 0.5742071271, blue: 0.3142549992, alpha: 1)))
                            .lineLimit(2)
                            .multilineTextAlignment(.center)
                            .font(.system(size: 24))
                        Text("Let's meet on the green\nBut for the moment...")
                            .bold()
                            .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                            .lineLimit(2)
                            .multilineTextAlignment(.center)
                            .font(.system(size: 24))
                    }
                    .padding(15)
                    .background(Color(#colorLiteral(red: 0.8872029185, green: 0.7698594928, blue: 0.6743299365, alpha: 1)).opacity(0.8).background(Blur()))
                    .cornerRadius(15)
                }
                Spacer()
                // Form
                VStack(spacing: 15){
                    ZStack{
                        HStack{
                            Image(systemName: "envelope.circle.fill")
                                .font(.system(size: 40))
                                .foregroundColor(Color(#colorLiteral(red: 0.4215126038, green: 0.354411304, blue: 0.3556520939, alpha: 1)))
                            TextField("Adresse Email", text: $mailInput)
                                .multilineTextAlignment(.leading)
                                .font(.system(size: 20))
                                .foregroundColor(Color(#colorLiteral(red: 0.4215126038, green: 0.354411304, blue: 0.3556520939, alpha: 1)))
                            
                        }
                    }
                    .padding(15)
                    .background(Color(#colorLiteral(red: 0.9896113276, green: 0.980209291, blue: 0.9757992625, alpha: 1)).opacity(0.55))
                    .cornerRadius(15)
                    .shadow(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)).opacity(0.2), radius: 20, x: 0, y: 15)
                    
                    ZStack{
                        HStack{
                            Image(systemName: "lock.circle.fill")
                                .font(.system(size: 40))
                                .foregroundColor(Color(#colorLiteral(red: 0.4215126038, green: 0.354411304, blue: 0.3556520939, alpha: 1)))
                            SecureField("Password", text: $passwordInput)
                                .multilineTextAlignment(.leading)
                                .font(.system(size: 20))
                                .foregroundColor(Color(#colorLiteral(red: 0.4215126038, green: 0.354411304, blue: 0.3556520939, alpha: 1)))
                        }
                    }
                    .padding(15)
                    .background(Color(#colorLiteral(red: 0.9896113276, green: 0.980209291, blue: 0.9757992625, alpha: 1)).opacity(0.55))
                    .cornerRadius(15)
                    .shadow(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)).opacity(0.2), radius: 20, x: 0, y: 15)
                    
                    
                    Button(action: {
                        NetworkManager.shared.authenticatePostManMethod(email: self.mailInput, password: self.passwordInput){ result in
                            switch result {
                            case .success(let token):
                                self.token = token
                                PersistenceManager.save(token: token)
                                self.isLoggedIn = true
                            case .failure(let err):
                                self.alertMessage = err.localizedDescription
                            }
                            if token == nil { self.wrongLogIn.toggle() }
                        }
                    }){
                        RoundedRectangle(cornerRadius: 15)
                            .frame(width: UIScreen.main.bounds.width * 0.30, height: UIScreen.main.bounds.height * 0.05)
                            .shadow(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)).opacity(0.2), radius: 20, x: 0, y: 15)
                            .foregroundColor(Color(#colorLiteral(red: 0.8770468831, green: 0.5742071271, blue: 0.3142549992, alpha: 1)))
                            .overlay(
                                Image(systemName:"checkmark")
                                    .edgesIgnoringSafeArea(.all)
                                    .font(.system(size: 50))
                                    .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                                    .offset(y: -UIScreen.main.bounds.height * 0.01)
                            )
                    }
                }
                .frame(maxWidth: .infinity)
                .frame(width: UIScreen.main.bounds.width * 0.67)
                .padding(20)
                .padding(.top, 25)
                .background(Color(#colorLiteral(red: 0.8872029185, green: 0.7698594928, blue: 0.6743299365, alpha: 1)).opacity(1)).cornerRadius(15)
                .overlay(
                    Image(systemName:"person.crop.circle.fill")
                        .resizable()
                        .foregroundColor(Color(#colorLiteral(red: 0.8872029185, green: 0.7698594928, blue: 0.6743299365, alpha: 1)).opacity(1))
                        .background(Circle().frame(width: 50, height: 50).foregroundColor(Color(#colorLiteral(red: 0.1862579584, green: 0.1104152128, blue: 0.1121566221, alpha: 1))))
                        .clipShape(Circle())
                        .frame(width:65, height: 65)
                        .offset(y: UIScreen.main.bounds.width * 0.67 * -0.53)
                )
                .keyboardAware()
                
                Spacer()
                Spacer()
            }
            .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
            
            // Personnalised Alert with animation
            WrongLog(isPresented: self.$wrongLogIn, alertMessage: self.alertMessage)
                .offset(y: self.wrongLogIn ?  0 : UIScreen.main.bounds.height * 1.5)
                .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
                .background(Blur().opacity(self.wrongLogIn ? 0.6 : 0).blur(radius: 30).frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        }
    }
}

struct loggingView_Previews: PreviewProvider {
    static var previews: some View {
        loggingView(isLoggedIn: .constant(true))
    }
}

// To move up the view while typing
extension loggingView {
    func keyboardSensible(_ offsetValue: Binding<CGFloat>) -> some View {

      return self
          .padding(.bottom, offsetValue.wrappedValue)
          .animation(.spring())
          .onAppear {
          NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: .main) { notification in

              let keyWindow = UIApplication.shared.connectedScenes
                  .filter({$0.activationState == .foregroundActive})
                  .map({$0 as? UIWindowScene})
                  .compactMap({$0})
                  .first?.windows
                  .filter({$0.isKeyWindow}).first

              let bottom = keyWindow?.safeAreaInsets.bottom ?? 0

              let value = notification.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! CGRect
              let height = value.height

              offsetValue.wrappedValue = height - bottom
          }

          NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: .main) { _ in
              offsetValue.wrappedValue = 0
          }
      }
    }
}

import SwiftUI

struct SupportChatView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State var textValue: String = ""
    
    var body: some View {
        NavigationView {
            VStack(spacing: 10) {
                VStack(spacing: 20) {
                    HStack {
                        VStack(alignment: .trailing, spacing: 5) {
                            Text("Hello. How can I help you? 🙂")
                            Text("18:06")
                                .font(Font.system(size: 12))
                                .foregroundColor(Color.white.opacity(0.5))
                        }
                        .padding(10)
                        .background(Color.blue.opacity(0.8))
                        .foregroundColor(Color.white)
                        .cornerRadius(10)
                        Spacer()
                    }
                    HStack {
                        Spacer()
                        VStack(alignment: .trailing, spacing: 5) {
                            Text("I'm not able to link my credit card 😞")
                            Text("18:06")
                                .font(Font.system(size: 12))
                                .foregroundColor(Color.white.opacity(0.5))
                        }
                        .padding(10)
                        .background(Color.green.opacity(0.8))
                        .foregroundColor(Color.white)
                        .cornerRadius(10)
                    }
                }
                Spacer()
                Divider()
                HStack {
                    TextField("Write a message...", text: $textValue)
                    Button(action: {}) {
                        Image(systemName: "paperplane.fill").resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding(EdgeInsets(top: 12, leading: 10, bottom: 10, trailing: 12))
                            .frame(width: 40, height: 40)
                            .background(Color.blue)
                            .foregroundColor(Color.white)
                            .clipShape(Circle())
                            .shadow(color: Color.blue.opacity(0.1), radius: 3, x: 0, y: 0)
                    }
                }
            }
            .padding(15)
            .navigationTitle("Chat")
            .navigationBarItems(trailing: Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                HStack(spacing: 10) {
                    Image(systemName: "xmark")
                }
                .padding(10)
                .background(Color.black.opacity(0.4))
                .clipShape(Circle())
                .accentColor(.white)
            })
        }
    }
    
}

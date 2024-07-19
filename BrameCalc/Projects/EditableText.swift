import SwiftUI

struct EditableText: View {
    @State private var isEditing = false
    @State private var draftText: String
    var text: String
    var onCommit: (String) -> Void
    
    init(text: String, onCommit: @escaping (String) -> Void) {
        self.text = text
        self._draftText = State(initialValue: text)
        self.onCommit = onCommit
    }
    
    var body: some View {
        if isEditing {
            TextField("Enter text", text: $draftText, onCommit: {
                isEditing = false
                onCommit(draftText)
            })
            .textFieldStyle(RoundedBorderTextFieldStyle())
        } else {
            Text(text)
                .onTapGesture {
                    isEditing = true
                }
        }
    }
}

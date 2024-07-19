import SwiftUI

struct LabeledTextField: View {
    var label: String
    @Binding var text: String

    var body: some View {
        VStack(alignment: .leading) {
            Text(label)
                .font(.caption)
                .foregroundColor(.gray)
            TextField(label, text: $text)
//                .padding(10)
//                .background(Color.gray.opacity(0.1))
                .cornerRadius(10)
        }
        .padding(.horizontal)
    }
}

struct LabeledTextEditor: View {
    var label: String
    @Binding var text: String

    var body: some View {
        VStack(alignment: .leading) {
            Text(label)
                .font(.caption)
                .foregroundColor(.gray)
            TextEditor(text: $text)
                .padding(10)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(10)
                .frame(height: 100)
        }
        .padding(.horizontal)
    }
}

struct LabeledDatePicker: View {
    var label: String
    @Binding var date: Date

    var body: some View {
        VStack(alignment: .leading) {
            Text(label)
                .font(.caption)
                .foregroundColor(.gray)
            DatePicker("", selection: $date, displayedComponents: .date)
                .labelsHidden()
                .padding(10)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(10)
        }
        .padding(.horizontal)
    }
}

import SwiftUI

struct CardView<Content: View>: View {
    let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        VStack {
            content
        }
        .padding()
        .background(Color.gray.opacity(0.1))
        .cornerRadius(10)
        .shadow(radius: 5)
        .padding(.horizontal)
    }
}

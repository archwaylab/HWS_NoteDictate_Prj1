//
//  ContentView.swift
//  NoteDictate WatchKit Extension
//
//  Created by kimberly teich on 11/28/21.
//

import SwiftUI

struct ContentView: View {
    @State private var notes = [Note]()
    @State private var text = ""
    
    var body: some View {
        VStack {
//            List(notes){
//                note in Text(note.text)
//            }
            
            // if we care about the index we will need to loop
             List {
                 ForEach(0..<notes.count, id: \.self) { i in
                     NavigationLink(destination: DetailView(index: i, note: notes[i])) {
                         Text(notes[i].text)
                             .lineLimit(1)
                     }
                }
                 .onDelete(perform: delete)
            }
            
            HStack {
                TextField("Add new note", text: $text)
                Button {
                    guard text.isEmpty == false else { return }
                    
                    // this code represents a trailing closure
                    let note = Note(id: UUID(), text: text)
                    notes.append(note)
                    
                    text = ""
                } label: {
                    Image(systemName: "plus")
                        .padding()
                }
                .fixedSize()
                .buttonStyle(BorderedButtonStyle(tint: .blue))
            }
        }
        .navigationTitle("Note Dictate")
    }

    func delete(offsets: IndexSet){
        withAnimation {
            notes.remove(atOffsets: offsets)
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

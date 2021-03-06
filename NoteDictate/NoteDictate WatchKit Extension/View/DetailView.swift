//
//  DetailView.swift
//  NoteDictate WatchKit Extension
//
//  Created by kimberly teich on 11/28/21.
//

import SwiftUI

struct DetailView: View {
    let index: Int
    let note: Note
    
    var body: some View {
        Text(note.text)
            .navigationTitle("Note \(index + 1)")
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(index: 1, note: Note(id: UUID(), text: "Hello World"))
    }
}

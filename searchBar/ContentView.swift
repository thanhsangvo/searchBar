//
//  ContentView.swift
//  searchBar
//
//  Created by Võ Thanh Sang on 7/6/20.
//

import SwiftUI

struct ContentView: View {
    
    @State var datas = ["hello", "ahihi", "huhu", "sang", "lan"]
    @State var txt = ""
    var body: some View {
        
        VStack {
            
            searchView(txt: $txt)
            List(datas.filter{ txt == "" ? true : $0.localizedCaseInsensitiveContains(txt)}, id: \.self) { (i) in
                Text(i)
            }
           
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct searchView: UIViewRepresentable {
    
    @Binding var txt: String
    
    func makeCoordinator() -> Coordinator {
        return searchView.Coordinator(parent1: self)
    }
    
    typealias UIViewType = UIViewRepresentableContext
    
    func makeUIView(context: UIViewType<searchView>) -> UISearchBar {
        let searchBar = UISearchBar()
        searchBar.barStyle = .default
        searchBar.autocapitalizationType = .none
        searchBar.delegate = context.coordinator
        return searchBar
        
        
    }
    
    func updateUIView(_ uiView: UISearchBar, context: UIViewType<searchView>) {
        
    }
    
    class Coordinator: NSObject, UISearchBarDelegate {
        
        var parent: searchView!
        
        
        init(parent1: searchView) {
            self.parent = parent1
        }
        
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            parent.txt = searchText
        }
    }
}

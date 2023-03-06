//
//  NoteView.swift
//  cpaquiz
//
//  Created by yoonseop on 2023/03/01.
//

import SwiftUI
import Combine
import GoogleMobileAds

struct NoteView: View {
    
    @State private var showSearchView: Bool = false
    @State private var searchText: String = ""
    @State private var questionList = questions
    @State private var listHeaderTitle: String = "전체문제"
    @FocusState private var searchViewIsFocused: Bool
    
    var body: some View {
        NavigationView {
            VStack {
                GoogleAdBannerView()
                    .frame(
                        width: UIScreen.main.bounds.width,
                        height: GADPortraitAnchoredAdaptiveBannerAdSizeWithWidth(UIScreen.main.bounds.width).size.height
                    )
                
                if (showSearchView) {
                    TextField("문항, 내용", text: $searchText)
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.accentColor, lineWidth: 2)
                        )
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .focused($searchViewIsFocused)
                        .onReceive(Just(searchText)) { searched in
                            let filtered = filterQuestions(by: searched, from: questions)
                            
                            if (searched.isEmpty) {
                                listHeaderTitle = "전체문제"
                                questionList = questions
                            } else {
                                listHeaderTitle = "검색결과"
                                questionList = filtered
                            }
                        }
                        .onSubmit {
                            withAnimation(.spring()) {
                                showSearchView = false
                            }
                        }
                        .onAppear {
                            searchViewIsFocused = true
                        }
                }
                
                QuestionListView(
                    questionList: questionList,
                    listHeaderTitle: listHeaderTitle
                )
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Text("노트")
                            .font(.title)
                    }

                    ToolbarItemGroup(placement: .navigationBarTrailing) {
                        if (!searchText.isEmpty) {
                            Button("검색 초기화") {
                                searchText = ""
                                listHeaderTitle = "전체문제"
                                questionList = questions
                            }
                            .buttonStyle(.plain)
                            .padding(.vertical, 6)
                            .padding(.horizontal, 16)
                            .overlay(
                                RoundedRectangle(cornerRadius: 6)
                                    .stroke(.primary, lineWidth: 1)
                            )
                            .padding(.trailing, 8)
                        }
                    }
                    
                    ToolbarItemGroup(placement: .navigationBarTrailing) {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(showSearchView ? .accentColor : nil)
                            .onTapGesture {
                                withAnimation(.spring()) {
                                    showSearchView.toggle()
                                }
                            }
                    }
                }
                .navigationBarTitleDisplayMode(.inline)
            }
            
        }
    }
}

struct NoteView_Previews: PreviewProvider {
    static var previews: some View {
        NoteView()
    }
}

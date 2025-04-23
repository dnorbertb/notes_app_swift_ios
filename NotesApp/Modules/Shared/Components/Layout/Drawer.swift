//
//  Drawer.swift
//  NotesApp
//
//  Created by Norbert Bednarczyk
//  At fisrt I wanted to create this app with drawer
//  I created this reusable component but changed my mind
//  But I leave this component as a component demo


import SwiftUI

struct DrawerWrapper<Content: View, Screen: View>: View {
    @State private var screenWidth: CGFloat = 0
    
    @Binding var isOpen: Bool
    let drawerContent: () -> Content
    let screen: () -> Screen
   

    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Color.gray
                    .opacity(isOpen ? 0.5 : 0)
                    .zIndex(isOpen ? 1 : 0)
                    .onTapGesture {
                        withAnimation {
                            isOpen.toggle()
                        }
                }.ignoresSafeArea(.all)
                
                ZStack {
                    screen()
                }.frame(maxWidth: .infinity, maxHeight: .infinity)
                    .zIndex(isOpen ? 0 : 1)

                ZStack {
                    drawerContent()
                }.frame(
                    maxWidth: min(geometry.size.width * 0.8, 300),
                    maxHeight: .infinity,
                    alignment: .topLeading
                )
                .background(Color.white)
                .offset(x:isOpen ? 0 : -min(geometry.size.width * 0.8, 300))
                .zIndex(3)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .gesture(
                DragGesture().onChanged {
                    value in print("value \(value.translation.width)")
                }
            ).onAppear {
                screenWidth = geometry.size.width
            }
        }
    }
}

#Preview {
    struct PreviewWrapper: View {
        @State private var isOpen = false
        
        var body: some View {
            DrawerWrapper(
                isOpen: $isOpen,
                drawerContent: {
                    ZStack {
                        Color.brown
                            .frame(maxWidth:.infinity, maxHeight:.infinity)
                            .ignoresSafeArea().zIndex(0)
                        
                        VStack {
                            Text("Drawer Content")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .foregroundStyle(.white)
                                .font(.title)
                            
                            Button(action: {
                                print("Test")
                            }, label: {
                                Text("Button")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.vertical, 10)
                                    .padding(.horizontal, 10)
                                    .foregroundStyle(.white)
                                    .background(Color.blue)
                                    .cornerRadius(8)
                            })
                        }
                        .frame(
                            maxWidth: .infinity,
                            maxHeight: .infinity,
                            alignment: .topLeading
                        )
                        .padding(.horizontal, 16)
                        .zIndex(1)
                        
                    }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                },
                screen: {
                    VStack {
                        Text("Main screen content")
                            .font(.largeTitle)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Button("Open drawer") {
                            withAnimation {
                                isOpen.toggle()
                            }
                        }
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                        .frame(maxWidth:.infinity, alignment: .leading)
                        
                    }.frame(
                        maxWidth:.infinity,
                        maxHeight: .infinity,
                        alignment: .topLeading
                    )
                    .padding(.horizontal, 16)
                })
        }
    }
    
    return PreviewWrapper()
}

//
//  AboutMe.swift
//  Portfolio
//
//  Created by Ankur Gyawali on 11/13/23.

import SwiftUI

struct AboutMeView: View {
    // State variables for animations
    @State private var rotation: Double = 0
    @State private var nameOpacity: Double = 0
    @State private var socialLinksOpacity: Double = 0

    // Define some colors for your background gradient
    let gradientColors = Gradient(colors: [Color.blue.opacity(0.6), Color.green.opacity(0.6)])

    var body: some View {
        ZStack {
            // Background gradient
            LinearGradient(gradient: gradientColors, startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)

            ScrollView {
                VStack(alignment: .center, spacing: 20) {
                    // Profile Image
                    Image("profile_photo") // Replace with your image name
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 150, height: 150)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.white, lineWidth: 4))
                        .shadow(radius: 10) // Adds a shadow for depth
                        .scaleEffect(nameOpacity) // Apply dynamic scaling based on the opacity
                        .onAppear {
                            withAnimation(.easeInOut(duration: 1.5)) {
                                self.nameOpacity = 1.0
                            }
                        }

                    // Name with custom font and animation
                    Text("Ankur Gyawali")
                        .font(.system(size: 32, weight: .bold, design: .rounded))
                        .foregroundColor(.white)
                        .opacity(nameOpacity) // Apply opacity

                    // Contact Info
                    VStack(alignment: .leading, spacing: 10) {
                        ContactInfoRow(label: "Email", value: "ankur.gyawali@bison.howard.edu")
                        ContactInfoRow(label: "Address", value: "Washington, DC")
                        ContactInfoRow(label: "Age", value: "21")
                        ContactInfoRow(label: "Phone", value: "+1 (771) 201 - 4622")
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)

                    // Social Links
                    HStack(spacing: 30) {
                        SocialLink(imageName: "github_icon", url: "https://github.com/ankur9301")
                        SocialLink(imageName: "linkedin_icon", url: "https://www.linkedin.com/in/ankur-gyawali07/")
                        SocialLink(imageName: "resume_icon1", url: "https://drive.google.com/file/d/1yH907kzlquZ_2gu6s0xjSZ72DjMqWin-/view?usp=share_link")
                    }
                    .padding(.top, 10)
                    .opacity(socialLinksOpacity) // Apply opacity
                    .onAppear {
                        withAnimation(.spring()) {
                            self.socialLinksOpacity = 1.0
                        }
                    }
                }
                .padding(.top, 44)
            }
        }
        .navigationBarTitle("About Me", displayMode: .large)
    }
}

// Custom View for Contact Info Row
struct ContactInfoRow: View {
    var label: String
    var value: String

    var body: some View {
        HStack {
            Text("\(label):")
                .fontWeight(.semibold)
                .foregroundColor(.white)
            Text(value)
                .foregroundColor(.white.opacity(0.85))
        }
    }
}

// Custom View for Social Link with Animation
struct SocialLink: View {
    var imageName: String
    var url: String

    @State private var scale: CGFloat = 0.8 // Initial scale

    var body: some View {
        Link(destination: URL(string: url)!) {
            Image(imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40)
                .scaleEffect(scale) // Apply scale
                .onAppear {
                    withAnimation(.easeInOut(duration: 1.0).repeatForever(autoreverses: true)) {
                        self.scale = 1.2
                    }
                }
        }
    }
}

struct AboutMeView_Previews: PreviewProvider {
    static var previews: some View {
        AboutMeView()
    }
}


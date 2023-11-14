//
//  ProjectView.swift
//  Portfolio
//
//  Created by Ankur Gyawali on 11/14/23.
//


import SwiftUI

struct ProjectsView: View {
    // Define some colors for your background gradient
    let gradientColors = Gradient(colors: [Color.blue.opacity(0.6), Color.purple.opacity(0.6)])

    var body: some View {
        ZStack {
            // Background gradient
            LinearGradient(gradient: gradientColors, startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)

            // Main content
            ScrollView {
                VStack(alignment: .leading, spacing: 12) {
                    ProjectEntry(title: "Trivia App (Personal Project - iOS Development 101)",
                                 date: "Oct 2023",
                                 points: [
                                    "Developed an interactive trivia app in Swift and UIKit, with a responsive UI and integrated Open Trivia Database API using URLSession for data retrieval.",
                                    "Utilized Postman for network testing and leveraged the Decodable protocol for efficient data parsing and real-time progress tracking."
                                 ])
                    
                    ProjectEntry(title: "DonateMe (Civic Tech Hackathon), Boston University",
                                 date: "Feb 2023",
                                 points: [
                                    "Used Flutter to design a fundraising app enabling donors to track their contributions & supports needy students.",
                                    "Collaborated on development an ML algorithm to allocate unused funds towards other students’ bills."
                                 ])
                    
                    ProjectEntry(title: "College Thrift (Hack UMBC), University of Maryland Baltimore County",
                                 date: "Oct 2022",
                                 points: [
                                    "Created a secure Flutter-powered marketplace app with integrated college email verification, ensuring user safety and security, and achieved all project milestones on schedule.",
                                    "Attended 4+ workshops, acquiring foundational skills in developing & training ML models."
                                 ])
                }
                .padding(.horizontal)
                .padding(.top, 44)
                .frame(maxWidth: .infinity)
            }
        }
    }
}

struct ProjectEntry: View {
    var title: String
    var date: String
    var points: [String]

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.title2)
                .bold()
                .foregroundColor(.white)
                .padding(.top, 8)

            Text(date)
                .font(.headline)
                .foregroundColor(.white.opacity(0.85))

            ForEach(points, id: \.self) { point in
                Text("• \(point)")
                    .foregroundColor(.white)
                    .fixedSize(horizontal: false, vertical: true)
            }
        }
        .padding()
        .background(Color.black.opacity(0.3).cornerRadius(8))
        .transition(.asymmetric(insertion: .scale, removal: .opacity))
    }
}

struct ProjectsView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectsView()
    }
}



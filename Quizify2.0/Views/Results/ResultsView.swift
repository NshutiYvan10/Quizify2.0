//
//  ResultsView.swift
//  Quizify2.0
//
//  Created by Inyambo Auca on 31/07/2025.
//

//import SwiftUI
//
//// The ResultsView shows a detailed breakdown of the user's test scores.
//// It uses a tabbed interface to filter results.
//struct ResultsView: View {
//    // The ViewModel provides the test result data.
//    @StateObject private var viewModel = ResultsViewModel()
//    // State to manage the currently selected tab.
//    @State private var selectedTab: ResultTab = .recent
//
//    var body: some View {
//        ScrollView {
//            VStack(alignment: .leading, spacing: 25) {
//                // MARK: - Header and Tab Picker
//                HStack {
//                    VStack(alignment: .leading) {
//                        Text("My Results")
//                            .font(.system(size: 28, weight: .bold))
//                        Text("View your test results and performance analytics.")
//                            .font(.title3)
//                            .foregroundColor(.quizifyTextGray)
//                    }
//                    Spacer()
//                    Picker("Filter Results", selection: $selectedTab) {
//                        ForEach(ResultTab.allCases) { tab in
//                            Text(tab.rawValue).tag(tab)
//                        }
//                    }
//                    .pickerStyle(SegmentedPickerStyle())
//                    .frame(maxWidth: 400)
//                }
//                
//                // MARK: - Performance Summary
//                // A grid of stat cards summarizing overall performance.
//                LazyVGrid(columns: [GridItem(.adaptive(minimum: 300), spacing: 25)], spacing: 25) {
//                    StatCardView(title: "Average Score", value: "87%", description: "Across all tests", icon: "percent", trend: "+2% from last month", color: .quizifyPrimary)
//                    StatCardView(title: "Tests Completed", value: "24", description: "Out of 25 assigned", icon: "checkmark.circle.fill", trend: "96% completion rate", color: .quizifyAccentBlue)
//                    StatCardView(title: "Best Subject", value: "English", description: "95% average score", icon: "star.fill", trend: "Consistent performance", color: .quizifyAccentGreen)
//                }
//                .padding(.bottom, 10)
//
//
//                // MARK: - Results List
//                // The list of result cards, filtered by the selected tab.
//                VStack(spacing: 20) {
//                    let results = currentResults()
//                    if results.isEmpty {
//                        Text("No results to display in this category.")
//                            .foregroundColor(.gray)
//                            .font(.headline)
//                            .frame(maxWidth: .infinity, minHeight: 200)
//                    } else {
//                        ForEach(results) { result in
//                            ResultCardView(result: result)
//                        }
//                    }
//                }
//            }
//            .padding(30)
//        }
//    }
//    
//    // Helper function to return the correct data based on the selected tab.
//    private func currentResults() -> [TestResult] {
//        switch selectedTab {
//        case .recent:
//            return viewModel.recentResults
//        case .best:
//            return viewModel.bestResults
//        case .all:
//            return viewModel.allResults
//        }
//    }
//}
//
//// Enum to define the filter tabs for the results.
//enum ResultTab: String, CaseIterable, Identifiable {
//    case recent = "Recent"
//    case best = "Best Scores"
//    case all = "All Results"
//    var id: String { self.rawValue }
//}
//
//// MARK: - ResultCardView
//// A card for displaying the details of a single test result.
//struct ResultCardView: View {
//    let result: TestResult
//    
//    // Determines the color based on the score for visual feedback.
//    private var scoreColor: Color {
//        if result.score >= 90 { return .quizifyAccentGreen }
//        if result.score >= 80 { return .quizifyAccentBlue }
//        if result.score >= 70 { return .quizifyAccentYellow }
//        return .quizifyRedError
//    }
//
//    var body: some View {
//        VStack(alignment: .leading, spacing: 15) {
//            // MARK: Card Header
//            HStack {
//                VStack(alignment: .leading) {
//                    Text(result.title)
//                        .font(.title3)
//                        .fontWeight(.bold)
//                    Text(result.subject)
//                        .font(.headline)
//                        .foregroundColor(.quizifyTextGray)
//                }
//                Spacer()
//                Text(result.date)
//                    .font(.subheadline)
//                    .foregroundColor(.quizifyTextGray)
//            }
//            
//            Divider()
//            
//            // MARK: Score Details
//            HStack {
//                // Score
//                VStack {
//                    Text("Score")
//                        .font(.caption)
//                        .foregroundColor(.quizifyTextGray)
//                    Text("\(result.score)%")
//                        .font(.system(size: 32, weight: .bold))
//                        .foregroundColor(scoreColor)
//                }
//                .frame(maxWidth: .infinity)
//                
//                Divider()
//                
//                // Correct Answers
//                VStack {
//                    Text("Correct")
//                        .font(.caption)
//                        .foregroundColor(.quizifyTextGray)
//                    Text("\(result.correct)/\(result.total)")
//                        .font(.title2)
//                        .fontWeight(.bold)
//                }
//                .frame(maxWidth: .infinity)
//                
//                Divider()
//
//                // Class Average
//                VStack {
//                    Text("Class Avg.")
//                        .font(.caption)
//                        .foregroundColor(.quizifyTextGray)
//                    Text("\(result.classAverage)%")
//                        .font(.title2)
//                        .fontWeight(.bold)
//                }
//                .frame(maxWidth: .infinity)
//            }
//            
//            Divider()
//            
//            // MARK: Card Footer
//            HStack {
//                Label(result.teacher, systemImage: "person.fill")
//                    .font(.subheadline)
//                Spacer()
//                Button(action: {}) {
//                    Label("View Details", systemImage: "eye.fill")
//                }
//                .buttonStyle(.bordered)
//                .tint(scoreColor)
//            }
//            .foregroundColor(.quizifyTextGray)
//        }
//        .padding(20)
//        .background(Color.white)
//        .cornerRadius(16)
//        .shadow(color: .black.opacity(0.05), radius: 5)
//    }
//}
//
//// MARK: - Preview
//struct ResultsView_Previews: PreviewProvider {
//    static var previews: some View {
//        ResultsView()
//    }
//}











//import SwiftUI
//
//// The ResultsView shows a detailed breakdown of the user's test scores.
//// It uses a custom tabbed interface to filter results and a new card-based
//// layout for a more professional and modern feel, consistent with the rest
//// of the Quizify app.
//struct ResultsView: View {
//    // The ViewModel provides the test result data.
//    @StateObject private var viewModel = ResultsViewModel()
//    // State to manage the currently selected tab.
//    @State private var selectedTab: ResultTab = .recent
//
//    var body: some View {
//        ScrollView {
//            VStack(alignment: .leading, spacing: 30) {
//                // MARK: - Header
//                VStack(alignment: .leading) {
//                    Text("My Results")
//                        .font(.system(size: 28, weight: .bold))
//                    Text("View your test results and performance analytics.")
//                        .font(.title3)
//                        .foregroundColor(.quizifyTextGray)
//                }
//                
//                // MARK: - Performance Summary Metrics
//                // A new grid of five dynamically populated stat cards for a more balanced layout.
//                LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 25), count: 5), spacing: 25) {
//                    StatCardView(
//                        title: "Average Score",
//                        value: "\(viewModel.averageScore)%",
//                        description: "Overall performance",
//                        icon: "chart.bar.xaxis",
//                        trend: "All-time average",
//                        color: .quizifyAccentGreen
//                    )
//                    StatCardView(
//                        title: "Best Score",
//                        value: "\(viewModel.bestScore)%",
//                        description: "Highest score achieved",
//                        icon: "trophy.fill",
//                        trend: viewModel.bestScoreSubject,
//                        color: .quizifyAccentBlue
//                    )
//                    StatCardView(
//                        title: "Tests Taken",
//                        value: "\(viewModel.totalTests)",
//                        description: "Total number of tests",
//                        icon: "pencil.and.ruler.fill",
//                        trend: "Total to date",
//                        color: .quizifyPrimary
//                    )
//                    StatCardView(
//                        title: "Tests Passed",
//                        value: "\(viewModel.testsPassed)",
//                        description: "Tests with a score > 70%",
//                        icon: "checkmark.circle.fill",
//                        trend: "Good job!",
//                        color: .quizifyAccentGreen
//                    )
//                    StatCardView(
//                        title: "Pass Rate",
//                        value: "\(viewModel.passRate)%",
//                        description: "Percentage of tests passed",
//                        icon: "list.bullet.clipboard.fill",
//                        trend: "Keep the momentum",
//                        color: .quizifyAccentYellow
//                    )
//                }
//
//                // MARK: - Filter Tabs
//                // Custom tab view implementation to match the style of TestsView.
//                HStack {
//                    Spacer()
//                    HStack(spacing: 0) {
//                        ForEach(ResultTab.allCases) { tab in
//                            ResultTabButton(tab: tab, selectedTab: $selectedTab)
//                        }
//                    }
//                    .background(Color.quizifyPrimary.opacity(0.1))
//                    .cornerRadius(8)
//                    .frame(maxWidth: 600)
//                    Spacer()
//                }
//                
//                // MARK: - Results List
//                // The list of result cards, filtered by the selected tab.
//                VStack(spacing: 20) {
//                    let results = currentResults()
//                    if results.isEmpty {
//                        Text("No results to display in this category.")
//                            .foregroundColor(.gray)
//                            .font(.headline)
//                            .frame(maxWidth: .infinity, minHeight: 200)
//                    } else {
//                        ForEach(results) { result in
//                            ResultCardView(result: result)
//                        }
//                    }
//                }
//            }
//            .padding(30)
//        }
//    }
//    
//    // Helper function to return the correct data based on the selected tab.
//    private func currentResults() -> [TestResult] {
//        switch selectedTab {
//        case .recent:
//            return viewModel.recentResults
//        case .best:
//            return viewModel.bestResults
//        case .all:
//            return viewModel.allResults
//        }
//    }
//}
//
//// MARK: - ResultTabButton
//// A dedicated view for the custom tab buttons.
//struct ResultTabButton: View {
//    let tab: ResultTab
//    @Binding var selectedTab: ResultTab
//    
//    var body: some View {
//        Button(action: {
//            withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
//                selectedTab = tab
//            }
//        }) {
//            Text(tab.rawValue)
//                .font(.headline)
//                .fontWeight(.semibold)
//                .padding(.vertical, 12)
//                .frame(maxWidth: .infinity)
//                .background(
//                    ZStack {
//                        if selectedTab == tab {
//                            RoundedRectangle(cornerRadius: 8)
//                                .fill(tab.activeColor)
//                                .shadow(radius: 3, y: 2)
//                        }
//                    }
//                )
//                .foregroundColor(selectedTab == tab ? .white : .primary)
//        }
//        .buttonStyle(PlainButtonStyle())
//    }
//}
//
//// Enum to define the filter tabs for the results.
//enum ResultTab: String, CaseIterable, Identifiable {
//    case recent = "Recent"
//    case best = "Best Scores"
//    case all = "All Results"
//    var id: String { self.rawValue }
//    
//    var activeColor: Color {
//        switch self {
//        case .recent: return .quizifyPrimary
//        case .best: return .quizifyAccentBlue
//        case .all: return .quizifyAccentGreen
//        }
//    }
//}
//
//// MARK: - ResultCardView
//// A card for displaying the details of a single test result.
//struct ResultCardView: View {
//    let result: TestResult
//    
//    // Determines the color based on the score for visual feedback.
//    private var scoreColor: Color {
//        if result.score >= 90 { return .quizifyAccentGreen }
//        if result.score >= 80 { return .quizifyAccentBlue }
//        if result.score >= 70 { return .quizifyAccentYellow }
//        return .quizifyRedError
//    }
//
//    var body: some View {
//        VStack(alignment: .leading, spacing: 20) {
//            // MARK: Card Header
//            HStack {
//                VStack(alignment: .leading, spacing: 4) {
//                    Text(result.title)
//                        .font(.title2)
//                        .fontWeight(.bold)
//                    Text(result.subject)
//                        .font(.headline)
//                        .foregroundColor(.gray)
//                }
//                Spacer()
//                Text(result.date)
//                    .font(.subheadline)
//                    .foregroundColor(.quizifyTextGray)
//            }
//            
//            // MARK: Score Details with a circular progress ring.
//            HStack(spacing: 30) {
//                // Score Progress Ring
//                ZStack {
//                    Circle()
//                        .stroke(lineWidth: 10.0)
//                        .opacity(0.1)
//                        .foregroundColor(scoreColor)
//                    
//                    Circle()
//                        .trim(from: 0.0, to: CGFloat(result.score) / 100.0)
//                        .stroke(style: StrokeStyle(lineWidth: 10.0, lineCap: .round, lineJoin: .round))
//                        .foregroundColor(scoreColor)
//                        .rotationEffect(Angle(degrees: 270.0))
//
//                    Text("\(result.score)%")
//                        .font(.title).fontWeight(.bold)
//                        .foregroundColor(scoreColor)
//                }
//                .frame(width: 80, height: 80)
//                
//                // Other details arranged in a clean vertical stack.
//                VStack(alignment: .leading, spacing: 8) {
//                    ResultInfoRow(icon: "checkmark.circle.fill", label: "Correct Answers", value: "\(result.correct)/\(result.total)", color: .quizifyAccentGreen)
//                    ResultInfoRow(icon: "person.2.fill", label: "Class Average", value: "\(result.classAverage)%", color: .quizifyPrimary)
//                    ResultInfoRow(icon: "hourglass", label: "Duration", value: result.duration, color: .quizifyAccentYellow)
//                    ResultInfoRow(icon: "person.fill", label: "Teacher", value: result.teacher, color: .quizifyAccentBlue)
//                }
//                .frame(maxWidth: .infinity, alignment: .leading)
//            }
//            .padding(.vertical, 15)
//            
//            // MARK: Card Footer
//            HStack {
//                Spacer()
//                Button(action: {}) {
//                    Label("View Details", systemImage: "eye.fill")
//                        .fontWeight(.semibold)
//                        .frame(maxWidth: 200)
//                        .padding(.vertical, 10)
//                }
//                .buttonStyle(OutlineButtonStyle(color: .quizifyPrimary))
//            }
//        }
//        .padding(25)
//        .background(Color.white)
//        .cornerRadius(20)
//        .shadow(color: .black.opacity(0.05), radius: 10, x: 0, y: 5)
//    }
//}
//
//// A new helper view for a single row of result information.
//fileprivate struct ResultInfoRow: View {
//    let icon: String
//    let label: String
//    let value: String
//    let color: Color
//    
//    var body: some View {
//        HStack {
//            Image(systemName: icon)
//                .foregroundColor(color)
//                .frame(width: 25)
//            Text(label)
//                .font(.subheadline)
//                .foregroundColor(.quizifyTextGray)
//            Spacer()
//            Text(value)
//                .font(.headline)
//                .fontWeight(.bold)
//        }
//    }
//}
//
//// MARK: - Preview
//struct ResultsView_Previews: PreviewProvider {
//    static var previews: some View {
//        ResultsView()
//            .frame(width: 1400)
//            .background(Color.quizifyOffWhite)
//    }
//}









//import SwiftUI
//
//// The ResultsView shows a detailed breakdown of the user's test scores.
//// It uses a custom tabbed interface to filter results and a new card-based
//// layout for a more professional and modern feel, consistent with the rest
//// of the Quizify app.
//struct ResultsView: View {
//    // The ViewModel provides the test result data.
//    @StateObject private var viewModel = ResultsViewModel()
//    // State to manage the currently selected tab.
//    @State private var selectedTab: ResultTab = .recent
//
//    var body: some View {
//        ScrollView {
//            VStack(alignment: .leading, spacing: 30) {
//                // MARK: - Header
//                VStack(alignment: .leading) {
//                    Text("My Results")
//                        .font(.system(size: 28, weight: .bold))
//                    Text("View your test results and performance analytics.")
//                        .font(.title3)
//                        .foregroundColor(.quizifyTextGray)
//                }
//                
//                // MARK: - Performance Summary Metrics
//                // A new grid of five dynamically populated stat cards for a more balanced layout.
//                LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 25), count: 5), spacing: 25) {
//                    StatCardView(
//                        title: "Average Score",
//                        value: "\(viewModel.averageScore)%",
//                        description: "Overall performance",
//                        icon: "chart.bar.xaxis",
//                        trend: "All-time average",
//                        color: .quizifyAccentGreen
//                    )
//                    StatCardView(
//                        title: "Best Score",
//                        value: "\(viewModel.bestScore)%",
//                        description: "Highest score achieved",
//                        icon: "trophy.fill",
//                        trend: viewModel.bestScoreSubject,
//                        color: .quizifyAccentBlue
//                    )
//                    StatCardView(
//                        title: "Tests Taken",
//                        value: "\(viewModel.totalTests)",
//                        description: "Total number of tests",
//                        icon: "pencil.and.ruler.fill",
//                        trend: "Total to date",
//                        color: .quizifyPrimary
//                    )
//                    StatCardView(
//                        title: "Tests Passed",
//                        value: "\(viewModel.testsPassed)",
//                        description: "Tests with a score > 70%",
//                        icon: "checkmark.circle.fill",
//                        trend: "Good job!",
//                        color: .quizifyAccentGreen
//                    )
//                    StatCardView(
//                        title: "Pass Rate",
//                        value: "\(viewModel.passRate)%",
//                        description: "Percentage of tests passed",
//                        icon: "list.bullet.clipboard.fill",
//                        trend: "Keep the momentum",
//                        color: .quizifyAccentYellow
//                    )
//                }
//
//                // MARK: - Filter Tabs
//                // Custom tab view implementation to match the style of TestsView.
//                HStack {
//                    Spacer()
//                    HStack(spacing: 0) {
//                        ForEach(ResultTab.allCases) { tab in
//                            ResultTabButton(tab: tab, selectedTab: $selectedTab)
//                        }
//                    }
//                    .background(Color.quizifyPrimary.opacity(0.1))
//                    .cornerRadius(8)
//                    .frame(maxWidth: 600)
//                    Spacer()
//                }
//                
//                // MARK: - Results List
//                // The list of result cards, filtered by the selected tab.
//                VStack(spacing: 20) {
//                    let results = currentResults()
//                    if results.isEmpty {
//                        Text("No results to display in this category.")
//                            .foregroundColor(.gray)
//                            .font(.headline)
//                            .frame(maxWidth: .infinity, minHeight: 200)
//                    } else {
//                        ForEach(results) { result in
//                            ResultCardView(result: result)
//                        }
//                    }
//                }
//            }
//            .padding(30)
//        }
//    }
//    
//    // Helper function to return the correct data based on the selected tab.
//    private func currentResults() -> [TestResult] {
//        switch selectedTab {
//        case .recent:
//            return viewModel.recentResults
//        case .best:
//            return viewModel.bestResults
//        case .all:
//            return viewModel.allResults
//        }
//    }
//}
//
//// MARK: - ResultTabButton
//// A dedicated view for the custom tab buttons.
//struct ResultTabButton: View {
//    let tab: ResultTab
//    @Binding var selectedTab: ResultTab
//    
//    var body: some View {
//        Button(action: {
//            withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
//                selectedTab = tab
//            }
//        }) {
//            Text(tab.rawValue)
//                .font(.headline)
//                .fontWeight(.semibold)
//                .padding(.vertical, 12)
//                .frame(maxWidth: .infinity)
//                .background(
//                    ZStack {
//                        if selectedTab == tab {
//                            RoundedRectangle(cornerRadius: 8)
//                                .fill(tab.activeColor)
//                                .shadow(radius: 3, y: 2)
//                        }
//                    }
//                )
//                .foregroundColor(selectedTab == tab ? .white : .primary)
//        }
//        .buttonStyle(PlainButtonStyle())
//    }
//}
//
//// Enum to define the filter tabs for the results.
//enum ResultTab: String, CaseIterable, Identifiable {
//    case recent = "Recent"
//    case best = "Best Scores"
//    case all = "All Results"
//    var id: String { self.rawValue }
//    
//    var activeColor: Color {
//        switch self {
//        case .recent: return .quizifyPrimary
//        case .best: return .quizifyAccentBlue
//        case .all: return .quizifyAccentGreen
//        }
//    }
//}
//
//// MARK: - ResultCardView
//// A card for displaying the details of a single test result.
//struct ResultCardView: View {
//    let result: TestResult
//    
//    // Determines the color based on the score for visual feedback.
//    private var scoreColor: Color {
//        if result.score >= 90 { return .quizifyAccentGreen }
//        if result.score >= 80 { return .quizifyAccentBlue }
//        if result.score >= 70 { return .quizifyAccentYellow }
//        return .quizifyRedError
//    }
//
//    var body: some View {
//        HStack(alignment: .top, spacing: 25) {
//            // MARK: - Score Chart
//            // The existing circular score chart is kept, but with updated spacing and colors.
//            VStack {
//                ZStack {
//                    Circle()
//                        .stroke(lineWidth: 10.0)
//                        .opacity(0.1)
//                        .foregroundColor(scoreColor)
//                    
//                    Circle()
//                        .trim(from: 0.0, to: CGFloat(result.score) / 100.0)
//                        .stroke(style: StrokeStyle(lineWidth: 10.0, lineCap: .round, lineJoin: .round))
//                        .foregroundColor(scoreColor)
//                        .rotationEffect(Angle(degrees: 270.0))
//
//                    Text("\(result.score)%")
//                        .font(.system(size: 28, weight: .bold))
//                        .foregroundColor(scoreColor)
//                }
//                .frame(width: 100, height: 100)
//                
//                Text("Your Score")
//                    .font(.caption)
//                    .fontWeight(.semibold)
//                    .foregroundColor(.quizifyTextGray)
//            }
//            
//            // MARK: - Test Info and Details
//            // This section is redesigned for a much cleaner layout.
//            VStack(alignment: .leading, spacing: 10) {
//                // Main Test Title and Subject
//                VStack(alignment: .leading) {
//                    Text(result.title)
//                        .font(.title2)
//                        .fontWeight(.bold)
//                    Text(result.subject)
//                        .font(.headline)
//                        .foregroundColor(.gray)
//                }
//                
//                Divider()
//                
//                // Details Grid for key info
//                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], alignment: .leading, spacing: 10) {
//                    ResultInfoRow(icon: "book.closed.fill", label: "Class", value: result.className)
//                    ResultInfoRow(icon: "person.fill", label: "Teacher", value: result.teacher)
//                    ResultInfoRow(icon: "calendar", label: "Date", value: result.date)
//                    ResultInfoRow(icon: "hourglass", label: "Duration", value: result.duration)
//                }
//            }
//            .frame(maxWidth: .infinity, alignment: .leading)
//            
//            Spacer()
//            
//            // MARK: - Score Breakdown and Action Button
//            // A dedicated section for a call to action and score metrics.
//            VStack(alignment: .trailing, spacing: 20) {
//                VStack(alignment: .trailing) {
//                    Text("Correct Answers")
//                        .font(.caption)
//                        .foregroundColor(.quizifyTextGray)
//                    Text("\(result.correct) / \(result.total)")
//                        .font(.title2)
//                        .fontWeight(.bold)
//                        .foregroundColor(.quizifyAccentGreen)
//                }
//                
//                VStack(alignment: .trailing) {
//                    Text("Class Average")
//                        .font(.caption)
//                        .foregroundColor(.quizifyTextGray)
//                    Text("\(result.classAverage)%")
//                        .font(.title2)
//                        .fontWeight(.bold)
//                }
//                
//                Spacer()
//                
//                Button(action: {}) {
//                    Label("View Details", systemImage: "eye.fill")
//                        .fontWeight(.semibold)
//                        .frame(maxWidth: 200)
//                        .padding(.vertical, 10)
//                }
//                .buttonStyle(OutlineButtonStyle(color: .quizifyPrimary))
//            }
//        }
//        .padding(25)
//        .background(Color.white)
//        .cornerRadius(20)
//        .shadow(color: .black.opacity(0.05), radius: 10, x: 0, y: 5)
//    }
//}
//
//// A new helper view for a single row of result information.
//fileprivate struct ResultInfoRow: View {
//    let icon: String
//    let label: String
//    let value: String
//    
//    var body: some View {
//        HStack {
//            Image(systemName: icon)
//                .foregroundColor(.quizifyPrimary)
//                .frame(width: 20)
//            Text(label)
//                .font(.subheadline)
//                .foregroundColor(.quizifyTextGray)
//            Spacer()
//            Text(value)
//                .font(.headline)
//                .fontWeight(.medium)
//        }
//    }
//}
//
//// MARK: - Preview
//struct ResultsView_Previews: PreviewProvider {
//    static var previews: some View {
//        ResultsView()
//            .frame(width: 1400)
//            .background(Color.quizifyOffWhite)
//    }
//}






//import SwiftUI
//
//// The ResultsView shows a detailed breakdown of the user's test scores.
//// It uses a custom tabbed interface to filter results and a new card-based
//// layout for a more professional and modern feel, consistent with the rest
//// of the Quizify app.
//struct ResultsView: View {
//    // The ViewModel provides the test result data.
//    @StateObject private var viewModel = ResultsViewModel()
//    // State to manage the currently selected tab.
//    @State private var selectedTab: ResultTab = .recent
//
//    var body: some View {
//        ScrollView {
//            VStack(alignment: .leading, spacing: 30) {
//                // MARK: - Header
//                VStack(alignment: .leading) {
//                    Text("My Results")
//                        .font(.system(size: 28, weight: .bold))
//                    Text("View your test results and performance analytics.")
//                        .font(.title3)
//                        .foregroundColor(.quizifyTextGray)
//                }
//                
//                // MARK: - Performance Summary Metrics
//                // A new grid of five dynamically populated stat cards for a more balanced layout.
//                LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 25), count: 5), spacing: 25) {
//                    StatCardView(
//                        title: "Average Score",
//                        value: "\(viewModel.averageScore)%",
//                        description: "Overall performance",
//                        icon: "chart.bar.xaxis",
//                        trend: "All-time average",
//                        color: .quizifyAccentGreen
//                    )
//                    StatCardView(
//                        title: "Best Score",
//                        value: "\(viewModel.bestScore)%",
//                        description: "Highest score achieved",
//                        icon: "trophy.fill",
//                        trend: viewModel.bestScoreSubject,
//                        color: .quizifyAccentBlue
//                    )
//                    StatCardView(
//                        title: "Tests Taken",
//                        value: "\(viewModel.totalTests)",
//                        description: "Total number of tests",
//                        icon: "pencil.and.ruler.fill",
//                        trend: "Total to date",
//                        color: .quizifyPrimary
//                    )
//                    StatCardView(
//                        title: "Tests Passed",
//                        value: "\(viewModel.testsPassed)",
//                        description: "Tests with a score > 70%",
//                        icon: "checkmark.circle.fill",
//                        trend: "Good job!",
//                        color: .quizifyAccentGreen
//                    )
//                    StatCardView(
//                        title: "Pass Rate",
//                        value: "\(viewModel.passRate)%",
//                        description: "Percentage of tests passed",
//                        icon: "list.bullet.clipboard.fill",
//                        trend: "Keep the momentum",
//                        color: .quizifyAccentYellow
//                    )
//                }
//
//                // MARK: - Filter Tabs
//                // Custom tab view implementation to match the style of TestsView.
//                HStack {
//                    Spacer()
//                    HStack(spacing: 0) {
//                        ForEach(ResultTab.allCases) { tab in
//                            ResultTabButton(tab: tab, selectedTab: $selectedTab)
//                        }
//                    }
//                    .background(Color.quizifyPrimary.opacity(0.1))
//                    .cornerRadius(8)
//                    .frame(maxWidth: 600)
//                    Spacer()
//                }
//                
//                // MARK: - Results List
//                // The list of result cards, filtered by the selected tab.
//                VStack(spacing: 20) {
//                    let results = currentResults()
//                    if results.isEmpty {
//                        Text("No results to display in this category.")
//                            .foregroundColor(.gray)
//                            .font(.headline)
//                            .frame(maxWidth: .infinity, minHeight: 200)
//                    } else {
//                        ForEach(results) { result in
//                            ResultCardView(result: result)
//                        }
//                    }
//                }
//            }
//            .padding(30)
//        }
//    }
//    
//    // Helper function to return the correct data based on the selected tab.
//    private func currentResults() -> [TestResult] {
//        switch selectedTab {
//        case .recent:
//            return viewModel.recentResults
//        case .best:
//            return viewModel.bestResults
//        case .all:
//            return viewModel.allResults
//        }
//    }
//}
//
//// MARK: - ResultTabButton
//// A dedicated view for the custom tab buttons.
//struct ResultTabButton: View {
//    let tab: ResultTab
//    @Binding var selectedTab: ResultTab
//    
//    var body: some View {
//        Button(action: {
//            withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
//                selectedTab = tab
//            }
//        }) {
//            Text(tab.rawValue)
//                .font(.headline)
//                .fontWeight(.semibold)
//                .padding(.vertical, 12)
//                .frame(maxWidth: .infinity)
//                .background(
//                    ZStack {
//                        if selectedTab == tab {
//                            RoundedRectangle(cornerRadius: 8)
//                                .fill(tab.activeColor)
//                                .shadow(radius: 3, y: 2)
//                        }
//                    }
//                )
//                .foregroundColor(selectedTab == tab ? .white : .primary)
//        }
//        .buttonStyle(PlainButtonStyle())
//    }
//}
//
//// Enum to define the filter tabs for the results.
//enum ResultTab: String, CaseIterable, Identifiable {
//    case recent = "Recent"
//    case best = "Best Scores"
//    case all = "All Results"
//    var id: String { self.rawValue }
//    
//    var activeColor: Color {
//        switch self {
//        case .recent: return .quizifyPrimary
//        case .best: return .quizifyAccentBlue
//        case .all: return .quizifyAccentGreen
//        }
//    }
//}
//
//// MARK: - ResultCardView
//// A card for displaying the details of a single test result.
//struct ResultCardView: View {
//    let result: TestResult
//    
//    // Determines the color based on the score for visual feedback.
//    private var scoreColor: Color {
//        if result.score >= 90 { return .quizifyAccentGreen }
//        if result.score >= 80 { return .quizifyAccentBlue }
//        if result.score >= 70 { return .quizifyAccentYellow }
//        return .quizifyRedError
//    }
//
//    var body: some View {
//        VStack(alignment: .leading, spacing: 20) {
//            // MARK: Card Header
//            // The title and subject are now more prominent for better legibility.
//            VStack(alignment: .leading, spacing: 5) {
//                Text(result.title)
//                    .font(.system(size: 22, weight: .bold))
//                Text(result.subject)
//                    .font(.system(size: 17))
//                    .foregroundColor(.gray)
//            }
//            
//            Divider()
//            
//            // MARK: Score & Metrics Section
//            // This section uses an HStack with a divider to visually separate the score from other details.
//            HStack(spacing: 20) {
//                // Circular Score Chart
//                VStack(spacing: 5) {
//                    ZStack {
//                        Circle()
//                            .stroke(lineWidth: 10.0)
//                            .opacity(0.1)
//                            .foregroundColor(scoreColor)
//                        
//                        Circle()
//                            .trim(from: 0.0, to: CGFloat(result.score) / 100.0)
//                            .stroke(style: StrokeStyle(lineWidth: 10.0, lineCap: .round, lineJoin: .round))
//                            .foregroundColor(scoreColor)
//                            .rotationEffect(Angle(degrees: 270.0))
//                            .animation(.linear(duration: 1.0), value: result.score)
//
//                        Text("\(result.score)%")
//                            .font(.system(size: 24, weight: .bold))
//                            .foregroundColor(scoreColor)
//                    }
//                    .frame(width: 80, height: 80)
//                    
//                    Text("Your Score")
//                        .font(.caption)
//                        .fontWeight(.semibold)
//                        .foregroundColor(.quizifyTextGray)
//                }
//                
//                Divider()
//                    .frame(height: 100)
//                
//                // Key Metrics
//                // This section is a grid to prevent content from stretching and to maintain a clean layout.
//                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], alignment: .leading, spacing: 10) {
//                    ResultSummaryItem(icon: "checkmark.circle.fill", label: "Correct Answers", value: "\(result.correct) / \(result.total)")
//                    ResultSummaryItem(icon: "person.2.fill", label: "Class Average", value: "\(result.classAverage)%")
//                    ResultSummaryItem(icon: "hourglass", label: "Duration", value: result.duration)
//                    ResultSummaryItem(icon: "calendar", label: "Date", value: result.date)
//                }
//                .frame(maxWidth: .infinity, alignment: .leading)
//            }
//            
//            Divider()
//            
//            // MARK: Footer with Teacher Info and Action Button
//            HStack {
//                // Teacher Info is now more prominent and visually consistent.
//                HStack(spacing: 10) {
//                    AsyncImage(url: URL(string: result.teacherAvatar ?? "")) { image in
//                        image.resizable().clipShape(Circle())
//                    } placeholder: {
//                        Image(systemName: "person.crop.circle.fill").resizable()
//                    }
//                    .frame(width: 30, height: 30)
//                    
//                    Text(result.teacher)
//                        .font(.headline)
//                        .foregroundColor(.quizifyTextGray)
//                }
//                
//                Spacer()
//                
//                // Action Button styled to match the app's theme.
//                Button(action: {}) {
//                    Label("View Details", systemImage: "eye.fill")
//                        .fontWeight(.semibold)
//                        .padding(.vertical, 10)
//                        .frame(maxWidth: 200)
//                }
//                .buttonStyle(OutlineButtonStyle(color: .quizifyPrimary))
//            }
//        }
//        .padding(25)
//        .background(Color.white)
//        .cornerRadius(20)
//        .shadow(color: .black.opacity(0.05), radius: 10, x: 0, y: 5)
//    }
//}
//
//// A reusable sub-view to display a key metric within the card.
//fileprivate struct ResultSummaryItem: View {
//    let icon: String
//    let label: String
//    let value: String
//    
//    var body: some View {
//        HStack {
//            Image(systemName: icon)
//                .foregroundColor(.quizifyPrimary)
//                .frame(width: 20)
//            VStack(alignment: .leading, spacing: 2) {
//                Text(label)
//                    .font(.caption)
//                    .foregroundColor(.quizifyTextGray)
//                Text(value)
//                    .font(.headline)
//                    .fontWeight(.medium)
//            }
//        }
//    }
//}
//
//// MARK: - Preview
//struct ResultsView_Previews: PreviewProvider {
//    static var previews: some View {
//        ResultsView()
//            .frame(width: 1400)
//            .background(Color.quizifyOffWhite)
//    }
//}





// karagerageza

//import SwiftUI
//
//// The ResultsView shows a detailed breakdown of the user's test scores.
//// It uses a custom tabbed interface to filter results and a new card-based
//// layout for a more professional and modern feel, consistent with the rest
//// of the Quizify app.
//struct ResultsView: View {
//    // The ViewModel provides the test result data.
//    @StateObject private var viewModel = ResultsViewModel()
//    // State to manage the currently selected tab.
//    @State private var selectedTab: ResultTab = .recent
//
//    var body: some View {
//        ScrollView {
//            VStack(alignment: .leading, spacing: 30) {
//                // MARK: - Header
//                VStack(alignment: .leading) {
//                    Text("My Results")
//                        .font(.system(size: 28, weight: .bold))
//                    Text("View your test results and performance analytics.")
//                        .font(.title3)
//                        .foregroundColor(.quizifyTextGray)
//                }
//                
//                // MARK: - Performance Summary Metrics
//                // A new grid of five dynamically populated stat cards for a more balanced layout.
//                LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 25), count: 5), spacing: 25) {
//                    StatCardView(
//                        title: "Average Score",
//                        value: "\(viewModel.averageScore)%",
//                        description: "Overall performance",
//                        icon: "chart.bar.xaxis",
//                        trend: "All-time average",
//                        color: .quizifyAccentGreen
//                    )
//                    StatCardView(
//                        title: "Best Score",
//                        value: "\(viewModel.bestScore)%",
//                        description: "Highest score achieved",
//                        icon: "trophy.fill",
//                        trend: viewModel.bestScoreSubject,
//                        color: .quizifyAccentBlue
//                    )
//                    StatCardView(
//                        title: "Tests Taken",
//                        value: "\(viewModel.totalTests)",
//                        description: "Total number of tests",
//                        icon: "pencil.and.ruler.fill",
//                        trend: "Total to date",
//                        color: .quizifyPrimary
//                    )
//                    StatCardView(
//                        title: "Tests Passed",
//                        value: "\(viewModel.testsPassed)",
//                        description: "Tests with a score > 70%",
//                        icon: "checkmark.circle.fill",
//                        trend: "Good job!",
//                        color: .quizifyAccentGreen
//                    )
//                    StatCardView(
//                        title: "Pass Rate",
//                        value: "\(viewModel.passRate)%",
//                        description: "Percentage of tests passed",
//                        icon: "list.bullet.clipboard.fill",
//                        trend: "Keep the momentum",
//                        color: .quizifyAccentYellow
//                    )
//                }
//
//                // MARK: - Filter Tabs
//                // Custom tab view implementation to match the style of TestsView.
//                HStack {
//                    Spacer()
//                    HStack(spacing: 0) {
//                        ForEach(ResultTab.allCases) { tab in
//                            ResultTabButton(tab: tab, selectedTab: $selectedTab)
//                        }
//                    }
//                    .background(Color.quizifyPrimary.opacity(0.1))
//                    .cornerRadius(8)
//                    .frame(maxWidth: 600)
//                    Spacer()
//                }
//                
//                // MARK: - Results List
//                // The list of result cards, filtered by the selected tab.
//                VStack(spacing: 20) {
//                    let results = currentResults()
//                    if results.isEmpty {
//                        Text("No results to display in this category.")
//                            .foregroundColor(.gray)
//                            .font(.headline)
//                            .frame(maxWidth: .infinity, minHeight: 200)
//                    } else {
//                        ForEach(results) { result in
//                            ResultCardView(result: result)
//                        }
//                    }
//                }
//            }
//            .padding(30)
//        }
//    }
//    
//    // Helper function to return the correct data based on the selected tab.
//    private func currentResults() -> [TestResult] {
//        switch selectedTab {
//        case .recent:
//            return viewModel.recentResults
//        case .best:
//            return viewModel.bestResults
//        case .all:
//            return viewModel.allResults
//        }
//    }
//}
//
//// MARK: - ResultTabButton
//// A dedicated view for the custom tab buttons.
//struct ResultTabButton: View {
//    let tab: ResultTab
//    @Binding var selectedTab: ResultTab
//    
//    var body: some View {
//        Button(action: {
//            withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
//                selectedTab = tab
//            }
//        }) {
//            Text(tab.rawValue)
//                .font(.headline)
//                .fontWeight(.semibold)
//                .padding(.vertical, 12)
//                .frame(maxWidth: .infinity)
//                .background(
//                    ZStack {
//                        if selectedTab == tab {
//                            RoundedRectangle(cornerRadius: 8)
//                                .fill(tab.activeColor)
//                                .shadow(radius: 3, y: 2)
//                        }
//                    }
//                )
//                .foregroundColor(selectedTab == tab ? .white : .primary)
//        }
//        .buttonStyle(PlainButtonStyle())
//    }
//}
//
//// Enum to define the filter tabs for the results.
//enum ResultTab: String, CaseIterable, Identifiable {
//    case recent = "Recent"
//    case best = "Best Scores"
//    case all = "All Results"
//    var id: String { self.rawValue }
//    
//    var activeColor: Color {
//        switch self {
//        case .recent: return .quizifyPrimary
//        case .best: return .quizifyAccentBlue
//        case .all: return .quizifyAccentGreen
//        }
//    }
//}
//
//// MARK: - ResultCardView
//// A card for displaying the details of a single test result.
//struct ResultCardView: View {
//    let result: TestResult
//    
//    // Determines the color based on the score for visual feedback.
//    private var scoreColor: Color {
//        if result.score >= 90 { return .quizifyAccentGreen }
//        if result.score >= 80 { return .quizifyAccentBlue }
//        if result.score >= 70 { return .quizifyAccentYellow }
//        return .quizifyRedError
//    }
//
//    var body: some View {
//        HStack(alignment: .top, spacing: 25) {
//            // MARK: Score Section
//            // This section is now a fixed-width container to prevent stretching.
//            VStack(spacing: 5) {
//                ZStack {
//                    Circle()
//                        .stroke(lineWidth: 10.0)
//                        .opacity(0.1)
//                        .foregroundColor(scoreColor)
//                    
//                    Circle()
//                        .trim(from: 0.0, to: CGFloat(result.score) / 100.0)
//                        .stroke(style: StrokeStyle(lineWidth: 10.0, lineCap: .round, lineJoin: .round))
//                        .foregroundColor(scoreColor)
//                        .rotationEffect(Angle(degrees: 270.0))
//                        .animation(.linear(duration: 1.0), value: result.score)
//
//                    Text("\(result.score)%")
//                        .font(.system(size: 32, weight: .bold))
//                        .foregroundColor(scoreColor)
//                }
//                .frame(width: 100, height: 100)
//                
//                Text("Your Score")
//                    .font(.caption)
//                    .fontWeight(.semibold)
//                    .foregroundColor(.quizifyTextGray)
//            }
//            .frame(width: 120) // Fixed width for consistent layout
//            
//            // A vertical divider to visually separate the score from the metrics.
//            Divider()
//                .frame(height: 120)
//
//            // MARK: Metrics and Footer Section
//            VStack(alignment: .leading, spacing: 20) {
//                // Main Test Title and Subject
//                VStack(alignment: .leading, spacing: 5) {
//                    Text(result.title)
//                        .font(.title2)
//                        .fontWeight(.bold)
//                    Text(result.subject)
//                        .font(.headline)
//                        .foregroundColor(.gray)
//                }
//                .frame(maxWidth: .infinity, alignment: .leading)
//                
//                Divider()
//
//                // Key Metrics
//                // This section uses a cross-divider layout similar to the TestsView for a clean, organized look.
//                HStack {
//                    ZStack {
//                        Rectangle().fill(Color.gray.opacity(0.15)).frame(width: 1)
//                        Rectangle().fill(Color.gray.opacity(0.15)).frame(height: 1)
//
//                        VStack(spacing: 15) {
//                            HStack(spacing: 20) {
//                                ResultSummaryItem(icon: "checkmark.circle.fill", label: "Correct Answers", value: "\(result.correct) / \(result.total)")
//                                    .frame(maxWidth: .infinity, alignment: .leading)
//                                ResultSummaryItem(icon: "person.2.fill", label: "Class Average", value: "\(result.classAverage)%")
//                                    .frame(maxWidth: .infinity, alignment: .leading)
//                            }
//                            HStack(spacing: 20) {
//                                ResultSummaryItem(icon: "hourglass", label: "Duration", value: result.duration)
//                                    .frame(maxWidth: .infinity, alignment: .leading)
//                                ResultSummaryItem(icon: "calendar", label: "Date", value: result.date)
//                                    .frame(maxWidth: .infinity, alignment: .leading)
//                            }
//                        }
//                    }
//                }
//                .padding()
//                .background(Color.gray.opacity(0.05))
//                .cornerRadius(12)
//                
//                // Footer with Teacher Info and Action Button
//                HStack {
//                    // Teacher Info
//                    HStack(spacing: 10) {
//                        AsyncImage(url: URL(string: result.teacherAvatar ?? "")) { image in
//                            image.resizable().clipShape(Circle())
//                        } placeholder: {
//                            Image(systemName: "person.crop.circle.fill").resizable()
//                        }
//                        .frame(width: 30, height: 30)
//                        
//                        Text(result.teacher)
//                            .font(.headline)
//                            .foregroundColor(.quizifyTextGray)
//                    }
//                    
//                    Spacer()
//                    
//                    // Action Button styled to match the app's theme.
//                    Button(action: {}) {
//                        Label("View Details", systemImage: "eye.fill")
//                            .fontWeight(.semibold)
//                            .padding(.vertical, 10)
//                            .frame(minWidth: 150)
//                    }
//                    .buttonStyle(OutlineButtonStyle(color: .quizifyPrimary))
//                }
//            }
//        }
//        .padding(25)
//        .background(Color.white)
//        .cornerRadius(20)
//        .shadow(color: .black.opacity(0.05), radius: 10, x: 0, y: 5)
//    }
//}
//
//// A reusable sub-view to display a key metric within the card.
//fileprivate struct ResultSummaryItem: View {
//    let icon: String
//    let label: String
//    let value: String
//    
//    var body: some View {
//        HStack {
//            Image(systemName: icon)
//                .foregroundColor(.quizifyPrimary)
//                .frame(width: 20)
//            VStack(alignment: .leading, spacing: 2) {
//                Text(label)
//                    .font(.caption)
//                    .foregroundColor(.quizifyTextGray)
//                Text(value)
//                    .font(.headline)
//                    .fontWeight(.medium)
//            }
//        }
//    }
//}
//
//// MARK: - Preview
//struct ResultsView_Previews: PreviewProvider {
//    static var previews: some View {
//        ResultsView()
//            .frame(width: 1400)
//            .background(Color.quizifyOffWhite)
//    }
//}







//import SwiftUI
//
//// The ResultsView shows a detailed breakdown of the user's test scores.
//// It uses a custom tabbed interface to filter results and a new card-based
//// layout for a more professional and modern feel, consistent with the rest
//// of the Quizify app.
//struct ResultsView: View {
//    // The ViewModel provides the test result data.
//    @StateObject private var viewModel = ResultsViewModel()
//    // State to manage the currently selected tab.
//    @State private var selectedTab: ResultTab = .recent
//
//    var body: some View {
//        ScrollView {
//            VStack(alignment: .leading, spacing: 30) {
//                // MARK: - Header
//                VStack(alignment: .leading) {
//                    Text("My Results")
//                        .font(.system(size: 28, weight: .bold))
//                    Text("View your test results and performance analytics.")
//                        .font(.title3)
//                        .foregroundColor(.quizifyTextGray)
//                }
//                
//                // MARK: - Performance Summary Metrics
//                // A new grid of five dynamically populated stat cards for a more balanced layout.
//                LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 25), count: 5), spacing: 25) {
//                    StatCardView(
//                        title: "Average Score",
//                        value: "\(viewModel.averageScore)%",
//                        description: "Overall performance",
//                        icon: "chart.bar.xaxis",
//                        trend: "All-time average",
//                        color: .quizifyAccentGreen
//                    )
//                    StatCardView(
//                        title: "Best Score",
//                        value: "\(viewModel.bestScore)%",
//                        description: "Highest score achieved",
//                        icon: "trophy.fill",
//                        trend: viewModel.bestScoreSubject,
//                        color: .quizifyAccentBlue
//                    )
//                    StatCardView(
//                        title: "Tests Taken",
//                        value: "\(viewModel.totalTests)",
//                        description: "Total number of tests",
//                        icon: "pencil.and.ruler.fill",
//                        trend: "Total to date",
//                        color: .quizifyPrimary
//                    )
//                    StatCardView(
//                        title: "Tests Passed",
//                        value: "\(viewModel.testsPassed)",
//                        description: "Tests with a score > 70%",
//                        icon: "checkmark.circle.fill",
//                        trend: "Good job!",
//                        color: .quizifyAccentGreen
//                    )
//                    StatCardView(
//                        title: "Pass Rate",
//                        value: "\(viewModel.passRate)%",
//                        description: "Percentage of tests passed",
//                        icon: "list.bullet.clipboard.fill",
//                        trend: "Keep the momentum",
//                        color: .quizifyAccentYellow
//                    )
//                }
//
//                // MARK: - Filter Tabs
//                // Custom tab view implementation to match the style of TestsView.
//                HStack {
//                    Spacer()
//                    HStack(spacing: 0) {
//                        ForEach(ResultTab.allCases) { tab in
//                            ResultTabButton(tab: tab, selectedTab: $selectedTab)
//                        }
//                    }
//                    .background(Color.quizifyPrimary.opacity(0.1))
//                    .cornerRadius(8)
//                    .frame(maxWidth: 600)
//                    Spacer()
//                }
//                
//                // MARK: - Results List
//                // The list of result cards, filtered by the selected tab.
//                VStack(spacing: 20) {
//                    let results = currentResults()
//                    if results.isEmpty {
//                        Text("No results to display in this category.")
//                            .foregroundColor(.gray)
//                            .font(.headline)
//                            .frame(maxWidth: .infinity, minHeight: 200)
//                    } else {
//                        ForEach(results) { result in
//                            ResultCardView(result: result)
//                        }
//                    }
//                }
//            }
//            .padding(30)
//        }
//    }
//    
//    // Helper function to return the correct data based on the selected tab.
//    private func currentResults() -> [TestResult] {
//        switch selectedTab {
//        case .recent:
//            return viewModel.recentResults
//        case .best:
//            return viewModel.bestResults
//        case .all:
//            return viewModel.allResults
//        }
//    }
//}
//
//// MARK: - ResultTabButton
//// A dedicated view for the custom tab buttons.
//struct ResultTabButton: View {
//    let tab: ResultTab
//    @Binding var selectedTab: ResultTab
//    
//    var body: some View {
//        Button(action: {
//            withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
//                selectedTab = tab
//            }
//        }) {
//            Text(tab.rawValue)
//                .font(.headline)
//                .fontWeight(.semibold)
//                .padding(.vertical, 12)
//                .frame(maxWidth: .infinity)
//                .background(
//                    ZStack {
//                        if selectedTab == tab {
//                            RoundedRectangle(cornerRadius: 8)
//                                .fill(tab.activeColor)
//                                .shadow(radius: 3, y: 2)
//                        }
//                    }
//                )
//                .foregroundColor(selectedTab == tab ? .white : .primary)
//        }
//        .buttonStyle(PlainButtonStyle())
//    }
//}
//
//// Enum to define the filter tabs for the results.
//enum ResultTab: String, CaseIterable, Identifiable {
//    case recent = "Recent"
//    case best = "Best Scores"
//    case all = "All Results"
//    var id: String { self.rawValue }
//    
//    var activeColor: Color {
//        switch self {
//        case .recent: return .quizifyPrimary
//        case .best: return .quizifyAccentBlue
//        case .all: return .quizifyAccentGreen
//        }
//    }
//}
//
//// MARK: - ResultCardView
//// A card for displaying the details of a single test result.
//struct ResultCardView: View {
//    let result: TestResult
//    
//    // Determines the color based on the score for visual feedback.
//    private var scoreColor: Color {
//        if result.score >= 90 { return .quizifyAccentGreen }
//        if result.score >= 80 { return .quizifyAccentBlue }
//        if result.score >= 70 { return .quizifyAccentYellow }
//        return .quizifyRedError
//    }
//
//    var body: some View {
//        HStack(alignment: .top, spacing: 25) {
//            // MARK: Score Section
//            VStack(spacing: 5) {
//                Spacer() // Pushes the content to the center
//                ZStack {
//                    Circle()
//                        .stroke(lineWidth: 10.0)
//                        .opacity(0.1)
//                        .foregroundColor(scoreColor)
//                    
//                    Circle()
//                        .trim(from: 0.0, to: CGFloat(result.score) / 100.0)
//                        .stroke(style: StrokeStyle(lineWidth: 10.0, lineCap: .round, lineJoin: .round))
//                        .foregroundColor(scoreColor)
//                        .rotationEffect(Angle(degrees: 270.0))
//                        .animation(.linear(duration: 1.0), value: result.score)
//
//                    Text("\(result.score)%")
//                        .font(.system(size: 32, weight: .bold))
//                        .foregroundColor(scoreColor)
//                }
//                .frame(width: 100, height: 100)
//                
//                Text("Your Score")
//                    .font(.caption)
//                    .fontWeight(.semibold)
//                    .foregroundColor(.quizifyTextGray)
//                Spacer() // Pushes the content to the center
//            }
//            .frame(width: 120)
//            
//            Divider()
//                .frame(height: 120)
//
//            // MARK: Metrics and Footer Section
//            VStack(alignment: .leading, spacing: 10) {
//                // Main Test Title and Subject
//                VStack(alignment: .leading, spacing: 5) {
//                    Text(result.title)
//                        .font(.title2)
//                        .fontWeight(.bold)
//                    Text(result.subject)
//                        .font(.headline)
//                        .foregroundColor(.gray)
//                }
//                .frame(maxWidth: .infinity, alignment: .leading)
//                
//                Spacer()
//
//                // Key Metrics - A new, clean grid layout with a cross divider.
//                HStack(alignment: .top) {
//                    VStack(alignment: .leading, spacing: 15) {
//                        ResultSummaryItem(icon: "checkmark.circle.fill", label: "Correct Answers", value: "\(result.correct) / \(result.total)")
//                            .frame(maxWidth: .infinity, alignment: .leading)
//                        ResultSummaryItem(icon: "person.2.fill", label: "Class Average", value: "\(result.classAverage)%")
//                            .frame(maxWidth: .infinity, alignment: .leading)
//                    }
//                    .frame(maxWidth: 180)
//
//                    Divider().frame(height: 80)
//                    
//                    VStack(alignment: .leading, spacing: 15) {
//                        ResultSummaryItem(icon: "hourglass", label: "Duration", value: result.duration)
//                            .frame(maxWidth: .infinity, alignment: .leading)
//                        ResultSummaryItem(icon: "calendar", label: "Date", value: result.date)
//                            .frame(maxWidth: .infinity, alignment: .leading)
//                    }
//                    .frame(maxWidth: 180)
//                }
//                .padding()
//                .background(Color.gray.opacity(0.05))
//                .cornerRadius(12)
//                .frame(maxWidth: .infinity)
//                
//                Spacer()
//                
//                // Footer with Teacher Info and Action Button
//                HStack {
//                    // Teacher Info
//                    HStack(spacing: 10) {
//                        AsyncImage(url: URL(string: result.teacherAvatar ?? "")) { image in
//                            image.resizable().clipShape(Circle())
//                        } placeholder: {
//                            Image(systemName: "person.crop.circle.fill").resizable()
//                        }
//                        .frame(width: 30, height: 30)
//                        
//                        Text(result.teacher)
//                            .font(.headline)
//                            .foregroundColor(.quizifyTextGray)
//                    }
//                    
//                    Spacer()
//                    
//                    // Action Button styled to match the app's theme.
//                    Button(action: {}) {
//                        Label("View Details", systemImage: "eye.fill")
//                            .fontWeight(.semibold)
//                            .padding(.vertical, 10)
//                            .frame(minWidth: 150)
//                    }
//                    .buttonStyle(OutlineButtonStyle(color: .quizifyPrimary))
//                }
//            }
//        }
//        .padding(25)
//        .background(Color.white)
//        .cornerRadius(20)
//        .shadow(color: .black.opacity(0.05), radius: 10, x: 0, y: 5)
//    }
//}
//
//// A reusable sub-view to display a key metric within the card.
//fileprivate struct ResultSummaryItem: View {
//    let icon: String
//    let label: String
//    let value: String
//    
//    var body: some View {
//        HStack {
//            Image(systemName: icon)
//                .foregroundColor(.quizifyPrimary)
//                .frame(width: 20)
//            VStack(alignment: .leading, spacing: 2) {
//                Text(label)
//                    .font(.caption)
//                    .foregroundColor(.quizifyTextGray)
//                Text(value)
//                    .font(.headline)
//                    .fontWeight(.medium)
//            }
//        }
//    }
//}
//
//// MARK: - Preview
//struct ResultsView_Previews: PreviewProvider {
//    static var previews: some View {
//        ResultsView()
//            .frame(width: 1400)
//            .background(Color.quizifyOffWhite)
//    }
//}








import SwiftUI

// The ResultsView shows a detailed breakdown of the user's test scores.
// It uses a custom tabbed interface to filter results and a new card-based
// layout for a more professional and modern feel, consistent with the rest
// of the Quizify app.
struct ResultsView: View {
    // The ViewModel provides the test result data.
    @StateObject private var viewModel = ResultsViewModel()
    // State to manage the currently selected tab.
    @State private var selectedTab: ResultTab = .recent

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 30) {
                // MARK: - Header
                VStack(alignment: .leading) {
                    Text("My Results")
                        .font(.system(size: 28, weight: .bold))
                    Text("View your test results and performance analytics.")
                        .font(.title3)
                        .foregroundColor(.quizifyTextGray)
                }

                // MARK: - Performance Summary Metrics
                // A new grid of five dynamically populated stat cards for a more balanced layout.
                LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 25), count: 5), spacing: 25) {
                    StatCardView(
                        title: "Average Score",
                        value: "\(viewModel.averageScore)%",
                        description: "Overall performance",
                        icon: "chart.bar.xaxis",
                        trend: "All-time average",
                        color: .quizifyAccentGreen
                    )
                    StatCardView(
                        title: "Best Score",
                        value: "\(viewModel.bestScore)%",
                        description: "Highest score achieved",
                        icon: "trophy.fill",
                        trend: viewModel.bestScoreSubject,
                        color: .quizifyAccentBlue
                    )
                    StatCardView(
                        title: "Tests Taken",
                        value: "\(viewModel.totalTests)",
                        description: "Total number of tests",
                        icon: "pencil.and.ruler.fill",
                        trend: "Total to date",
                        color: .quizifyPrimary
                    )
                    StatCardView(
                        title: "Tests Passed",
                        value: "\(viewModel.testsPassed)",
                        description: "Tests with a score > 70%",
                        icon: "checkmark.circle.fill",
                        trend: "Good job!",
                        color: .quizifyAccentGreen
                    )
                    StatCardView(
                        title: "Pass Rate",
                        value: "\(viewModel.passRate)%",
                        description: "Percentage of tests passed",
                        icon: "list.bullet.clipboard.fill",
                        trend: "Keep the momentum",
                        color: .quizifyAccentYellow
                    )
                }

                // MARK: - Filter Tabs
                // Custom tab view implementation to match the style of TestsView.
                HStack {
                    Spacer()
                    HStack(spacing: 0) {
                        ForEach(ResultTab.allCases) { tab in
                            ResultTabButton(tab: tab, selectedTab: $selectedTab)
                        }
                    }
                    .background(Color.quizifyPrimary.opacity(0.1))
                    .cornerRadius(8)
                    .frame(maxWidth: 600)
                    Spacer()
                }

                // MARK: - Results List
                // The list of result cards, filtered by the selected tab.
                VStack(spacing: 20) {
                    let results = currentResults()
                    if results.isEmpty {
                        Text("No results to display in this category.")
                            .foregroundColor(.gray)
                            .font(.headline)
                            .frame(maxWidth: .infinity, minHeight: 200)
                    } else {
                        ForEach(results) { result in
                            ResultCardView(result: result)
                        }
                    }
                }
            }
            .padding(30)
        }
    }

    // Helper function to return the correct data based on the selected tab.
    private func currentResults() -> [TestResult] {
        switch selectedTab {
        case .recent:
            return viewModel.recentResults
        case .best:
            return viewModel.bestResults
        case .all:
            return viewModel.allResults
        }
    }
}

// MARK: - ResultTabButton
// A dedicated view for the custom tab buttons.
struct ResultTabButton: View {
    let tab: ResultTab
    @Binding var selectedTab: ResultTab

    var body: some View {
        Button(action: {
            withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                selectedTab = tab
            }
        }) {
            Text(tab.rawValue)
                .font(.headline)
                .fontWeight(.semibold)
                .padding(.vertical, 12)
                .frame(maxWidth: .infinity)
                .background(
                    ZStack {
                        if selectedTab == tab {
                            RoundedRectangle(cornerRadius: 8)
                                .fill(tab.activeColor)
                                .shadow(radius: 3, y: 2)
                        }
                    }
                )
                .foregroundColor(selectedTab == tab ? .white : .primary)
        }
        .buttonStyle(PlainButtonStyle())
    }
}

// Enum to define the filter tabs for the results.
enum ResultTab: String, CaseIterable, Identifiable {
    case recent = "Recent"
    case best = "Best Scores"
    case all = "All Results"
    var id: String { self.rawValue }

    var activeColor: Color {
        switch self {
        case .recent: return .quizifyPrimary
        case .best: return .quizifyAccentBlue
        case .all: return .quizifyAccentGreen
        }
    }
}

// MARK: - ResultCardView
// A card for displaying the details of a single test result.
struct ResultCardView: View {
    let result: TestResult

    // Determines the color based on the score for visual feedback.
    private var scoreColor: Color {
        if result.score >= 90 { return .quizifyAccentGreen }
        if result.score >= 80 { return .quizifyAccentBlue }
        if result.score >= 70 { return .quizifyAccentYellow }
        return .quizifyRedError
    }

    var body: some View {
        HStack(alignment: .top, spacing: 25) {
            // MARK: Score Section
            // This section is now a fixed-width container to prevent stretching.
            VStack(spacing: 5) {
                ZStack {
                    Circle()
                        .stroke(lineWidth: 10.0)
                        .opacity(0.1)
                        .foregroundColor(scoreColor)

                    Circle()
                        .trim(from: 0.0, to: CGFloat(result.score) / 100.0)
                        .stroke(style: StrokeStyle(lineWidth: 10.0, lineCap: .round, lineJoin: .round))
                        .foregroundColor(scoreColor)
                        .rotationEffect(Angle(degrees: 270.0))
                        .animation(.linear(duration: 1.0), value: result.score)

                    Text("\(result.score)%")
                        .font(.system(size: 32, weight: .bold))
                        .foregroundColor(scoreColor)
                }
                .frame(width: 100, height: 100)

                Text("Your Score")
                    .font(.caption)
                    .fontWeight(.semibold)
                    .foregroundColor(.quizifyTextGray)
            }
            .frame(width: 120) // Fixed width for consistent layout

            // A vertical divider to visually separate the score from the metrics.
            Divider()
                .frame(height: 120)

            // MARK: Metrics and Footer Section
            VStack(alignment: .leading, spacing: 20) {
                // Main Test Title and Subject
                VStack(alignment: .leading, spacing: 5) {
                    Text(result.title)
                        .font(.title2)
                        .fontWeight(.bold)
                    Text(result.subject)
                        .font(.headline)
                        .foregroundColor(.gray)
                }
                .frame(maxWidth: .infinity, alignment: .leading)

                Divider()

                // Key Metrics
                // This section uses a cross-divider layout similar to the TestsView for a clean, organized look.
                HStack {
                    ZStack {
                        Rectangle().fill(Color.gray.opacity(0.15)).frame(width: 1)
                        Rectangle().fill(Color.gray.opacity(0.15)).frame(height: 1)

                        VStack(spacing: 15) {
                            HStack(spacing: 20) {
                                ResultSummaryItem(icon: "checkmark.circle.fill", label: "Correct Answers", value: "\(result.correct) / \(result.total)")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                ResultSummaryItem(icon: "person.2.fill", label: "Class Average", value: "\(result.classAverage)%")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                            HStack(spacing: 20) {
                                ResultSummaryItem(icon: "hourglass", label: "Duration", value: result.duration)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                ResultSummaryItem(icon: "calendar", label: "Date", value: result.date)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                        }
                    }
                }
                .padding()
                .background(Color.gray.opacity(0.05))
                .cornerRadius(12)

                // Footer with Teacher Info and Action Button
                HStack {
                    // Teacher Info
                    HStack(spacing: 10) {
                        AsyncImage(url: URL(string: result.teacherAvatar ?? "")) { image in
                            image.resizable().clipShape(Circle())
                        } placeholder: {
                            Image(systemName: "person.crop.circle.fill").resizable()
                        }
                        .frame(width: 30, height: 30)

                        Text(result.teacher)
                            .font(.headline)
                            .foregroundColor(.quizifyTextGray)
                    }

                    Spacer()

                    // Action Button styled to match the app's theme.
                    Button(action: {}) {
                        Label("View Details", systemImage: "eye.fill")
                            .fontWeight(.semibold)
                            .padding(.vertical, 10)
                            .frame(minWidth: 150)
                    }
                    .buttonStyle(OutlineButtonStyle(color: .quizifyPrimary))
                }
            }
        }
        .padding(25)
        .background(Color.white)
        .cornerRadius(20)
        .shadow(color: .black.opacity(0.05), radius: 10, x: 0, y: 5)
    }
}

// A reusable sub-view to display a key metric within the card.
fileprivate struct ResultSummaryItem: View {
    let icon: String
    let label: String
    let value: String

    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(.quizifyPrimary)
                .frame(width: 20)
            VStack(alignment: .leading, spacing: 2) {
                Text(label)
                    .font(.caption)
                    .foregroundColor(.quizifyTextGray)
                Text(value)
                    .font(.headline)
                    .fontWeight(.medium)
            }
        }
    }
}

// MARK: - Preview
struct ResultsView_Previews: PreviewProvider {
    static var previews: some View {
        ResultsView()
            .frame(width: 1400)
            .background(Color.quizifyOffWhite)
    }
}

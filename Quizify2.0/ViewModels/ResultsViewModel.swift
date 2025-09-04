//
//  ResultsViewModel.swift
//  Quizify2.0
//
//  Created by Inyambo Auca on 31/07/2025.
//

//import Foundation
//import Combine
//
//// This ViewModel is for the ResultsView, loading all result categories.
//class ResultsViewModel: ObservableObject {
//    @Published var recentResults: [TestResult] = []
//    @Published var bestResults: [TestResult] = []
//    @Published var allResults: [TestResult] = []
//
//    init() {
//        let resultsData: TestResultDataSet = load("results")
//        self.recentResults = resultsData.recent
//        self.bestResults = resultsData.best
//        self.allResults = resultsData.all
//    }
//}


import Foundation
import Combine

// This ViewModel is for the ResultsView, loading all result categories.
class ResultsViewModel: ObservableObject {
    @Published var recentResults: [TestResult] = []
    @Published var bestResults: [TestResult] = []
    @Published var allResults: [TestResult] = []

    init() {
        let resultsData: TestResultDataSet = load("results")
        self.recentResults = resultsData.recent
        self.bestResults = resultsData.best
        self.allResults = resultsData.all
    }
    
    // MARK: - Computed Properties for Stat Cards
    var totalTests: Int {
        allResults.count
    }
    
    var averageScore: Int {
        guard !allResults.isEmpty else { return 0 }
        let totalScore = allResults.reduce(0) { $0 + $1.score }
        return totalScore / totalTests
    }
    
    var bestScore: Int {
        allResults.max(by: { $0.score < $1.score })?.score ?? 0
    }
    
    var bestScoreSubject: String {
        allResults.max(by: { $0.score < $1.score })?.subject ?? "N/A"
    }
    
    var testsPassed: Int {
        allResults.filter { $0.score >= 70 }.count
    }
    
    var passRate: Int {
        guard totalTests > 0 else { return 0 }
        return (testsPassed * 100) / totalTests
    }
}

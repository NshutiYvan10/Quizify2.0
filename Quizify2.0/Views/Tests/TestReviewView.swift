////
////  TestReviewView.swift
////  Quizify2.0
////
////  Created by Inyambo Auca on 04/09/2025.
////
//
//import SwiftUI
//
//// This view is for reviewing a completed test, showing the score summary
//// and a breakdown of each question with the correct and selected answers.
//struct TestReviewView: View {
//    let completedTest: CompletedTestDetails
//    let onDismiss: () -> Void
//
//    // A simple confetti view for celebrating high scores.
//    private struct ConfettiView: View {
//        @State private var particles: [ConfettiParticle] = []
//        @State private var burstCount = 0
//        private let totalBursts = 3
//        private let burstDuration: TimeInterval = 5
//
//        var body: some View {
//            GeometryReader { geometry in
//                TimelineView(.animation) { timeline in
//                    Canvas { context, size in
//                        for particle in particles {
//                            var newContext = context
//                            newContext.opacity = particle.opacity
//                            newContext.translateBy(x: particle.position.x, y: particle.position.y)
//                            newContext.rotate(by: particle.rotation)
//                            newContext.fill(Path(CGRect(x: -particle.size.width / 2, y: -particle.size.height / 2, width: particle.size.width, height: particle.size.height)), with: .color(particle.color))
//                        }
//                    }
//                    .onChange(of: timeline.date) {
//                        if particles.isEmpty && burstCount < totalBursts {
//                            particles = createParticles(size: geometry.size)
//                            burstCount += 1
//                        }
//                        updateParticles(at: timeline.date)
//                    }
//                }
//            }
//        }
//
//        private func createParticles(size: CGSize) -> [ConfettiParticle] {
//            (0..<150).map { _ in ConfettiParticle(size: size, duration: burstDuration) }
//        }
//
//        private func updateParticles(at date: Date) {
//            for i in particles.indices {
//                particles[i].update()
//            }
//            particles.removeAll { $0.isFinished }
//        }
//    }
//    
//    // Defines a single confetti particle's properties and behavior.
//    struct ConfettiParticle {
//        var position: CGPoint
//        var color: Color
//        var size: CGSize
//        var rotation: Angle
//        var velocity: CGVector
//        var creationDate = Date()
//        var duration: TimeInterval
//        
//        var isFinished: Bool {
//            Date().timeIntervalSince(creationDate) > duration
//        }
//        var opacity: Double {
//            max(0, 1 - (Date().timeIntervalSince(creationDate) / duration))
//        }
//
//        init(size viewSize: CGSize, duration: TimeInterval) {
//            self.position = CGPoint(x: .random(in: 0...viewSize.width), y: -20)
//            self.color = [.red, .green, .blue, .yellow, .purple, .orange].randomElement()!
//            self.size = CGSize(width: .random(in: 8...15), height: .random(in: 5...10))
//            self.rotation = .degrees(.random(in: 0...360))
//            self.velocity = CGVector(dx: .random(in: -50...50), dy: .random(in: 100...250))
//            self.duration = duration
//        }
//
//        mutating func update() {
//            let timeInterval = 1.0 / 60.0 // Assume 60 FPS
//            position.x += velocity.dx * timeInterval
//            position.y += velocity.dy * timeInterval
//            rotation += .degrees(.random(in: -10...10))
//        }
//    }
//
//    var body: some View {
//        ZStack {
//            Color.quizifyOffWhite.edgesIgnoringSafeArea(.all)
//            
//            ScrollView {
//                VStack(spacing: 30) {
//                    ScoreSummaryCard(
//                        result: (
//                            score: completedTest.score,
//                            correct: completedTest.correct,
//                            total: completedTest.total
//                        )
//                    )
//                    .padding(.top, 40)
//                    
//                    Text("Question Breakdown")
//                        .font(.title2)
//                        .fontWeight(.bold)
//                        .frame(maxWidth: .infinity, alignment: .leading)
//                        .padding(.horizontal, 30)
//
//                    ForEach(completedTest.questions.indices, id: \.self) { index in
//                        QuestionResultCard(
//                            question: completedTest.questions[index],
//                            userAnswer: completedTest.userAnswers[index],
//                            questionNumber: index + 1
//                        )
//                    }
//                }
//                .padding(.bottom, 120) // Add padding to the bottom to avoid the footer.
//            }
//
//            // MARK: - Footer Buttons
//            VStack {
//                Spacer()
//                HStack {
//                    Spacer()
//                    VStack(spacing: 20) {
//                        HStack(spacing: 20) {
//                            Button(action: onDismiss) {
//                                Label("Back to Tests", systemImage: "arrow.left.circle.fill")
//                                    .fontWeight(.semibold)
//                                    .frame(maxWidth: .infinity)
//                                    .padding()
//                            }
//                            .buttonStyle(OutlineButtonStyle(color: .quizifyPrimary))
//
//                            Button(action: {}) {
//                                Label("Download Results", systemImage: "square.and.arrow.down.fill")
//                                    .fontWeight(.semibold)
//                                    .frame(maxWidth: .infinity)
//                                    .padding()
//                            }
//                            .buttonStyle(FilledButtonStyle(color: .quizifyAccentGreen))
//                        }
//                    }
//                    .padding(30)
//                    .background(Color.white)
//                    .cornerRadius(20)
//                    .shadow(color: .black.opacity(0.1), radius: 10)
//                    .frame(maxWidth: 600) // Constrain the width of the card
//                    Spacer()
//                }
//                .padding(.bottom)
//            }
//            .edgesIgnoringSafeArea(.bottom)
//
//            if completedTest.score >= 80 {
//                ConfettiView()
//                    .allowsHitTesting(false) // Allows interaction with views behind it.
//            }
//        }
//    }
//}
//
//// MARK: - Helper Views for Results Summary
//struct ScoreSummaryCard: View {
//    let result: (score: Int, correct: Int, total: Int)
//    
//    var body: some View {
//        VStack(spacing: 15) {
//            Text("Test Completed!")
//                .font(.system(size: 40, weight: .bold))
//            
//            ZStack {
//                Circle()
//                    .stroke(lineWidth: 20)
//                    .foregroundColor(Color.gray.opacity(0.1))
//                
//                Circle()
//                    .trim(from: 0, to: CGFloat(result.score) / 100)
//                    .stroke(style: StrokeStyle(lineWidth: 20, lineCap: .round, lineJoin: .round))
//                    .fill(result.score >= 70 ? Color.quizifyAccentGreen : Color.quizifyRedError)
//                    .rotationEffect(.degrees(-90))
//                
//                Text("\(result.score)%")
//                    .font(.system(size: 72, weight: .bold))
//            }
//            .frame(width: 250, height: 250)
//            .shadow(color: (result.score >= 70 ? Color.quizifyAccentGreen : Color.quizifyRedError).opacity(0.5), radius: 20)
//
//            Text("You answered \(result.correct) out of \(result.total) questions correctly.")
//                .font(.title)
//                .foregroundColor(.quizifyTextGray)
//        }
//        .padding(40)
//        .background(Color.white)
//        .cornerRadius(25)
//        .shadow(color: .black.opacity(0.1), radius: 10)
//        .padding(.horizontal, 30)
//    }
//}
//
//struct QuestionResultCard: View {
//    let question: Question
//    let userAnswer: String?
//    let questionNumber: Int
//
//    var body: some View {
//        VStack(alignment: .leading, spacing: 15) {
//            Text("Question \(questionNumber): \(question.question)")
//                .font(.title2)
//                .fontWeight(.bold)
//            
//            ForEach(question.options, id: \.self) { option in
//                HStack {
//                    if option == question.correctAnswer {
//                        Image(systemName: "checkmark.circle.fill")
//                            .foregroundColor(.quizifyAccentGreen)
//                    } else if option == userAnswer {
//                        Image(systemName: "xmark.circle.fill")
//                            .foregroundColor(.quizifyRedError)
//                    } else {
//                        Image(systemName: "circle")
//                            .foregroundColor(.gray.opacity(0.5))
//                    }
//                    Text(option)
//                }
//                .font(.headline)
//                .padding(12)
//                .frame(maxWidth: .infinity, alignment: .leading)
//                .background(
//                    (option == question.correctAnswer ? Color.quizifyAccentGreen : (option == userAnswer ? Color.quizifyRedError : Color.clear))
//                        .opacity(0.1)
//                )
//                .cornerRadius(10)
//            }
//        }
//        .padding(20)
//        .background(Color.white)
//        .cornerRadius(16)
//        .shadow(color: .black.opacity(0.05), radius: 5)
//        .padding(.horizontal, 30)
//    }
//}

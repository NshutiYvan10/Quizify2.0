//
//  SettingsView.swift
//  Quizify2.0
//
//  Created by Inyambo Auca on 31/07/2025.
//

//import SwiftUI
//
//// The SettingsView allows users to manage their personal information,
//// account credentials, and notification preferences.
//struct SettingsView: View {
//    // State variables to hold the form data.
//    // In a real app, this would be bound to a ViewModel or a data model.
//    @State private var firstName = "John"
//    @State private var lastName = "Smith"
//    @State private var email = "john.smith@example.com"
//    @State private var phone = "+1 (555) 123-4567"
//    @State private var username = "johnsmith"
//    
//    @State private var emailNotifications = true
//    @State private var pushNotifications = true
//
//    var body: some View {
//        ScrollView {
//            VStack(alignment: .leading, spacing: 30) {
//                // MARK: - Header
//                Text("Settings")
//                    .font(.system(size: 28, weight: .bold))
//                
//                // MARK: - Settings Sections
//                // The settings are organized into distinct cards for clarity.
//                HStack(alignment: .top, spacing: 30) {
//                    // Left column for profile and account settings.
//                    VStack(spacing: 30) {
//                        ProfileSettingsCard(firstName: $firstName, lastName: $lastName, email: $email, phone: $phone)
//                        AccountSettingsCard(username: $username)
//                    }
//                    
//                    // Right column for notification and privacy settings.
//                    VStack(spacing: 30) {
//                        NotificationSettingsCard(emailNotifications: $emailNotifications, pushNotifications: $pushNotifications)
//                        PrivacySettingsCard()
//                    }
//                }
//            }
//            .padding(30)
//        }
//    }
//}
//
//// MARK: - Reusable Settings Cards
//// A card for editing profile information.
//struct ProfileSettingsCard: View {
//    @Binding var firstName: String
//    @Binding var lastName: String
//    @Binding var email: String
//    @Binding var phone: String
//
//    var body: some View {
//        TitledSection(title: "Profile Information", description: "Update your personal details.") {
//            VStack(spacing: 15) {
//                HStack {
//                    TextField("First Name", text: $firstName)
//                    TextField("Last Name", text: $lastName)
//                }
//                TextField("Email Address", text: $email)
//                TextField("Phone Number", text: $phone)
//            }
//            .textFieldStyle(RoundedBorderTextFieldStyle())
//            
//            Button("Save Profile") {}
//                .buttonStyle(.borderedProminent)
//                .frame(maxWidth: .infinity, alignment: .trailing)
//        }
//    }
//}
//
//// A card for managing account settings like username and password.
//struct AccountSettingsCard: View {
//    @Binding var username: String
//    @State private var currentPassword = ""
//    @State private var newPassword = ""
//
//    var body: some View {
//        TitledSection(title: "Account Settings", description: "Manage your login credentials.") {
//            VStack(spacing: 15) {
//                TextField("Username", text: $username)
//                SecureField("Current Password", text: $currentPassword)
//                SecureField("New Password", text: $newPassword)
//            }
//            .textFieldStyle(RoundedBorderTextFieldStyle())
//            
//            Button("Update Password") {}
//                .buttonStyle(.borderedProminent)
//                .frame(maxWidth: .infinity, alignment: .trailing)
//        }
//    }
//}
//
//// A card for controlling notification preferences.
//struct NotificationSettingsCard: View {
//    @Binding var emailNotifications: Bool
//    @Binding var pushNotifications: Bool
//
//    var body: some View {
//        TitledSection(title: "Notification Preferences", description: "Control how you receive alerts.") {
//            VStack(spacing: 15) {
//                Toggle("Email Notifications", isOn: $emailNotifications)
//                Toggle("Push Notifications", isOn: $pushNotifications)
//                Toggle("New Quiz Alerts", isOn: .constant(true))
//                Toggle("Result Announcements", isOn: .constant(true))
//            }
//            .toggleStyle(SwitchToggleStyle(tint: .quizifyPrimary))
//        }
//    }
//}
//
//// A card for managing privacy settings.
//struct PrivacySettingsCard: View {
//    var body: some View {
//        TitledSection(title: "Privacy", description: "Manage your data and account.") {
//            VStack(spacing: 15) {
//                Text("Manage how your data is used and shared.")
//                    .foregroundColor(.quizifyTextGray)
//                Button("Download Your Data") {}
//                Button("Delete Your Account", role: .destructive) {}
//            }
//            .frame(maxWidth: .infinity, alignment: .leading)
//        }
//    }
//}
//
//
//// MARK: - Preview
//struct SettingsView_Previews: PreviewProvider {
//    static var previews: some View {
//        SettingsView()
//    }
//}



//import SwiftUI
//
//// The SettingsView allows users to manage their personal information,
//// account credentials, and notification preferences.
//struct SettingsView: View {
//    // State variables for the settings options.
//    @State private var firstName = "John"
//    @State private var lastName = "Smith"
//    @State private var email = "john.smith@example.com"
//    @State private var username = "johnsmith"
//    @State private var currentPassword = ""
//    @State private var newPassword = ""
//    
//    @State private var emailNotifications = true
//    @State private var pushNotifications = true
//    
//    @State private var selectedTheme: Theme = .system
//    @State private var selectedAccentColor: Color = .quizifyPrimary
//    @State private var textSize: Double = 1.0
//    @State private var reduceMotion = false
//
//    // An array of accent colors for the color picker.
//    private let accentColors: [Color] = [.quizifyPrimary, .quizifyAccentBlue, .quizifyAccentGreen, .quizifyAccentYellow, .orange, .red]
//
//    var body: some View {
//        ScrollView {
//            VStack(spacing: 40) {
//                // MARK: - Header
//                VStack(alignment: .leading, spacing: 4) {
//                    Text("Settings")
//                        .font(.system(size: 28, weight: .bold))
//                    Text("Manage your account, preferences, and app settings.")
//                        .font(.title3)
//                        .foregroundColor(.quizifyTextGray)
//                }
//                .frame(maxWidth: .infinity, alignment: .leading)
//                
//                // MARK: - Profile & Account Settings
//                TitledSection(title: "Profile & Account", description: "Edit your personal information and manage your password.") {
//                    VStack(spacing: 20) {
//                        SettingsRow(label: "First Name", icon: "person.fill") {
//                            StyledTextField(placeholder: "First Name", text: $firstName)
//                        }
//                        SettingsRow(label: "Last Name", icon: "person.fill") {
//                            StyledTextField(placeholder: "Last Name", text: $lastName)
//                        }
//                        SettingsRow(label: "Email", icon: "envelope.fill") {
//                            StyledTextField(placeholder: "Email", text: $email)
//                        }
//                        SettingsRow(label: "Username", icon: "at") {
//                            StyledTextField(placeholder: "Username", text: $username)
//                        }
//                        
//                        Divider().padding(.vertical, 10)
//                        
//                        SettingsRow(label: "Current Password", icon: "lock.fill") {
//                            StyledSecureField(placeholder: "Current Password", text: $currentPassword)
//                        }
//                        SettingsRow(label: "New Password", icon: "lock.plus.fill") {
//                            StyledSecureField(placeholder: "New Password", text: $newPassword)
//                        }
//                        
//                        HStack {
//                            Spacer()
//                            Button("Save Changes") {}
//                                .buttonStyle(FilledButtonStyle(color: .quizifyPrimary))
//                        }
//                    }
//                }
//
//                // MARK: - App Settings
//                TitledSection(title: "App Settings", description: "Customize the appearance and accessibility of the app.") {
//                    VStack(spacing: 20) {
//                        // Theme Picker
//                        SettingsRow(label: "Theme", icon: "paintbrush.fill") {
//                            Picker("Theme", selection: $selectedTheme) {
//                                ForEach(Theme.allCases) { theme in
//                                    Text(theme.rawValue).tag(theme)
//                                }
//                            }
//                            .pickerStyle(SegmentedPickerStyle())
//                        }
//                        
//                        // Accent Color Picker
//                        SettingsRow(label: "Accent Color", icon: "eyedropper.full") {
//                            AccentColorPicker(selectedColor: $selectedAccentColor, colors: accentColors)
//                        }
//                        
//                        Divider().padding(.vertical, 10)
//
//                        // Accessibility Settings
//                        SettingsRow(label: "Text Size", icon: "textformat.size") {
//                            Slider(value: $textSize, in: 0.8...1.5, step: 0.1)
//                        }
//                        
//                        SettingsRow(label: "Reduce Motion", icon: "figure.walk.motion") {
//                            StyledToggle(isOn: $reduceMotion, label: "Reduce Motion")
//                        }
//                        
//                        SettingsRow(label: "Notifications", icon: "bell.badge.fill") {
//                            VStack(spacing: 15) {
//                                StyledToggle(isOn: $emailNotifications, label: "Email Notifications")
//                                StyledToggle(isOn: $pushNotifications, label: "Push Notifications")
//                            }
//                        }
//                    }
//                }
//
//                // MARK: - About & Support
//                TitledSection(title: "About & Support", description: "Get help and review our policies.") {
//                    VStack(spacing: 15) {
//                        NavigationLink(destination: Text("Help Center")) {
//                            SettingsLinkRow(icon: "questionmark.circle.fill", title: "Help Center")
//                        }
//                        NavigationLink(destination: Text("Terms of Service")) {
//                            SettingsLinkRow(icon: "doc.text.fill", title: "Terms of Service")
//                        }
//                        NavigationLink(destination: Text("Privacy Policy")) {
//                            SettingsLinkRow(icon: "shield.lefthalf.filled", title: "Privacy Policy")
//                        }
//                    }
//                }
//            }
//            .padding(30)
//            .frame(maxWidth: 1000) // Constrain the width for a centered, professional look
//            .frame(maxWidth: .infinity) // Allow the frame to center itself
//        }
//    }
//}
//
//// MARK: - Helper Views for Settings
//// A reusable row for a setting with a label and content.
//struct SettingsRow<Content: View>: View {
//    let label: String
//    let icon: String
//    @ViewBuilder let content: Content
//
//    var body: some View {
//        HStack(alignment: .top) {
//            HStack {
//                Image(systemName: icon)
//                    .font(.headline)
//                    .foregroundColor(.quizifyPrimary)
//                    .frame(width: 25)
//                Text(label)
//                    .font(.headline)
//                    .foregroundColor(.quizifyTextGray)
//            }
//            .frame(width: 200, alignment: .leading)
//            
//            content
//                .frame(maxWidth: .infinity)
//        }
//    }
//}
//
//// A custom styled text field.
//struct StyledTextField: View {
//    let placeholder: String
//    @Binding var text: String
//
//    var body: some View {
//        TextField(placeholder, text: $text)
//            .padding(12)
//            .background(Color.quizifyOffWhite)
//            .cornerRadius(8)
//            .overlay(
//                RoundedRectangle(cornerRadius: 8)
//                    .stroke(Color.quizifyLightGray, lineWidth: 1)
//            )
//    }
//}
//
//// A custom styled secure field for passwords.
//struct StyledSecureField: View {
//    let placeholder: String
//    @Binding var text: String
//
//    var body: some View {
//        SecureField(placeholder, text: $text)
//            .padding(12)
//            .background(Color.quizifyOffWhite)
//            .cornerRadius(8)
//            .overlay(
//                RoundedRectangle(cornerRadius: 8)
//                    .stroke(Color.quizifyLightGray, lineWidth: 1)
//            )
//    }
//}
//
//// A custom styled toggle switch.
//struct StyledToggle: View {
//    @Binding var isOn: Bool
//    let label: String
//
//    var body: some View {
//        Toggle(isOn: $isOn) {
//            Text(label)
//                .font(.headline)
//                .foregroundColor(.primary)
//        }
//        .toggleStyle(SwitchToggleStyle(tint: .quizifyAccentGreen))
//    }
//}
//
//// A custom view for selecting an accent color.
//struct AccentColorPicker: View {
//    @Binding var selectedColor: Color
//    let colors: [Color]
//
//    var body: some View {
//        HStack {
//            ForEach(colors, id: \.self) { color in
//                Button(action: { selectedColor = color }) {
//                    Circle()
//                        .fill(color)
//                        .frame(width: 30, height: 30)
//                        .overlay(
//                            Circle()
//                                .stroke(selectedColor == color ? Color.blue.opacity(0.8) : Color.clear, lineWidth: 3)
//                        )
//                }
//                .buttonStyle(PlainButtonStyle())
//            }
//        }
//    }
//}
//
//// A row for navigation links.
//struct SettingsLinkRow: View {
//    let icon: String
//    let title: String
//    
//    var body: some View {
//        HStack {
//            Image(systemName: icon)
//                .font(.headline)
//                .foregroundColor(.quizifyPrimary)
//                .frame(width: 25)
//            Text(title)
//                .font(.headline)
//            Spacer()
//            Image(systemName: "chevron.right")
//                .foregroundColor(.gray)
//        }
//        .padding()
//        .background(Color.quizifyOffWhite)
//        .cornerRadius(12)
//    }
//}
//
//// Enum to define the theme options.
//enum Theme: String, CaseIterable, Identifiable {
//    case system = "System"
//    case light = "Light"
//    case dark = "Dark"
//    var id: String { self.rawValue }
//}
//
//// MARK: - Preview
//struct SettingsView_Previews: PreviewProvider {
//    static var previews: some View {
//        SettingsView()
//    }
//}





//import SwiftUI
//
//// The SettingsView allows users to manage their personal information,
//// account credentials, and notification preferences.
//struct SettingsView: View {
//    // State variables for the settings options.
//    @State private var firstName = "John"
//    @State private var lastName = "Smith"
//    @State private var email = "john.smith@example.com"
//    @State private var username = "johnsmith"
//    @State private var currentPassword = ""
//    @State private var newPassword = ""
//    @State private var confirmNewPassword = ""
//    @State private var isPasswordVerified = false
//    
//    @State private var emailNotifications = true
//    @State private var pushNotifications = true
//    
//    @State private var selectedTheme: Theme = .system
//    @State private var selectedAccentColor: Color = .quizifyPrimary
//    @State private var textSize: Double = 1.0
//    @State private var reduceMotion = false
//    
//    // State for presenting the legal text sheets.
//    @State private var showingSheet = false
//    @State private var selectedLegalText: LegalText? = nil
//
//    // An array of accent colors for the color picker.
//    private let accentColors: [Color] = [.quizifyPrimary, .quizifyAccentBlue, .quizifyAccentGreen, .quizifyAccentYellow, .orange, .red]
//
//    var body: some View {
//        ScrollView {
//            VStack(alignment: .leading, spacing: 30) {
//                // MARK: - Header
//                VStack(alignment: .leading, spacing: 4) {
//                    Text("Settings")
//                        .font(.system(size: 28, weight: .bold))
//                    Text("Manage your account, preferences, and app settings.")
//                        .font(.title3)
//                        .foregroundColor(.quizifyTextGray)
//                }
//                
//                // MARK: - Settings Grid
//                LazyVGrid(columns: [GridItem(.flexible(minimum: 400)), GridItem(.flexible(minimum: 400))], spacing: 30) {
//                    // Profile & Account Settings
//                    TitledSection(title: "Profile & Account", description: "Edit your personal information and manage your password.") {
//                        VStack(spacing: 20) {
//                            StyledTextField(placeholder: "First Name", text: $firstName, icon: "person.fill")
//                            StyledTextField(placeholder: "Last Name", text: $lastName, icon: "person.fill")
//                            StyledTextField(placeholder: "Email", text: $email, icon: "envelope.fill")
//                            StyledTextField(placeholder: "Username", text: $username, icon: "at")
//                            
//                            Divider().padding(.vertical, 10)
//                            
//                            if !isPasswordVerified {
//                                StyledSecureField(placeholder: "Enter Current Password to Verify", text: $currentPassword, icon: "lock.shield.fill")
//                                Button(action: { isPasswordVerified = true }) {
//                                    Label("Verify Password", systemImage: "checkmark.seal.fill")
//                                        .frame(maxWidth: .infinity)
//                                }
//                                .buttonStyle(OutlineButtonStyle(color: .quizifyPrimary))
//                            } else {
//                                StyledSecureField(placeholder: "New Password", text: $newPassword, icon: "lock.plus.fill")
//                                StyledSecureField(placeholder: "Confirm New Password", text: $confirmNewPassword, icon: "lock.plus.fill")
//                            }
//                            
//                            Button("Save Changes") {}
//                                .buttonStyle(FilledButtonStyle(color: .quizifyPrimary))
//                                .frame(maxWidth: .infinity, alignment: .trailing)
//                        }
//                    }
//
//                    // App Settings
//                    TitledSection(title: "App Settings", description: "Customize the appearance and accessibility.") {
//                        VStack(spacing: 25) {
//                            SettingsRow(label: "Theme", icon: "paintbrush.fill") {
//                                Picker("Theme", selection: $selectedTheme) {
//                                    ForEach(Theme.allCases) { theme in
//                                        Text(theme.rawValue).tag(theme)
//                                    }
//                                }
//                                .pickerStyle(SegmentedPickerStyle())
//                            }
//                            
//                            SettingsRow(label: "Accent Color", icon: "eyedropper.full") {
//                                AccentColorPicker(selectedColor: $selectedAccentColor, colors: accentColors)
//                            }
//                            
//                            SettingsRow(label: "Text Size", icon: "textformat.size") {
//                                Slider(value: $textSize, in: 0.8...1.5, step: 0.1)
//                            }
//                            
//                            SettingsRow(label: "Reduce Motion", icon: "figure.walk.motion") {
//                                StyledToggle(isOn: $reduceMotion, label: "")
//                            }
//                            
//                            SettingsRow(label: "Email Notifications", icon: "envelope.badge.fill") {
//                                StyledToggle(isOn: $emailNotifications, label: "")
//                            }
//                            
//                            SettingsRow(label: "Push Notifications", icon: "bell.badge.fill") {
//                                StyledToggle(isOn: $pushNotifications, label: "")
//                            }
//                        }
//                    }
//
//                    // About & Support
//                    TitledSection(title: "About & Support", description: "Get help and review our policies.") {
//                        VStack(spacing: 15) {
//                            Button(action: { selectedLegalText = .helpCenter; showingSheet = true }) {
//                                SettingsLinkRow(icon: "questionmark.circle.fill", title: "Help Center")
//                            }
//                            Button(action: { selectedLegalText = .termsOfService; showingSheet = true }) {
//                                SettingsLinkRow(icon: "doc.text.fill", title: "Terms of Service")
//                            }
//                            Button(action: { selectedLegalText = .privacyPolicy; showingSheet = true }) {
//                                SettingsLinkRow(icon: "shield.lefthalf.filled", title: "Privacy Policy")
//                            }
//                        }
//                        .buttonStyle(PlainButtonStyle())
//                    }
//                }
//            }
//            .padding(30)
//        }
//        .sheet(item: $selectedLegalText) { legalText in
//            LegalTextView(legalText: legalText)
//        }
//    }
//}
//
//
//// MARK: - Helper Views for Settings
//// A reusable row for a setting with a label and content.
//struct SettingsRow<Content: View>: View {
//    let label: String
//    let icon: String
//    @ViewBuilder let content: Content
//
//    var body: some View {
//        HStack {
//            Image(systemName: icon)
//                .font(.headline)
//                .foregroundColor(.quizifyPrimary)
//                .frame(width: 25, alignment: .center)
//            Text(label)
//                .font(.headline)
//                .foregroundColor(.quizifyTextGray)
//            Spacer()
//            content
//        }
//    }
//}
//
//// A custom styled text field with an icon.
//struct StyledTextField: View {
//    let placeholder: String
//    @Binding var text: String
//    let icon: String
//
//    var body: some View {
//        HStack {
//            Image(systemName: icon).foregroundColor(.gray)
//            TextField(placeholder, text: $text)
//        }
//        .padding(12)
//        .background(Color.quizifyOffWhite)
//        .cornerRadius(8)
//        .overlay(
//            RoundedRectangle(cornerRadius: 8)
//                .stroke(Color.quizifyLightGray, lineWidth: 1)
//        )
//    }
//}
//
//// A custom styled secure field for passwords with an icon.
//struct StyledSecureField: View {
//    let placeholder: String
//    @Binding var text: String
//    let icon: String
//
//    var body: some View {
//        HStack {
//            Image(systemName: icon).foregroundColor(.gray)
//            SecureField(placeholder, text: $text)
//        }
//        .padding(12)
//        .background(Color.quizifyOffWhite)
//        .cornerRadius(8)
//        .overlay(
//            RoundedRectangle(cornerRadius: 8)
//                .stroke(Color.quizifyLightGray, lineWidth: 1)
//        )
//    }
//}
//
//// A custom styled toggle switch.
//struct StyledToggle: View {
//    @Binding var isOn: Bool
//    let label: String
//
//    var body: some View {
//        Toggle(isOn: $isOn) {
//            Text(label)
//        }
//        .toggleStyle(SwitchToggleStyle(tint: .quizifyAccentGreen))
//    }
//}
//
//// A custom view for selecting an accent color.
//struct AccentColorPicker: View {
//    @Binding var selectedColor: Color
//    let colors: [Color]
//
//    var body: some View {
//        HStack {
//            ForEach(colors, id: \.self) { color in
//                Button(action: { selectedColor = color }) {
//                    Circle()
//                        .fill(color)
//                        .frame(width: 30, height: 30)
//                        .overlay(
//                            Circle()
//                                .stroke(selectedColor == color ? Color.blue.opacity(0.8) : Color.clear, lineWidth: 3)
//                        )
//                }
//                .buttonStyle(PlainButtonStyle())
//            }
//        }
//    }
//}
//
//// A row for navigation links.
//struct SettingsLinkRow: View {
//    let icon: String
//    let title: String
//    
//    var body: some View {
//        HStack {
//            Image(systemName: icon)
//                .font(.headline)
//                .foregroundColor(.quizifyPrimary)
//                .frame(width: 25)
//            Text(title)
//                .font(.headline)
//            Spacer()
//            Image(systemName: "chevron.right")
//                .foregroundColor(.gray)
//        }
//        .padding()
//        .background(Color.quizifyOffWhite)
//        .cornerRadius(12)
//        .overlay(
//            RoundedRectangle(cornerRadius: 12)
//                .stroke(Color.quizifyLightGray.opacity(0.5), lineWidth: 1)
//        )
//    }
//}
//
//// Enum to define the theme options.
//enum Theme: String, CaseIterable, Identifiable {
//    case system = "System"
//    case light = "Light"
//    case dark = "Dark"
//    var id: String { self.rawValue }
//}
//
//// MARK: - Legal Text View and Model
//enum LegalText: String, Identifiable {
//    case helpCenter = "Help Center"
//    case termsOfService = "Terms of Service"
//    case privacyPolicy = "Privacy Policy"
//    
//    var id: String { self.rawValue }
//    
//    var icon: String {
//        switch self {
//        case .helpCenter: "questionmark.circle.fill"
//        case .termsOfService: "doc.text.fill"
//        case .privacyPolicy: "shield.lefthalf.filled"
//        }
//    }
//    
//    var content: String {
//        switch self {
//        case .helpCenter: "Welcome to the Quizify Help Center! Here you can find answers to frequently asked questions and get support for any issues you may encounter."
//        case .termsOfService: "By using Quizify, you agree to our Terms of Service. Please read them carefully."
//        case .privacyPolicy: "Our Privacy Policy explains how we collect, use, and protect your data."
//        }
//    }
//}
//
//struct LegalTextView: View {
//    let legalText: LegalText
//    @Environment(\.dismiss) var dismiss
//
//    var body: some View {
//        VStack(spacing: 0) {
//            // Header
//            HStack {
//                Image(systemName: legalText.icon)
//                    .font(.title)
//                    .foregroundColor(.quizifyPrimary)
//                Text(legalText.rawValue)
//                    .font(.largeTitle)
//                    .fontWeight(.bold)
//                Spacer()
//                Button(action: { dismiss() }) {
//                    Image(systemName: "xmark.circle.fill")
//                        .font(.title)
//                        .foregroundColor(.gray)
//                }
//            }
//            .padding()
//            .background(Color.white.shadow(.drop(radius: 5, y: 5)))
//            
//            // Content
//            ScrollView {
//                Text(legalText.content)
//                    .font(.title2)
//                    .padding()
//            }
//        }
//        .frame(minWidth: 600, minHeight: 400)
//    }
//}
//
//
//// MARK: - Preview
//struct SettingsView_Previews: PreviewProvider {
//    static var previews: some View {
//        SettingsView()
//    }
//}





//import SwiftUI
//
//// The SettingsView allows users to manage their personal information,
//// account credentials, and notification preferences.
//struct SettingsView: View {
//    // State variables for the settings options.
//    @State private var firstName = "John"
//    @State private var lastName = "Smith"
//    @State private var email = "john.smith@example.com"
//    @State private var username = "johnsmith"
//    @State private var currentPassword = ""
//    @State private var newPassword = ""
//    @State private var confirmNewPassword = ""
//    @State private var isPasswordVerified = false
//    
//    @State private var emailNotifications = true
//    @State private var pushNotifications = true
//    
//    @State private var selectedTheme: Theme = .system
//    @State private var selectedAccentColor: Color = .quizifyPrimary
//    @State private var textSize: Double = 1.0
//    @State private var reduceMotion = false
//    
//    // State for presenting the legal text sheets.
//    @State private var showingSheet = false
//    @State private var selectedLegalText: LegalText? = nil
//
//    // An array of accent colors for the color picker.
//    private let accentColors: [Color] = [.quizifyPrimary, .quizifyAccentBlue, .quizifyAccentGreen, .quizifyAccentYellow, .orange, .red]
//
//    var body: some View {
//        ScrollView {
//            VStack(alignment: .leading, spacing: 30) {
//                // MARK: - Header
//                VStack(alignment: .leading, spacing: 4) {
//                    Text("Settings")
//                        .font(.system(size: 28, weight: .bold))
//                    Text("Manage your account, preferences, and app settings.")
//                        .font(.title3)
//                        .foregroundColor(.quizifyTextGray)
//                }
//                
//                // MARK: - Settings Grid
//                LazyVGrid(columns: [GridItem(.flexible(minimum: 400), alignment: .top), GridItem(.flexible(minimum: 400), alignment: .top)], spacing: 30) {
//                    // Profile & Account Settings
//                    TitledSection(title: "Profile & Account", description: "Edit your personal information and manage your password.") {
//                        VStack(spacing: 20) {
//                            StyledTextField(placeholder: "First Name", text: $firstName, icon: "person.fill")
//                            StyledTextField(placeholder: "Last Name", text: $lastName, icon: "person.fill")
//                            StyledTextField(placeholder: "Email", text: $email, icon: "envelope.fill")
//                            StyledTextField(placeholder: "Username", text: $username, icon: "at")
//                            
//                            Divider().padding(.vertical, 10)
//                            
//                            if !isPasswordVerified {
//                                StyledSecureField(placeholder: "Enter Current Password to Verify", text: $currentPassword, icon: "lock.shield.fill")
//                                Button(action: { isPasswordVerified = true }) {
//                                    Label("Verify Password", systemImage: "checkmark.seal.fill")
//                                        .frame(maxWidth: .infinity)
//                                }
//                                .buttonStyle(OutlineButtonStyle(color: .quizifyPrimary))
//                            } else {
//                                StyledSecureField(placeholder: "New Password", text: $newPassword, icon: "lock.plus.fill")
//                                StyledSecureField(placeholder: "Confirm New Password", text: $confirmNewPassword, icon: "lock.plus.fill")
//                            }
//                            
//                            HStack {
//                                Spacer()
//                                Button("Save Changes") {}
//                                    .buttonStyle(FilledButtonStyle(color: .quizifyPrimary))
//                            }
//                        }
//                    }
//
//                    // App Settings & Support
//                    VStack(spacing: 30) {
//                        TitledSection(title: "App Settings", description: "Customize the appearance and accessibility.") {
//                            VStack(spacing: 25) {
//                                SettingsRow(label: "Theme", icon: "paintbrush.fill") {
//                                    Picker("Theme", selection: $selectedTheme) {
//                                        ForEach(Theme.allCases) { theme in
//                                            Text(theme.rawValue).tag(theme)
//                                        }
//                                    }
//                                    .pickerStyle(SegmentedPickerStyle())
//                                }
//                                
//                                SettingsRow(label: "Accent Color", icon: "eyedropper.full") {
//                                    AccentColorPicker(selectedColor: $selectedAccentColor, colors: accentColors)
//                                }
//                                
//                                SettingsRow(label: "Text Size", icon: "textformat.size") {
//                                    Slider(value: $textSize, in: 0.8...1.5, step: 0.1)
//                                }
//                                
//                                SettingsRow(label: "Reduce Motion", icon: "figure.walk.motion") {
//                                    StyledToggle(isOn: $reduceMotion, label: "")
//                                }
//                                
//                                SettingsRow(label: "Email Notifications", icon: "envelope.badge.fill") {
//                                    StyledToggle(isOn: $emailNotifications, label: "")
//                                }
//                                
//                                SettingsRow(label: "Push Notifications", icon: "bell.badge.fill") {
//                                    StyledToggle(isOn: $pushNotifications, label: "")
//                                }
//                            }
//                        }
//
//                        TitledSection(title: "About & Support", description: "Get help and review our policies.") {
//                            VStack(spacing: 15) {
//                                Button(action: { selectedLegalText = .helpCenter; showingSheet = true }) {
//                                    SettingsLinkRow(icon: "questionmark.circle.fill", title: "Help Center")
//                                }
//                                Button(action: { selectedLegalText = .termsOfService; showingSheet = true }) {
//                                    SettingsLinkRow(icon: "doc.text.fill", title: "Terms of Service")
//                                }
//                                Button(action: { selectedLegalText = .privacyPolicy; showingSheet = true }) {
//                                    SettingsLinkRow(icon: "shield.lefthalf.filled", title: "Privacy Policy")
//                                }
//                            }
//                            .buttonStyle(PlainButtonStyle())
//                        }
//                    }
//                }
//            }
//            .padding(30)
//        }
//        .sheet(item: $selectedLegalText) { legalText in
//            LegalTextView(legalText: legalText)
//        }
//    }
//}
//
//
//// MARK: - Helper Views for Settings
//// A reusable row for a setting with a label and content.
//struct SettingsRow<Content: View>: View {
//    let label: String
//    let icon: String
//    @ViewBuilder let content: Content
//
//    var body: some View {
//        HStack {
//            Image(systemName: icon)
//                .font(.headline)
//                .foregroundColor(.quizifyPrimary)
//                .frame(width: 25, alignment: .center)
//            Text(label)
//                .font(.headline)
//                .foregroundColor(.quizifyTextGray)
//            Spacer()
//            content
//        }
//    }
//}
//
//// A custom styled text field with an icon.
//struct StyledTextField: View {
//    let placeholder: String
//    @Binding var text: String
//    let icon: String
//
//    var body: some View {
//        HStack {
//            Image(systemName: icon).foregroundColor(.gray)
//            TextField(placeholder, text: $text)
//        }
//        .padding(12)
//        .background(Color.quizifyOffWhite)
//        .cornerRadius(8)
//        .overlay(
//            RoundedRectangle(cornerRadius: 8)
//                .stroke(Color.quizifyLightGray, lineWidth: 1)
//        )
//    }
//}
//
//// A custom styled secure field for passwords with an icon.
//struct StyledSecureField: View {
//    let placeholder: String
//    @Binding var text: String
//    let icon: String
//
//    var body: some View {
//        HStack {
//            Image(systemName: icon).foregroundColor(.gray)
//            SecureField(placeholder, text: $text)
//        }
//        .padding(12)
//        .background(Color.quizifyOffWhite)
//        .cornerRadius(8)
//        .overlay(
//            RoundedRectangle(cornerRadius: 8)
//                .stroke(Color.quizifyLightGray, lineWidth: 1)
//        )
//    }
//}
//
//// A custom styled toggle switch.
//struct StyledToggle: View {
//    @Binding var isOn: Bool
//    let label: String
//
//    var body: some View {
//        Toggle(isOn: $isOn) {
//            Text(label)
//        }
//        .toggleStyle(SwitchToggleStyle(tint: .quizifyAccentGreen))
//    }
//}
//
//// A custom view for selecting an accent color.
//struct AccentColorPicker: View {
//    @Binding var selectedColor: Color
//    let colors: [Color]
//
//    var body: some View {
//        HStack {
//            ForEach(colors, id: \.self) { color in
//                Button(action: { selectedColor = color }) {
//                    Circle()
//                        .fill(color)
//                        .frame(width: 30, height: 30)
//                        .overlay(
//                            Circle()
//                                .stroke(selectedColor == color ? Color.blue.opacity(0.8) : Color.clear, lineWidth: 3)
//                        )
//                }
//                .buttonStyle(PlainButtonStyle())
//            }
//        }
//    }
//}
//
//// A row for navigation links.
//struct SettingsLinkRow: View {
//    let icon: String
//    let title: String
//    
//    var body: some View {
//        HStack {
//            Image(systemName: icon)
//                .font(.headline)
//                .foregroundColor(.quizifyPrimary)
//                .frame(width: 25)
//            Text(title)
//                .font(.headline)
//            Spacer()
//            Image(systemName: "chevron.right")
//                .foregroundColor(.gray)
//        }
//        .padding()
//        .background(Color.quizifyOffWhite)
//        .cornerRadius(12)
//        .overlay(
//            RoundedRectangle(cornerRadius: 12)
//                .stroke(Color.quizifyLightGray.opacity(0.5), lineWidth: 1)
//        )
//    }
//}
//
//// Enum to define the theme options.
//enum Theme: String, CaseIterable, Identifiable {
//    case system = "System"
//    case light = "Light"
//    case dark = "Dark"
//    var id: String { self.rawValue }
//}
//
//// MARK: - Legal Text View and Model
//enum LegalText: String, Identifiable {
//    case helpCenter = "Help Center"
//    case termsOfService = "Terms of Service"
//    case privacyPolicy = "Privacy Policy"
//    
//    var id: String { self.rawValue }
//    
//    var icon: String {
//        switch self {
//        case .helpCenter: "questionmark.circle.fill"
//        case .termsOfService: "doc.text.fill"
//        case .privacyPolicy: "shield.lefthalf.filled"
//        }
//    }
//    
//    var content: String {
//        switch self {
//        case .helpCenter: "Welcome to the Quizify Help Center! Here you can find answers to frequently asked questions and get support for any issues you may encounter."
//        case .termsOfService: "By using Quizify, you agree to our Terms of Service. Please read them carefully."
//        case .privacyPolicy: "Our Privacy Policy explains how we collect, use, and protect your data."
//        }
//    }
//}
//
//struct LegalTextView: View {
//    let legalText: LegalText
//    @Environment(\.dismiss) var dismiss
//
//    var body: some View {
//        VStack(spacing: 0) {
//            // Header
//            HStack {
//                Image(systemName: legalText.icon)
//                    .font(.title)
//                    .foregroundColor(.quizifyPrimary)
//                Text(legalText.rawValue)
//                    .font(.largeTitle)
//                    .fontWeight(.bold)
//                Spacer()
//                Button(action: { dismiss() }) {
//                    Image(systemName: "xmark.circle.fill")
//                        .font(.title)
//                        .foregroundColor(.gray)
//                }
//            }
//            .padding()
//            .background(Color.white.shadow(.drop(radius: 5, y: 5)))
//            
//            // Content
//            ScrollView {
//                Text(legalText.content)
//                    .font(.title2)
//                    .padding()
//            }
//        }
//        .frame(minWidth: 600, minHeight: 400)
//    }
//}
//
//
//// MARK: - Preview
//struct SettingsView_Previews: PreviewProvider {
//    static var previews: some View {
//        SettingsView()
//    }
//}





//import SwiftUI
//
//// The SettingsView allows users to manage their personal information,
//// account credentials, and notification preferences.
//struct SettingsView: View {
//    // State variables for the settings options.
//    @State private var firstName = "John"
//    @State private var lastName = "Smith"
//    @State private var email = "john.smith@example.com"
//    @State private var username = "johnsmith"
//    @State private var currentPassword = ""
//    @State private var newPassword = ""
//    @State private var confirmNewPassword = ""
//    @State private var isPasswordVerified = false
//    
//    @State private var emailNotifications = true
//    @State private var pushNotifications = true
//    
//    @State private var selectedTheme: Theme = .system
//    @State private var selectedAccentColor: Color = .quizifyPrimary
//    @State private var textSize: Double = 1.0
//    @State private var reduceMotion = false
//    
//    // State for presenting the legal text sheets.
//    @State private var showingSheet = false
//    @State private var selectedLegalText: LegalText? = nil
//
//    var body: some View {
//        ScrollView {
//            VStack(alignment: .leading, spacing: 30) {
//                // MARK: - Header
//                VStack(alignment: .leading, spacing: 4) {
//                    Text("Settings")
//                        .font(.system(size: 28, weight: .bold))
//                    Text("Manage your account, preferences, and app settings.")
//                        .font(.title3)
//                        .foregroundColor(.quizifyTextGray)
//                }
//                
//                // MARK: - Settings Columns
//                HStack(alignment: .top, spacing: 30) {
//                    // Left Column
//                    LeftSettingsColumn(
//                        firstName: $firstName,
//                        lastName: $lastName,
//                        email: $email,
//                        username: $username,
//                        currentPassword: $currentPassword,
//                        newPassword: $newPassword,
//                        confirmNewPassword: $confirmNewPassword,
//                        isPasswordVerified: $isPasswordVerified
//                    )
//                    
//                    // Right Column
//                    RightSettingsColumn(
//                        selectedTheme: $selectedTheme,
//                        selectedAccentColor: $selectedAccentColor,
//                        textSize: $textSize,
//                        reduceMotion: $reduceMotion,
//                        emailNotifications: $emailNotifications,
//                        pushNotifications: $pushNotifications,
//                        selectedLegalText: $selectedLegalText
//                    )
//                }
//            }
//            .padding(30)
//        }
//        .sheet(item: $selectedLegalText) { legalText in
//            LegalTextView(legalText: legalText)
//        }
//    }
//}
//
//// MARK: - Column Views
//struct LeftSettingsColumn: View {
//    @Binding var firstName: String
//    @Binding var lastName: String
//    @Binding var email: String
//    @Binding var username: String
//    @Binding var currentPassword: String
//    @Binding var newPassword: String
//    @Binding var confirmNewPassword: String
//    @Binding var isPasswordVerified: Bool
//
//    var body: some View {
//        TitledSection(title: "Profile & Account", description: "Edit your personal information and manage your password.") {
//            VStack(spacing: 20) {
//                FormRow(label: "First Name", icon: "person.fill") {
//                    TextField("John", text: $firstName)
//                }
//                FormRow(label: "Last Name", icon: "person.fill") {
//                    TextField("Smith", text: $lastName)
//                }
//                FormRow(label: "Email", icon: "envelope.fill") {
//                    TextField("john.smith@example.com", text: $email)
//                }
//                FormRow(label: "Username", icon: "at") {
//                    TextField("johnsmith", text: $username)
//                }
//                
//                Divider().padding(.vertical, 10)
//                
//                if !isPasswordVerified {
//                    FormRow(label: "Password", icon: "lock.shield.fill") {
//                        SecureField("Enter Current Password", text: $currentPassword)
//                    }
//                    Button(action: { isPasswordVerified = true }) {
//                        Label("Verify Password", systemImage: "checkmark.seal.fill")
//                    }
//                    .buttonStyle(OutlineButtonStyle(color: .quizifyPrimary))
//                } else {
//                    FormRow(label: "New Password", icon: "lock.plus.fill") {
//                        SecureField("Enter New Password", text: $newPassword)
//                    }
//                    FormRow(label: "Confirm", icon: "lock.plus.fill") {
//                        SecureField("Confirm New Password", text: $confirmNewPassword)
//                    }
//                }
//                
//                HStack {
//                    Spacer()
//                    Button(action: {}) {
//                        Label("Save Changes", systemImage: "checkmark.circle.fill")
//                            .fontWeight(.semibold)
//                            .padding(.horizontal, 20)
//                            .padding(.vertical, 10)
//                    }
//                    .buttonStyle(FilledButtonStyle(color: .quizifyPrimary))
//                }
//            }
//        }
//    }
//}
//
//struct RightSettingsColumn: View {
//    @Binding var selectedTheme: Theme
//    @Binding var selectedAccentColor: Color
//    @Binding var textSize: Double
//    @Binding var reduceMotion: Bool
//    @Binding var emailNotifications: Bool
//    @Binding var pushNotifications: Bool
//    @Binding var selectedLegalText: LegalText?
//    
//    private let accentColors: [Color] = [.quizifyPrimary, .quizifyAccentBlue, .quizifyAccentGreen, .quizifyAccentYellow, .orange, .red]
//
//    var body: some View {
//        VStack(spacing: 30) {
//            TitledSection(title: "App Settings", description: "Customize the appearance and accessibility.") {
//                VStack(spacing: 25) {
//                    VStack(alignment: .leading, spacing: 10) {
//                        Text("Theme")
//                            .font(.headline)
//                            .foregroundColor(.quizifyTextGray)
//                        ThemeSelectorView(selectedTheme: $selectedTheme)
//                    }
//                    
//                    SettingsRow(label: "Accent Color", icon: "eyedropper.full") {
//                        AccentColorPicker(selectedColor: $selectedAccentColor, colors: accentColors)
//                    }
//                    
//                    SettingsRow(label: "Text Size", icon: "textformat.size") {
//                        Slider(value: $textSize, in: 0.8...1.5, step: 0.1)
//                    }
//                    
//                    SettingsRow(label: "Reduce Motion", icon: "figure.walk.motion") {
//                        StyledToggle(isOn: $reduceMotion)
//                    }
//                    
//                    SettingsRow(label: "Email Notifications", icon: "envelope.badge.fill") {
//                        StyledToggle(isOn: $emailNotifications)
//                    }
//                    
//                    SettingsRow(label: "Push Notifications", icon: "bell.badge.fill") {
//                        StyledToggle(isOn: $pushNotifications)
//                    }
//                }
//            }
//
//            TitledSection(title: "About & Support", description: "Get help and review our policies.") {
//                VStack(spacing: 15) {
//                    Button(action: { selectedLegalText = .helpCenter }) {
//                        SettingsLinkRow(icon: "questionmark.circle.fill", title: "Help Center")
//                    }
//                    Button(action: { selectedLegalText = .termsOfService }) {
//                        SettingsLinkRow(icon: "doc.text.fill", title: "Terms of Service")
//                    }
//                    Button(action: { selectedLegalText = .privacyPolicy }) {
//                        SettingsLinkRow(icon: "shield.lefthalf.filled", title: "Privacy Policy")
//                    }
//                }
//                .buttonStyle(PlainButtonStyle())
//            }
//        }
//    }
//}
//
//
//// MARK: - Helper Views for Settings
//// A reusable row for settings like toggles, sliders, and color pickers.
//struct SettingsRow<Content: View>: View {
//    let label: String
//    let icon: String
//    @ViewBuilder let content: Content
//
//    var body: some View {
//        HStack {
//            Image(systemName: icon)
//                .font(.headline)
//                .foregroundColor(.quizifyPrimary)
//                .frame(width: 25, alignment: .center)
//            Text(label)
//                .font(.headline)
//                .foregroundColor(.quizifyTextGray)
//            Spacer()
//            content
//        }
//    }
//}
//
//// A reusable row for text and secure fields.
//struct FormRow<Content: View>: View {
//    let label: String
//    let icon: String
//    @ViewBuilder let content: Content
//
//    var body: some View {
//        VStack(alignment: .leading, spacing: 8) {
//            HStack {
//                Image(systemName: icon)
//                Text(label)
//            }
//            .font(.headline)
//            .foregroundColor(.quizifyTextGray)
//            
//            content
//                .padding(12)
//                .background(Color.quizifyOffWhite)
//                .cornerRadius(8)
//                .overlay(
//                    RoundedRectangle(cornerRadius: 8)
//                        .stroke(Color.quizifyLightGray, lineWidth: 1)
//                )
//        }
//    }
//}
//
//// A custom styled toggle switch.
//struct StyledToggle: View {
//    @Binding var isOn: Bool
//    
//    var body: some View {
//        Toggle("", isOn: $isOn)
//            .toggleStyle(SwitchToggleStyle(tint: .quizifyAccentGreen))
//    }
//}
//
//// A custom view for selecting an accent color.
//struct AccentColorPicker: View {
//    @Binding var selectedColor: Color
//    let colors: [Color]
//
//    var body: some View {
//        HStack {
//            ForEach(colors, id: \.self) { color in
//                Button(action: { selectedColor = color }) {
//                    Circle()
//                        .fill(color)
//                        .frame(width: 30, height: 30)
//                        .overlay(
//                            Circle()
//                                .stroke(selectedColor == color ? Color.blue.opacity(0.8) : Color.clear, lineWidth: 3)
//                        )
//                }
//                .buttonStyle(PlainButtonStyle())
//            }
//        }
//    }
//}
//
//// A row for navigation links.
//struct SettingsLinkRow: View {
//    let icon: String
//    let title: String
//    
//    var body: some View {
//        HStack {
//            Image(systemName: icon)
//                .font(.headline)
//                .foregroundColor(.quizifyPrimary)
//                .frame(width: 25)
//            Text(title)
//                .font(.headline)
//            Spacer()
//            Image(systemName: "chevron.right")
//                .foregroundColor(.gray)
//        }
//        .padding()
//        .background(Color.quizifyOffWhite)
//        .cornerRadius(12)
//        .overlay(
//            RoundedRectangle(cornerRadius: 12)
//                .stroke(Color.quizifyLightGray.opacity(0.5), lineWidth: 1)
//        )
//    }
//}
//
//// Enum to define the theme options.
//enum Theme: String, CaseIterable, Identifiable {
//    case system = "System"
//    case light = "Light"
//    case dark = "Dark"
//    var id: String { self.rawValue }
//}
//
//// A custom view for the theme selector.
//struct ThemeSelectorView: View {
//    @Binding var selectedTheme: Theme
//
//    var body: some View {
//        HStack(spacing: 15) {
//            ForEach(Theme.allCases) { theme in
//                Button(action: {
//                    withAnimation(.spring()) {
//                        selectedTheme = theme
//                    }
//                }) {
//                    VStack {
//                        Image(systemName: theme == .light ? "sun.max.fill" : (theme == .dark ? "moon.fill" : "display"))
//                            .font(.title2)
//                        Text(theme.rawValue)
//                            .font(.headline)
//                    }
//                    .frame(maxWidth: .infinity)
//                    .padding()
//                    .background(selectedTheme == theme ? Color.quizifyPrimary.opacity(0.1) : Color.clear)
//                    .foregroundColor(selectedTheme == theme ? .quizifyPrimary : .quizifyTextGray)
//                    .cornerRadius(12)
//                    .overlay(
//                        RoundedRectangle(cornerRadius: 12)
//                            .stroke(selectedTheme == theme ? .quizifyPrimary : Color.quizifyLightGray, lineWidth: 1.5)
//                    )
//                }
//                .buttonStyle(PlainButtonStyle())
//            }
//        }
//    }
//}
//
//
//// MARK: - Legal Text View and Model
//enum LegalText: String, Identifiable {
//    case helpCenter = "Help Center"
//    case termsOfService = "Terms of Service"
//    case privacyPolicy = "Privacy Policy"
//    
//    var id: String { self.rawValue }
//    
//    var icon: String {
//        switch self {
//        case .helpCenter: "questionmark.circle.fill"
//        case .termsOfService: "doc.text.fill"
//        case .privacyPolicy: "shield.lefthalf.filled"
//        }
//    }
//    
//    var content: String {
//        switch self {
//        case .helpCenter: "Welcome to the Quizify Help Center! Here you can find answers to frequently asked questions and get support for any issues you may encounter."
//        case .termsOfService: "By using Quizify, you agree to our Terms of Service. Please read them carefully."
//        case .privacyPolicy: "Our Privacy Policy explains how we collect, use, and protect your data."
//        }
//    }
//}
//
//struct LegalTextView: View {
//    let legalText: LegalText
//    @Environment(\.dismiss) var dismiss
//
//    var body: some View {
//        VStack(spacing: 0) {
//            // Header
//            HStack {
//                Image(systemName: legalText.icon)
//                    .font(.title)
//                    .foregroundColor(.quizifyPrimary)
//                Text(legalText.rawValue)
//                    .font(.largeTitle)
//                    .fontWeight(.bold)
//                Spacer()
//                Button(action: { dismiss() }) {
//                    Image(systemName: "xmark.circle.fill")
//                        .font(.title)
//                        .foregroundColor(.gray)
//                }
//            }
//            .padding()
//            .background(Color.white.shadow(.drop(radius: 5, y: 5)))
//            
//            // Content
//            ScrollView {
//                Text(legalText.content)
//                    .font(.title2)
//                    .padding()
//            }
//        }
//        .frame(minWidth: 600, minHeight: 400)
//    }
//}
//
//
//// MARK: - Preview
//struct SettingsView_Previews: PreviewProvider {
//    static var previews: some View {
//        SettingsView()
//    }
//}




//import SwiftUI
//
//// The SettingsView allows users to manage their personal information,
//// account credentials, and notification preferences.
//struct SettingsView: View {
//    // State variables for the settings options.
//    @State private var firstName = "John"
//    @State private var lastName = "Smith"
//    @State private var email = "john.smith@example.com"
//    @State private var username = "johnsmith"
//    @State private var currentPassword = ""
//    @State private var newPassword = ""
//    @State private var confirmNewPassword = ""
//    @State private var isPasswordVerified = false
//    
//    @State private var emailNotifications = true
//    @State private var pushNotifications = true
//    
//    @State private var selectedTheme: Theme = .system
//    @State private var selectedAccentColor: Color = .quizifyPrimary
//    @State private var textSize: Double = 1.0
//    @State private var reduceMotion = false
//    
//    // State for presenting the legal text sheets.
//    @State private var showingSheet = false
//    @State private var selectedLegalText: LegalText? = nil
//
//    var body: some View {
//        ScrollView {
//            VStack(alignment: .leading, spacing: 30) {
//                // MARK: - Header
//                VStack(alignment: .leading, spacing: 4) {
//                    Text("Settings")
//                        .font(.system(size: 28, weight: .bold))
//                    Text("Manage your account, preferences, and app settings.")
//                        .font(.title3)
//                        .foregroundColor(.quizifyTextGray)
//                }
//                
//                // MARK: - Settings Columns
//                HStack(alignment: .top, spacing: 30) {
//                    // Left Column
//                    LeftSettingsColumn(
//                        firstName: $firstName,
//                        lastName: $lastName,
//                        email: $email,
//                        username: $username,
//                        currentPassword: $currentPassword,
//                        newPassword: $newPassword,
//                        confirmNewPassword: $confirmNewPassword,
//                        isPasswordVerified: $isPasswordVerified
//                    )
//                    
//                    // Right Column
//                    RightSettingsColumn(
//                        selectedTheme: $selectedTheme,
//                        selectedAccentColor: $selectedAccentColor,
//                        textSize: $textSize,
//                        reduceMotion: $reduceMotion,
//                        emailNotifications: $emailNotifications,
//                        pushNotifications: $pushNotifications,
//                        selectedLegalText: $selectedLegalText
//                    )
//                }
//            }
//            .padding(30)
//        }
//        .sheet(item: $selectedLegalText) { legalText in
//            LegalTextView(legalText: legalText)
//        }
//    }
//}
//
//// MARK: - Column Views
//struct LeftSettingsColumn: View {
//    @Binding var firstName: String
//    @Binding var lastName: String
//    @Binding var email: String
//    @Binding var username: String
//    @Binding var currentPassword: String
//    @Binding var newPassword: String
//    @Binding var confirmNewPassword: String
//    @Binding var isPasswordVerified: Bool
//
//    var body: some View {
//        TitledSection(title: "Profile & Account", description: "Edit your personal information and manage your password.") {
//            VStack(spacing: 20) {
//                FormRow(label: "First Name", icon: "person.fill") {
//                    TextField("John", text: $firstName)
//                }
//                FormRow(label: "Last Name", icon: "person.fill") {
//                    TextField("Smith", text: $lastName)
//                }
//                FormRow(label: "Email", icon: "envelope.fill") {
//                    TextField("john.smith@example.com", text: $email)
//                }
//                FormRow(label: "Username", icon: "at") {
//                    TextField("johnsmith", text: $username)
//                }
//                
//                Divider().padding(.vertical, 10)
//                
//                if !isPasswordVerified {
//                    FormRow(label: "Password", icon: "lock.shield.fill") {
//                        SecureField("Enter Current Password", text: $currentPassword)
//                    }
//                    Button(action: { isPasswordVerified = true }) {
//                        Label("Verify Password", systemImage: "checkmark.seal.fill")
//                    }
//                    .buttonStyle(OutlineButtonStyle(color: .quizifyPrimary))
//                } else {
//                    FormRow(label: "New Password", icon: "lock.plus.fill") {
//                        SecureField("Enter New Password", text: $newPassword)
//                    }
//                    FormRow(label: "Confirm", icon: "lock.plus.fill") {
//                        SecureField("Confirm New Password", text: $confirmNewPassword)
//                    }
//                }
//                
//                HStack {
//                    Spacer()
//                    Button(action: {}) {
//                        Label("Save Changes", systemImage: "checkmark.circle.fill")
//                            .fontWeight(.semibold)
//                            .padding(.horizontal, 20)
//                            .padding(.vertical, 10)
//                    }
//                    .buttonStyle(FilledButtonStyle(color: .quizifyPrimary))
//                }
//            }
//        }
//    }
//}
//
//struct RightSettingsColumn: View {
//    @Binding var selectedTheme: Theme
//    @Binding var selectedAccentColor: Color
//    @Binding var textSize: Double
//    @Binding var reduceMotion: Bool
//    @Binding var emailNotifications: Bool
//    @Binding var pushNotifications: Bool
//    @Binding var selectedLegalText: LegalText?
//    
//    private let accentColors: [Color] = [.quizifyPrimary, .quizifyAccentBlue, .quizifyAccentGreen, .quizifyAccentYellow, .orange, .red]
//
//    var body: some View {
//        VStack(spacing: 30) {
//            TitledSection(title: "App Settings", description: "Customize the appearance and accessibility.") {
//                VStack(spacing: 25) {
//                    VStack(alignment: .leading, spacing: 10) {
//                        Text("Theme")
//                            .font(.headline)
//                            .foregroundColor(.quizifyTextGray)
//                        ThemeSelectorView(selectedTheme: $selectedTheme)
//                    }
//                    
//                    SettingsRow(label: "Accent Color", icon: "eyedropper.full") {
//                        AccentColorPicker(selectedColor: $selectedAccentColor, colors: accentColors)
//                    }
//                    
//                    SettingsRow(label: "Text Size", icon: "textformat.size") {
//                        Slider(value: $textSize, in: 0.8...1.5, step: 0.1)
//                    }
//                    
//                    SettingsRow(label: "Reduce Motion", icon: "figure.walk.motion") {
//                        StyledToggle(isOn: $reduceMotion)
//                    }
//                    
//                    SettingsRow(label: "Email Notifications", icon: "envelope.badge.fill") {
//                        StyledToggle(isOn: $emailNotifications)
//                    }
//                    
//                    SettingsRow(label: "Push Notifications", icon: "bell.badge.fill") {
//                        StyledToggle(isOn: $pushNotifications)
//                    }
//                }
//            }
//
//            TitledSection(title: "About & Support", description: "Get help and review our policies.") {
//                VStack(spacing: 15) {
//                    Button(action: { selectedLegalText = .helpCenter }) {
//                        SettingsLinkRow(icon: "questionmark.circle.fill", title: "Help Center")
//                    }
//                    Button(action: { selectedLegalText = .termsOfService }) {
//                        SettingsLinkRow(icon: "doc.text.fill", title: "Terms of Service")
//                    }
//                    Button(action: { selectedLegalText = .privacyPolicy }) {
//                        SettingsLinkRow(icon: "shield.lefthalf.filled", title: "Privacy Policy")
//                    }
//                }
//                .buttonStyle(PlainButtonStyle())
//            }
//        }
//    }
//}
//
//
//// MARK: - Helper Views for Settings
//// A reusable row for settings like toggles, sliders, and color pickers.
//struct SettingsRow<Content: View>: View {
//    let label: String
//    let icon: String
//    @ViewBuilder let content: Content
//
//    var body: some View {
//        HStack {
//            Image(systemName: icon)
//                .font(.headline)
//                .foregroundColor(.quizifyPrimary)
//                .frame(width: 25, alignment: .center)
//            Text(label)
//                .font(.headline)
//                .foregroundColor(.quizifyTextGray)
//            Spacer()
//            content
//        }
//    }
//}
//
//// A reusable row for text and secure fields.
//struct FormRow<Content: View>: View {
//    let label: String
//    let icon: String
//    @ViewBuilder let content: Content
//
//    var body: some View {
//        VStack(alignment: .leading, spacing: 8) {
//            HStack {
//                Image(systemName: icon)
//                Text(label)
//            }
//            .font(.headline)
//            .foregroundColor(.quizifyTextGray)
//            
//            content
//                .padding(12)
//                .background(Color.quizifyOffWhite)
//                .cornerRadius(8)
//                .overlay(
//                    RoundedRectangle(cornerRadius: 8)
//                        .stroke(Color.quizifyLightGray, lineWidth: 1)
//                )
//        }
//    }
//}
//
//// A custom styled toggle switch.
//struct StyledToggle: View {
//    @Binding var isOn: Bool
//    
//    var body: some View {
//        Toggle("", isOn: $isOn)
//            .toggleStyle(SwitchToggleStyle(tint: .quizifyAccentGreen))
//    }
//}
//
//// A custom view for selecting an accent color.
//struct AccentColorPicker: View {
//    @Binding var selectedColor: Color
//    let colors: [Color]
//
//    var body: some View {
//        HStack {
//            ForEach(colors, id: \.self) { color in
//                Button(action: { selectedColor = color }) {
//                    Circle()
//                        .fill(color)
//                        .frame(width: 30, height: 30)
//                        .overlay(
//                            Circle()
//                                .stroke(selectedColor == color ? Color.blue.opacity(0.8) : Color.clear, lineWidth: 3)
//                        )
//                }
//                .buttonStyle(PlainButtonStyle())
//            }
//        }
//    }
//}
//
//// A row for navigation links.
//struct SettingsLinkRow: View {
//    let icon: String
//    let title: String
//    
//    var body: some View {
//        HStack {
//            Image(systemName: icon)
//                .font(.headline)
//                .foregroundColor(.quizifyPrimary)
//                .frame(width: 25)
//            Text(title)
//                .font(.headline)
//            Spacer()
//            Image(systemName: "chevron.right")
//                .foregroundColor(.gray)
//        }
//        .padding()
//        .background(Color.quizifyOffWhite)
//        .cornerRadius(12)
//        .overlay(
//            RoundedRectangle(cornerRadius: 12)
//                .stroke(Color.quizifyLightGray.opacity(0.5), lineWidth: 1)
//        )
//    }
//}
//
//// Enum to define the theme options.
//enum Theme: String, CaseIterable, Identifiable {
//    case system = "System"
//    case light = "Light"
//    case dark = "Dark"
//    var id: String { self.rawValue }
//}
//
//// A custom view for the theme selector.
//struct ThemeSelectorView: View {
//    @Binding var selectedTheme: Theme
//
//    var body: some View {
//        HStack(spacing: 15) {
//            ForEach(Theme.allCases) { theme in
//                Button(action: {
//                    withAnimation(.spring()) {
//                        selectedTheme = theme
//                    }
//                }) {
//                    VStack {
//                        Image(systemName: theme == .light ? "sun.max.fill" : (theme == .dark ? "moon.fill" : "display"))
//                            .font(.title2)
//                        Text(theme.rawValue)
//                            .font(.headline)
//                    }
//                    .frame(maxWidth: .infinity)
//                    .padding()
//                    .background(selectedTheme == theme ? Color.quizifyPrimary.opacity(0.1) : Color.clear)
//                    .foregroundColor(selectedTheme == theme ? .quizifyPrimary : .quizifyTextGray)
//                    .cornerRadius(12)
//                    .overlay(
//                        RoundedRectangle(cornerRadius: 12)
//                            .stroke(selectedTheme == theme ? .quizifyPrimary : Color.quizifyLightGray, lineWidth: 1.5)
//                    )
//                }
//                .buttonStyle(PlainButtonStyle())
//            }
//        }
//    }
//}
//
//
//// MARK: - Legal Text View and Model
//enum LegalText: String, Identifiable {
//    case helpCenter = "Help Center"
//    case termsOfService = "Terms of Service"
//    case privacyPolicy = "Privacy Policy"
//    
//    var id: String { self.rawValue }
//    
//    var icon: String {
//        switch self {
//        case .helpCenter: "questionmark.circle.fill"
//        case .termsOfService: "doc.text.fill"
//        case .privacyPolicy: "shield.lefthalf.filled"
//        }
//    }
//    
//    var content: String {
//        switch self {
//        case .helpCenter: "Welcome to the Quizify Help Center! Here you can find answers to frequently asked questions and get support for any issues you may encounter."
//        case .termsOfService: "By using Quizify, you agree to our Terms of Service. Please read them carefully."
//        case .privacyPolicy: "Our Privacy Policy explains how we collect, use, and protect your data."
//        }
//    }
//}
//
//struct LegalTextView: View {
//    let legalText: LegalText
//    @Environment(\.dismiss) var dismiss
//
//    var body: some View {
//        VStack(spacing: 0) {
//            // Header
//            HStack {
//                Image(systemName: legalText.icon)
//                    .font(.title)
//                    .foregroundColor(.quizifyPrimary)
//                Text(legalText.rawValue)
//                    .font(.largeTitle)
//                    .fontWeight(.bold)
//                Spacer()
//                Button(action: { dismiss() }) {
//                    Image(systemName: "xmark.circle.fill")
//                        .font(.title)
//                        .foregroundColor(.gray)
//                }
//            }
//            .padding()
//            .background(Color.white.shadow(.drop(radius: 5, y: 5)))
//            
//            // Content
//            ScrollView {
//                Text(legalText.content)
//                    .font(.title2)
//                    .padding()
//            }
//        }
//        .frame(minWidth: 600, minHeight: 400)
//    }
//}
//
//
//// MARK: - Preview
//struct SettingsView_Previews: PreviewProvider {
//    static var previews: some View {
//        SettingsView()
//    }
//}



//import SwiftUI
//
//// The SettingsView allows users to manage their personal information,
//// account credentials, and notification preferences.
//struct SettingsView: View {
//    // State variables for the settings options.
//    @State private var firstName = "John"
//    @State private var lastName = "Smith"
//    @State private var email = "john.smith@example.com"
//    @State private var username = "johnsmith"
//    @State private var currentPassword = ""
//    @State private var newPassword = ""
//    @State private var confirmNewPassword = ""
//    @State private var isPasswordVerified = false
//    
//    @State private var emailNotifications = true
//    @State private var pushNotifications = true
//    
//    @State private var selectedTheme: Theme = .system
//    @State private var selectedAccentColor: Color = .quizifyPrimary
//    @State private var textSize: Double = 1.0
//    @State private var reduceMotion = false
//    
//    // State for presenting the legal text sheets.
//    @State private var showingSheet = false
//    @State private var selectedLegalText: LegalText? = nil
//
//    var body: some View {
//        ScrollView {
//            VStack(alignment: .leading, spacing: 30) {
//                // MARK: - Header
//                VStack(alignment: .leading, spacing: 4) {
//                    Text("Settings")
//                        .font(.system(size: 28, weight: .bold))
//                    Text("Manage your account, preferences, and app settings.")
//                        .font(.title3)
//                        .foregroundColor(.quizifyTextGray)
//                }
//                
//                // MARK: - Settings Columns
//                HStack(alignment: .top, spacing: 30) {
//                    // Left Column
//                    LeftSettingsColumn(
//                        firstName: $firstName,
//                        lastName: $lastName,
//                        email: $email,
//                        username: $username,
//                        currentPassword: $currentPassword,
//                        newPassword: $newPassword,
//                        confirmNewPassword: $confirmNewPassword,
//                        isPasswordVerified: $isPasswordVerified
//                    )
//                    
//                    // Right Column
//                    RightSettingsColumn(
//                        selectedTheme: $selectedTheme,
//                        selectedAccentColor: $selectedAccentColor,
//                        textSize: $textSize,
//                        reduceMotion: $reduceMotion,
//                        emailNotifications: $emailNotifications,
//                        pushNotifications: $pushNotifications,
//                        selectedLegalText: $selectedLegalText
//                    )
//                }
//            }
//            .padding(30)
//        }
//        .sheet(item: $selectedLegalText) { legalText in
//            LegalTextView(legalText: legalText)
//        }
//    }
//}
//
//// MARK: - Column Views
//struct LeftSettingsColumn: View {
//    @Binding var firstName: String
//    @Binding var lastName: String
//    @Binding var email: String
//    @Binding var username: String
//    @Binding var currentPassword: String
//    @Binding var newPassword: String
//    @Binding var confirmNewPassword: String
//    @Binding var isPasswordVerified: Bool
//
//    var body: some View {
//        TitledSection(title: "Profile & Account", description: "Edit your personal information and manage your password.") {
//            VStack(spacing: 20) {
//                FormField(label: "First Name", icon: "person.fill") {
//                    TextField("John", text: $firstName)
//                }
//                FormField(label: "Last Name", icon: "person.fill") {
//                    TextField("Smith", text: $lastName)
//                }
//                FormField(label: "Email", icon: "envelope.fill") {
//                    TextField("john.smith@example.com", text: $email)
//                }
//                FormField(label: "Username", icon: "at") {
//                    TextField("johnsmith", text: $username)
//                }
//                
//                Divider().padding(.vertical, 10)
//                
//                if !isPasswordVerified {
//                    FormField(label: "Password", icon: "lock.shield.fill") {
//                        SecureField("Enter Current Password", text: $currentPassword)
//                    }
//                    Button(action: { isPasswordVerified = true }) {
//                        Label("Verify Password", systemImage: "checkmark.seal.fill")
//                            .fontWeight(.semibold)
//                            .frame(maxWidth: .infinity)
//                            .padding(.vertical, 10)
//                    }
//                    .buttonStyle(OutlineButtonStyle(color: .quizifyPrimary))
//                } else {
//                    FormField(label: "New Password", icon: "lock.plus.fill") {
//                        SecureField("Enter New Password", text: $newPassword)
//                    }
//                    FormField(label: "Confirm", icon: "lock.plus.fill") {
//                        SecureField("Confirm New Password", text: $confirmNewPassword)
//                    }
//                }
//                
//                HStack {
//                    Spacer()
//                    Button(action: {}) {
//                        Label("Save Changes", systemImage: "checkmark.circle.fill")
//                            .fontWeight(.semibold)
//                            .padding(.horizontal, 20)
//                            .padding(.vertical, 10)
//                    }
//                    .buttonStyle(FilledButtonStyle(color: .quizifyPrimary))
//                }
//            }
//        }
//    }
//}
//
//struct RightSettingsColumn: View {
//    @Binding var selectedTheme: Theme
//    @Binding var selectedAccentColor: Color
//    @Binding var textSize: Double
//    @Binding var reduceMotion: Bool
//    @Binding var emailNotifications: Bool
//    @Binding var pushNotifications: Bool
//    @Binding var selectedLegalText: LegalText?
//    
//    private let accentColors: [Color] = [.quizifyPrimary, .quizifyAccentBlue, .quizifyAccentGreen, .quizifyAccentYellow, .orange, .red]
//
//    var body: some View {
//        VStack(spacing: 30) {
//            TitledSection(title: "App Settings", description: "Customize the appearance and accessibility.") {
//                VStack(spacing: 25) {
//                    VStack(alignment: .leading, spacing: 10) {
//                        Text("Theme")
//                            .font(.headline)
//                            .foregroundColor(.quizifyTextGray)
//                        ThemeSelectorView(selectedTheme: $selectedTheme)
//                    }
//                    
//                    SettingsRow(label: "Accent Color", icon: "eyedropper.full") {
//                        AccentColorPicker(selectedColor: $selectedAccentColor, colors: accentColors)
//                    }
//                    
//                    SettingsRow(label: "Text Size", icon: "textformat.size") {
//                        Slider(value: $textSize, in: 0.8...1.5, step: 0.1)
//                    }
//                    
//                    SettingsRow(label: "Reduce Motion", icon: "figure.walk.motion") {
//                        StyledToggle(isOn: $reduceMotion)
//                    }
//                    
//                    SettingsRow(label: "Email Notifications", icon: "envelope.badge.fill") {
//                        StyledToggle(isOn: $emailNotifications)
//                    }
//                    
//                    SettingsRow(label: "Push Notifications", icon: "bell.badge.fill") {
//                        StyledToggle(isOn: $pushNotifications)
//                    }
//                }
//            }
//
//            TitledSection(title: "About & Support", description: "Get help and review our policies.") {
//                VStack(spacing: 15) {
//                    Button(action: { selectedLegalText = .helpCenter }) {
//                        SettingsLinkRow(icon: "questionmark.circle.fill", title: "Help Center")
//                    }
//                    Button(action: { selectedLegalText = .termsOfService }) {
//                        SettingsLinkRow(icon: "doc.text.fill", title: "Terms of Service")
//                    }
//                    Button(action: { selectedLegalText = .privacyPolicy }) {
//                        SettingsLinkRow(icon: "shield.lefthalf.filled", title: "Privacy Policy")
//                    }
//                }
//                .buttonStyle(PlainButtonStyle())
//            }
//        }
//    }
//}
//
//
//// MARK: - Helper Views for Settings
//// A reusable row for settings like toggles, sliders, and color pickers.
//struct SettingsRow<Content: View>: View {
//    let label: String
//    let icon: String
//    @ViewBuilder let content: Content
//
//    var body: some View {
//        HStack {
//            Image(systemName: icon)
//                .font(.headline)
//                .foregroundColor(.quizifyPrimary)
//                .frame(width: 25, alignment: .center)
//            Text(label)
//                .font(.headline)
//                .foregroundColor(.quizifyTextGray)
//            Spacer()
//            content
//        }
//    }
//}
//
//// A reusable row for text and secure fields.
//struct FormField<Content: View>: View {
//    let label: String
//    let icon: String
//    @ViewBuilder let content: Content
//
//    var body: some View {
//        VStack(alignment: .leading, spacing: 8) {
//            HStack {
//                Image(systemName: icon)
//                Text(label)
//            }
//            .font(.headline)
//            .foregroundColor(.quizifyTextGray)
//            
//            content
//                .padding(12)
//                .background(Color.quizifyOffWhite)
//                .cornerRadius(8)
//                .overlay(
//                    RoundedRectangle(cornerRadius: 8)
//                        .stroke(Color.quizifyLightGray, lineWidth: 1)
//                )
//        }
//    }
//}
//
//// A custom styled toggle switch.
//struct StyledToggle: View {
//    @Binding var isOn: Bool
//    
//    var body: some View {
//        Toggle("", isOn: $isOn)
//            .toggleStyle(SwitchToggleStyle(tint: .quizifyAccentGreen))
//    }
//}
//
//// A custom view for selecting an accent color.
//struct AccentColorPicker: View {
//    @Binding var selectedColor: Color
//    let colors: [Color]
//
//    var body: some View {
//        HStack {
//            ForEach(colors, id: \.self) { color in
//                Button(action: { selectedColor = color }) {
//                    Circle()
//                        .fill(color)
//                        .frame(width: 30, height: 30)
//                        .overlay(
//                            Circle()
//                                .stroke(selectedColor == color ? Color.blue.opacity(0.8) : Color.clear, lineWidth: 3)
//                        )
//                }
//                .buttonStyle(PlainButtonStyle())
//            }
//        }
//    }
//}
//
//// A row for navigation links.
//struct SettingsLinkRow: View {
//    let icon: String
//    let title: String
//    
//    var body: some View {
//        HStack {
//            Image(systemName: icon)
//                .font(.headline)
//                .foregroundColor(.quizifyPrimary)
//                .frame(width: 25)
//            Text(title)
//                .font(.headline)
//            Spacer()
//            Image(systemName: "chevron.right")
//                .foregroundColor(.gray)
//        }
//        .padding()
//        .background(Color.quizifyOffWhite)
//        .cornerRadius(12)
//        .overlay(
//            RoundedRectangle(cornerRadius: 12)
//                .stroke(Color.quizifyLightGray.opacity(0.5), lineWidth: 1)
//        )
//    }
//}
//
//// Enum to define the theme options.
//enum Theme: String, CaseIterable, Identifiable {
//    case system = "System"
//    case light = "Light"
//    case dark = "Dark"
//    var id: String { self.rawValue }
//}
//
//// A custom view for the theme selector.
//struct ThemeSelectorView: View {
//    @Binding var selectedTheme: Theme
//
//    var body: some View {
//        HStack(spacing: 15) {
//            ForEach(Theme.allCases) { theme in
//                Button(action: {
//                    withAnimation(.spring()) {
//                        selectedTheme = theme
//                    }
//                }) {
//                    VStack {
//                        Image(systemName: theme == .light ? "sun.max.fill" : (theme == .dark ? "moon.fill" : "display"))
//                            .font(.title2)
//                        Text(theme.rawValue)
//                            .font(.headline)
//                    }
//                    .frame(maxWidth: .infinity)
//                    .padding()
//                    .background(selectedTheme == theme ? Color.quizifyPrimary.opacity(0.1) : Color.clear)
//                    .foregroundColor(selectedTheme == theme ? .quizifyPrimary : .quizifyTextGray)
//                    .cornerRadius(12)
//                    .overlay(
//                        RoundedRectangle(cornerRadius: 12)
//                            .stroke(selectedTheme == theme ? .quizifyPrimary : Color.quizifyLightGray, lineWidth: 1.5)
//                    )
//                }
//                .buttonStyle(PlainButtonStyle())
//            }
//        }
//    }
//}
//
//
//// MARK: - Legal Text View and Model
//enum LegalText: String, Identifiable {
//    case helpCenter = "Help Center"
//    case termsOfService = "Terms of Service"
//    case privacyPolicy = "Privacy Policy"
//    
//    var id: String { self.rawValue }
//    
//    var icon: String {
//        switch self {
//        case .helpCenter: "questionmark.circle.fill"
//        case .termsOfService: "doc.text.fill"
//        case .privacyPolicy: "shield.lefthalf.filled"
//        }
//    }
//    
//    var content: String {
//        switch self {
//        case .helpCenter: "Welcome to the Quizify Help Center! Here you can find answers to frequently asked questions and get support for any issues you may encounter."
//        case .termsOfService: "By using Quizify, you agree to our Terms of Service. Please read them carefully."
//        case .privacyPolicy: "Our Privacy Policy explains how we collect, use, and protect your data."
//        }
//    }
//}
//
//struct LegalTextView: View {
//    let legalText: LegalText
//    @Environment(\.dismiss) var dismiss
//
//    var body: some View {
//        VStack(spacing: 0) {
//            // Header
//            HStack {
//                Image(systemName: legalText.icon)
//                    .font(.title)
//                    .foregroundColor(.quizifyPrimary)
//                Text(legalText.rawValue)
//                    .font(.largeTitle)
//                    .fontWeight(.bold)
//                Spacer()
//                Button(action: { dismiss() }) {
//                    Image(systemName: "xmark.circle.fill")
//                        .font(.title)
//                        .foregroundColor(.gray)
//                }
//            }
//            .padding()
//            .background(Color.white.shadow(.drop(radius: 5, y: 5)))
//            
//            // Content
//            ScrollView {
//                Text(legalText.content)
//                    .font(.title2)
//                    .padding()
//            }
//        }
//        .frame(minWidth: 600, minHeight: 400)
//    }
//}
//
//
//// MARK: - Preview
//struct SettingsView_Previews: PreviewProvider {
//    static var previews: some View {
//        SettingsView()
//    }
//}





// now we're talking 10000

//import SwiftUI
//
//// The SettingsView allows users to manage their personal information,
//// account credentials, and notification preferences.
//struct SettingsView: View {
//    // State variables for the settings options.
//    @State private var firstName = "John"
//    @State private var lastName = "Smith"
//    @State private var email = "john.smith@example.com"
//    @State private var username = "johnsmith"
//    @State private var currentPassword = ""
//    @State private var newPassword = ""
//    @State private var confirmNewPassword = ""
//    @State private var isPasswordVerified = false
//    
//    @State private var emailNotifications = true
//    @State private var pushNotifications = true
//    
//    @State private var selectedTheme: Theme = .system
//    @State private var selectedAccentColor: Color = .quizifyPrimary
//    @State private var textSize: Double = 1.0
//    @State private var reduceMotion = false
//    
//    // State for presenting the legal text sheets.
//    @State private var showingSheet = false
//    @State private var selectedLegalText: LegalText? = nil
//
//    var body: some View {
//        ScrollView {
//            VStack(alignment: .leading, spacing: 30) {
//                // MARK: - Header
//                VStack(alignment: .leading, spacing: 4) {
//                    Text("Settings")
//                        .font(.system(size: 28, weight: .bold))
//                    Text("Manage your account, preferences, and app settings.")
//                        .font(.title3)
//                        .foregroundColor(.quizifyTextGray)
//                }
//                
//                // MARK: - Settings Columns
//                HStack(alignment: .top, spacing: 30) {
//                    // Left Column
//                    LeftSettingsColumn(
//                        firstName: $firstName,
//                        lastName: $lastName,
//                        email: $email,
//                        username: $username,
//                        currentPassword: $currentPassword,
//                        newPassword: $newPassword,
//                        confirmNewPassword: $confirmNewPassword,
//                        isPasswordVerified: $isPasswordVerified
//                    )
//                    
//                    // Right Column
//                    RightSettingsColumn(
//                        selectedTheme: $selectedTheme,
//                        selectedAccentColor: $selectedAccentColor,
//                        textSize: $textSize,
//                        reduceMotion: $reduceMotion,
//                        emailNotifications: $emailNotifications,
//                        pushNotifications: $pushNotifications,
//                        selectedLegalText: $selectedLegalText
//                    )
//                }
//            }
//            .padding(30)
//        }
//        .sheet(item: $selectedLegalText) { legalText in
//            LegalTextView(legalText: legalText)
//        }
//    }
//}
//
//// MARK: - Column Views
//
//
//struct LeftSettingsColumn: View {
//    @Binding var firstName: String
//    @Binding var lastName: String
//    @Binding var email: String
//    @Binding var username: String
//    @Binding var currentPassword: String
//    @Binding var newPassword: String
//    @Binding var confirmNewPassword: String
//    @Binding var isPasswordVerified: Bool
//
//    var body: some View {
//        TitledSection(title: "Profile & Account", description: "Edit your personal information and manage your password.") {
//            VStack(spacing: 20) {
//                // Input fields with plain style to remove internal white background
//                FormField(label: "First Name", icon: "person.fill") {
//                    TextField("John", text: $firstName)
//                        .textFieldStyle(.plain) // ✅ Use plain style
//                }
//                FormField(label: "Last Name", icon: "person.fill") {
//                    TextField("Smith", text: $lastName)
//                        .textFieldStyle(.plain)
//                }
//                FormField(label: "Email", icon: "envelope.fill") {
//                    TextField("john.smith@example.com", text: $email)
//                        .textFieldStyle(.plain)
//                }
//                FormField(label: "Username", icon: "at") {
//                    TextField("johnsmith", text: $username)
//                        .textFieldStyle(.plain)
//                }
//
//                Divider().padding(.vertical, 10)
//                
//                if !isPasswordVerified {
//                    FormField(label: "Password", icon: "lock.shield.fill") {
//                        SecureField("Enter Current Password", text: $currentPassword)
//                            .textFieldStyle(.plain)
//                    }
//                    
//                    // Verify Password button
//                    HStack {
//                        Spacer()
//                        Button(action: { isPasswordVerified = true }) {
//                            Label("Verify Password", systemImage: "checkmark.seal.fill")
//                                .fontWeight(.semibold)
//                                .padding(.horizontal, 25)
//                                .padding(.vertical, 10)
//                        }
//                        .buttonStyle(OutlineButtonStyle(color: .quizifyPrimary))
//                        Spacer()
//                    }
//                    .padding(.top, 5)
//                } else {
//                    FormField(label: "New Password", icon: "lock.plus.fill") {
//                        SecureField("Enter New Password", text: $newPassword)
//                            .textFieldStyle(.plain)
//                    }
//                    FormField(label: "Confirm", icon: "lock.plus.fill") {
//                        SecureField("Confirm New Password", text: $confirmNewPassword)
//                            .textFieldStyle(.plain)
//                    }
//                }
//
//                // Save Changes button
//                HStack {
//                    Spacer()
//                    Button(action: {}) {
//                        Label("Save Changes", systemImage: "checkmark.circle.fill")
//                            .fontWeight(.semibold)
//                            .padding(.horizontal, 20)
//                            .padding(.vertical, 10)
//                    }
//                    .buttonStyle(FilledButtonStyle(color: .quizifyPrimary))
//                }
//            }
//        }
//    }
//}
//
//
//
//
//
//struct RightSettingsColumn: View {
//    @Binding var selectedTheme: Theme
//    @Binding var selectedAccentColor: Color
//    @Binding var textSize: Double
//    @Binding var reduceMotion: Bool
//    @Binding var emailNotifications: Bool
//    @Binding var pushNotifications: Bool
//    @Binding var selectedLegalText: LegalText?
//    
//    private let accentColors: [Color] = [.quizifyPrimary, .quizifyAccentBlue, .quizifyAccentGreen, .quizifyAccentYellow, .orange, .red]
//
//    var body: some View {
//        VStack(spacing: 30) {
//            TitledSection(title: "App Settings", description: "Customize the appearance and accessibility.") {
//                VStack(spacing: 25) {
//                    VStack(alignment: .leading, spacing: 10) {
//                        Text("Theme")
//                            .font(.headline)
//                            .foregroundColor(.quizifyTextGray)
//                        ThemeSelectorView(selectedTheme: $selectedTheme)
//                    }
//                    
//                    SettingsRow(label: "Accent Color", icon: "eyedropper.full") {
//                        AccentColorPicker(selectedColor: $selectedAccentColor, colors: accentColors)
//                    }
//                    
//                    SettingsRow(label: "Text Size", icon: "textformat.size") {
//                        Slider(value: $textSize, in: 0.8...1.5, step: 0.1)
//                    }
//                    
//                    SettingsRow(label: "Reduce Motion", icon: "figure.walk.motion") {
//                        StyledToggle(isOn: $reduceMotion)
//                    }
//                    
//                    SettingsRow(label: "Email Notifications", icon: "envelope.badge.fill") {
//                        StyledToggle(isOn: $emailNotifications)
//                    }
//                    
//                    SettingsRow(label: "Push Notifications", icon: "bell.badge.fill") {
//                        StyledToggle(isOn: $pushNotifications)
//                    }
//                }
//            }
//
//            TitledSection(title: "About & Support", description: "Get help and review our policies.") {
//                VStack(spacing: 15) {
//                    Button(action: { selectedLegalText = .helpCenter }) {
//                        SettingsLinkRow(icon: "questionmark.circle.fill", title: "Help Center")
//                    }
//                    Button(action: { selectedLegalText = .termsOfService }) {
//                        SettingsLinkRow(icon: "doc.text.fill", title: "Terms of Service")
//                    }
//                    Button(action: { selectedLegalText = .privacyPolicy }) {
//                        SettingsLinkRow(icon: "shield.lefthalf.filled", title: "Privacy Policy")
//                    }
//                }
//                .buttonStyle(PlainButtonStyle())
//            }
//        }
//    }
//}
//
//
//// MARK: - Helper Views for Settings
//// A reusable row for settings like toggles, sliders, and color pickers.
//struct SettingsRow<Content: View>: View {
//    let label: String
//    let icon: String
//    @ViewBuilder let content: Content
//
//    var body: some View {
//        HStack {
//            Image(systemName: icon)
//                .font(.headline)
//                .foregroundColor(.quizifyPrimary)
//                .frame(width: 25, alignment: .center)
//            Text(label)
//                .font(.headline)
//                .foregroundColor(.quizifyTextGray)
//            Spacer()
//            content
//        }
//    }
//}
//
//// A reusable row for text and secure fields.
//struct FormField<Content: View>: View {
//    let label: String
//    let icon: String
//    @ViewBuilder let content: Content
//
//    var body: some View {
//        VStack(alignment: .leading, spacing: 8) {
//            HStack {
//                Image(systemName: icon)
//                Text(label)
//            }
//            .font(.headline)
//            .foregroundColor(.quizifyTextGray)
//            
//            content
//                .padding(12)
//                .background(Color.quizifyOffWhite)
//                .cornerRadius(8)
//                .overlay(
//                    RoundedRectangle(cornerRadius: 8)
//                        .stroke(Color.quizifyLightGray, lineWidth: 1)
//                )
//        }
//    }
//}
//
//// A custom styled toggle switch.
//struct StyledToggle: View {
//    @Binding var isOn: Bool
//    
//    var body: some View {
//        Toggle("", isOn: $isOn)
//            .toggleStyle(SwitchToggleStyle(tint: .quizifyAccentGreen))
//    }
//}
//
//// A custom view for selecting an accent color.
//struct AccentColorPicker: View {
//    @Binding var selectedColor: Color
//    let colors: [Color]
//
//    var body: some View {
//        HStack {
//            ForEach(colors, id: \.self) { color in
//                Button(action: { selectedColor = color }) {
//                    Circle()
//                        .fill(color)
//                        .frame(width: 30, height: 30)
//                        .overlay(
//                            Circle()
//                                .stroke(selectedColor == color ? Color.blue.opacity(0.8) : Color.clear, lineWidth: 3)
//                        )
//                }
//                .buttonStyle(PlainButtonStyle())
//            }
//        }
//    }
//}
//
//// A row for navigation links.
//struct SettingsLinkRow: View {
//    let icon: String
//    let title: String
//    
//    var body: some View {
//        HStack {
//            Image(systemName: icon)
//                .font(.headline)
//                .foregroundColor(.quizifyPrimary)
//                .frame(width: 25)
//            Text(title)
//                .font(.headline)
//            Spacer()
//            Image(systemName: "chevron.right")
//                .foregroundColor(.gray)
//        }
//        .padding()
//        .background(Color.quizifyOffWhite)
//        .cornerRadius(12)
//        .overlay(
//            RoundedRectangle(cornerRadius: 12)
//                .stroke(Color.quizifyLightGray.opacity(0.5), lineWidth: 1)
//        )
//    }
//}
//
//// Enum to define the theme options.
//enum Theme: String, CaseIterable, Identifiable {
//    case system = "System"
//    case light = "Light"
//    case dark = "Dark"
//    var id: String { self.rawValue }
//}
//
//// A custom view for the theme selector.
//struct ThemeSelectorView: View {
//    @Binding var selectedTheme: Theme
//
//    var body: some View {
//        HStack(spacing: 15) {
//            ForEach(Theme.allCases) { theme in
//                Button(action: {
//                    withAnimation(.spring()) {
//                        selectedTheme = theme
//                    }
//                }) {
//                    VStack {
//                        Image(systemName: theme == .light ? "sun.max.fill" : (theme == .dark ? "moon.fill" : "display"))
//                            .font(.title2)
//                        Text(theme.rawValue)
//                            .font(.headline)
//                    }
//                    .frame(maxWidth: .infinity)
//                    .padding()
//                    .background(selectedTheme == theme ? Color.quizifyPrimary.opacity(0.1) : Color.clear)
//                    .foregroundColor(selectedTheme == theme ? .quizifyPrimary : .quizifyTextGray)
//                    .cornerRadius(12)
//                    .overlay(
//                        RoundedRectangle(cornerRadius: 12)
//                            .stroke(selectedTheme == theme ? .quizifyPrimary : Color.quizifyLightGray, lineWidth: 1.5)
//                    )
//                }
//                .buttonStyle(PlainButtonStyle())
//            }
//        }
//    }
//}
//
//
//// MARK: - Legal Text View and Model
//enum LegalText: String, Identifiable {
//    case helpCenter = "Help Center"
//    case termsOfService = "Terms of Service"
//    case privacyPolicy = "Privacy Policy"
//    
//    var id: String { self.rawValue }
//    
//    var icon: String {
//        switch self {
//        case .helpCenter: "questionmark.circle.fill"
//        case .termsOfService: "doc.text.fill"
//        case .privacyPolicy: "shield.lefthalf.filled"
//        }
//    }
//    
//    var content: String {
//        switch self {
//        case .helpCenter: "Welcome to the Quizify Help Center! Here you can find answers to frequently asked questions and get support for any issues you may encounter."
//        case .termsOfService: "By using Quizify, you agree to our Terms of Service. Please read them carefully."
//        case .privacyPolicy: "Our Privacy Policy explains how we collect, use, and protect your data."
//        }
//    }
//}
//
//struct LegalTextView: View {
//    let legalText: LegalText
//    @Environment(\.dismiss) var dismiss
//
//    var body: some View {
//        VStack(spacing: 0) {
//            // Header
//            HStack {
//                Image(systemName: legalText.icon)
//                    .font(.title)
//                    .foregroundColor(.quizifyPrimary)
//                Text(legalText.rawValue)
//                    .font(.largeTitle)
//                    .fontWeight(.bold)
//                Spacer()
//                Button(action: { dismiss() }) {
//                    Image(systemName: "xmark.circle.fill")
//                        .font(.title)
//                        .foregroundColor(.gray)
//                }
//            }
//            .padding()
//            .background(Color.white.shadow(.drop(radius: 5, y: 5)))
//            
//            // Content
//            ScrollView {
//                Text(legalText.content)
//                    .font(.title2)
//                    .padding()
//            }
//        }
//        .frame(minWidth: 600, minHeight: 400)
//    }
//}
//
//
//// MARK: - Preview
//struct SettingsView_Previews: PreviewProvider {
//    static var previews: some View {
//        SettingsView()
//    }
//}




// now we're talking !!

import SwiftUI

// The SettingsView allows users to manage their personal information,
// account credentials, and notification preferences.
struct SettingsView: View {
    // State variables for the settings options.
    @State private var firstName = "John"
    @State private var lastName = "Smith"
    @State private var email = "john.smith@example.com"
    @State private var username = "johnsmith"
    @State private var currentPassword = ""
    @State private var newPassword = ""
    @State private var confirmNewPassword = ""
    @State private var isPasswordVerified = false

    @State private var emailNotifications = true
    @State private var pushNotifications = true

    @State private var selectedTheme: Theme = .system
    @State private var selectedAccentColor: Color = .quizifyPrimary
    @State private var textSize: Double = 1.0
    @State private var reduceMotion = false

    // State for presenting the legal text sheets.
    @State private var showingSheet = false
    @State private var selectedLegalText: LegalText? = nil

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 30) {
                // MARK: - Header
                VStack(alignment: .leading, spacing: 4) {
                    Text("Settings")
                        .font(.system(size: 28, weight: .bold))
                    Text("Manage your account, preferences, and app settings.")
                        .font(.title3)
                        .foregroundColor(.quizifyTextGray)
                }

                // MARK: - Settings Columns
                HStack(alignment: .top, spacing: 30) {
                    // Left Column
                    LeftSettingsColumn(
                        firstName: $firstName,
                        lastName: $lastName,
                        email: $email,
                        username: $username,
                        currentPassword: $currentPassword,
                        newPassword: $newPassword,
                        confirmNewPassword: $confirmNewPassword,
                        isPasswordVerified: $isPasswordVerified
                    )

                    // Right Column
                    RightSettingsColumn(
                        selectedTheme: $selectedTheme,
                        selectedAccentColor: $selectedAccentColor,
                        textSize: $textSize,
                        reduceMotion: $reduceMotion,
                        emailNotifications: $emailNotifications,
                        pushNotifications: $pushNotifications,
                        selectedLegalText: $selectedLegalText
                    )
                }
            }
            .padding(30)
        }
        .sheet(item: $selectedLegalText) { legalText in
            LegalTextView(legalText: legalText)
        }
    }
}

// MARK: - Column Views


struct LeftSettingsColumn: View {
    @Binding var firstName: String
    @Binding var lastName: String
    @Binding var email: String
    @Binding var username: String
    @Binding var currentPassword: String
    @Binding var newPassword: String
    @Binding var confirmNewPassword: String
    @Binding var isPasswordVerified: Bool

    var body: some View {
        TitledSection(title: "Profile & Account", description: "Edit your personal information and manage your password.") {
            VStack(spacing: 20) {
                // First Name
                FormField(label: "First Name", icon: "person.fill") {
                    TextField("John", text: $firstName)
                        .textFieldStyle(.plain)
                }
                
                // Last Name
                FormField(label: "Last Name", icon: "person.fill") {
                    TextField("Smith", text: $lastName)
                        .textFieldStyle(.plain)
                }

                // Email
                FormField(label: "Email", icon: "envelope.fill") {
                    TextField("john.smith@example.com", text: $email)
                        .textFieldStyle(.plain)
                }

                // Username
                FormField(label: "Username", icon: "at") {
                    TextField("johnsmith", text: $username)
                        .textFieldStyle(.plain)
                }

                Divider().padding(.vertical, 10)
                
                if !isPasswordVerified {
                    // Current Password
                    FormField(label: "Password", icon: "lock.shield.fill") {
                        SecureField("Enter Current Password", text: $currentPassword)
                            .textFieldStyle(.plain)
                    }
                    
                    // Verify Password button
                    HStack {
                        Spacer()
                        Button(action: { isPasswordVerified = true }) {
                            Label("Verify Password", systemImage: "checkmark.seal.fill")
                                .fontWeight(.semibold)
                                .padding(.horizontal, 25)
                                .padding(.vertical, 10)
                        }
                        .buttonStyle(OutlineButtonStyle(color: .quizifyPrimary))
                        Spacer()
                    }
                    .padding(.top, 5)
                } else {
                    // New Password
                    FormField(label: "New Password", icon: "lock.plus.fill") {
                        SecureField("Enter New Password", text: $newPassword)
                            .textFieldStyle(.plain)
                    }

                    // Confirm Password
                    FormField(label: "Confirm", icon: "lock.plus.fill") {
                        SecureField("Confirm New Password", text: $confirmNewPassword)
                            .textFieldStyle(.plain)
                    }
                }

                // Save Changes button
                HStack {
                    Spacer()
                    Button(action: {}) {
                        Label("Save Changes", systemImage: "checkmark.circle.fill")
                            .fontWeight(.semibold)
                            .padding(.horizontal, 20)
                            .padding(.vertical, 10)
                    }
                    .buttonStyle(FilledButtonStyle(color: .quizifyPrimary))
                }
            }
        }
    }
}






struct RightSettingsColumn: View {
    @Binding var selectedTheme: Theme
    @Binding var selectedAccentColor: Color
    @Binding var textSize: Double
    @Binding var reduceMotion: Bool
    @Binding var emailNotifications: Bool
    @Binding var pushNotifications: Bool
    @Binding var selectedLegalText: LegalText?

    private let accentColors: [Color] = [.quizifyPrimary, .quizifyAccentBlue, .quizifyAccentGreen, .quizifyAccentYellow, .orange, .red]

    var body: some View {
        VStack(spacing: 30) {
            TitledSection(title: "App Settings", description: "Customize the appearance and accessibility.") {
                VStack(spacing: 25) {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Theme")
                            .font(.headline)
                            .foregroundColor(.quizifyTextGray)
                        ThemeSelectorView(selectedTheme: $selectedTheme)
                    }

                    SettingsRow(label: "Accent Color", icon: "eyedropper.full") {
                        AccentColorPicker(selectedColor: $selectedAccentColor, colors: accentColors)
                    }

                    SettingsRow(label: "Text Size", icon: "textformat.size") {
                        Slider(value: $textSize, in: 0.8...1.5, step: 0.1)
                    }

                    SettingsRow(label: "Reduce Motion", icon: "figure.walk.motion") {
                        StyledToggle(isOn: $reduceMotion)
                    }

                    SettingsRow(label: "Email Notifications", icon: "envelope.badge.fill") {
                        StyledToggle(isOn: $emailNotifications)
                    }

                    SettingsRow(label: "Push Notifications", icon: "bell.badge.fill") {
                        StyledToggle(isOn: $pushNotifications)
                    }
                }
            }

            TitledSection(title: "About & Support", description: "Get help and review our policies.") {
                VStack(spacing: 15) {
                    Button(action: { selectedLegalText = .helpCenter }) {
                        SettingsLinkRow(icon: "questionmark.circle.fill", title: "Help Center")
                    }
                    Button(action: { selectedLegalText = .termsOfService }) {
                        SettingsLinkRow(icon: "doc.text.fill", title: "Terms of Service")
                    }
                    Button(action: { selectedLegalText = .privacyPolicy }) {
                        SettingsLinkRow(icon: "shield.lefthalf.filled", title: "Privacy Policy")
                    }
                }
                .buttonStyle(PlainButtonStyle())
            }
        }
    }
}


// MARK: - Helper Views for Settings
// A reusable row for settings like toggles, sliders, and color pickers.
struct SettingsRow<Content: View>: View {
    let label: String
    let icon: String
    @ViewBuilder let content: Content

    var body: some View {
        HStack {
            Image(systemName: icon)
                .font(.headline)
                .foregroundColor(.quizifyPrimary)
                .frame(width: 25, alignment: .center)
            Text(label)
                .font(.headline)
                .foregroundColor(.quizifyTextGray)
            Spacer()
            content
        }
    }
}

// A reusable row for text and secure fields.
struct FormField<Content: View>: View {
    let label: String
    let icon: String
    @ViewBuilder let content: Content

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Image(systemName: icon)
                Text(label)
            }
            .font(.headline)
            .foregroundColor(.quizifyTextGray)

            content
                .padding(12)
                .background(Color.quizifyOffWhite)
                .cornerRadius(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.quizifyLightGray, lineWidth: 1)
                )
        }
    }
}

// A custom styled toggle switch.
struct StyledToggle: View {
    @Binding var isOn: Bool

    var body: some View {
        Toggle("", isOn: $isOn)
            .toggleStyle(SwitchToggleStyle(tint: .quizifyAccentGreen))
    }
}

// A custom view for selecting an accent color.
struct AccentColorPicker: View {
    @Binding var selectedColor: Color
    let colors: [Color]

    var body: some View {
        HStack {
            ForEach(colors, id: \.self) { color in
                Button(action: { selectedColor = color }) {
                    Circle()
                        .fill(color)
                        .frame(width: 30, height: 30)
                        .overlay(
                            Circle()
                                .stroke(selectedColor == color ? Color.blue.opacity(0.8) : Color.clear, lineWidth: 3)
                        )
                }
                .buttonStyle(PlainButtonStyle())
            }
        }
    }
}

// A row for navigation links.
struct SettingsLinkRow: View {
    let icon: String
    let title: String

    var body: some View {
        HStack {
            Image(systemName: icon)
                .font(.headline)
                .foregroundColor(.quizifyPrimary)
                .frame(width: 25)
            Text(title)
                .font(.headline)
            Spacer()
            Image(systemName: "chevron.right")
                .foregroundColor(.gray)
        }
        .padding()
        .background(Color.quizifyOffWhite)
        .cornerRadius(12)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.quizifyLightGray.opacity(0.5), lineWidth: 1)
        )
    }
}

// Enum to define the theme options.
enum Theme: String, CaseIterable, Identifiable {
    case system = "System"
    case light = "Light"
    case dark = "Dark"
    var id: String { self.rawValue }
}

// A custom view for the theme selector.
struct ThemeSelectorView: View {
    @Binding var selectedTheme: Theme

    var body: some View {
        HStack(spacing: 15) {
            ForEach(Theme.allCases) { theme in
                Button(action: {
                    withAnimation(.spring()) {
                        selectedTheme = theme
                    }
                }) {
                    VStack {
                        Image(systemName: theme == .light ? "sun.max.fill" : (theme == .dark ? "moon.fill" : "display"))
                            .font(.title2)
                        Text(theme.rawValue)
                            .font(.headline)
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(selectedTheme == theme ? Color.quizifyPrimary.opacity(0.1) : Color.clear)
                    .foregroundColor(selectedTheme == theme ? .quizifyPrimary : .quizifyTextGray)
                    .cornerRadius(12)
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(selectedTheme == theme ? .quizifyPrimary : Color.quizifyLightGray, lineWidth: 1.5)
                    )
                }
                .buttonStyle(PlainButtonStyle())
            }
        }
    }
}


// MARK: - Legal Text View and Model
enum LegalText: String, Identifiable {
    case helpCenter = "Help Center"
    case termsOfService = "Terms of Service"
    case privacyPolicy = "Privacy Policy"

    var id: String { self.rawValue }

    var icon: String {
        switch self {
        case .helpCenter: "questionmark.circle.fill"
        case .termsOfService: "doc.text.fill"
        case .privacyPolicy: "shield.lefthalf.filled"
        }
    }

    var content: String {
        switch self {
        case .helpCenter: "Welcome to the Quizify Help Center! Here you can find answers to frequently asked questions and get support for any issues you may encounter."
        case .termsOfService: "By using Quizify, you agree to our Terms of Service. Please read them carefully."
        case .privacyPolicy: "Our Privacy Policy explains how we collect, use, and protect your data."
        }
    }
}

struct LegalTextView: View {
    let legalText: LegalText
    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack(spacing: 0) {
            // Header
            HStack {
                Image(systemName: legalText.icon)
                    .font(.title)
                    .foregroundColor(.quizifyPrimary)
                Text(legalText.rawValue)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Spacer()
                Button(action: { dismiss() }) {
                    Image(systemName: "xmark.circle.fill")
                        .font(.title)
                        .foregroundColor(.gray)
                }
            }
            .padding()
            .background(Color.white.shadow(.drop(radius: 5, y: 5)))

            // Content
            ScrollView {
                Text(legalText.content)
                    .font(.title2)
                    .padding()
            }
        }
        .frame(minWidth: 600, minHeight: 400)
    }
}


// MARK: - Preview
struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}

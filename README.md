
# PrimeChat: Your Ultimate Messaging App for iOS

PrimeChat is a secure, user-friendly messaging app designed for iOS devices. With PrimeChat, you can connect with friends and family, chat in real-time, update your status, and customize your profile settings effortlessly. This README.md provides comprehensive information about the app's features, installation guide, and usage instructions.

## Features

- **User Authentication:**
  - Secure user authentication system for sign-up and login.
  - Password validation and encryption for enhanced security.
  
- **Real-time Messaging:**
  - One-on-one chat conversations with real-time message delivery.
  - Text messages, emojis, and multimedia (images, videos) support.
  - Message status indicators (sent, delivered, read). (Future scope)

- **Status Updates:**
  - Set and update your status to let your contacts know what you're up to.
  - View the status of your contacts in the chat list.

- **Profile Customization:**
  - Customize your profile picture, display name, and other settings.
  - View and edit your personal information easily.

- **User Experience:**
  - Intuitive and clean user interface for seamless navigation.
  - Dark mode support for comfortable messaging at night. (Future scope)
  - Smooth animations and transitions for a polished user experience.

## Screenshots

*Login Screen*
<img src="/screenshots/login_screen.png" alt="Login Screen" width="300"/>
*Chat Conversation*
<img src="/screenshots/chat_conversation.png" alt="Chat Conversation" width="300"/>
*Status Updates*
<img src="/screenshots/status_updates.png" alt="Status Updates" width="300"/>
*Profile settings*
<img src="/screenshots/chat_conversation.png" alt="Profile settings" width="300"/>
*Chats list*
<img src="/screenshots/status_updates.png" alt="Chats list" width="300"/>


## Installation

To run PrimeChat on your iOS device, follow these steps:

1. **Clone the Repository:**
   ```
   git clone https://github.com/JeevanEashwar/PrimeAPI.git
   ```

2. **Open the Project in Xcode:**
   ```
   cd PrimeChat
   open PrimeChat.xcodeproj
   ```

3. **Configure Firebase:**
   - Create a new Firebase project at [Firebase Console](https://console.firebase.google.com/).
   - Set up Firebase Authentication and Realtime Database.
   - Update `GoogleService-Info.plist` with your Firebase configuration.

4. **Run the App:**
   - Choose your target device or simulator.
   - Click the "Run" button in Xcode to install and run the app on your iOS device.

5. **Start Messaging:**
   - Sign up or log in to your account.
   - Start messaging with your contacts in real-time!

## Dependencies

- Firebase Authentication and Realtime Database for backend services.
- SwiftLint for Swift code linting.

## Contributing

Contributions are welcome! If you find a bug or have a feature request, please open an issue. Pull requests are also encouraged.

## License

MIT License

Copyright (c) [2023] [Jeevan Eashwar]

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

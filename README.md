# HearHub

HearHub is an accessibility-focused mobile application designed to assist individuals with hearing impairments by improving their ability to engage in real-time conversations. The application emphasizes simplicity, usability, and practical impact through a clean interface and assistive interaction flows.

---

## Overview

Hearing loss can make everyday interactions—such as conversations in classrooms, meetings, or public spaces—difficult to follow. HearHub addresses this challenge by providing a structured and intuitive platform that supports users during conversations and helps them better interpret spoken information.

The project focuses on delivering a seamless user experience that reduces friction and makes assistive technology more approachable and effective.

---

## Features

- Real-time conversation assistance through a speech-to-text interaction model  
- Structured and accessible user interface built for clarity and ease of use  
- Assistive tool recommendations to support different user needs  
- Modular design enabling future enhancements such as conversation history and summaries  

---

## Technology Stack

- **Frontend:** Flutter (Dart)  
- **Backend:** Node.js, Express.js  
- **Version Control:** Git and GitHub  

---

## Architecture

The project is organized into modular components to support scalability and maintainability:

- `flutter_app/` – Mobile application developed using Flutter  
- `backend/` – Server-side logic and API services  
- `public/`, `src/` – Supporting assets and application logic  

This separation enables independent development and easier extension of features over time.

---

## Getting Started

### Prerequisites

Ensure the following are installed:

- Flutter SDK  
- Node.js (v16 or later recommended)  
- Git  

Verify setup:

```bash
flutter doctor
node -v
npm -v
Clone Repository
git clone https://github.com/gitpulkit/hearhub.git
cd hearhub
Running the Application
1. Start Backend Server
cd backend
npm install
npm start

The backend runs on:

http://localhost:3000
2. Run Flutter Application

Open a new terminal:

cd flutter_app
flutter pub get

Ensure a device or emulator is available:

flutter devices

Then run:

flutter run
Important Notes
Ensure the backend server is running before starting the mobile application
If running on a physical device, replace localhost in API calls with your machine’s local IP address
Update API endpoints in the frontend if backend configuration differs
Key Design Focus
Accessibility-first approach
Clean and minimal user interface
Practical usability in real-world scenarios
Extensible architecture for future development
Future Scope

Planned improvements include real-time speech recognition integration, multi-language support, cloud-based conversation storage, and intelligent summarization features to enhance user experience further.

License

This project is open-source and available for learning and development purposes.

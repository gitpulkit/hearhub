# HearHub

HearHub is an accessibility-focused application designed to assist individuals with hearing impairments by improving their ability to engage in real-time conversations. The system combines a mobile interface, backend services, and a web interface to deliver a structured and practical assistive experience.

---

## Overview

Hearing loss can make everyday interactions—such as conversations in classrooms, meetings, or public spaces—difficult to follow. HearHub addresses this challenge by providing a clean, intuitive platform that supports real-time communication and user assistance.

The project focuses on usability, accessibility, and modular design to enable future enhancements and real-world applicability.

---

## Features

- Clean and accessible user interface designed for usability  
- Authentication system with secure token-based access  
- Modular architecture supporting mobile, backend, and web components  
- Extensible design for future enhancements such as conversation history and summaries  

---

## Technology Stack

- **Mobile:** Flutter (Dart)  
- **Backend:** Node.js, Express.js, MongoDB  
- **Web:** React, TypeScript (Vite)  
- **Version Control:** Git and GitHub  

---

## Architecture

The project is organized into modular components:

- `flutter_app/` – Mobile application (Flutter)  
- `backend/` – Backend API and authentication services  
- Root (`/`) – Web application (React + Vite)  

This structure allows independent development and scaling of each component.

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

Installation
Clone the repository:

git clone https://github.com/gitpulkit/hearhub.git
cd hearhub

--Running the Backend

Navigate to the backend directory:

cd backend

Create an environment file:

cp .env.example .env

Update .env with appropriate values:

PORT=5001
MONGODB_URI=your_mongodb_connection_string
JWT_SECRET=your_secure_secret
JWT_EXPIRES_IN=7d

Install dependencies and start the server:

npm install
npm start

The backend will run on:

http://localhost:5001
Running the Mobile Application

Open a new terminal:

cd flutter_app
flutter pub get

Ensure a device or emulator is available:

flutter devices

Run the application:

flutter run

By default, the mobile app connects to:

http://10.0.2.2:5001/api   (emulator)
http://localhost:5001/api  (Web)

If needed, configure the API base URL during build or update it in the code.

Running the Web Application

From the root directory:

npm install
npm run dev

This will start the web application using Vite.

--Important Notes
Ensure the backend server is running before starting the mobile or web application
Configure environment variables correctly before running the backend
For physical devices, replace localhost with your machine’s local IP address
Do not commit .env files or sensitive credentials

--Key Design Focus
Accessibility-first design
Clean and minimal user interface
Practical usability in real-world scenarios
Modular and scalable architecture
Future Scope
Real-time speech recognition integration
Multi-language support
Cloud-based conversation storage
AI-powered conversation summaries

--License
This project is open-source and available for learning and development purposes.

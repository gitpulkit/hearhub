

# HearHub – Hearing Support Mobile App

A pixel-perfect, mobile-optimized wellness app helping users discover and use hearing support tools. Frontend-only prototype with a warm, accessible design.

---

## Design System

- **Palette**: Warm Off-White (#F6F4EF), Charcoal (#2C2C2C), Soft Gray (#8C8C8C), Lavender Purple (#6F4BD8), Pale Lavender (#E9E3F9), Soft Pink (#F7DCE5)
- **Rounded cards & buttons** (24px radius), **56px min-height buttons** for accessibility
- **8px spacing grid**, clean sans-serif typography
- **Lucide icons** (24px) in 48px circular pastel containers
- **Mobile-first layout** (max-width 480px, centered on desktop)

---

## Screen 1: Welcome Screen (`/`)

A warm onboarding landing page with:
- Large 120px lavender circle with hearing aid icon
- Hero text: "Welcome to HearHub" with subtitle
- Three feature rows with alternating pastel icon backgrounds (Discover tools, Learn usage, Improve daily life)
- Fixed "Get Started" button routing to `/onboarding`

## Screen 2: Category Selection (`/onboarding`)

- Back button + 25% progress bar
- Four selectable cards with icons: "I am a student", "I am a professional", "I am a parent", "I am a senior"
- Selected card gets a purple border highlight
- "Continue" button routes to the appropriate guide (e.g., `/guide/student`)

## Screen 3: Student Scenario Guide (`/guide/student`)

- **Recommended tools**: Horizontal scroll with "Live Transcribe" and "Otter.ai" cards
- **Video section**: 16:9 placeholder with play overlay and caption preview box
- **How to Use**: Numbered steps (1, 2, 3) with purple step circles
- Fixed "Try these tools" button routing to `/dashboard`

## Screen 4: Main Dashboard (`/dashboard`)

- Top bar with "Hello, User" greeting and pink avatar circle
- **Top Picks carousel**: Large cards with app icons and purple "Get" buttons
- **Daily Situations grid**: 2-column grid (Restaurant, Meeting, Classroom, Home) with pastel icon containers
- **Bottom navigation bar**: 5 icons (Home active in purple, Discover, Search, Saved, Settings)
- Tapping "Restaurant" routes to `/assessment/restaurant`

## Screen 5: Assessment Question (`/assessment/restaurant`)

- Header: "Question 3 of 10" with Skip button
- 100px lavender circle with Utensils icon
- Bold centered question with helpful subtext
- Two answer buttons: purple "Yes, often" and pink "No, rarely"
- Footer info text about personalization
- Both answers show a success state then return to `/dashboard`

---

## Navigation & Interactions

- React Router for all page transitions
- Basic CSS transitions between screens (no heavy animation library needed)
- Selected states, hover effects, and active navigation highlighting
- All interactive elements meet accessibility tap-target guidelines


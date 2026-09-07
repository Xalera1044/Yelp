# Yelp
For Azerbaijan
# HARA? — MVP Blueprint

## 1. Product Goal

HARA? is a local discovery and review app built for Azerbaijan, starting with Baku.

The core promise:

**Find the best places, professionals, and services in Baku — based on trusted local reviews.**

The MVP focuses on four categories:

1. Restaurants & Cafés
2. Nightlife
3. Doctors & Clinics
4. Beauty & Spa

The app should feel modern, premium, visual, and simple rather than like a traditional directory.

---

# 2. Main Navigation

The mobile app uses five bottom navigation items:

### Home
Main discovery feed.

### Search
Search all categories and apply filters.

### Add
Write a review or suggest a missing business.

### Saved
Saved businesses and doctors.

### Profile
User profile, reviews, settings, and activity.

---

# 3. Screen 1 — Splash Screen

## Purpose
Introduce the brand while the app loads.

## Display

HARA?

**Discover. Review. Book. Baku.**

Minimal logo animation.

## App logic

When the app launches:

- Check whether the user is logged in.
- Load language preference.
- Load location permission status.
- Continue to Home.

No forced login on first launch.

---

# 4. Screen 2 — Language Selection

Shown only on first launch.

## Options

- AZ — Azərbaycan
- RU — Русский
- EN — English

## Buttons

### Continue

Stores the user's language preference.

Language can later be changed in Settings.

---

# 5. Screen 3 — Home

This is the most important screen.

## Header

Location:

**Baku**

Notification icon.

Profile avatar.

---

## Main headline

**Where should we go?**

Search bar:

**Restaurants, doctors, beauty...**

Tapping the search bar opens Search.

---

## Category shortcuts

Large visual icons:

- Restaurants
- Cafés
- Doctors
- Beauty & Spa
- Nightlife
- Clinics
- Bars
- More

Tapping a category opens its Category Screen.

---

## Trending in Baku

Horizontal cards.

Each card displays:

- Main photo
- Business name
- Overall rating
- Number of reviews
- Category
- Area
- Price level
- Distance
- Verified-review indicator
- Save button

Example:

**SAHiL**

⭐ 9.1  
438 reviews

Seafood · ₼₼₼  
1.3 km

**92% would return**

---

## Near You

Shows highly rated businesses close to the user.

Requires location permission.

If location permission is not given:

Display:

**See what's popular near you**

Button:

**Enable Location**

---

## Popular This Week

Businesses receiving unusually high engagement or strong recent ratings.

---

## New & Worth Trying

Recently added businesses with good early reviews.

---

# 6. Screen 4 — Search

## Search bar

Users can type:

- Business name
- Doctor name
- Specialty
- Cuisine
- Salon service
- Treatment
- Neighborhood
- Business type

Examples:

"steak"

"dermatologist"

"laser"

"massage"

"Nizami"

---

## Recent searches

Displayed below search.

---

## Suggested searches

Examples:

- Best steak
- Dermatologist
- Couple massage
- Rooftop restaurant
- Nail salon
- Live music

---

# 7. Screen 5 — Search Results

Two modes:

### List

### Map

Toggle displayed at the top.

---

## Filters

Filters depend on category.

General filters:

- Rating
- Distance
- Price
- Open now
- Verified reviews
- Neighborhood

---

## Restaurant filters

- Cuisine
- Price
- Outdoor seating
- Family friendly
- Romantic
- Live music
- Alcohol
- Breakfast
- Parking

---

## Doctor filters

- Specialty
- Clinic
- Consultation price
- Languages
- Gender
- Available today
- Area

---

## Beauty filters

- Hair
- Nails
- Massage
- Facial
- Laser
- Makeup
- Spa
- Price
- Area

---

# 8. Screen 6 — Map View

Interactive map.

Business markers display ratings.

Example:

9.2

8.7

9.4

Tapping a marker opens a small business card.

The card displays:

- Photo
- Name
- Rating
- Category
- Distance

Buttons:

**View Profile**

**Directions**

---

# 9. Screen 7 — Restaurant / Café Profile

## Header

Large photo gallery.

Save icon.

Share icon.

---

## Business information

Business name.

Verified business badge if applicable.

Overall rating.

Number of reviews.

Category.

Price level.

Area.

Distance.

Open / closed status.

---

## Action buttons

### Call

Opens phone dialer.

### Directions

Opens navigation.

### Menu

Displays menu link or uploaded menu.

### Instagram

Opens Instagram profile.

### Book

Initially:

Phone / WhatsApp / external booking link.

Full booking system is NOT required for MVP.

---

## Tabs

### Overview

### Reviews

### Menu

### Photos

---

## Overview contains

- Description
- Opening hours
- Address
- Phone
- Website
- Instagram
- Features
- Cuisine
- Parking
- Outdoor seating
- Family friendly
- Price range

---

## Rating breakdown

Example:

Food: 9.3

Service: 8.8

Atmosphere: 9.5

Value: 8.7

---

## Review highlights

AI summarization can be added later.

For MVP:

Display commonly selected tags:

- Great atmosphere
- Excellent food
- Slow service
- Good value
- Romantic
- Family friendly

---

# 10. Screen 8 — Doctor Category

## Header

**Doctors & Clinics**

Search:

**Search by doctor or specialty**

---

## Specialty shortcuts

- Dentist
- Dermatologist
- Gynecologist
- Cardiologist
- Pediatrician
- Orthopedist
- ENT
- Ophthalmologist
- Neurologist
- More

---

## Top Rated Doctors

Doctor cards display:

- Photo
- Name
- Specialty
- Rating
- Review count
- Clinic
- Area
- Consultation price if known

---

# 11. Screen 9 — Doctor Profile

## Header

Doctor photo.

Name.

Specialty.

Clinic.

Verified professional badge.

Rating.

Review count.

---

## Important rule

HARA? ratings must describe the patient experience.

They must not imply medical competence or treatment effectiveness.

---

## Action buttons

### Call

### Directions

### Book

### Website

---

## Doctor information

- Specialty
- Clinic
- Experience
- Languages
- Consultation price
- Working hours
- Education
- Certifications
- Areas of focus

---

## Doctor review categories

Users rate:

### Communication

### Waiting time

### Clarity of explanation

### Clinic experience

### Overall experience

Users should NOT rate:

"Medical skill"

"Treatment success"

"Diagnosis accuracy"

---

## Review disclaimer

Small notice:

**Reviews describe patient experiences and should not be considered medical advice.**

---

# 12. Screen 10 — Clinic Profile

Separate from doctor profiles.

Displays:

- Clinic name
- Rating
- Photos
- Address
- Phone
- Opening hours
- Website
- Services
- Doctors working there
- Reviews

Clinic reviews focus on:

- Reception
- Cleanliness
- Waiting time
- Organization
- Service

---

# 13. Screen 11 — Beauty & Spa Category

Header:

**Beauty & Spa**

Search:

**Search salons, services or treatments**

---

## Quick categories

- Hair
- Nails
- Facial
- Massage
- Laser
- Makeup
- Spa
- Brows
- Lashes

---

## Salon card

Displays:

- Photo
- Name
- Rating
- Number of reviews
- Category
- Area
- Price range
- Distance

---

# 14. Screen 12 — Beauty / Spa Profile

Large visual photography is important.

## Information

- Business name
- Overall rating
- Review count
- Area
- Opening hours
- Phone
- Instagram
- WhatsApp
- Price range

---

## Action buttons

### Call

### WhatsApp

### Directions

### Book

### Instagram

---

## Tabs

### Overview

### Reviews

### Services

### Photos

---

## Services

Example:

Haircut — 35–60 AZN

Manicure — 25 AZN

Massage — 70 AZN

Laser treatment — from 40 AZN

Prices can initially be entered manually by businesses/admin.

---

## Beauty review categories

- Service
- Cleanliness
- Result
- Atmosphere
- Value

---

# 15. Screen 13 — Nightlife Category

Includes:

- Clubs
- Bars
- Lounges
- Rooftops
- Live music venues

---

## Important information

Profiles can show:

- Music type
- Crowd
- Dress code
- Entry fee
- Reservation required
- Opening hours
- Age requirement
- Average drink price
- Outdoor seating
- Live DJ
- Live music

---

# 16. Screen 14 — Review Creation

User taps:

**Write a Review**

---

## Step 1

Select business.

If review started from a business profile, skip this step.

---

## Step 2

Overall rating.

---

## Step 3

Category-specific ratings.

Example restaurant:

Food

Service

Atmosphere

Value

---

## Step 4

Written review.

Minimum:

Approximately 20 characters.

---

## Step 5

Add photos.

Optional.

---

## Step 6

Would you return?

### Yes

### Maybe

### No

This becomes an important HARA? metric.

---

## Step 7

Verified Visit

Options:

### Location verification

User was physically near the location.

Later versions can support:

- Receipt verification
- QR verification
- Booking verification

---

## Submit Review

Review enters moderation checks.

---

# 17. Screen 15 — Review Display

Each review displays:

- User avatar
- Username
- Reviewer level
- Review date
- Verified visit badge
- Overall rating
- Category ratings
- Text
- Photos
- Helpful votes

Buttons:

### Helpful

### Report

### Share

---

# 18. Screen 16 — Add Missing Place

Users can suggest businesses not yet listed.

Fields:

- Business name
- Category
- Location
- Instagram
- Phone
- Photo
- Notes

Admin must approve before publication.

---

# 19. Screen 17 — Saved

Collections:

### All Saved

### Restaurants

### Doctors

### Beauty

### Nightlife

Later:

Users can create custom collections.

Example:

**Date Night**

**Doctors**

**Places to Try**

---

# 20. Screen 18 — User Profile

Displays:

- Profile photo
- Username
- City
- Review count
- Helpful votes
- Followers
- Following

---

## Tabs

### Reviews

### Saved

### Photos

---

## Reviewer reputation

Future concept:

Reviewer levels.

Example:

New Reviewer

Local Explorer

Trusted Reviewer

Baku Expert

Not necessary for initial launch but database should allow it later.

---

# 21. Screen 19 — Notifications

Notification examples:

Someone found your review helpful.

A saved restaurant opened nearby.

Business replied to your review.

Your suggested place was approved.

New highly rated business near you.

---

# 22. Screen 20 — Settings

Options:

- Language
- Location permissions
- Notifications
- Privacy
- Account
- Help
- Report a problem
- Terms
- Delete account
- Logout

---

# 23. Business Claiming

Every profile has:

**Own this business?**

Button:

**Claim Business**

---

## Business claim form

Business provides:

- Name
- Position
- Phone
- Email
- Business verification document or social account

Admin manually approves claims.

---

# 24. Business Owner Capabilities

MVP owner dashboard should allow:

- Edit business description
- Edit opening hours
- Add phone number
- Add Instagram
- Add website
- Add menu
- Add services
- Upload photos
- Reply to reviews

Owners cannot:

- Remove negative reviews
- Alter ratings
- Hide legitimate reviews

---

# 25. Admin Dashboard

This is critical.

Admin must be able to:

### Businesses

- Add business
- Edit business
- Delete business
- Approve suggested businesses
- Merge duplicate listings

### Reviews

- View reviews
- Remove spam
- Handle reports
- Suspend abusive accounts

### Users

- Search users
- Suspend accounts
- View activity

### Claims

- Review business ownership requests
- Approve
- Reject

### Categories

- Create categories
- Add specialties
- Add services
- Manage tags

---

# 26. Database Structure

Core tables:

## users

- id
- name
- username
- email
- avatar
- language
- city
- created_at

## businesses

- id
- name
- description
- category
- subcategory
- address
- latitude
- longitude
- phone
- website
- instagram
- whatsapp
- price_level
- opening_hours
- verified
- claimed
- owner_id
- created_at

## doctors

- id
- business_id
- name
- specialty
- clinic
- experience
- languages
- consultation_price
- profile_photo

## business_photos

- id
- business_id
- user_id
- photo_url
- approved

## reviews

- id
- user_id
- business_id
- overall_rating
- review_text
- verified_visit
- would_return
- created_at

## review_scores

- id
- review_id
- score_type
- score

## saved_businesses

- user_id
- business_id

## helpful_votes

- user_id
- review_id

## business_claims

- business_id
- user_id
- status

## reports

- reporter_id
- review_id
- reason
- status

---

# 27. Rating Scale

Use:

**1.0–10.0**

instead of five stars as the primary displayed score.

Examples:

9.4

8.7

7.9

This differentiates HARA? visually from Google and Yelp.

Stars can still appear during review entry.

---

# 28. Ranking System

Initial ranking should consider:

- Average rating
- Number of reviews
- Verified review percentage
- Recent reviews
- Distance
- Review quality
- Return percentage

Businesses with only two reviews should not outrank businesses with hundreds of strong reviews.

---

# 29. Verification System

MVP:

### Verified Visit

Location-based verification.

The user can receive the badge if their device location confirms they are close to the business.

This does NOT prevent non-verified reviews.

Verified reviews simply carry more weight.

---

# 30. Fraud Prevention

Basic MVP protections:

- Email verification
- Rate limiting
- Duplicate review detection
- Same-user review limits
- Reporting system
- Admin moderation

Later:

- Device fingerprinting
- Receipt verification
- Business QR codes
- Suspicious review detection

---

# 31. Monetization

Do not aggressively monetize during initial launch.

Later monetization:

### HARA? Business

29–99 AZN/month.

Features:

- Enhanced profile
- Analytics
- More photos
- Offers
- Booking links
- Service catalog
- Competitor insights

---

## Sponsored results

Businesses can pay for placement.

Must display:

**Sponsored**

Sponsored placement must never change actual ratings.

---

# 32. What Is NOT Included in MVP

Do NOT build yet:

- Payments
- Full booking calendar
- Restaurant table inventory
- Doctor appointment management
- Loyalty points
- Rewards wallet
- Influencer marketplace
- Direct messaging
- AI assistant
- Delivery
- Video feed
- Business advertising platform
- Subscription payment system

Architecture should allow these later.

---

# 33. Recommended Technology

## Mobile

React Native + Expo

One codebase for:

- iOS
- Android

---

## Backend

Supabase

Includes:

- PostgreSQL database
- Authentication
- File storage
- Backend functions
- Permissions

---

## Admin Dashboard

Next.js

Web-based.

---

## Maps

Google Maps or Mapbox.

Provider can be finalized during development.

---

## Repository

GitHub.

Recommended repositories:

hara-mobile

hara-admin

Potentially:

hara-backend

although Supabase may eliminate the need for a separate backend repository initially.

---

# 34. First Data Target

Launch should not begin with an empty app.

Initial goal:

### 500 Baku listings

Suggested distribution:

Restaurants & Cafés — 200

Doctors & Clinics — 100

Beauty & Spa — 125

Nightlife — 75

Each listing should ideally include:

- Name
- Correct category
- Address
- Coordinates
- Phone
- Instagram
- Opening hours
- At least one photo

---

# 35. Beta Launch Strategy

Start with approximately:

**100–200 invited users**

Friends, acquaintances, local food enthusiasts, beauty customers, nightlife users, and active reviewers.

Target:

At least 1,000 genuine reviews before broad marketing.

---

# 36. Core Success Metrics

Track:

- Daily active users
- Searches per user
- Business profile views
- Reviews submitted
- Reviews per active user
- Saved places
- Directions clicks
- Calls
- WhatsApp clicks
- Return users
- Verified-review percentage

The key metric:

**How often does HARA? actually help someone decide where to go or whom to choose?**

---

# 37. Future AI Search

Not part of MVP, but build the data model to support it.

Example searches:

**Find me a quiet restaurant for dinner with my wife under 120 AZN.**

**Show me highly rated dermatologists who speak Russian.**

**Find a massage near Port Baku available tonight.**

**Find a good nail salon in Nizami under 40 AZN.**

HARA? eventually interprets the request and searches reviews, profiles, prices, location, and tags.

---

# 38. HARA? Brand Direction

Working name:

# HARA?

Meaning:

**Where?**

Brand tone:

- Local
- Confident
- Modern
- Premium
- Friendly
- Trustworthy

Possible tagline:

**Find the best of Baku.**

Alternative:

**Real people. Real places. Better choices.**

Primary visual direction:

- Strong photography
- Large rating numbers
- Minimal UI
- White/light interface
- Dark premium accents
- Soft rounded cards
- Clear category colors
- Highly visual business profiles

The product should feel closer to Airbnb and Instagram than a traditional business directory.

---

# 39. MVP Definition of Done

The MVP is ready when a user can:

1. Download HARA?.
2. Choose their language.
3. Browse businesses in Baku.
4. Search for a restaurant, doctor, salon, or nightlife venue.
5. Filter the results.
6. See locations on a map.
7. Open a full profile.
8. Call or navigate to the business.
9. Read genuine reviews.
10. Create an account.
11. Submit a review.
12. Upload photos.
13. Save businesses.
14. Suggest a missing business.
15. Manage their profile.

And the admin can:

16. Add businesses.
17. Edit businesses.
18. Approve listings.
19. Moderate reviews.
20. Handle reports.
21. Approve business claims.

That is HARA? Version 1.

# HARA? — Technical Build Plan

## 1. Build Strategy

Build HARA? as a real production-ready MVP, not as a disposable prototype.

The priority is:

**working app first → real database → real authentication → real listings → reviews → admin tools → polish**

Do not try to build every future feature in Version 1.

---

# 2. Recommended Stack

## Mobile App

**React Native + Expo + TypeScript**

One codebase for:

- iPhone
- Android

Expo is the preferred setup because it makes development, testing, builds and future App Store deployment considerably easier.

---

## Backend

**Supabase**

Use Supabase for:

- PostgreSQL database
- Authentication
- File/image storage
- Row Level Security
- Backend functions
- Data API

The current Supabase documentation has first-party Expo/React Native guidance and supports persistent mobile authentication sessions.

---

## Admin / Business Dashboard

**Next.js + TypeScript**

Use the modern App Router.

Next.js currently recommends App Router as the newer routing model for modern applications.

---

## Maps

Start with:

**Google Maps**

Potential alternative:

Mapbox.

For Azerbaijan, provider choice should be tested against:

- Baku address accuracy
- POI coverage
- geocoding
- pricing
- React Native support

Do not deeply couple the database to one map provider.

Store our own:

- latitude
- longitude
- formatted address

---

# 3. GitHub Structure

I would begin with two repositories.

## Repository 1

`hara-mobile`

Contains:

- React Native app
- Expo configuration
- mobile components
- mobile API layer
- translations
- assets

---

## Repository 2

`hara-admin`

Contains:

- admin dashboard
- future business dashboard
- moderation tools
- listing management

---

## Supabase

The Supabase project is shared by both.

Database migrations should eventually also be committed to GitHub.

Recommended structure:

`supabase/`

containing:

- migrations
- seed data
- database functions
- policies

This can live inside `hara-admin` initially.

A third repository is unnecessary for MVP.

---

# 4. Mobile Folder Structure

Recommended structure:

```text
hara-mobile/

app/
  _layout.tsx

  (tabs)/
    index.tsx
    search.tsx
    add.tsx
    saved.tsx
    profile.tsx

  business/
    [id].tsx

  doctor/
    [id].tsx

  clinic/
    [id].tsx

  category/
    [slug].tsx

  review/
    new.tsx
    [id].tsx

  auth/
    login.tsx
    signup.tsx

  settings/
    index.tsx

components/
  BusinessCard.tsx
  DoctorCard.tsx
  RatingBadge.tsx
  SearchBar.tsx
  CategoryButton.tsx
  ReviewCard.tsx
  PhotoGallery.tsx
  FilterSheet.tsx
  EmptyState.tsx

lib/
  supabase.ts
  auth.ts
  location.ts
  ratings.ts

services/
  businesses.ts
  reviews.ts
  users.ts
  search.ts

hooks/
  useAuth.ts
  useLocation.ts
  useBusinesses.ts
  useSaved.ts

types/
  database.ts
  business.ts
  review.ts

constants/
  categories.ts
  ratingTypes.ts

i18n/
  az.json
  ru.json
  en.json

assets/

utils/
```

Use Expo Router for navigation.

---

# 5. Database Design

The database should be normalized enough to scale but not over-engineered.

---

## Table: profiles

Corresponds to authenticated users.

Fields:

```text
id
username
display_name
avatar_url
bio
preferred_language
city
review_count
helpful_count
is_admin
is_suspended
created_at
updated_at
```

`id` references Supabase Auth user ID.

---

# 6. Table: businesses

Main listing table.

Fields:

```text
id
name
slug
description

category_id
subcategory_id

address
district
city

latitude
longitude

phone
whatsapp
website
instagram

price_level

opening_hours

verified
claimed

owner_user_id

status

average_rating
review_count
verified_review_count
return_percentage

created_at
updated_at
```

Possible `status` values:

```text
draft
pending
active
suspended
closed
```

---

# 7. Table: categories

Examples:

```text
Restaurants & Cafés
Nightlife
Doctors & Clinics
Beauty & Spa
```

Fields:

```text
id
name
slug
icon
sort_order
active
```

---

# 8. Table: subcategories

Examples:

Restaurants:

- Steakhouse
- Italian
- Azerbaijani
- Sushi
- Café

Doctors:

- Dermatology
- Cardiology
- Dentistry

Beauty:

- Nails
- Hair
- Massage
- Laser

Nightlife:

- Club
- Bar
- Lounge
- Rooftop

Fields:

```text
id
category_id
name
slug
active
```

---

# 9. Table: doctors

Doctors need their own entity.

Fields:

```text
id
profile_business_id

name
slug

specialty_id

profile_photo_url

experience_years

education
certifications

languages

consultation_price_min
consultation_price_max

verified

average_rating
review_count

created_at
updated_at
```

A doctor can later work at multiple clinics.

Therefore do NOT permanently store one clinic directly on the doctor.

---

# 10. Table: doctor_clinics

Relationship table.

```text
doctor_id
clinic_business_id

consultation_price
working_hours

primary_clinic
```

This makes it possible for:

**Dr. X**

to work at:

**Clinic A**

and:

**Clinic B**

without creating duplicate doctor profiles.

---

# 11. Table: specialties

```text
id
name
slug
```

Examples:

- Dermatologist
- Dentist
- Cardiologist
- Pediatrician

---

# 12. Table: business_photos

```text
id
business_id

uploaded_by_user_id

storage_path

caption

is_primary

approved

created_at
```

Images live in Supabase Storage.

---

# 13. Table: reviews

```text
id

user_id
business_id
doctor_id

overall_rating

review_text

would_return

verified_visit

verification_method

status

helpful_count

created_at
updated_at
```

Either:

`business_id`

or:

`doctor_id`

is used depending on the reviewed entity.

Possible review status:

```text
pending
published
flagged
removed
```

---

# 14. Table: review_scores

Allows category-specific scoring.

```text
id
review_id

metric

score
```

Example restaurant review:

```text
food       9
service    8
atmosphere 10
value      8
```

Doctor:

```text
communication
clarity
waiting_time
clinic_experience
```

Beauty:

```text
service
cleanliness
result
atmosphere
value
```

This avoids building separate review tables for every business type.

---

# 15. Table: review_photos

```text
id
review_id
storage_path
approved
created_at
```

---

# 16. Table: saved_items

```text
user_id
business_id
doctor_id
created_at
```

Future support can add custom collections.

---

# 17. Table: helpful_votes

```text
user_id
review_id
created_at
```

Unique constraint:

```text
user_id + review_id
```

One person cannot vote repeatedly.

---

# 18. Table: business_claims

```text
id

business_id
user_id

claimant_name
position

phone
email

verification_notes
document_path

status

reviewed_by
reviewed_at

created_at
```

Statuses:

```text
pending
approved
rejected
```

---

# 19. Table: listing_suggestions

For missing places.

```text
id

submitted_by

name
category_id

address
latitude
longitude

phone
instagram

notes

status

created_at
```

---

# 20. Table: reports

```text
id

reporter_user_id

review_id
business_id
user_id

reason
details

status

created_at
resolved_at
```

---

# 21. Authentication

The app must allow people to browse without logging in.

Do NOT force login when the app opens.

Require login only when the user wants to:

- write review
- save place
- vote helpful
- upload photo
- suggest business
- claim business

---

## Initial Login Methods

Start with:

### Email

### Google

### Apple

Supabase supports mobile authentication flows including social providers.

Phone-number authentication can be considered later.

---

# 22. Authentication Flow

### Guest opens HARA?

↓

Can browse normally.

↓

User taps:

**Write Review**

↓

If logged in:

Continue.

If not:

Show login sheet.

↓

Login/signup

↓

Return user directly to review screen.

Do not send them back to Home after authentication.

---

# 23. Security

This is important.

Enable Supabase:

**Row Level Security**

for all user-facing tables.

Supabase explicitly recommends reviewing RLS policies before production deployment.

Examples:

Users:

- can update only their own profile.

Reviews:

- users can create their own reviews.
- users can edit only their own reviews.
- users cannot approve reviews.
- admin can moderate reviews.

Business claims:

- users can view their own claim.
- administrators can view all claims.

Admin permissions must never depend only on hiding buttons in the app.

They must be enforced server-side.

---

# 24. Rating System

User enters ratings from:

**1–10**

Allow whole numbers initially.

Example:

```text
Food        9
Service     8
Atmosphere 10
Value       8
```

Calculate overall rating automatically or let user provide overall score separately.

For MVP:

I prefer:

**user selects overall score independently**

because sometimes the experience isn't perfectly represented by an average.

---

# 25. Display Ratings

Display:

```text
9.2
```

rather than:

```text
★★★★☆
```

This becomes part of the HARA? identity.

---

# 26. Ranking Logic

Do NOT simply sort by average score.

Otherwise:

Business A:

10.0 / 2 reviews

beats:

Business B:

9.4 / 700 reviews

which makes rankings useless.

Initial ranking score should factor:

```text
rating
review volume
verified reviews
recent reviews
return percentage
```

Later this can become more sophisticated.

---

# 27. Search Architecture

For MVP use PostgreSQL search.

Search across:

```text
business name
description
category
subcategory
district
doctor name
specialty
```

Examples:

```text
steak
massage
dermatologist
dentist
rooftop
nails
```

Do not introduce Elasticsearch or Algolia yet.

Postgres is enough for MVP.

---

# 28. Location

Request location only when useful.

Do not block onboarding with mandatory location permission.

Use location for:

- Near You
- distance
- map
- verified visit
- nearby search

---

# 29. Verified Visit

MVP verification:

User submits review.

App checks whether location permission exists.

If user recently came sufficiently close to the business:

```text
verified_visit = true
```

Otherwise:

```text
verified_visit = false
```

Unverified reviews remain allowed.

---

# 30. Important Verification Improvement

Do NOT only check the user's current GPS location when they submit.

People often write reviews later.

Eventually store a privacy-safe temporary visit signal when the user intentionally checks in or interacts with a location.

For the first build, however, current/explicit location verification is sufficient.

---

# 31. Images

Use Supabase Storage buckets.

Suggested buckets:

```text
avatars
business-photos
review-photos
claim-documents
```

`claim-documents` must be private.

Public business imagery can be public/CDN-served.

---

# 32. Translation

All interface strings must come from translation files.

Never hard-code English UI text directly throughout components.

Structure:

```text
i18n/en.json
i18n/az.json
i18n/ru.json
```

Example:

```json
{
  "home.searchPlaceholder": "Restaurants, doctors, beauty...",
  "home.trending": "Trending in Baku",
  "review.write": "Write a review"
}
```

English can be built first.

Azerbaijani and Russian follow once UI copy stabilizes.

---

# 33. Admin Dashboard

The first admin dashboard does NOT need to look beautiful.

It needs to work.

Sections:

### Dashboard

Counts:

- businesses
- users
- reviews
- pending reviews
- pending claims
- listing suggestions

---

### Businesses

Admin can:

- create
- edit
- deactivate
- upload photos
- change category
- change location

---

### Doctors

Admin can:

- create doctor
- edit profile
- assign specialty
- assign clinics

---

### Reviews

Admin can:

- read
- approve
- flag
- remove
- restore

---

### Claims

Admin can:

- review claim
- see documents
- approve owner
- reject claim

---

### Suggestions

Admin can:

- approve listing
- edit submitted information
- reject suggestion

---

# 34. Business Dashboard

Do NOT build a separate sophisticated business application yet.

Once a claim is approved, owners can access a simple protected section of the web dashboard.

They can:

- edit contact information
- edit description
- edit hours
- upload photos
- reply to reviews

They cannot alter ratings or delete reviews.

---

# 35. Analytics Events

Build analytics hooks early.

Important events:

```text
app_opened

search_performed

category_opened

business_viewed

doctor_viewed

call_clicked

directions_clicked

instagram_clicked

whatsapp_clicked

business_saved

review_started

review_submitted

review_helpful_clicked
```

These will tell us if people actually use HARA?.

---

# 36. Build Order

## Milestone 1 — App Shell

Build:

- splash
- bottom navigation
- Home
- Search
- Saved
- Profile
- placeholder data

Goal:

**HARA? opens on a real phone and feels like an app.**

---

## Milestone 2 — Supabase

Create:

- Supabase project
- schema
- seed data
- API connection

Replace fake cards with database content.

---

## Milestone 3 — Business Profiles

Build:

- restaurant profile
- nightlife profile
- beauty profile
- clinic profile

Support:

- photos
- contacts
- ratings
- address
- opening hours

---

## Milestone 4 — Doctors

Build:

- doctor discovery
- specialties
- doctor profile
- clinic relationships

---

## Milestone 5 — Authentication

Add:

- account creation
- login
- logout
- persistent sessions
- profile

Official Supabase Expo examples support persistent authentication sessions in React Native.

---

## Milestone 6 — Reviews

Build:

- write review
- category-specific ratings
- photos
- would-return question
- review display
- helpful voting

---

## Milestone 7 — Search & Filters

Add:

- live search
- categories
- specialties
- price
- rating
- district
- open now

---

## Milestone 8 — Maps & Location

Build:

- map results
- distance
- directions
- near me
- visit verification

---

## Milestone 9 — Admin

Build administrative dashboard.

Populate listings.

---

## Milestone 10 — Polish

Improve:

- animations
- loading states
- skeleton loaders
- typography
- spacing
- error messages
- empty states
- image performance
- dark mode if desired

---

# 37. First Working Milestone

This is what I want Work to create FIRST.

Not the complete app.

Create:

### Functional HARA? prototype

Containing:

1. Splash screen
2. Home screen
3. Bottom navigation
4. Categories
5. Search screen
6. Search results
7. Restaurant profile
8. Doctor profile
9. Beauty profile
10. Nightlife profile
11. Saved screen
12. User profile

Use realistic sample Baku data.

No backend required during this first visual milestone.

Everything should be navigable.

This lets us judge:

- design
- UX
- information hierarchy
- visual identity

before database complexity is introduced.

---

# 38. Sample Data

For the prototype, create approximately:

### 10 restaurants/cafés

### 6 doctors

### 5 clinics

### 8 beauty/spa businesses

### 6 nightlife venues

Use realistic but clearly sample/test data if actual business information has not been verified.

Do not fabricate reviews and present them as genuine real-world reviews.

---

# 39. Design Direction

Use the concept already approved.

HARA? should feel like:

**Airbnb × modern local discovery × premium social app**

Not:

- government directory
- corporate SaaS
- old Yelp
- generic template app

---

## Visual rules

### Photography first

Use large images.

### Rating first

9.4 should be highly visible.

### Cards

Rounded but not excessively bubbly.

### Typography

Clean modern sans-serif.

### Spacing

Generous.

### Interface

Minimal.

### Color

Mostly neutral interface with one distinctive HARA? brand accent.

---

# 40. Home Screen Priority

The hierarchy should be:

### HARA?

↓

### Where should we go?

↓

Search

↓

Categories

↓

Trending in Baku

↓

Near You

↓

Popular This Week

↓

New & Worth Trying

Do not overcrowd it.

---

# 41. Avoid

Do not:

- put five-star icons everywhere
- add crypto
- add chat
- add unnecessary AI
- add loyalty points
- build payments
- build delivery
- build a TikTok feed
- add dozens of settings
- require signup immediately
- use placeholder Lorem Ipsum
- create overly complex onboarding

Keep Version 1 focused.

---

# 42. Code Standards

Use:

- TypeScript
- reusable components
- consistent naming
- environment variables
- no hard-coded secrets
- clear data types
- loading states
- error states
- empty states

Do not put the entire application inside a few giant files.

---

# 43. Environment Variables

Example:

```text
EXPO_PUBLIC_SUPABASE_URL=
EXPO_PUBLIC_SUPABASE_PUBLISHABLE_KEY=
```

Supabase's current Expo guidance uses Expo-prefixed public environment variables for client connection details.

Sensitive server credentials must never be committed to GitHub or bundled inside the mobile application.

---

# 44. Definition of First Deliverable

The first coding session is successful when I can open HARA? on a phone and:

- browse Home
- tap categories
- search
- see results
- open a restaurant
- open a doctor
- open a salon
- open nightlife
- save a place visually
- move around using bottom navigation

It must already look convincingly like a real consumer application.

Backend implementation begins after this design/UX version is approved.

---

# 45. Instruction for AI Coding Agent

**Build HARA? according to this technical specification and the HARA? MVP Blueprint.**

Prioritize the approved visual design and user experience.

Start with Milestone 1 only.

Do not attempt to implement the entire specification at once.

Use clean reusable React Native/Expo TypeScript components.

Use realistic Baku-focused sample content.

Ensure every visible button in the first prototype either works or is clearly disabled.

The result should run successfully before proceeding to the next milestone.

Do not add features outside the specification without approval.
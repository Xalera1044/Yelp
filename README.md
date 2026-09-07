# HARA? — Version 1 Web Beta

Local discovery and reviews for Azerbaijan, starting with Baku.

**Status:** Private web beta. This is the first implementation snapshot, not the completed launch MVP or a native iOS/Android app.

**Preview:** https://hara-baku.abbas-nazarov.chatgpt.site (owner-private)

## Product rules

Build strictly from `docs/HARA_MVP_Blueprint.md`. Keep the experience premium, mobile-first and Baku-focused. Do not add features outside the MVP unless requested.

Core categories:

- Restaurants & Cafés
- Nightlife
- Doctors & Clinics
- Beauty & Spa

Use ratings from **1.0 to 10.0**. Doctor reviews describe patient experience, never medical competence, diagnosis accuracy or treatment effectiveness. Booking uses verified phone, WhatsApp or external links; a full booking system is outside the MVP.

## Included in this snapshot

- Home discovery feed and category shortcuts.
- Search with category, rating, price, neighborhood and selected service/specialty filters.
- Interactive Baku map with pan, zoom and selectable venue markers.
- Restaurant, doctor, clinic, beauty and nightlife profile views.
- Persistent saved places and category collections.
- Review forms with category-specific scores, written reviews, optional photo uploads and “Would you return?” answers.
- Basic location proximity checks for verified-visit badges.
- Review moderation, helpful votes and reports.
- Missing-place suggestions and business ownership claims.
- Approved-owner description/contact editing and review reply submission.
- Profile text editing, submission-status notifications and stored-record deletion.
- Basic admin approval/rejection and account suspension controls.

These are implemented flows, not a claim of end-to-end test coverage. Some workflows remain partial: approving a suggested place does not yet create a discoverable listing, and owner replies still need complete display integration.

## Data and launch limitations

Listings, displayed scores, review counts, prices and venue photography are illustrative. They are labeled as samples. Displayed score aggregates do not yet recalculate from submitted genuine reviews. Contact actions remain unavailable where verified contact details are missing.

Still required by the blueprint:

- Native Expo iOS/Android app and app-store delivery.
- Public account registration with email verification.
- Verified Baku listing dataset; target 500 listings before launch.
- Genuine review aggregates, return percentages and confidence-weighted ranking.
- Complete category-specific filters, distance filtering and reliable open-now/availability data.
- Full Azerbaijani and Russian localization; only main discovery labels are translated today.
- Complete admin listing creation, deletion, duplicate merging and category management.
- Full owner menu, service and photo management.
- Review highlights, profile-photo editing and complete notification behavior.
- Normalized relational schema matching the blueprint.
- Complete account deletion, including uploaded image objects.
- Security review, accessibility review and browser/end-to-end testing.

## Current technology

| Layer | Current implementation |
| --- | --- |
| Interface | React 19, TypeScript, Vinext/Vite |
| Styling | Tailwind CSS 4, custom CSS, Radix/Shadcn primitives |
| Runtime | Cloudflare Workers through Sites |
| Database | Cloudflare D1 with Drizzle migrations |
| Photos | Cloudflare R2 |
| Authentication | Sites-provided ChatGPT identity |
| Map | OpenStreetMap tiles and custom pan/zoom controls |

The blueprint recommends Expo and Supabase. This web beta currently uses the stack above; it is not already an Expo/Supabase project.

## Source structure

| Path | Purpose |
| --- | --- |
| `app/page.tsx` | Main application views and interactions |
| `app/globals.css` | Brand styling and responsive layout |
| `app/BakuMap.tsx` | Interactive map |
| `app/api/data/route.ts` | Data, saves, reviews and moderation API |
| `app/api/upload/route.ts` | Photo uploads |
| `app/api/photo/[id]/route.ts` | Photo retrieval |
| `lib/data.ts` | Sample listings and category rating definitions |
| `db/schema.ts` | Current database schema |
| `drizzle/` | Generated database migrations |
| `public/images/` | Illustrative images |
| `.openai/hosting.json` | Existing Site identity and logical storage bindings |
| `IMPLEMENTATION.md` | Detailed implementation notes and image sources |
| `docs/HARA_MVP_Blueprint.md` | Authoritative product blueprint |

## Development setup

The existing scripts target **Linux**, with Node.js **22.13.0 or later**, npm, Bash, `flock`, `curl` and GNU `timeout`. On a Mac, use a Linux development container or adapt the Linux-specific scripts first.

From the extracted project directory:

```bash
npm run install:ci
npm run dev
```

Other existing commands:

```bash
npm run build
npm run db:generate
```

The preview UI and backend have different prerequisites. Persistent workflows require D1/R2 bindings, an initialized database and a trusted authentication layer. Local simulation does not automatically supply the deployed Site's users, database contents or photo objects. Database migration generation does not apply migrations by itself.

Outside Sites, provision those services and replace or securely integrate the authentication layer. The API currently trusts identity headers supplied by Sites; never expose it publicly behind a server that accepts arbitrary client-supplied identity headers. Admin access currently uses a server-side account-email check in `app/api/data/route.ts`.

The existing `.openai/hosting.json` identifies the current Site. Keeping source in GitHub does not automatically deploy it or configure GitHub Actions.

## Add this version to GitHub

1. Create an empty **private** repository named `hara-web`.
2. Extract `HARA_V1_Source.zip` and open its `hara-v1` directory.
3. Use the included `README.md` as the repository README. `HARA_VERSION_1.md` is a standalone copy of this document, not the application code.
4. Run the following, replacing `YOUR_GITHUB_USERNAME`:

```bash
git init
git add .
git commit -m "HARA version 1 web beta"
git branch -M main
git remote add origin https://github.com/YOUR_GITHUB_USERNAME/hara-web.git
git push -u origin main
git tag v0.1.0
git push origin v0.1.0
```

The product snapshot is called Version 1; the suggested Git tag is `v0.1.0` because the launch MVP is incomplete and the package version is currently `0.1.0`.

The ZIP includes tracked source, assets, configuration, lockfile and migrations. It excludes `.git`, dependencies, build output, runtime caches, credentials and live user data. Original deployed source revision: `3cbedd13a862c65a5e000fe78abd740d5c645693`. The export replaces the generic starter README with this document and adds the supplied blueprint; application code is unchanged.

## Verification

The prior build, SQLite migration check, saved-place uniqueness check and deployment packaging check passed. Private deployment succeeded. Browser interaction testing and a complete automated test suite were not run. Existing starter tests are not proof of HARA feature coverage.

## Explicitly outside MVP

No payments, full booking calendar, appointment inventory, loyalty wallet, direct messaging, delivery, AI assistant, video feed, advertising platform or subscription billing.

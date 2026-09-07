# HARA? implementation status

Source brief: supplied HARA? MVP Blueprint. This checkout is a private, mobile-first web beta, not the completed native launch MVP.

Implemented: discovery, four core categories and subcategories, search, category/price/rating/area filters, real map tiles with selectable coordinate markers and pan/zoom, place/doctor/clinic profiles, persistent saved places, category-specific review submission, optional image upload, location-based badge checks, moderation queue, helpful/report actions, place suggestions, claims, approved-owner editing and replies, profile editing, account-data deletion, notifications for submitted records, admin approval and suspension.

Data: sample listings and sample scores are explicitly labeled. Venue photographs are illustrative, not claimed as photos of listed businesses. No fabricated contacts or genuine-review claims. Current displayed sample aggregates do not represent submitted reviews.

Remaining launch requirements: native Expo iOS/Android client; public email verification/authentication; verified launch dataset (target 500); genuine review aggregates and confidence-weighted ranking; all category-specific filters including accurate open-now and consultation availability; complete AZ/RU translations; normalized blueprint relational schema; comprehensive admin create/delete/merge/category tools; review highlight tag aggregation; profile photo editing; push notifications; full account deletion of uploaded blobs; owner services/menu/photo editing; production security and end-to-end tests. Device geolocation is a basic proximity check, not spoof-proof proof of attendance.

Platform: Vinext on Cloudflare Workers, D1 persistent data and R2 photos. Private Sites authentication, not Supabase public signup. Admin access is restricted server-side to Abbas's supplied account email. Uploaded files are private-site resources. Public launch is not configured.

Image sources:
- Baku: https://www.eurojet-service.com/post/city-getaway-in-the-caucasus-baku
- Restaurant: Dmitry Spravko on Unsplash, https://unsplash.com/photos/a-restaurant-with-a-bunch-of-lights-hanging-from-the-ceiling-wrW1mQTja7w
- Spa: https://thewordrobe.com/fontainebleau-las-vegas-unveils-wellness-menu-and-its-out-of-this-world/
Confirm image rights and replace illustrative assets with authorized venue photos before public release.

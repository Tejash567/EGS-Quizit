# EGS Quiz Arena

A static scoreboard for the EGS annual inter-school quiz. It runs directly in a modern browser and does not need a build step or a backend for a single laptop event.

## Run locally

Open `index.html` in a modern browser. Quiz setup, scores, and the selected display palette are saved in that browser on that device.

## Deploy with GitHub Pages

1. Create an empty GitHub repository and push this repository's `main` branch.
2. In the repository, open **Settings → Pages**.
3. Choose **Deploy from a branch**, select `main` and `/ (root)`, then save.
4. GitHub Pages will publish `index.html` and the logo images in `assets/`.

The page is static, so GitHub Pages, Netlify, or Cloudflare Pages can host it without a server or database.

## When Supabase is useful

Supabase is not needed for a quiz scored on one laptop, including when that laptop's display is duplicated to a projector. The scores are stored in that browser's local storage. Add a shared database only if multiple devices need to see and update the same live scores, or if results must sync across devices and sessions.

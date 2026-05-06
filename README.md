# Ubuntu Gate Memorial Day

> *He said Ubuntu. He meant Arch. The office never recovered.*

A cinematic memorial honoring the day a coworker confidently said "Ubuntu" when he meant "Arch." Built as the world's most over-engineered single-page site, shipped in a ~1.5MB Docker container.

**Live at [www.ubuntu-gate.de](https://www.ubuntu-gate.de)**

## Features

- Cinematic intro sequence with a CLASSIFIED slam
- Glitching title with RGB split
- 100 floating ember particles with pre-baked glow sprites
- Random lightning bolts with forking
- Explosions with shockwave rings
- 3D mouse-tilt parallax
- Click anywhere to trigger an explosion
- Dynamic day counter since May 16, 2025
- Rotating orbital rings and pulsing halo
- The whole thing runs on busybox

## Stack

| Layer | Tech |
|-------|------|
| Frontend | Single HTML file, vanilla JS, canvas |
| Server | busybox httpd |
| Container | `busybox:1.37-musl` (~1.5MB total) |
| Reverse proxy | Traefik v3 with Let's Encrypt |
| CI/CD | GitHub Actions → ghcr.io |

## Run locally

```bash
docker build -t ubuntu-gate .
docker run -p 8080:8080 ubuntu-gate
```

Open [localhost:8080](http://localhost:8080).

## Deploy

The GitHub Action builds and pushes to `ghcr.io/amacado/ubuntu-gate/ubuntu-gate:latest` on every push to `main`.

On the server, with an existing Traefik instance on the `proxy` network:

```bash
docker compose up -d
```

This serves the site at `www.ubuntu-gate.de` with automatic SSL and a 301 redirect from the naked domain.

## Project structure

```
.
├── ubuntu-gate-memorial-day.html   # The entire site
├── favicon.svg                     # Skull & crossbones Ubuntu logo
├── Dockerfile                      # 5 lines, busybox-based
├── docker-compose.yml              # Production deploy with Traefik labels
└── .github/workflows/publish.yml   # Build & publish to ghcr.io
```

## Never forget

```
  He Said          He Meant
 ─────────       ──────────
  UBUNTU    ≠      ARCH
```

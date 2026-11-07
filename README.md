# Request a show, nobody touches anything: the *arr stack

Companion repo for the video. Follow one request from a phone to the Plex library:
Seerr, Sonarr/Radarr, Prowlarr, a download client (behind a VPN if you torrent),
hardlinks, Plex and Bazarr.

**Watch:** {{VIDEO_URL}}

These are examples to read, copy and adapt, not a product. Every hostname, path, ID and
key is a placeholder. I run everything on Kubernetes with Helm; the video says the same
setup works in plain Docker, so the examples here are Docker Compose.

## What's here

| Folder | Part of the video |
|---|---|
| [`steps/01-data-root`](steps/01-data-root) | Shared data root, PUID/PGID, UMASK (body_7, body_9, body_18, body_19) |
| [`steps/02-seerr-sonarr-radarr`](steps/02-seerr-sonarr-radarr) | Seerr, Sonarr and Radarr, root folders (body_5 to body_7) |
| [`steps/03-prowlarr-indexers`](steps/03-prowlarr-indexers) | Usenet vs torrents, Prowlarr (body_10 to body_13) |
| [`steps/04-download-clients`](steps/04-download-clients) | SABnzbd, qBittorrent, VPN pattern, full compose (body_14 to body_16) |
| [`steps/05-verify-hardlinks`](steps/05-verify-hardlinks) | Hardlinks and the `ls -li` check (body_17 to body_21, body_25) |
| [`steps/06-plex-and-bazarr`](steps/06-plex-and-bazarr) | Naming, Plex notification, Bazarr (body_22 to body_24) |
| [`steps/07-backups-and-next`](steps/07-backups-and-next) | Backups, TRaSH Guides, Notifiarr, the other arrs (body_26 to body_30) |

## Prerequisites

- A working Plex server (the video assumes you already have one).
- Somewhere to keep a lot of files, like a NAS, and a way to run containers.
- For Usenet: a provider and an indexer, which cost money. For torrents: a client
  behind a VPN. The video names no providers and neither does this repo.
- A browser tab per app: they are all configured through their own web UI.

## Follow along

1. Create the shared data root and pick one PUID/PGID: `steps/01-data-root`.
2. `cp .env.example .env`, fill it in, then bring up the apps from `steps/02-...`
   and add Prowlarr, the clients and the VPN from `steps/04-...`.
3. Configure each app in its web UI as described in each step's README.
4. Request something small in Seerr and run `steps/05-verify-hardlinks/check-hardlinks.sh`.

## Notes and caveats

- The Compose files are my reading of the video's setup, written for this repo. They
  were not run as part of making the video, so treat them as a starting point.
- Image names are variables in `.env.example` that you must fill in with a version tag
  you choose. Don't use `latest` for something you want to reproduce.
- This is managing your own library. Some content is not legal to download where you
  live; don't download it.

## Credits

Settings and layouts follow the Servarr wiki, the TRaSH Guides and each app's docs.

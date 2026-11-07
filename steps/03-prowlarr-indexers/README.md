# Step 3: indexers and Prowlarr

Two ways to download: Usenet and torrents. Sonarr/Radarr can use both and rank the
releases; a common setup is Usenet first, torrents as fallback.

- **Usenet**: servers share posted articles; big files are split with recovery files.
  A provider is the server you connect to; an indexer is the search side and gives you
  an NZB. Both usually cost money.
- **Torrents**: a client asks a tracker for peers, trades pieces and checks them against
  hashes, then keeps uploading (seeding) until you stop it.

**Prowlarr** manages indexers in one place and pushes them to your apps. Usenet indexers
speak Newznab; torrent indexers speak Torznab (Newznab plus seeders). The apps only need
Prowlarr's URL and API key, never the indexer's.

Order of setup:

1. Add your indexers in Prowlarr.
2. Settings, Apps: add Sonarr and Radarr with their URL and API key (Settings, General
   in each app).
3. Pick a sync level: Disabled, Add and Remove Only, or Full Sync. Full Sync overwrites
   edits you made inside the apps on the next sync.
4. Disable the apps' own copies of the indexers (the ones without "(Prowlarr)").

Also: Sync Profiles control RSS, interactive and automatic search and minimum seeders.
Tags tie indexers to apps, download clients and proxies (FlareSolverr only applies when
it and the indexer share a tag). The Redirect option is required for Usenet indexers and
optional for torrent ones, per the wiki at recording time.

No indexers or providers are named here, on purpose.

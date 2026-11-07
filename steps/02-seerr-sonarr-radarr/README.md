# Step 2: Seerr, Sonarr, Radarr

**Seerr** is the one app your household opens. Overseerr and Jellyseerr guides apply:
they merged into Seerr. Log in with Plex, connect it to your Plex server, then add
Sonarr and Radarr, otherwise a request can never become a download. If you migrate from
Overseerr/Jellyseerr, back up the config and database first, it runs migrations.

**Sonarr (TV) and Radarr (movies)** are the same app for different media. A request
becomes a monitored title; they find a release, send it to the download client, then
rename and file it.

- Sonarr polls indexers' RSS feeds for newly posted releases and compares them with
  what's missing, so by itself it only covers the future. For a show that already aired,
  tick *Start search for missing* when adding it, or search from the show page or Wanted.
- Settings, Media Management, Root Folders: `/data/media/tv` (Sonarr),
  `/data/media/movies` (Radarr). This is where it imports to and where Plex reads. It is
  not the download folder and can't be the same place. The user needs read/write access.
- Turn on Rename Episodes (TRaSH naming, see step 7), keep quality and release group in
  the file name, and turn on Import Extra Files with at least `srt`.
- Library on the NAS; the apps' config and database on local storage.
- Config on NFS/SMB risks a malformed SQLite database. Sonarr 4.0.0.615+, Radarr and
  Prowlarr can use PostgreSQL instead (Sonarr needs two databases, main and log, created
  by you; migrating an existing SQLite database is unsupported).

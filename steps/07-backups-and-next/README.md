# Step 7: backups, tuning and the rest of the family

**Back up every app's config directory** (database and settings): it's the only copy of
your clicking, and the API keys that link the apps together live there. Back up the Plex
database too (not the media): a rescan can take very long on a big library.

**TRaSH Guides** are community guides for Radarr and Sonarr: naming schemes and quality
profiles you import rather than build. Optional; the apps' own docs are good.
**Notifiarr** is an optional client that handles notifications and can sync TRaSH
profiles (a paid feature). Free alternatives for the sync: Recyclarr (config files),
Configarr (scheduled job), Clonarr (web UI).

**Beyond the basics** (each configured in its own web UI; check each app's wiki):

| App | For | Note from the video |
|---|---|---|
| Chaptarr | Books | Readarr is deprecated and archived; I run Chaptarr, pointed at Postgres |
| Mylar / Kapowarr | Comics | Direct-download providers matter here |
| Romarr | ROMs | Early-stage; RomM (the library app) is separate and can integrate with it |

Expect rough edges with the young projects.

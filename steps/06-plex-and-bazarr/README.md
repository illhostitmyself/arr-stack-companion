# Step 6: Plex and Bazarr

**Naming.** Plex matches TV by layout: a show folder (name and year), `Season 01`
inside, files like `Show Name - s01e01`. Anything after the s/e numbers is ignored.
Metadata comes from TheTVDB and TMDB. Rename Episodes (TRaSH naming: series title and
year, season/episode, episode title, quality and release group in brackets; the series
folder can carry an ID tag for the Plex scanner) keeps this right. Subtitle files must
sit beside the video with a matching name.

**Telling Plex.** Plex normally watches the file system. Where it can't (some remote and
older network mounts), set up Sonarr's and Radarr's Plex connection under Settings,
Connect; it pushes an update on import, upgrade, rename and delete. This is needed on my
NFS library. If full scans bother you, the wiki suggests plex_autoscan.

**Bazarr.** Last hop. Connect it to Sonarr and Radarr with their API keys, enable at
least one subtitle provider (free ones have caps), and create a Language Profile and
set it as the default for series and movies, otherwise nothing downloads. Path mappings
are only needed if it and Sonarr see the same files at different paths.

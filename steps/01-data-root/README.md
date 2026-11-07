# Step 1: one data root, one user

## One shared data root

Hardlinks and atomic moves only work inside one file system. If downloads and the
library are separate mounts, Sonarr falls back to copy-then-delete, every episode
exists twice and disk use doubles while the torrent seeds. Nothing errors.

Use one root and mount all of it into Sonarr and Radarr:

```
data
├── torrents
│   ├── tv
│   └── movies
├── usenet
│   ├── incomplete
│   └── complete
│       ├── tv
│       └── movies
└── media
    ├── tv
    └── movies
```

- Sonarr and Radarr: mount all of `data`.
- Torrent client: only `data/torrents`. Usenet client: only `data/usenet`.
- Plex and Bazarr: only `data/media`.
- Use the same path inside every container (`/data`).

```bash
export DATA_ROOT=/srv/data   # your path
mkdir -p "$DATA_ROOT"/torrents/{tv,movies} \
         "$DATA_ROOT"/usenet/incomplete \
         "$DATA_ROOT"/usenet/complete/{tv,movies} \
         "$DATA_ROOT"/media/{tv,movies}
```

## Ownership: PUID, PGID, UMASK

- PUID/PGID are the user and group ID the process runs as. Use the same pair in every
  arr and every download client, so what one writes the others can read.
- UMASK removes permissions. The default 022 strips group write, so when several
  containers write one tree you usually want 002.
- Setting Docker's `user:` option on these images turns PUID, PGID and UMASK off.
- On NFS, matching users and groups on the storage server make life easier.

To reset a whole shared tree (adjust the user, group and path; this changes
ownership and permissions of everything under it, so check the path first):

```bash
sudo chown -R YOUR_USER:YOUR_GROUP "$DATA_ROOT"
sudo chmod -R a=,a+rX,u+w,g+w "$DATA_ROOT"
```

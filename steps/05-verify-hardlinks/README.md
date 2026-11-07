# Step 5: check that hardlinks work

When a download finishes, Sonarr asks the client where the file is, parses the name,
renames it and files it. Usenet: a move, atomic and instant if downloads and library are
on the same file system, copy-then-delete if not. Torrents: the file has to stay put to
keep seeding, so Sonarr makes a hardlink: a second name for the same bytes. No extra
space, deleting one name leaves the other, editing one edits all. In some versions you
have to tick *Use Hardlinks instead of Copy* (Settings, Media Management, Importing).

```bash
ls -li /data/torrents/tv/SHOW/FILE /data/media/tv/SHOW/Season\ 01/FILE
stat /data/media/tv/SHOW/Season\ 01/FILE
find /data -inum INODE_NUMBER
du -ch /data/torrents/tv/SHOW /data/media/tv/SHOW
```

Same inode and link count 2 means hardlinked. `check-hardlinks.sh` wraps the same
commands. Usenet-only setups show nothing here, because imports are atomic moves.

End-to-end check: the request shows as pending or approved in Seerr, the title is
monitored in Sonarr and Activity shows the grab, the client lists it under the `tv`
category, and it lands in `media` in a show folder with a `Season 01` folder.

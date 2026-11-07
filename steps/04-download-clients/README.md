# Step 4: download clients and the VPN

In Sonarr, Radarr (or Prowlarr): Settings, Download Clients. Host, port, credentials or
API key, and a **category**. Set it: Sonarr follows downloads through the client's API
by category. One per app: `tv` for Sonarr, `movies` for Radarr, and it must match the
category in the client. With several clients, Client Priority runs 1 (highest) to 50.

- **SABnzbd** (Usenet): Config, Folders has a temporary (incomplete) and a completed
  folder. Putting incomplete on node-local fast storage keeps repair and unpacking off
  the network; only finished files go to the NAS. Remember the completed folder is
  under the shared data root.
- **qBittorrent vs Flood**: Prowlarr can answer with a redirect to a magnet link; as
  far as I remember Flood can't follow it and rejects the release, qBittorrent can.
- **VPN (torrents)**: `network_mode: "service:vpn"`, the web UI port declared on the VPN
  container, `/dev/net/tun` and `NET_ADMIN`. Then test the kill switch: stop the VPN
  container and check the client can't reach the internet. A VPN is not a legal shield
  or a promise of anonymity.

If your arrs and client are containers with identical mounts you rarely need a Remote
Path Mapping. If the client reports a different path than Sonarr sees, add one in
Settings, Download Clients: client host, the path the client reports, the path Sonarr
sees. It only translates the string, it doesn't stop hardlinks by itself.

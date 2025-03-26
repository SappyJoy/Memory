# Memory

> “[One] who works with the door open gets all kinds of interruptions, but [they] also occasionally gets clues as to what the world is and what might be important.” — Richard Hamming

To launch service automatically on start do following.

1. **Create User Service File**

```sh
v ~/.config/systemd/user/memory.service
```

With this content

```ini
[Unit]
Description=Personal Notes Service
After=network.target

[Service]
Type=exec
WorkingDirectory=<project directory>
ExecStart=/usr/bin/docker compose --env-file .env up -d
ExecStop=/usr/bin/docker compose down
Restart=always
RestartSec=5s

[Install]
WantedBy=default.target
```

2. **Reload and enable the service**:
```bash
systemctl --user daemon-reload
systemctl --user enable --now memory.service
```

3. **Ensure lingering is enabled**:
```bash
sudo loginctl enable-linger $USER
```

4. **Verify Docker permissions** (you've already done this, but just in case):
```bash
sudo usermod -aG docker $USER
# Then log out and back in
```

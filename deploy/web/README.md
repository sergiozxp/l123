# Public web deployment

This profile serves l123 through ttyd while each browser session runs
inside its own disposable Docker container.

Security properties:

- `/System`, PostgreSQL, and direct CUPS printing are disabled in code.
- Containers run as UID/GID 10001 with every Linux capability dropped.
- The root filesystem is read-only; only a 32 MiB ephemeral `/work` exists.
- Container networking is disabled.
- Each session has 256 MiB RAM, 0.5 CPU, 64 PIDs, and a one-hour lifetime.
- ttyd accepts four clients globally; Nginx limits each IP to two connections.
- No workbook persists after a session ends.

Build from the repository root:

```sh
cargo build --release -p l123
docker build -f deploy/web/Dockerfile -t l123-web:a757fa9-secure .
```

Install `run-session.sh` under `/opt/l123-web`, install the systemd
unit, and merge the Nginx rate zones and location into the relevant
`http` and `server` contexts.

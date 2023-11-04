# portable-zoom

## Description

portable-zoom is container for Distrobox with Zoom installed

## How to use
Create new distrobox, pulling this container
```bash
distrobox create -i ghcr.io/jimjimovich/portable-zoom -n portable-zoom --pull
```

Enter the distrobox
```bash
distrobox enter portable-zoom
```

Export Zoom from inside the distrobox
```bash
distrobox-export --app zoom
```
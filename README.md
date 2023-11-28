# github-desktop
The configuration to get an Ubuntu xfce desktop running on GitHub Codespaces.

# Setup and run
Run [setup.sh](https://github.com/MechaXYZ/github-desktop/blob/main/setup.sh)

If you want to restart the server, run:
`kill $(lsof -t -i:5901) && kill $(lsof -t -i:6080)`

then run setup.sh again.

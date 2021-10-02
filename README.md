# wcsim_hybrid_docker
Build a WCSim_hybridPMT image and push to docker hub with github actions. 

The base GEANT4 image is built by https://github.com/kmtsui/geant4_docker, and the WCSim package is downloaded from https://github.com/kmtsui/WCSim/tree/feature_scattering and stored in the directory `/WCSim`.

The final image is pushed to `kmtsui/wcsimhybrid:latest` at docker hub.

## Usage
To run the container, simply call
```
docker run -it --rm --name wcsim_container kmtsui/wcsimhybrid:latest bash
```
Options:
- `-it`: Keep bash open after invoking
- `--rm`: Delete container when stopping. Remove this option if you want to keep your container for more than one session
- `--name wcsim_container`: Name for your container.

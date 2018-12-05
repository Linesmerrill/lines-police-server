# lines-police-server

Built to run on Windows

## Run

Execute the file `start-server.cmd` to run the server located at the root of the project.

## Adding Mods

Mods are located in the `resources/` directory. The current directories for mods are as follows:

* `resources/[mods]`: contains mods to the base game such as [deleteveh](https://forum.fivem.net/t/release-delete-vehicle-script-1-0-5/7727)
* `resources/[vehicles]`: contains add on vehicles such as [blaineCountySheriffPack](https://forum.fivem.net/t/blaine-county-sheriff-mega-pack-non-els/56061)
* `resources/[visual]`: contains any visual addons such as [vegetation](https://forum.fivem.net/t/release-fivem-maps-vehicles-enhancements/46133)

After placing the mods under the appropiate directory, be sure to add the `start` command for that mod to the `server.cfg` file under the appropriate location.

Simply find the correct spot in the `server.cfg` file. For example if I want to add a new visual mod for `sandyshores` i'll drop that folder inside of `resources/[visual]` and then add the start command: `start sandyshores` to the **visual** section in the `server.cfg` so it should look like:

```properties
...
#####################
# -- Visual Mods -- #
#####################
start sandyairfield # Modern-Sandy-Shores-Airfield
start paleto        # Paleto-Bay-Alive
start ad2           # Real-Movie-Posters---Billboards---Realism-Mod
start In-N-Out      # In-N-Out---Krispy-Kreme---Real-Billboards
start sandyshores   # **<Place the name and version here>**
...
```

For consistency and help later on, be sure to place the name and version lined up to the right side of the start command.

## Questions

Send us an email with your questions: [linespoliceserver@gmail.com](mailto:linespoliceserver@gmail.com)
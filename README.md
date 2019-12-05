# Workflow Scripts

#### [Use LAN](./scripts/use_lan/)

Deactivates your WIFI if you are connected to the internet via a LAN cable. (also works for hubs, adapters)

* Need to go to a meeting? Unplug your cable --> Wifi is **on** and connected again.
* Want to work at your desk? Plug your cable in --> Wifi is **off** and LAN is connected.

This potentially reduces noise in crowded Wifi networks and always serves the fastest internet possible.

#### [Keep Git Repos Clean](./scripts/git_clean/)

Creates a Launch agent to regularly call [`git gc`](https://git-scm.com/docs/git-gc) in all your git repositories to keep your disk space tidy.

*Side-Note: Have a look in the .plist file to adapt the schedule to your needs. ([launchd documentation](https://www.launchd.info))*

#### [Save as Log](./scripts/save_as_log/)

Saves selected text (e.g. from your IDE) to a log file on your Desktop.

#### [Convert HEIF to JPEG](./scripts/convert_to_jpeg/)

Replaces any selected image files in Finder (e.g. HEIF from your iPhone) to jpeg files.





###### °°<><
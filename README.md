# Docker image for 7 Days to Die Dedicated Server

## Docker the image
1. Ensure `/config` is mounted inside the runtime, ie `-v /opt/7dtd/:/config`
1. First time it runs, it populates a sample `serverconfig.xml` then exits,
  giving you time to modify it to your needs.
1. Map data gets symlinked into `/config/Saves/`

## Update automation
IFTTT monitors the RSS feed of the games news, and will trigger a dockerhub
 rebuild of the image, pulling down a new version of the game. This is
 sub-optimal as any time they announce a sale, it will rebuild.
#!/bin/sh

PERMISSION_ERROR="Check assets directory permissions & docker user or skip default assets install by setting the INIT_SITE env var to 0"

if [ "${INIT_SITE}" -eq "1" ]; then
    if [ ! -w "/sites" ]; then  echo "Directory not writable. $PERMISSION_ERROR" && ls -la /sites && exit 1; fi

    hugo new site first-site
    git clone  https://github.com/leafee98/hugo-theme-flat.git first-site/themes/hugo-theme-flat
    cp first-site/themes/hugo-theme-flat/exampleSite/config.toml first-site/. 
    mv first-site/config.yaml first-site/config.yaml.bak || true
    sed -i 's,themesDir = "../..",themesDir = "./themes",g' first-site/config.toml
    sed -i "s,baseURL = \"\",baseURL = \"$HUGO_BASEURL\",g" first-site/config.toml
    cp first-site/themes/hugo-theme-flat/archetypes/default.md first-site/archetypes/.
    sed -i 's/draft: true/draft: flase/g' first-site/archetypes/default.md
    hugo new posts/first-post.md --source /sites/first-site
fi

echo "Starting hugo server"
hugo server -D --bind 0.0.0.0 --appendPort=false -b ${HUGO_BASEURL} --source /sites/first-site
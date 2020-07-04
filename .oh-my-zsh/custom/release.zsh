#!/bin/bash

release() {
  # current Git branch
  # branch=$(git symbolic-ref HEAD | sed -e 's,.*/\(.*\),\1,')

  versionLabel=$(randomName)
  echo $release_name

  git flow release start $versionLabel $1
}

randomName() {
  ADJS=(autumn hidden bitter misty silent empty dry dark summer icy delicate quiet white cool spring winter patient twilight dawn crimson wispy weathered blue billowing broken cold damp falling frosty green long late lingering bold little morning muddy old red rough still small sparkling shy wandering withered wild black young holy solitary fragrant aged snowy proud floral restless divine)
  NOUNS=(waterfall river breeze moon rain wind sea morning snow lake sunset pine shadow leaf dawn glitter forest hill cloud meadow sun glade bird brook butterfly bush dew dust field fire flower firefly feather grass haze mountain night pond darkness snowflake silence sound sky shape surf thunder violet water wildflower wave water resonance sun wood dream cherry tree fog frost voice paper)
  start_name=$(sample ADJS)
  end_name=$(sample NOUNS)
  printf "%s-%s-%s" \
    $start_name \
    $end_name \
    $(gshuf -i 1000-9999 -n1)
  # return "%s-%s-%s\n"  \
  #      $(sample ADJS) \
  #      $(sample NOUNS)\
  #      $(gshuf -i 1000-9999 -n1)
}

sample() {
  echo $(eval echo "\${$1[\$RANDOM%\${#$1[@]}]}")
}

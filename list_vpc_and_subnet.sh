#!/bin/bash

#gcloud projects list --format="value(projectId)" --sort-by=projectId > $PWD/src/list_projects_id 2> /dev/null

/bin/bash $PWD/src/list_subnet.sh 

#nohup  <script>  1>/dev/null 2>&1
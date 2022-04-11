#!/bin/bash

## This file builds and deploys the frontend application of microservices
## TO run this file goto the folder where this file is present
## and type . frontend.sh in the gcloud shell

# First building the new frontend app from react app
cd react-app
npm run build
# Last step builds new public folder with new React App into the frontend in microservices folder

# Now build new image based on new frontend microservice folder
cd ../microservices/src/frontend
gcloud builds submit --tag gcr.io/${GOOGLE_CLOUD_PROJECT}/frontend:latest .

# Now apply the deployment files based on the newly created image
cd ../deps
kubectl apply -f frontend.yaml


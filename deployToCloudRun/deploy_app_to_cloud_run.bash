

gcloud auth list
gcloud config list project
# enable the Cloud Run API
gcloud services enable run.googleapis.com
# Set the compute region
gcloud config set compute/region us-central1
# Create a LOCATION environment variable
LOCATION="us-central1"
# create a new directory named helloworld, then move your view into that directory
mkdir helloworld && cd helloworld

# build your container image using Cloud Build by running the following 
# command from the directory containing the Dockerfile. 
# (Note the $GOOGLE_CLOUD_PROJECT environmental variable in 
# the command, which contains your lab's Project ID):

gcloud builds submit --tag gcr.io/$GOOGLE_CLOUD_PROJECT/helloworld

# List all the container images associated with your current project using this command
gcloud container images list
# To run and test the application locally from Cloud Shell, start it using this standard docker command
docker run -d -p 8080:8080 gcr.io/$GOOGLE_CLOUD_PROJECT/helloworld
# Deploying your containerized application to Cloud Run is done using the following command adding your Project-ID
gcloud run deploy --image gcr.io/$GOOGLE_CLOUD_PROJECT/helloworld --allow-unauthenticated --region=$LOCATION

# clean-up

gcloud container images delete gcr.io/$GOOGLE_CLOUD_PROJECT/helloworld
gcloud run services delete helloworld --region=us-central1
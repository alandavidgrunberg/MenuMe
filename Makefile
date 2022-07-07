set_vars:
	export GCP_PROJECT_ID=“alandavidgrunberg” 
	export DOCKER_IMAGE_NAME="menu-mep” 
	export GCR_MULTI_REGION="asia.gcr.io" 
	export GCR_REGION="asia-southeast1"

docker_build:
	docker build -t $GCR_MULTI_REGION/$GCP_PROJECT_ID/$DOCKER_IMAGE_NAME .

docker_push:
	docker push $GCR_MULTI_REGION/$GCP_PROJECT_ID/$DOCKER_IMAGE_NAME

gloud_run:
	gcloud run deploy --image $GCR_MULTI_REGION/$GCP_PROJECT_ID/$DOCKER_IMAGE_NAME --platform managed --region $GCR_REGION

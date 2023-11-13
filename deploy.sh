docker build -t cgarson/multi-client -f ./client/Dockerfile ./client
docker build -t cgarson/multi-server -f ./server/Dockerfile ./server
docker build -t cgarson/multi-worker -f ./worker/Dockerfile ./worker
docker push cgarson/multi-client
docker push cgarson/multi-server
docker push cgarson/multi-worker
kubectl apply -f k8s
kubectl set image deployments/server-deployment
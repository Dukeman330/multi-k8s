docker build -t cgarson/multi-client:latest -t cgarson/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t cgarson/multi-server:latest -t cgarson/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t cgarson/multi-worker:latest -t cgarson/multi-worker:$SHA -f ./worker/Dockerfile ./worker

docker push cgarson/multi-client:latest
docker push cgarson/multi-client:$SHA
docker push cgarson/multi-server:latest
docker push cgarson/multi-server:$SHA
docker push cgarson/multi-worker:latest
docker push cgarson/multi-worker:$SHA

kubectl apply -f k8s
kubectl set image deployments/server-deployment server=cgarson/multi-server:$SHA
kubectl set image deployments/client-deployment client=cgarson/multi-client:$SHA
kubectl set image deployments/worker-deployment worker=cgarson/multi-worker:$SHA
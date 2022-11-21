echo "Criando as imagens docker..."

docker build -t luminato/projeto-backend:1.0 backend/.
docker build -t luminato/projeto-database:1.0 database/.

echo "Realizando o push das imagens..."

docker push luminato/projeto-backend:1.0
docker push luminato/projeto-database:1.0

echo "Criando serviços no cluster kubernets..."

kubectl apply -f ./services.yml

echo "Criando os deployments..."

kubectl apply -f ./deployment.yml
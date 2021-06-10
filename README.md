# Rails Blog
This is a simple Rails app for learning Kubernetes.
- Kubernetes
- NGINX
- Puma
- Rails
- Postgres
- Redis
- Sidekiq


## Local Development
No K8s (yet?). It's a simple docker-comopose.

## Deployment
### Build Image and Push
```sh
./ops/build_container.sh
```
### Deploy new image
Update the corresponding `ops/k8s/file.yml` to the new image and run
```sh
kubectl apply -f ops/k8s/file.yml
```

### Update K8s secrets
I am using ansible-vault to store the secrets.
```
pip install -r requirements.txt
ansible-vault edit ops/k8s/secrets.yml
```


## TODO
- Set up cron job to delete very old post (to keep DB small)
- Not use ansible-vault to store K8s secret. Use something like HashiCorp Vault
- Run Redis on K8s (learning purpose)
- Run PostgreSQL on K8s (learning purpose)
- Move sidekiq cron out from web deployment
- Add GitHub repo link to the website

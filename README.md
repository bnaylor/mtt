## Docker setup for running MyTinyTodo painlessly.

**Notes**:
- Need to provide a datadir w/a volume mount.  DB will be inited for you.
- Defaults to port 8082 in docker compose, change that if you like.
- k8s deployment still untested.
- Raw docker: `docker run --rm -it -v $(pwd)/test:/var/www/html/db -p 8082:80 docker.io/bnaylor/mtt:1.0`

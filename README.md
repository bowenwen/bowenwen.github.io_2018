# Personal site based on Minimal Mistakes


## Getting Started

To build the site without running server, use build and watch

```
bundle exec jekyll build --watch
```

Or, run Jekyll with `bundle exec`, like so:

```
bundle exec jekyll serve
```

You can also use docker to bring up the site in development:

```
docker-compose --file docker-compose.yml build
docker-compose --file docker-compose.yml --file docker-compose.override.yml up
```

## Version Bumps

To update gem versions, change it in **Gemfile**, save the
file and run `bundle install` or `bundle update`.

To update local **Gemfile** and then **Gemfile.lock** with docker:

1. first, delete local **Gemfile.lock** file
2. then, build the image, if Gemfile.lock is missing, a new one will be generated.
3. finally, copy the Gemfile.lock from image to local
```
id=$(docker create bowenwengithubio_web)
docker cp $id:/home/app/web/Gemfile.lock - > ./Gemfile.lock
```
4. view the file within the container
```
docker exec -it $id /bin/sh
cat Gemfile.lock
docker stop $id
```
5. clean up container
```
docker rm -v $id
```

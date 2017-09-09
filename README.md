[![CircleCI](https://circleci.com/gh/newdark/youtube_view_count.svg?style=svg)](https://circleci.com/gh/newdark/youtube_view_count)

# Setup

Just have to execute the bin/setup script

```shell
$ bin/setup
```

After that place the YOUTUBE_API_KEY into the .env file or export the api key to the bash console your going to be starting the rails server on.

```shell
export YOUTUBE_API_KEY='THEONEKEY'
```

after that should start and be all happy

```shell
bundle exec puma
```

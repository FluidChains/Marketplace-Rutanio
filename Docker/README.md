# Rutanio Marketplace Deployment

- Edit your .env file

>**Note** \
If you ``don't`` have a real domain associate with your site, please use the [development build](#development). This configuration allows Nginx to serve port 80 without request for any certificate.

<a name="development"></a>
## Development build

- Build docker-compose using default yml and dev.yml:
```bash
docker-compose -f docker-compose.yml -f docker-compose.dev.yml build
```

If it is a first time run, please go to: [first time](#first)

- Run services:
```bash
docker-compose -f docker-compose.yml -f docker-compose.dev.yml up -d
```

Now you can see the site on visiting [http://localhost]

To stop services, use:
```bash
docker-compose down --remove-orphans
```

## Production Build

- Make sure you complete Ngnix section on .env file.

- Build docker-compose production using:

```bash
docker-compose -f docker-compose.yml -f docker-compose.prod.yml build
```

If is first run, please see [First Run](#first)

- Run services:
```bash
docker-compose -f docker-compose.yml -f docker-compose.prod.yml up -d
```

If is first run, please see [First Run](#first)

- Stop services:
```bash
docker-compose down
```

<a name=first></a>
### First Run
- If is the first run you must recreate the database using:

```bash
docker-compose run -d marketplace rake db:setup
```

```bash
docker-compose run -d web rake db:migrate
```

Continue with your environment instructions

- If you have a .sql backup, paste it under [db_backups](https://github.com/FluidChains/MarketplaceDocker/tree/master/Docker/db_backups) folder and run (Change variables ``_user``,``_database`` and ``_dbfile`` to your real data):
```bash
docker exec -i docker_db_marketplace_1 bash -c "psql -U {_user} -d {_database} {_dbfile}"
``` 
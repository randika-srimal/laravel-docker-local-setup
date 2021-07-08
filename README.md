
# Laravel Docker 1 Minute Local Setup

## Included Features

- Phpmyadmin database manager
- Mailhog SMTP Testing service (Mailtrap like service for local use)
- Run laravel apps instantly on any development environment




## How to intergrate to your laravel project



1. Clone the project

```bash
  git clone git@github.com:randika-srimal/laravel-docker-local-setup.git
```

2. Checkout to the branch which meet your requirements.

- version-1 : Nodejs v14.17.1, PHP v8.0, MySQL v8.0.25, Composer v2.1.3

3. Make copies of env files inside `env` directory and rename as below.
You can change default values if wants, but good to go with defaults for local developement. 

```bash
  mysql.env.example -> mysql.env
  phpmyadmin.env.example -> phpmyadmin.env
```

4. Delete `.git` folder in the root directory. (You are starting a new project so this .git folder is not required.)

5. Delete `.gitignore` file in the `src` directory. (Laravel has its own `.gitignore` file)

6. Copy all of your laravel files in to `src` directory. If you are moving an existing project in to `src` please avoid copying `node_modules` and `vendor` folders.

7. Change laravel env DB_HOST to "mysql".

```bash
DB_HOST=mysql
```

8. If you want to use Mailhog service for email testing set below values in laravel .env file.

```bash
MAIL_MAILER=smtp
MAIL_HOST=mailhog
MAIL_PORT=1025
```
 
9. Execute below command in the root directory and wait until all services starts (This will take few minutes on first time but after that this will start in seconds).

```bash
  make local-up
```
10. Execute below command in the root directory to access app's shell command prompt.

```bash
  make local-shell
```
From this shell you can execute commands like `composer install`, `npm install` etc. You don't need to execute these commands everytime you start this. Just execute one time and it will create the files inside src directory. 

11. You will access the services by navigating to below urls.

- [Laravel app on http://localhost:8001](http://localhost:8001)

- [Phpmyadmin on http://localhost:8002](http://localhost:8002)

- [Mailhog SMTP Testing Server on http://localhost:8003](http://localhost:8003)

12. After your development works are done execute below command in root directory to stop all the services started.

```bash
  make local-down
```


  
## FAQ

#### Where to init git if I don't need these configs in my app repository. 

Just init your git repo inside `src` directory while keeping these configs outside of your project files.

  
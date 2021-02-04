# Hackathon

## Project setup instructions

#### **Note:** *This project uses MySQL. Make sure you've installed MySQL in your machine.*

**Step 1:** Clone this repo
```
git clone https://github.com/AkhileshwarReddy/Hackathon.git
```

**Step 2:** Move into the `Hackathon` folder and Install the dependencies
```
bundle install
yarn install
```

**Step 3:** Setup Database credentials  
By default, this project is using `root` user for the database. If you want to continue with this, export root user password as `MYSQL_ROOT_PASSWORD`.
```
export MYSQL_ROOT_PASSWORD=<mysql_root_password>
```

If you don't want to use `root` user, then change `user`, `password` in `config/database.yml` with your preferred user credentials.

**Step 4:** Setup the database
```
rails db:setup
```

**Step 5:** Seed the database for pre-defined tags
```
rails db:seed
```

**Step 6:** Run the Server
```
rails s
```

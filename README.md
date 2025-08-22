
# Moodle Docker Project - Quick Start

## 1. Setup Environment Variables

- Copy `example.env` to `.env`:
  ```
  cp example.env .env
  ```
- Edit `.env` and set your desired values for:
  
  DB_ROOT_PASSWORD
  APP_405_PORT
  APP_500_PORT
  MYSQL_PORT
  APP_405_WWWROOT
  APP_500_WWWROOT
  DB_405_NAME
  DB_500_NAME

## 2. Start the Project

- Run the following command to build and start the containers:
  ```
  docker compose up -d
  ```

## 3. Set Permissions

- Change the permission of the newly created `moodledata-405` and `moodledata-500`  directory:
  ```
  sudo chmod 0777 moodledata-405/
  sudo chmod 0777 moodledata-500/
  ```

## 4. Access Moodle

- Open your browser and go to the URL set in `APP_405_WWWROOT` `APP_500_WWWROOT` (default: http://localhost)

---

**Note:**
- If you change any values in `.env`, restart the containers with:
  ```
  docker compose down
  docker compose up -d
  ```
- The configuration files (`moodle/config.php` and `moodle/config-dist.php`) are set up to read database password and site URL from environment variables.
- `.env` is ignored by git. Use `example.env` as a template for sharing configuration.
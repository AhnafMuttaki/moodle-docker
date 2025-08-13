
# Moodle Docker Project - Quick Start

## 1. Setup Environment Variables

- Copy `example.env` to `.env`:
  ```
  cp example.env .env
  ```
- Edit `.env` and set your desired values for:
  - `DB_ROOT_PASSWORD`
  - `APP_PORT`
  - `MYSQL_PORT`
  - `APP_WWWROOT`

## 2. Start the Project

- Run the following command to build and start the containers:
  ```
  docker compose up -d
  ```

## 3. Set Permissions

- Change the permission of the newly created `moodledata` directory:
  ```
  sudo chmod 0777 moodledata/
  ```

## 4. Access Moodle

- Open your browser and go to the URL set in `APP_WWWROOT` (default: http://localhost)

---

**Note:**
- If you change any values in `.env`, restart the containers with:
  ```
  docker compose down
  docker compose up -d
  ```
- The configuration files (`moodle/config.php` and `moodle/config-dist.php`) are set up to read database password and site URL from environment variables.
- `.env` is ignored by git. Use `example.env` as a template for sharing configuration.
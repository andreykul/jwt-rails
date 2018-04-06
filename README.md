# JWT Rails
Basic setup for a Rails application using JWT for authentication with minimal dependencies.

### Dependencies
- devise
- devise-jwt

### ENV Configurations
In development you can just create a file `.env` in the main folder and set those
Set the following ENV variables:
- DEVISE_SECRET_KEY
- JWT_SECRET_KEY

Generate the secrets using `rails secret`

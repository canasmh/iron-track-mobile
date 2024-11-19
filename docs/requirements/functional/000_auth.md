# Authentication and Authorization

Iron Track needs to be able to seamlessly manage user authentication and authorization. It should support a variety of secure options for user authentication. Authorization will allow for a personal experience with the application, only showing users the content that is their own. 

## User Flow

When users open Iron Track, they will see one of two things: A welcome page with some sign-in buttons, a login button, and some SSO options, or they will see their dashboard. This will depend on their authentication status. This functional requirement focuses on the former.

### Sign in with Credentials

Users who decide to create an account without using an OAuth provider will do so via a sign-in form. The form should consist of a Name, Email, Password, and Confirm Password field. Upon successful creation of the account, a verification email should be sent to the user. This email will expire in 15 minutes. Users should have the option to resend a verification email via their profile. Features will be limited until users verify their email. 

### Sign in with OAuth

Users will have the option to sign in with Facebook, X, Google, or Apple. Users can be associated with multiple OAuth accounts via the same email. If a user creates an account with credentials, but then signs in with SSO and the same email is shared, the application should handle this by combining the accounts. Signing in with SSO should imply that the email has already been verified.

### Log in with Credentials

Once users have created an account via credentials, they will need to use those credentials to log back into the account. Specifically, just an email and password. Users should have the ability to reset their password if they've forgotten it by having a link set to their email. 

## Front-End Requirements

### Welcome Page

The welcome page is a branded site that displays a "Sign In" button, a "Log In" button, and the icons for the respective OAuth options.

### Sign Up Page 

The sign-up page is also branded. It consists of four input fields, namely Name, Email, Password, and Confirm Password. It will also include a way to navigate back to the welcome page and the option to switch to the login page.

### Log In Page 

The log-in page is also branded. It consists of two input fields, namely Nameand Password. It will also include a way to navigate back to the welcome page and the option to switch to the sign-up page.

### Profile Page

The profile page is a secured page that will display the users name and email. It will allow for the option to reset their password (via magic link) and also the option to verify the users email (if applicable). The profile page will also provide a logout button.


## Back-End Requirements

The back-end will leverage AWS microservices. Amazon Cognito will be used for authentication users and creating JWTs. The API routes wil utilize amazon's API Gateway and lambda functions to handle the request. This feature requires the creation of three API routes

### Sign Up/Registration

`POST api/auth/register`

- Handles email/password registration
- Creates user in Cognito User Pool
- Returns User ID and session token

### Sign In

`POST /auth/login`
- Handles email/password login
- Returns JWT tokens and refresh token

`POST /auth/oauth/{provider}`
- Providers: Google, Apple, Facebook, X
- Initiates OAuth flow
- Returns authorization URL

`POST /auth/oauth/{provider}/callback`
- Handles OAuth provider callback
- Exchanges authorization code for tokens
- Creates/links Cognito user if needed

### Session Management

`POST /auth/refresh`
- Refresh expired access token using refresh token

`POST /auth/logout`
- Invalidates current session
- Revokes refresh token

### Password Management

`POST /auth/forgot-password`
- Triggers password reset email

`POST /auth/reset-password`
- Resets password with reset code

## Additional Details

These are some additional requirements and/or suggestions for this feature
- Tokens should be refreshed every 15 minutes
- Consider how Face ID will be managed
- Passwords consist of 8-32 characters, an upper case letter, a lower case letter, and a special character

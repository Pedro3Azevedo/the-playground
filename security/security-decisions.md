# Secure Software

In order to develope secure software and mitigate possible cyber attacks, the following security features were implemented

## 1- Sign Up

### Password Validation

The user must insert a valid password that follows these requirements:
  - length between 8 and 20 characters
  - at least one lowercase and one uppercase letter
  - at least one number
  - only alphanumeric characters

### Confirm email exist

To preveent Email enumeration, when a user register an email, if is a valid email, it will say it is valid.
Then, the app will ask the user to confirm the email with link they receive.
If the email is already usedm it will not receive again, and no message will appear.
With this, attackers wont receive feedback if an email already exists.

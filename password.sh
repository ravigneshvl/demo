#!/bin/bash

#echo "Welcome to Password reset portal"

# Function to generate random password
generate_password() {
    local length=$1
    # Define character set for password generation
    char_set="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@#$%^&*()_+-="
    # Generate random password
    LC_CTYPE=C && cat /dev/urandom | tr -dc "$char_set" | fold -w $length | head -n 1
}

# Prompt user for the length of the password
#read -p "Enter the length of the password: " password_length
password_length=16


# Validate user input
if ! [[ $password_length =~ ^[0-9]+$ ]]; then
    echo "Error: Please enter a valid number for password length."
    exit 1
fi

# Generate password
password=$(generate_password $password_length)

echo "$password"

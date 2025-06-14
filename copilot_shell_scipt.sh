#!/bin/bash

read -p "Enter assignment name : " ASSIGNMENT

#validating the input fiels
while [[ -z "$ASSIGNMENT" ]]; do
    echo "Assignment name cannot be empty."
    read -p "Enter assignment name: " ASSIGNMENT
done
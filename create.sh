#!/bin/sh

HOST_APPLICATIONS_PATH="$(pwd)/../applications/"

# Check deploy template input
if [ "$1" == "" ]; then
    echo "Please enter the deploy template:"
    read deploy_template
else
    deploy_template=$1
fi

# Check if the deploy template exists
if [ -f "$(pwd)/deployment-roles/$deploy_template/tasks/main.yml" ]; then
    role_exists="yes"
else
    role_exists="no"
fi

# Check the app name input
if [ "$2" == "" ]; then
    echo "Please enter the app name:"
    read app_name
else
    app_name=$2
fi

# Check file path
APP_PATH="$HOST_APPLICATIONS_PATH$app_name"

if [ -d "$APP_PATH" ]; then
    echo "Found app directory: $APP_PATH"
else
    echo "Creating directory on host: $APP_PATH"
    mkdir -p "$APP_PATH"
fi

#Run playbook
ansible-playbook \
    -e ansible_python_interpreter=/usr/bin/python3 \
    -i .vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory \
    create.yml \
    --extra-vars "ansible_python_interpreter=/usr/bin/python3 \
        deploy_template=$deploy_template \
        app_name=$app_name \
        role_exists=$role_exists"


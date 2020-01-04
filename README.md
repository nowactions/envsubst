# GitHub Action: envsubst

[![Test](https://github.com/nowactions/envsubst/workflows/Test/badge.svg)](https://github.com/nowactions/envsubst/actions)
[![Release](https://img.shields.io/github/release/nowactions/envsubst.svg)](https://github.com/nowactions/envsubst/releases)

This GitHub Action substitutes the values of environment variables using envsubst.
This Action is provided as a Docker action, so it works only on Linux machines.
For more information on types of actions, see the [actions documentation](https://help.github.com/en/actions/automating-your-workflow-with-github-actions/about-actions#types-of-actions)

## Usage

### Prerequisites

Create a workflow `.yml` file in your `.github/workflows` directory.
An [example workflow](#example) is available below.
For more information, reference the GitHub Help Documentation for [Creating a workflow file](https://help.github.com/en/articles/configuring-a-workflow#creating-a-workflow-file).

### Inputs

- `input`: Path to the input file
- `output`: Path to the output file

## Example

```
name: Deploy app to Kubernetes

on:
  push:
    branch:
      - master

jobs:
  deploy:
    name: Deploy app to Kubernetes
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v1

      - name: Build and Push Docker image
        run: ./scripts/image
        env:
          IMAGE_TAG: gcr.io/myprj/app:${{ github.sha }}

      - name: Render Deployment YAML
        uses: nowactions/envsubst@master
        with:
          input: ./deployment.yaml.tmpl
          output: ./deployment.yaml
        env:
          IMAGE_TAG: gcr.io/myprj/app:${{ github.sha }}
          REPLICAS: 3

      - name: Deploy
        run: kubectl apply -f ./deployment.yaml
```

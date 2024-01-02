#!/bin/bash

# Create database
docker run -d -p 27017:27017 --name jiriaf_test_platform_db -v /home/jeng-yuantsai/JIRIAF/mongodb/data:/data/db mongo:latest
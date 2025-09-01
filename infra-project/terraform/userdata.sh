#!/bin/bash
yum update -y
yum install -y docker
systemctl enable docker
systemctl start docker

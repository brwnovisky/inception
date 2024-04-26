#!/bin/bash

if ! grep "bluiz-al.42.fr" /etc/hosts; then \
		sudo sed -i '2i\127.0.0.1\tbluiz-al.42.fr' /etc/hosts; \
	fi

#!/bin/bash
srv=server_name
fix=$1 
fix+=";"
sed -i "s/\($srv *\).*/\1$fix/" default

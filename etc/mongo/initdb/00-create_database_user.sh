#!/bin/bash
set -e;

# a default non-root role
MONGO_APP_ROLE="${MONGO_APP_ROLE:-readWrite}"

if [ -n "${MONGO_APP_USERNAME:-}" ] && [ -n "${MONGO_APP_PASSWORD:-}" ]; then
	"${mongo[@]}" <<-EOJS
		use $MONGO_APP_DATABASE;

		db.createUser({
			user: "$MONGO_APP_USERNAME",
			pwd: "$MONGO_APP_PASSWORD",
			roles: [ {
				role: "$MONGO_APP_ROLE",
				db: "$MONGO_APP_DATABASE" 
			} ] 
		});
	EOJS
fi
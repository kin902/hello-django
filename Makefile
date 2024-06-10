# Add the following 'help' target to your Makefile
# And add help text after each target name starting with '\#\#'

help: # Show this help.
	@grep -h -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "⚡ \033[34m%-30s\033[0m %s\n", $$1, $$2}'

venv: ## 1. Create Virtual Env at current directory. Should run `source .venv/bin/activate` after created Virtual Env.
	python -m venv .venv

django: ## 2. Install Django. Note: Should run `source .venv/bin/activate` to load Virtual Env
	python -m pip install django

project: ## 3. Create project with default name 'system'. Note: Should run `source .venv/bin/activate` to load Virtual Env
	django-admin startproject system
	mv system system_tmp && mv system_tmp/* . && rm -fr system_tmp

superuser: ## 4. Create super user for project
	python manage.py migrate && python manage.py createsuperuser

app: ## 5. Create app $(name). Example `make app name=blog`
	python manage.py startapp $(name)

dev: ## 6. Run project
	python manage.py runserver

migrate: ## Create DB migration
	python manage.py makemigrations && python manage.py migrate

shell: ## Python shell
	python manage.py shell

static: ## Public static file
	python manage.py collectstatic

freeze: ## Export requirements.txt
	python -m pip freeze > requirements.txt

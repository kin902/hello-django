# Add the following 'help' target to your Makefile
# And add help text after each target name starting with '\#\#'

help: # Show this help.
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'

venv: ## 1. Create Virtual Env at current directory. Should run `source .venv/bin/activate` after created Virtual Env.
	python -m venv .venv

django: ## 2. Install Django. Note: Should run `source .venv/bin/activate` to load Virtual Env
	python -m pip install django

project: ## 3. Create project with default name 'myproject'. Note: Should run `source .venv/bin/activate` to load Virtual Env
	django-admin startproject myproject

superuser: ## 4. Create super user for project
	cd myproject && python manage.py migrate && python manage.py createsuperuser && cd ../

app: ## 5. Create app $(name). Example `make app name=blog`
	cd myproject && python manage.py startapp $(name) && cd ../

dev: ## 6. Run project
	cd myproject && python manage.py runserver && cd ../

migrate: ## Create DB migration
	cd myproject && python manage.py makemigrations && python manage.py migrate && cd ../

shell: ## Python shell
	cd myproject && python manage.py shell && cd ../

static: ## Public static file
	cd myproject && python manage.py collectstatic && cd ../

freeze: ## Export requirements.txt
	cd myproject && python -m pip freeze > requirements.txt && cd ../

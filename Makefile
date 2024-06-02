dev:
	cd myproject && python manage.py runserver && cd ../

migrate:
	cd myproject && python manage.py makemigrations && python manage.py migrate && cd ../

shell:
	cd myproject && python manage.py shell && cd ../
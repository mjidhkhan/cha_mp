meal_category:
id	meal_category
1	Starters
2	Main Course
3	Dessert
4	Breakfast
5	Refreshment

-------------------

meal_type
id	meal_type
1	Vegetarian
2	Non Vegetarian

```yaml
RewriteEngine On
RewriteBase /
RewriteCond %{REQUEST_FILENAME} !-d
RewriteCond %{REQUEST_FILENAME} !-f
RewriteCond %{REQUEST_FILENAME} !-l
RewriteRule ^(.+)$ index.php?url=$1 [QSA,L]
```




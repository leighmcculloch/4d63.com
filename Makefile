export CLOUDFLARE_ZONE = b4d27d8decb687eb19b99c74c15ff7b9

generate: clean
	vangen

clean:
	rm -fR vangen/

deploy: push-gcs cdn

push-gcs:
	gsutil -m cp -a public-read -r vangen/* gs://4d63.com
	gsutil web set -m index.html -e 404.txt gs://4d63.com

cdn:
	curl -X DELETE "https://api.cloudflare.com/client/v4/zones/$(CLOUDFLARE_ZONE)/purge_cache" \
		-H "X-Auth-Email: $(CLOUDFLARE_EMAIL)" \
		-H "X-Auth-Key: $(CLOUDFLARE_CLIENT_API_KEY)" \
		-H "Content-Type: application/json" \
		--data '{"purge_everything":true}'

setup:
	go get -u 4d63.com/vangen

{{ $domains := tree "jabber" | byKey }}{{ range $domain, $pairs := $domains }}
{{ with $fullchain := printf "letsencrypt/%s/fullchain" $domain }}{{ key $fullchain }}{{ end }}
{{ with $privkey := printf "letsencrypt/%s/privkey" $domain }}{{ key $privkey }}{{ end }}
{{ end }}

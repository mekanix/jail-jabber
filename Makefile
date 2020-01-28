SERVICE = jabber
REGGAE_PATH = /usr/local/share/reggae
PORTS = 5000 5222 5269 5280 5281

post_setup_ansible:
	@echo "jabber_domain: ${FQDN}" >>ansible/group_vars/all

.include <${REGGAE_PATH}/mk/service.mk>

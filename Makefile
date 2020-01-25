SERVICE = jabber
REGGAE_PATH = /usr/local/share/reggae
PORTS = 5222 5269 5444

post_setup_ansible:
	@echo "jabber_domain: ${FQDN}" >>ansible/group_vars/all

.include <${REGGAE_PATH}/mk/service.mk>

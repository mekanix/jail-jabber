SERVICE = jabber
REGGAE_PATH = /usr/local/share/reggae

post_setup_ansible:
	@echo "jabber_domain: ${FQDN}" >>ansible/group_vars/all

.include <${REGGAE_PATH}/mk/ansible.mk>
.include <${REGGAE_PATH}/mk/service.mk>

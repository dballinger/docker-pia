FROM resin/rpi-raspbian:stretch-20181017

RUN apt-get update

RUN apt-get install -y openvpn curl vim wget iputils-ping supervisor deluged deluge-webui deluge-console cron jq
COPY sweden.ovpn /etc/openvpn/sweden.ovpn
COPY .secrets /etc/openvpn/.secrets
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY crontab /etc/cron.d/ip-check
COPY ip-check.sh /ip-check.sh
RUN chmod 0644 /etc/cron.d/ip-check
RUN touch /var/log/cron.log
RUN crontab /etc/cron.d/ip-check

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]

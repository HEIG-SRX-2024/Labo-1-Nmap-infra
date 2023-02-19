for service in apache2 cups dnsmasq mysql smbd ssh; do
  /etc/init.d/$service start
done
tail -f /dev/null
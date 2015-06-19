Riconfigurazione automatica CPE scorderella
===========================================

1. Piazzare lo script su un device nella stessa LAN della CPE scorderella
2. Piazzare una copia della configurazione corretta nella stessa directory dello script, possibilmente chiamandola system.cfg
3. Cambiare i parametri di impostazione iniziali
4. Provare a lanciare lo script manualmente per assicurarsi che funzioni correttamente
5. Mettere lo script in cron, ogni 5 minuti è sufficiente

Dipendenze
==========

* ping
* sshpass
* openssh
* scp

Riconfigurazione automatica device scorderello
==============================================

1. Piazzare lo script su un device nella stessa LAN del device scorderello
2. Piazzare una copia della configurazione corretta nella stessa directory dello script, possibilmente chiamandola system.cfg
3. Cambiare i parametri di impostazione iniziali
4. Provare a lanciare lo script manualmente per assicurarsi che funzioni correttamente
5. Mettere lo script in cron, ogni 5 minuti è sufficiente, "crontab -e"

Eg:

    5 * * * * <path>/airos_ensure_config.sh >/dev/null 2>&1

Dipendenze
==========

* ping
* sshpass
* openssh
* scp

E' un hack temporaneo
=====================

Questo è un hack temporaneo che permette di prendere tempo e continuare a far funzionare la rete mentre si cerca la situazione definitiva.


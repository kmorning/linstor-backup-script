# linstor-backup-script
Script for export linstor configuration as simple commands

Before using please install `jq`.

**Installation:**
```
wget -o linstor-backup.sh https://github.com/kvaps/linstor-backup-script/raw/master/linstor-backup.sh
chmod +x linstor-backup.sh
```

**Usage:**
```
./linstor-backup.sh | tee linstor_$(date +%Y-%m-%d).sh
```

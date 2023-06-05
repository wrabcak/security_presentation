read -p "Emulate malicious user actions in the environment to demonstrate built-in Security technologies in RHEL-9"
echo ""

clear

read -p "--> Fapolicyd example 1. Different path"
read -p "--> sudo cp /bin/ls /tmp"
echo ""
sudo cp /bin/ls /tmp
echo ""

read -p "--> /tmp/ls"
echo ""
/tmp/ls
echo ""

read -p "--> systemctl stop fapolicyd"
echo ""
sudo systemctl stop fapolicyd
echo ""

read -p "--> /tmp/ls"
echo ""
/tmp/ls
echo ""

read -p "--> Fapolicyd example 2. Integrity via sha256"
read -p "--> cp /bin/more /bin/more.bak"
echo ""
sudo cp -a /bin/more /bin/more.bak
echo ""

read -p "--> cp /bin/less /bin/more"
echo ""
sudo cp -a /bin/less  /bin/more
echo ""

read -p "--> systemctl start fapolicyd"
echo ""
sudo systemctl start fapolicyd
echo ""

read -p "--> /bin/more /etc/redhat-release"
echo ""
/bin/more /etc/redhat-release
echo ""

read -p "--> systemctl stop fapolicyd"
echo ""
sudo systemctl stop fapolicyd
echo ""

read -p "--> /bin/more /etc/redhat-release"
echo ""
/bin/more /etc/redhat-release
echo ""

sudo mv -f /bin/more.bak /bin/more

echo ""
clear

read -p "--> Update aide db for demo purposes"

sudo aide --update > /dev/null
sudo mv /var/lib/aide/aide.db.new.gz /var/lib/aide/aide.db.gz

read -p "--> Aide example 1. Modify config"
echo ""
read -p "--> echo '* * * * * /usr/local/sbin/badhack' >> /etc/crontab"
echo ""
sudo sh -c 'echo "* * * * * /usr/local/sbin/badhack" >> /etc/crontab'

read -p "--> Aide example 1. Aide check database"
echo ""
sudo aide --check
echo ""

read -p ""
clear

read -p "--> SELinux example 1. Confined users"
read -p "--> ssh tester@localhost"
echo ""
ssh tester@localhost
echo ""

echo "End of demo."

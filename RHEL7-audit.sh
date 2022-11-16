#!/bin/bash

# 1.1.1.1 Ensure mounting of cramfs filesystems is disabled - lsmod
echo "************************************************************" >> output.txt
echo "1.1.1.1 Ensure mounting of cramfs filesystems is disabled - lsmod" >> output.txt
echo "************************************************************" >> output.txt
lsmod | grep cramfs >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 1.1.1.1 Ensure mounting of cramfs filesystems is disabled - modprobe
echo "************************************************************" >> output.txt
echo "1.1.1.1 Ensure mounting of cramfs filesystems is disabled - modprobe" >> output.txt
echo "************************************************************" >> output.txt
modprobe -n -v cramfs | grep -E '(cramfs|install)' >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 1.1.1.2 Ensure mounting of squashfs filesystems is disabled - lsmod
echo "************************************************************" >> output.txt
echo "1.1.1.2 Ensure mounting of squashfs filesystems is disabled - lsmod" >> output.txt
echo "************************************************************" >> output.txt
lsmod | grep squashfs >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 1.1.1.2 Ensure mounting of squashfs filesystems is disabled - modprobe
echo "************************************************************" >> output.txt
echo "1.1.1.2 Ensure mounting of squashfs filesystems is disabled - modprobe" >> output.txt
echo "************************************************************" >> output.txt
modprobe -n -v squashfs | grep -E '(squashfs|install)' >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 1.1.1.3 Ensure mounting of udf filesystems is disabled - lsmod
echo "************************************************************" >> output.txt
echo "1.1.1.3 Ensure mounting of udf filesystems is disabled - lsmod" >> output.txt
echo "************************************************************" >> output.txt
lsmod | grep udf >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 1.1.1.3 Ensure mounting of udf filesystems is disabled - modprobe
echo "************************************************************" >> output.txt
echo "1.1.1.3 Ensure mounting of udf filesystems is disabled - modprobe" >> output.txt
echo "************************************************************" >> output.txt
modprobe -n -v udf | grep -E '(udf|install)' >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 1.1.10 Ensure separate partition exists for /var
echo "************************************************************" >> output.txt
echo "1.1.10 Ensure separate partition exists for /var" >> output.txt
echo "************************************************************" >> output.txt
findmnt /var >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 1.1.11 Ensure separate partition exists for /var/tmp
echo "************************************************************" >> output.txt
echo "1.1.11 Ensure separate partition exists for /var/tmp" >> output.txt
echo "************************************************************" >> output.txt
findmnt /var/tmp >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 1.1.12 Ensure /var/tmp partition includes the noexec option
echo "************************************************************" >> output.txt
echo "1.1.12 Ensure /var/tmp partition includes the noexec option" >> output.txt
echo "************************************************************" >> output.txt
findmnt -n /var/tmp | grep -Ev '\bnoexec\b' >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 1.1.13 Ensure /var/tmp partition includes the nodev option
echo "************************************************************" >> output.txt
echo "1.1.13 Ensure /var/tmp partition includes the nodev option" >> output.txt
echo "************************************************************" >> output.txt
findmnt -n /var/tmp | grep -Ev '\bnodev\b' >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 1.1.14 Ensure /var/tmp partition includes the nosuid option
echo "************************************************************" >> output.txt
echo "1.1.14 Ensure /var/tmp partition includes the nosuid option" >> output.txt
echo "************************************************************" >> output.txt
findmnt -n /var/tmp | grep -Ev '\bnosuid\b' >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 1.1.15 Ensure separate partition exists for /var/log
echo "************************************************************" >> output.txt
echo "1.1.15 Ensure separate partition exists for /var/log" >> output.txt
echo "************************************************************" >> output.txt
findmnt /var/log >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 1.1.16 Ensure separate partition exists for /var/log/audit
echo "************************************************************" >> output.txt
echo "1.1.16 Ensure separate partition exists for /var/log/audit" >> output.txt
echo "************************************************************" >> output.txt
findmnt /var/log/audit >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 1.1.17 Ensure separate partition exists for /home
echo "************************************************************" >> output.txt
echo "1.1.17 Ensure separate partition exists for /home" >> output.txt
echo "************************************************************" >> output.txt
findmnt /home >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 1.1.18 Ensure /home partition includes the nodev option
echo "************************************************************" >> output.txt
echo "1.1.18 Ensure /home partition includes the nodev option" >> output.txt
echo "************************************************************" >> output.txt
findmnt /home | grep -Ev '\bnodev\b' >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 1.1.2 Ensure /tmp is configured
echo "************************************************************" >> output.txt
echo "1.1.2 Ensure /tmp is configured" >> output.txt
echo "************************************************************" >> output.txt
findmnt -n /tmp >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 1.1.2 Ensure /tmp is configured - etc/fstab
echo "************************************************************" >> output.txt
echo "1.1.2 Ensure /tmp is configured - etc/fstab" >> output.txt
echo "************************************************************" >> output.txt
grep -E '\s/tmp\s' /etc/fstab | grep -E -v '^\s*#' >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 1.1.2 Ensure /tmp is configured - tmp.mount
echo "************************************************************" >> output.txt
echo "1.1.2 Ensure /tmp is configured - tmp.mount" >> output.txt
echo "************************************************************" >> output.txt
systemctl show "tmp.mount" | grep -i unitfilestate >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 1.1.23 Disable Automounting
echo "************************************************************" >> output.txt
echo "1.1.23 Disable Automounting" >> output.txt
echo "************************************************************" >> output.txt
systemctl show "autofs.service" | grep -i unitfilestate=enabled >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 1.1.24 Disable USB Storage - lsmod
echo "************************************************************" >> output.txt
echo "1.1.24 Disable USB Storage - lsmod" >> output.txt
echo "************************************************************" >> output.txt
lsmod | grep usb-storage >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 1.1.24 Disable USB Storage - modprobe
echo "************************************************************" >> output.txt
echo "1.1.24 Disable USB Storage - modprobe" >> output.txt
echo "************************************************************" >> output.txt
modprobe -n -v usb-storage >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 1.1.3 Ensure noexec option set on /tmp partition
echo "************************************************************" >> output.txt
echo "1.1.3 Ensure noexec option set on /tmp partition" >> output.txt
echo "************************************************************" >> output.txt
findmnt -n /tmp | grep -Ev '\bnodev\b' >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 1.1.4 Ensure nodev option set on /tmp partition
echo "************************************************************" >> output.txt
echo "1.1.4 Ensure nodev option set on /tmp partition" >> output.txt
echo "************************************************************" >> output.txt
findmnt -n /tmp -n | grep -Ev '\bnodev\b' >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 1.1.5 Ensure nosuid option set on /tmp partition
echo "************************************************************" >> output.txt
echo "1.1.5 Ensure nosuid option set on /tmp partition" >> output.txt
echo "************************************************************" >> output.txt
findmnt -n /tmp -n | grep -Ev '\bnosuid\b' >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 1.1.6 Ensure /dev/shm is configured - fstab
echo "************************************************************" >> output.txt
echo "1.1.6 Ensure /dev/shm is configured - fstab" >> output.txt
echo "************************************************************" >> output.txt
grep -E '\s/dev/shm\s' /etc/fstab >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 1.1.6 Ensure /dev/shm is configured - mount
echo "************************************************************" >> output.txt
echo "1.1.6 Ensure /dev/shm is configured - mount" >> output.txt
echo "************************************************************" >> output.txt
findmnt -n /dev/shm >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 1.1.7 Ensure noexec option set on /dev/shm partition
echo "************************************************************" >> output.txt
echo "1.1.7 Ensure noexec option set on /dev/shm partition" >> output.txt
echo "************************************************************" >> output.txt
findmnt -n /dev/shm | grep -Ev '\bnoexec\b' >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 1.1.8 Ensure nodev option set on /dev/shm partition
echo "************************************************************" >> output.txt
echo "1.1.8 Ensure nodev option set on /dev/shm partition" >> output.txt
echo "************************************************************" >> output.txt
findmnt -n /dev/shm | grep -Ev '\bnodev\b' >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 1.1.9 Ensure nosuid option set on /dev/shm partition
echo "************************************************************" >> output.txt
echo "1.1.9 Ensure nosuid option set on /dev/shm partition" >> output.txt
echo "************************************************************" >> output.txt
findmnt -n /dev/shm | grep -Ev '\bnosuid\b' >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 1.2.1 Ensure GPG keys are configured
echo "************************************************************" >> output.txt
echo "1.2.1 Ensure GPG keys are configured" >> output.txt
echo "************************************************************" >> output.txt
rpm -q gpg-pubkey --qf '%{name}-%{version}-%{release} --> %{summary}\n' >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 1.2.2 Ensure package manager repositories are configured
echo "************************************************************" >> output.txt
echo "1.2.2 Ensure package manager repositories are configured" >> output.txt
echo "************************************************************" >> output.txt
yum repolist >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 1.2.3 Ensure gpgcheck is globally activated - 1
echo "************************************************************" >> output.txt
echo "1.2.3 Ensure gpgcheck is globally activated - 1" >> output.txt
echo "************************************************************" >> output.txt
(grep ^\s*gpgcheck /etc/yum.conf ; grep -P '^\h*gpgcheck=[^1\n\r]+\b(\h+.*)?$' /etc/yum.conf /etc/yum.repos.d/*.repo) >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 1.2.4 Ensure Red Hat Subscription Manager connection is configured
echo "************************************************************" >> output.txt
echo "1.2.4 Ensure Red Hat Subscription Manager connection is configured" >> output.txt
echo "************************************************************" >> output.txt
subscription-manager identity >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 1.2.5 Disable the rhnsd Daemon
echo "************************************************************" >> output.txt
echo "1.2.5 Disable the rhnsd Daemon" >> output.txt
echo "************************************************************" >> output.txt
systemctl is-enabled rhnsd >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 1.3.1 Ensure AIDE is installed
echo "************************************************************" >> output.txt
echo "1.3.1 Ensure AIDE is installed" >> output.txt
echo "************************************************************" >> output.txt
rpm -q aide >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 1.3.2 Ensure filesystem integrity is regularly checked - cron
echo "************************************************************" >> output.txt
echo "1.3.2 Ensure filesystem integrity is regularly checked - cron" >> output.txt
echo "************************************************************" >> output.txt
grep -Ers '^([^#]+\s+)?(\/usr\/s?bin\/|^\s*)aide(\.wrapper)?\s(--?\S+\s)*(--(check|update)|\$AIDEARGS)\b' /etc/cron.* /etc/crontab /var/spool/cron/ >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 1.3.2 Ensure filesystem integrity is regularly checked - systemctl is-enabled aidecheck.service
echo "************************************************************" >> output.txt
echo "1.3.2 Ensure filesystem integrity is regularly checked - systemctl is-enabled aidecheck.service" >> output.txt
echo "************************************************************" >> output.txt
systemctl is-enabled aidecheck.service >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 1.3.2 Ensure filesystem integrity is regularly checked - systemctl is-enabled aidecheck.timer
echo "************************************************************" >> output.txt
echo "1.3.2 Ensure filesystem integrity is regularly checked - systemctl is-enabled aidecheck.timer" >> output.txt
echo "************************************************************" >> output.txt
systemctl is-enabled aidecheck.timer >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 1.3.2 Ensure filesystem integrity is regularly checked - systemctl status aidecheck.timer
echo "************************************************************" >> output.txt
echo "1.3.2 Ensure filesystem integrity is regularly checked - systemctl status aidecheck.timer" >> output.txt
echo "************************************************************" >> output.txt
systemctl status aidecheck.timer >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 1.4.3 Ensure authentication required for single user mode - emergency.service
echo "************************************************************" >> output.txt
echo "1.4.3 Ensure authentication required for single user mode - emergency.service" >> output.txt
echo "************************************************************" >> output.txt
grep /sbin/sulogin /usr/lib/systemd/system/emergency.service >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 1.4.3 Ensure authentication required for single user mode - rescue.service
echo "************************************************************" >> output.txt
echo "1.4.3 Ensure authentication required for single user mode - rescue.service" >> output.txt
echo "************************************************************" >> output.txt
grep /sbin/sulogin /usr/lib/systemd/system/rescue.service >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 1.5.1 Ensure core dumps are restricted - limits.conf limits.d
echo "************************************************************" >> output.txt
echo "1.5.1 Ensure core dumps are restricted - limits.conf limits.d" >> output.txt
echo "************************************************************" >> output.txt
grep -E "^\s*\*\s+hard\s+core" /etc/security/limits.conf /etc/security/limits.d/* >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 1.5.1 Ensure core dumps are restricted - sysctl
echo "************************************************************" >> output.txt
echo "1.5.1 Ensure core dumps are restricted - sysctl" >> output.txt
echo "************************************************************" >> output.txt
sysctl fs.suid_dumpable >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 1.5.1 Ensure core dumps are restricted - sysctl.conf sysctl.d
echo "************************************************************" >> output.txt
echo "1.5.1 Ensure core dumps are restricted - sysctl.conf sysctl.d" >> output.txt
echo "************************************************************" >> output.txt
grep "fs\.suid_dumpable" /etc/sysctl.conf /etc/sysctl.d/* >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 1.5.1 Ensure core dumps are restricted - systemd-coredump ProcessSizeMax
echo "************************************************************" >> output.txt
echo "1.5.1 Ensure core dumps are restricted - systemd-coredump ProcessSizeMax" >> output.txt
echo "************************************************************" >> output.txt
grep "fs\.suid_dumpable" /etc/sysctl.conf /etc/sysctl.d/* >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 1.5.1 Ensure core dumps are restricted - systemd-coredump Storage
echo "************************************************************" >> output.txt
echo "1.5.1 Ensure core dumps are restricted - systemd-coredump Storage" >> output.txt
echo "************************************************************" >> output.txt
grep "fs\.suid_dumpable" /etc/sysctl.conf /etc/sysctl.d/* >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 1.5.2 Ensure XD/NX support is enabled
echo "************************************************************" >> output.txt
echo "1.5.2 Ensure XD/NX support is enabled" >> output.txt
echo "************************************************************" >> output.txt
journalctl | grep 'protection: active' >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 1.5.2 Ensure XD/NX support is enabled - systems without journalctl
echo "************************************************************" >> output.txt
echo "1.5.2 Ensure XD/NX support is enabled - systems without journalctl" >> output.txt
echo "************************************************************" >> output.txt
[[ -n $(grep noexec[0-9]*=off /proc/cmdline) || -z $(grep -E -i ' (pae|nx) ' /proc/cpuinfo) || -n $(grep '\sNX\s.*\sprotection:\s' /var/log/dmesg | grep -v active) ]] && echo "NX Protection is not active" >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 1.5.3 Ensure address space layout randomization (ASLR) is enabled - sysctl
echo "************************************************************" >> output.txt
echo "1.5.3 Ensure address space layout randomization (ASLR) is enabled - sysctl" >> output.txt
echo "************************************************************" >> output.txt
sysctl kernel.randomize_va_space >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 1.5.3 Ensure address space layout randomization (ASLR) is enabled - sysctl.conf sysctl.d
echo "************************************************************" >> output.txt
echo "1.5.3 Ensure address space layout randomization (ASLR) is enabled - sysctl.conf sysctl.d" >> output.txt
echo "************************************************************" >> output.txt
grep "kernel\.randomize_va_space" /etc/sysctl.conf /etc/sysctl.d/* >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 1.5.4 Ensure prelink is not installed
echo "************************************************************" >> output.txt
echo "1.5.4 Ensure prelink is not installed" >> output.txt
echo "************************************************************" >> output.txt
rpm -q prelink >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 1.6.1.1 Ensure SELinux is installed
echo "************************************************************" >> output.txt
echo "1.6.1.1 Ensure SELinux is installed" >> output.txt
echo "************************************************************" >> output.txt
rpm -q libselinux >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 1.6.1.3 Ensure SELinux policy is configured - /etc/selinux/config
echo "************************************************************" >> output.txt
echo "1.6.1.3 Ensure SELinux policy is configured - /etc/selinux/config" >> output.txt
echo "************************************************************" >> output.txt
grep SELINUXTYPE= /etc/selinux/config >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 1.6.1.3 Ensure SELinux policy is configured - sestatus
echo "************************************************************" >> output.txt
echo "1.6.1.3 Ensure SELinux policy is configured - sestatus" >> output.txt
echo "************************************************************" >> output.txt
sestatus | grep 'Loaded policy' >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 1.6.1.4 Ensure the SELinux mode is enforcing or permissive - /etc/selinux/config
echo "************************************************************" >> output.txt
echo "1.6.1.4 Ensure the SELinux mode is enforcing or permissive - /etc/selinux/config" >> output.txt
echo "************************************************************" >> output.txt
grep -Ei '^\s*SELINUX=(enforcing|permissive)' /etc/selinux/config >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 1.6.1.4 Ensure the SELinux mode is enforcing or permissive - getenforce
echo "************************************************************" >> output.txt
echo "1.6.1.4 Ensure the SELinux mode is enforcing or permissive - getenforce" >> output.txt
echo "************************************************************" >> output.txt
getenforce >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 1.6.1.5 Ensure the SELinux mode is enforcing - /etc/selinux/config
echo "************************************************************" >> output.txt
echo "1.6.1.5 Ensure the SELinux mode is enforcing - /etc/selinux/config" >> output.txt
echo "************************************************************" >> output.txt
grep -i SELINUX=enforcing /etc/selinux/config >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 1.6.1.5 Ensure the SELinux mode is enforcing - getenforce
echo "************************************************************" >> output.txt
echo "1.6.1.5 Ensure the SELinux mode is enforcing - getenforce" >> output.txt
echo "************************************************************" >> output.txt
getenforce >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 1.6.1.6 Ensure no unconfined services exist
echo "************************************************************" >> output.txt
echo "1.6.1.6 Ensure no unconfined services exist" >> output.txt
echo "************************************************************" >> output.txt
ps -eZ | grep unconfined_service_t >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 1.6.1.7 Ensure SETroubleshoot is not installed
echo "************************************************************" >> output.txt
echo "1.6.1.7 Ensure SETroubleshoot is not installed" >> output.txt
echo "************************************************************" >> output.txt
rpm -q setroubleshoot >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 1.6.1.8 Ensure the MCS Translation Service (mcstrans) is not installed
echo "************************************************************" >> output.txt
echo "1.6.1.8 Ensure the MCS Translation Service (mcstrans) is not installed" >> output.txt
echo "************************************************************" >> output.txt
rpm -q mcstrans >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 1.7.1 Ensure message of the day is configured properly - banner text
echo "************************************************************" >> output.txt
echo "1.7.1 Ensure message of the day is configured properly - banner text" >> output.txt
echo "************************************************************" >> output.txt
# grep -E -i "(\\\v|\\\r|\\\m|\\\s|$(grep '^ID=' /etc/os-release | cut -d= -f2 | sed -e 's/"//g'))" /etc/motd >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 1.7.1 Ensure message of the day is configured properly - mrsv
echo "************************************************************" >> output.txt
echo "1.7.1 Ensure message of the day is configured properly - mrsv" >> output.txt
echo "************************************************************" >> output.txt
cat /etc/motd >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 1.7.2 Ensure local login warning banner is configured properly - banner text
echo "************************************************************" >> output.txt
echo "1.7.2 Ensure local login warning banner is configured properly - banner text" >> output.txt
echo "************************************************************" >> output.txt
grep -E -i "(\\\v|\\\r|\\\m|\\\s|$(grep '^ID=' /etc/os-release | cut -d= -f2 | sed -e 's/"//g'))" /etc/issue >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 1.7.2 Ensure local login warning banner is configured properly - mrsv
echo "************************************************************" >> output.txt
echo "1.7.2 Ensure local login warning banner is configured properly - mrsv" >> output.txt
echo "************************************************************" >> output.txt
cat /etc/issue >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 1.7.3 Ensure remote login warning banner is configured properly - banner text
echo "************************************************************" >> output.txt
echo "1.7.3 Ensure remote login warning banner is configured properly - banner text" >> output.txt
echo "************************************************************" >> output.txt
# grep -E -i "(\\\v|\\\r|\\\m|\\\s|$(grep '^ID=' /etc/os-release | cut -d= -f2 | sed -e 's/"//g'))" /etc/issue.net >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 1.7.3 Ensure remote login warning banner is configured properly - mrsv
echo "************************************************************" >> output.txt
echo "1.7.3 Ensure remote login warning banner is configured properly - mrsv" >> output.txt
echo "************************************************************" >> output.txt
cat /etc/issue.net >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 1.7.4 Ensure permissions on /etc/motd are configured
echo "************************************************************" >> output.txt
echo "1.7.4 Ensure permissions on /etc/motd are configured" >> output.txt
echo "************************************************************" >> output.txt
stat /etc/motd >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 1.7.5 Ensure permissions on /etc/issue are configured
echo "************************************************************" >> output.txt
echo "1.7.5 Ensure permissions on /etc/issue are configured" >> output.txt
echo "************************************************************" >> output.txt
stat /etc/issue >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 1.7.6 Ensure permissions on /etc/issue.net are configured
echo "************************************************************" >> output.txt
echo "1.7.6 Ensure permissions on /etc/issue.net are configured" >> output.txt
echo "************************************************************" >> output.txt
stat /etc/issue.net >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 1.8.1 Ensure GNOME Display Manager is removed
echo "************************************************************" >> output.txt
echo "1.8.1 Ensure GNOME Display Manager is removed" >> output.txt
echo "************************************************************" >> output.txt
rpm -q gdm >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 1.8.4 Ensure XDCMP is not enabled
echo "************************************************************" >> output.txt
echo "1.8.4 Ensure XDCMP is not enabled" >> output.txt
echo "************************************************************" >> output.txt
grep -Eis '^\s*Enable\s*=\s*true' /etc/gdm/custom.conf >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 1.9 Ensure updates, patches, and additional security software are installed
echo "************************************************************" >> output.txt
echo "1.9 Ensure updates, patches, and additional security software are installed" >> output.txt
echo "************************************************************" >> output.txt
yum check-update >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 2.1.1 Ensure xinetd is not installed
echo "************************************************************" >> output.txt
echo "2.1.1 Ensure xinetd is not installed" >> output.txt
echo "************************************************************" >> output.txt
rpm -q xinetd >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 2.2.1.1 Ensure time synchronization is in use - chrony ntp
echo "************************************************************" >> output.txt
echo "2.2.1.1 Ensure time synchronization is in use - chrony ntp" >> output.txt
echo "************************************************************" >> output.txt
rpm -q chrony ntp >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 2.2.1.1 Ensure time synchronization is in use - ntp
echo "************************************************************" >> output.txt
echo "2.2.1.1 Ensure time synchronization is in use - ntp" >> output.txt
echo "************************************************************" >> output.txt
rpm -q ntp >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 2.2.1.2 Ensure chrony is configured - NTP server
echo "************************************************************" >> output.txt
echo "2.2.1.2 Ensure chrony is configured - NTP server" >> output.txt
echo "************************************************************" >> output.txt
grep -E "^(server|pool)" /etc/chrony.conf >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 2.2.1.2 Ensure chrony is configured - OPTIONS
echo "************************************************************" >> output.txt
echo "2.2.1.2 Ensure chrony is configured - OPTIONS" >> output.txt
echo "************************************************************" >> output.txt
grep ^OPTIONS /etc/sysconfig/chronyd >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 2.2.1.3 Ensure ntp is configured - restrict -4 & -6
echo "************************************************************" >> output.txt
echo "2.2.1.3 Ensure ntp is configured - restrict -4 & -6" >> output.txt
echo "************************************************************" >> output.txt
grep "^restrict" /etc/ntp.conf >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 2.2.1.3 Ensure ntp is configured - server
echo "************************************************************" >> output.txt
echo "2.2.1.3 Ensure ntp is configured - server" >> output.txt
echo "************************************************************" >> output.txt
grep -E "^(server|pool)" /etc/ntp.conf >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 2.2.1.3 Ensure ntp is configured - -u ntp:ntp
echo "************************************************************" >> output.txt
echo "2.2.1.3 Ensure ntp is configured - -u ntp:ntp" >> output.txt
echo "************************************************************" >> output.txt
(grep "^OPTIONS" /etc/sysconfig/ntpd ; grep "^ExecStart" /usr/lib/systemd/system/ntpd.service) >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 2.2.10 Ensure IMAP and POP3 server is not installed
echo "************************************************************" >> output.txt
echo "2.2.10 Ensure IMAP and POP3 server is not installed" >> output.txt
echo "************************************************************" >> output.txt
rpm -q dovecot >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 2.2.11 Ensure Samba is not installed
echo "************************************************************" >> output.txt
echo "2.2.11 Ensure Samba is not installed" >> output.txt
echo "************************************************************" >> output.txt
rpm -q samba >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 2.2.12 Ensure HTTP Proxy Server is not installed
echo "************************************************************" >> output.txt
echo "2.2.12 Ensure HTTP Proxy Server is not installed" >> output.txt
echo "************************************************************" >> output.txt
rpm -q squid >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 2.2.13 Ensure net-snmp is not installed
echo "************************************************************" >> output.txt
echo "2.2.13 Ensure net-snmp is not installed" >> output.txt
echo "************************************************************" >> output.txt
rpm -q net-snmp >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 2.2.14 Ensure NIS server is not installed
echo "************************************************************" >> output.txt
echo "2.2.14 Ensure NIS server is not installed" >> output.txt
echo "************************************************************" >> output.txt
rpm -q ypserv >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 2.2.15 Ensure telnet-server is not installed
echo "************************************************************" >> output.txt
echo "2.2.15 Ensure telnet-server is not installed" >> output.txt
echo "************************************************************" >> output.txt
rpm -q telnet-server >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 2.2.16 Ensure mail transfer agent is configured for local-only mode
echo "************************************************************" >> output.txt
echo "2.2.16 Ensure mail transfer agent is configured for local-only mode" >> output.txt
echo "************************************************************" >> output.txt
ss -lntu | grep -E ':25\s' | grep -E -v '\s(127.0.0.1|\[?::1\]?):25\s' >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 2.2.17 Ensure nfs-utils is not installed or the nfs-server service is masked
echo "************************************************************" >> output.txt
echo "2.2.17 Ensure nfs-utils is not installed or the nfs-server service is masked" >> output.txt
echo "************************************************************" >> output.txt
rpm -q nfs-utils >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 2.2.18 Ensure rpcbind is not installed or the rpcbind services are masked - rpcbind
echo "************************************************************" >> output.txt
echo "2.2.18 Ensure rpcbind is not installed or the rpcbind services are masked - rpcbind" >> output.txt
echo "************************************************************" >> output.txt
rpm -q rpcbind >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 2.2.18 Ensure rpcbind is not installed or the rpcbind services are masked - rpcbind
echo "************************************************************" >> output.txt
echo "2.2.18 Ensure rpcbind is not installed or the rpcbind services are masked - rpcbind" >> output.txt
echo "************************************************************" >> output.txt
systemctl is-enabled rpcbind >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 2.2.18 Ensure rpcbind is not installed or the rpcbind services are masked - rpcbind.socket
echo "************************************************************" >> output.txt
echo "2.2.18 Ensure rpcbind is not installed or the rpcbind services are masked - rpcbind.socket" >> output.txt
echo "************************************************************" >> output.txt
systemctl is-enabled rpcbind.socket >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 2.2.19 Ensure rsync is not installed or the rsyncd service is masked
echo "************************************************************" >> output.txt
echo "2.2.19 Ensure rsync is not installed or the rsyncd service is masked" >> output.txt
echo "************************************************************" >> output.txt
rpm -q rsync >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 2.2.19 Ensure rsync is not installed or the rsyncd service is masked
echo "************************************************************" >> output.txt
echo "2.2.19 Ensure rsync is not installed or the rsyncd service is masked" >> output.txt
echo "************************************************************" >> output.txt
systemctl is-enabled rsyncd >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 2.2.2 Ensure X11 Server components are not installed
echo "************************************************************" >> output.txt
echo "2.2.2 Ensure X11 Server components are not installed" >> output.txt
echo "************************************************************" >> output.txt
rpm -qa xorg-x11-server* >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 2.2.3 Ensure Avahi Server is not installed - avahi & avani-autoipd
echo "************************************************************" >> output.txt
echo "2.2.3 Ensure Avahi Server is not installed - avahi & avani-autoipd" >> output.txt
echo "************************************************************" >> output.txt
rpm -q avahi-autoipd avahi >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 2.2.4 Ensure CUPS is not installed
echo "************************************************************" >> output.txt
echo "2.2.4 Ensure CUPS is not installed" >> output.txt
echo "************************************************************" >> output.txt
rpm -q cups >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 2.2.5 Ensure DHCP Server is not installed
echo "************************************************************" >> output.txt
echo "2.2.5 Ensure DHCP Server is not installed" >> output.txt
echo "************************************************************" >> output.txt
rpm -q dhcp >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 2.2.6 Ensure LDAP server is not installed
echo "************************************************************" >> output.txt
echo "2.2.6 Ensure LDAP server is not installed" >> output.txt
echo "************************************************************" >> output.txt
rpm -q openldap-servers >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 2.2.7 Ensure DNS Server is not installed
echo "************************************************************" >> output.txt
echo "2.2.7 Ensure DNS Server is not installed" >> output.txt
echo "************************************************************" >> output.txt
rpm -q bind >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 2.2.8 Ensure FTP Server is not installed
echo "************************************************************" >> output.txt
echo "2.2.8 Ensure FTP Server is not installed" >> output.txt
echo "************************************************************" >> output.txt
rpm -q vsftpd >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 2.2.9 Ensure HTTP server is not installed
echo "************************************************************" >> output.txt
echo "2.2.9 Ensure HTTP server is not installed" >> output.txt
echo "************************************************************" >> output.txt
rpm -q httpd >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 2.3.1 Ensure NIS Client is not installed
echo "************************************************************" >> output.txt
echo "2.3.1 Ensure NIS Client is not installed" >> output.txt
echo "************************************************************" >> output.txt
rpm -q ypbind >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 2.3.2 Ensure rsh client is not installed
echo "************************************************************" >> output.txt
echo "2.3.2 Ensure rsh client is not installed" >> output.txt
echo "************************************************************" >> output.txt
rpm -q rsh >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 2.3.3 Ensure talk client is not installed
echo "************************************************************" >> output.txt
echo "2.3.3 Ensure talk client is not installed" >> output.txt
echo "************************************************************" >> output.txt
rpm -q talk >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 2.3.4 Ensure telnet client is not installed
echo "************************************************************" >> output.txt
echo "2.3.4 Ensure telnet client is not installed" >> output.txt
echo "************************************************************" >> output.txt
rpm -q telnet >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 2.3.5 Ensure LDAP client is not installed
echo "************************************************************" >> output.txt
echo "2.3.5 Ensure LDAP client is not installed" >> output.txt
echo "************************************************************" >> output.txt
rpm -q openldap-clients >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 2.4 Ensure nonessential services are removed or masked
echo "************************************************************" >> output.txt
echo "2.4 Ensure nonessential services are removed or masked" >> output.txt
echo "************************************************************" >> output.txt
lsof -i -P -n | grep -v "(ESTABLISHED)" >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 3.1.1 Disable IPv6
echo "************************************************************" >> output.txt
echo "3.1.1 Disable IPv6" >> output.txt
echo "************************************************************" >> output.txt
grep "^\s*linux" /boot/grub2/grub.cfg | grep -v ipv6.disable=1 >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 3.1.1 Disable IPv6 through sysctl 
echo "************************************************************" >> output.txt
echo "3.1.1 Disable IPv6 through sysctl " >> output.txt
echo "************************************************************" >> output.txt
sysctl net.ipv6.conf.all.disable_ipv6 >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 3.1.1 Disable IPv6 through sysctl 
echo "************************************************************" >> output.txt
echo "3.1.1 Disable IPv6 through sysctl " >> output.txt
echo "************************************************************" >> output.txt
sysctl net.ipv6.conf.default.disable_ipv6 >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 3.1.1 Disable IPv6 through sysctl 
echo "************************************************************" >> output.txt
echo "3.1.1 Disable IPv6 through sysctl " >> output.txt
echo "************************************************************" >> output.txt
grep -E '^\s*net\.ipv6\.conf\.(all|default)\.disable_ipv6\s*=\s*1\b(\s+#.*)?$' /etc/sysctl.conf /etc/sysctl.d/*.conf | cut -d: -f2 >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 3.2.1 Ensure IP forwarding is disabled - ipv4 sysctl
echo "************************************************************" >> output.txt
echo "3.2.1 Ensure IP forwarding is disabled - ipv4 sysctl" >> output.txt
echo "************************************************************" >> output.txt
sysctl net.ipv4.ip_forward >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 3.2.1 Ensure IP forwarding is disabled - ipv4 sysctl.conf sysctl.d
echo "************************************************************" >> output.txt
echo "3.2.1 Ensure IP forwarding is disabled - ipv4 sysctl.conf sysctl.d" >> output.txt
echo "************************************************************" >> output.txt
grep -E -s "^\s*net\.ipv4\.ip_forward\s*=\s*1" /etc/sysctl.conf /etc/sysctl.d/*.conf /usr/lib/sysctl.d/*.conf /run/sysctl.d/*.conf >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 3.2.1 Ensure IP forwarding is disabled - ipv6 sysctl
echo "************************************************************" >> output.txt
echo "3.2.1 Ensure IP forwarding is disabled - ipv6 sysctl" >> output.txt
echo "************************************************************" >> output.txt
sysctl net.ipv6.conf.all.forwarding >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 3.2.1 Ensure IP forwarding is disabled - ipv6 sysctl.conf sysctl.d
echo "************************************************************" >> output.txt
echo "3.2.1 Ensure IP forwarding is disabled - ipv6 sysctl.conf sysctl.d" >> output.txt
echo "************************************************************" >> output.txt
grep -E -s "^\s*net\.ipv6\.conf\.all\.forwarding\s*=\s*1" /etc/sysctl.conf /etc/sysctl.d/*.conf /usr/lib/sysctl.d/*.conf /run/sysctl.d/*.conf >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 3.2.2 Ensure packet redirect sending is disabled - files 'net.ipv4.conf.all.send_redirects = 0'
echo "************************************************************" >> output.txt
echo "3.2.2 Ensure packet redirect sending is disabled - files 'net.ipv4.conf.all.send_redirects = 0'" >> output.txt
echo "************************************************************" >> output.txt
sysctl net.ipv4.conf.all.send_redirects >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 3.2.2 Ensure packet redirect sending is disabled - files 'net.ipv4.conf.default.send_redirects = 0'
echo "************************************************************" >> output.txt
echo "3.2.2 Ensure packet redirect sending is disabled - files 'net.ipv4.conf.default.send_redirects = 0'" >> output.txt
echo "************************************************************" >> output.txt
sysctl net.ipv4.conf.default.send_redirects >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 3.2.2 Ensure packet redirect sending is disabled - 'net.ipv4.conf.all.send_redirects = 0'
echo "************************************************************" >> output.txt
echo "3.2.2 Ensure packet redirect sending is disabled - 'net.ipv4.conf.all.send_redirects = 0'" >> output.txt
echo "************************************************************" >> output.txt
grep "net\.ipv4\.conf\.all\.send_redirects" /etc/sysctl.conf /etc/sysctl.d/*.conf /usr/lib/sysctl.d/*.conf /run/sysctl.d/*.conf >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 3.2.2 Ensure packet redirect sending is disabled - 'net.ipv4.conf.default.send_redirects = 0'
echo "************************************************************" >> output.txt
echo "3.2.2 Ensure packet redirect sending is disabled - 'net.ipv4.conf.default.send_redirects = 0'" >> output.txt
echo "************************************************************" >> output.txt
grep "net\.ipv4\.conf\.default\.send_redirects" /etc/sysctl.conf /etc/sysctl.d/*.conf /usr/lib/sysctl.d/*.conf /run/sysctl.d/*.conf >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 3.3.1 Ensure source routed packets are not accepted - files 'net.ipv4.conf.all.accept_source_route = 0'
echo "************************************************************" >> output.txt
echo "3.3.1 Ensure source routed packets are not accepted - files 'net.ipv4.conf.all.accept_source_route = 0'" >> output.txt
echo "************************************************************" >> output.txt
sysctl net.ipv4.conf.all.accept_source_route >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 3.3.1 Ensure source routed packets are not accepted - files 'net.ipv4.conf.default.accept_source_route = 0'
echo "************************************************************" >> output.txt
echo "3.3.1 Ensure source routed packets are not accepted - files 'net.ipv4.conf.default.accept_source_route = 0'" >> output.txt
echo "************************************************************" >> output.txt
sysctl net.ipv4.conf.default.accept_source_route >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 3.3.1 Ensure source routed packets are not accepted - files 'net.ipv6.conf.all.accept_source_route = 0'
echo "************************************************************" >> output.txt
echo "3.3.1 Ensure source routed packets are not accepted - files 'net.ipv6.conf.all.accept_source_route = 0'" >> output.txt
echo "************************************************************" >> output.txt
sysctl net.ipv6.conf.all.accept_source_route >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 3.3.1 Ensure source routed packets are not accepted - files 'net.ipv6.conf.default.accept_source_route = 0'
echo "************************************************************" >> output.txt
echo "3.3.1 Ensure source routed packets are not accepted - files 'net.ipv6.conf.default.accept_source_route = 0'" >> output.txt
echo "************************************************************" >> output.txt
sysctl net.ipv6.conf.default.accept_source_route >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 3.3.1 Ensure source routed packets are not accepted - 'net.ipv4.conf.all.accept_source_route = 0'
echo "************************************************************" >> output.txt
echo "3.3.1 Ensure source routed packets are not accepted - 'net.ipv4.conf.all.accept_source_route = 0'" >> output.txt
echo "************************************************************" >> output.txt
grep "net\.ipv4\.conf\.all\.accept_source_route" /etc/sysctl.conf /etc/sysctl.d/*.conf /usr/lib/sysctl.d/*.conf /run/sysctl.d/*.conf >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 3.3.1 Ensure source routed packets are not accepted - 'net.ipv4.conf.default.accept_source_route = 0'
echo "************************************************************" >> output.txt
echo "3.3.1 Ensure source routed packets are not accepted - 'net.ipv4.conf.default.accept_source_route = 0'" >> output.txt
echo "************************************************************" >> output.txt
grep "net\.ipv4\.conf\.default\.accept_source_route" /etc/sysctl.conf /etc/sysctl.d/*.conf /usr/lib/sysctl.d/*.conf /run/sysctl.d/*.conf >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 3.3.1 Ensure source routed packets are not accepted - 'net.ipv6.conf.all.accept_source_route = 0'
echo "************************************************************" >> output.txt
echo "3.3.1 Ensure source routed packets are not accepted - 'net.ipv6.conf.all.accept_source_route = 0'" >> output.txt
echo "************************************************************" >> output.txt
grep "net\.ipv6\.conf\.all\.accept_source_route" /etc/sysctl.conf /etc/sysctl.d/*.conf /usr/lib/sysctl.d/*.conf /run/sysctl.d/*.conf >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 3.3.1 Ensure source routed packets are not accepted - 'net.ipv6.conf.default.accept_source_route = 0'
echo "************************************************************" >> output.txt
echo "3.3.1 Ensure source routed packets are not accepted - 'net.ipv6.conf.default.accept_source_route = 0'" >> output.txt
echo "************************************************************" >> output.txt
grep "net\.ipv6\.conf\.default\.accept_source_route" /etc/sysctl.conf /etc/sysctl.d/*.conf /usr/lib/sysctl.d/*.conf /run/sysctl.d/*.conf >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 3.3.2 Ensure ICMP redirects are not accepted - files 'net.ipv4.conf.all.accept_redirects = 0'
echo "************************************************************" >> output.txt
echo "3.3.2 Ensure ICMP redirects are not accepted - files 'net.ipv4.conf.all.accept_redirects = 0'" >> output.txt
echo "************************************************************" >> output.txt
sysctl net.ipv4.conf.all.accept_redirects >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 3.3.2 Ensure ICMP redirects are not accepted - files 'net.ipv4.conf.default.accept_redirects = 0'
echo "************************************************************" >> output.txt
echo "3.3.2 Ensure ICMP redirects are not accepted - files 'net.ipv4.conf.default.accept_redirects = 0'" >> output.txt
echo "************************************************************" >> output.txt
sysctl net.ipv4.conf.default.accept_redirects >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 3.3.2 Ensure ICMP redirects are not accepted - files 'net.ipv6.conf.all.accept_redirects = 0'
echo "************************************************************" >> output.txt
echo "3.3.2 Ensure ICMP redirects are not accepted - files 'net.ipv6.conf.all.accept_redirects = 0'" >> output.txt
echo "************************************************************" >> output.txt
sysctl net.ipv6.conf.all.accept_redirects >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 3.3.2 Ensure ICMP redirects are not accepted - files 'net.ipv6.conf.default.accept_redirects = 0'
echo "************************************************************" >> output.txt
echo "3.3.2 Ensure ICMP redirects are not accepted - files 'net.ipv6.conf.default.accept_redirects = 0'" >> output.txt
echo "************************************************************" >> output.txt
sysctl net.ipv6.conf.default.accept_redirects >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 3.3.2 Ensure ICMP redirects are not accepted - 'net.ipv4.conf.all.accept_redirects = 0'
echo "************************************************************" >> output.txt
echo "3.3.2 Ensure ICMP redirects are not accepted - 'net.ipv4.conf.all.accept_redirects = 0'" >> output.txt
echo "************************************************************" >> output.txt
grep "net\.ipv4\.conf\.all\.accept_redirects" /etc/sysctl.conf /etc/sysctl.d/*.conf /usr/lib/sysctl.d/*.conf /run/sysctl.d/*.conf >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 3.3.2 Ensure ICMP redirects are not accepted - 'net.ipv4.conf.default.accept_redirects = 0'
echo "************************************************************" >> output.txt
echo "3.3.2 Ensure ICMP redirects are not accepted - 'net.ipv4.conf.default.accept_redirects = 0'" >> output.txt
echo "************************************************************" >> output.txt
grep "net\.ipv4\.conf\.default\.accept_redirects" /etc/sysctl.conf /etc/sysctl.d/*.conf /usr/lib/sysctl.d/*.conf /run/sysctl.d/*.conf >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 3.3.2 Ensure ICMP redirects are not accepted - 'net.ipv6.conf.all.accept_redirects = 0'
echo "************************************************************" >> output.txt
echo "3.3.2 Ensure ICMP redirects are not accepted - 'net.ipv6.conf.all.accept_redirects = 0'" >> output.txt
echo "************************************************************" >> output.txt
grep "net\.ipv6\.conf\.all\.accept_redirects" /etc/sysctl.conf /etc/sysctl.d/*.conf /usr/lib/sysctl.d/*.conf /run/sysctl.d/*.conf >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 3.3.2 Ensure ICMP redirects are not accepted - 'net.ipv6.conf.default.accept_redirects = 0'
echo "************************************************************" >> output.txt
echo "3.3.2 Ensure ICMP redirects are not accepted - 'net.ipv6.conf.default.accept_redirects = 0'" >> output.txt
echo "************************************************************" >> output.txt
grep "net\.ipv6\.conf\.default\.accept_redirects" /etc/sysctl.conf /etc/sysctl.d/*.conf /usr/lib/sysctl.d/*.conf /run/sysctl.d/*.conf >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 3.3.3 Ensure secure ICMP redirects are not accepted - files 'net.ipv4.conf.all.secure_redirects = 0'
echo "************************************************************" >> output.txt
echo "3.3.3 Ensure secure ICMP redirects are not accepted - files 'net.ipv4.conf.all.secure_redirects = 0'" >> output.txt
echo "************************************************************" >> output.txt
sysctl net.ipv4.conf.all.secure_redirects >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 3.3.3 Ensure secure ICMP redirects are not accepted - files 'net.ipv4.conf.default.secure_redirects = 0'
echo "************************************************************" >> output.txt
echo "3.3.3 Ensure secure ICMP redirects are not accepted - files 'net.ipv4.conf.default.secure_redirects = 0'" >> output.txt
echo "************************************************************" >> output.txt
sysctl net.ipv4.conf.default.secure_redirects >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 3.3.3 Ensure secure ICMP redirects are not accepted - 'net.ipv4.conf.all.secure_redirects = 0'
echo "************************************************************" >> output.txt
echo "3.3.3 Ensure secure ICMP redirects are not accepted - 'net.ipv4.conf.all.secure_redirects = 0'" >> output.txt
echo "************************************************************" >> output.txt
grep "net\.ipv4\.conf\.all\.secure_redirects" /etc/sysctl.conf /etc/sysctl.d/*.conf /usr/lib/sysctl.d/*.conf /run/sysctl.d/*.conf >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 3.3.3 Ensure secure ICMP redirects are not accepted - 'net.ipv4.conf.default.secure_redirects = 0'
echo "************************************************************" >> output.txt
echo "3.3.3 Ensure secure ICMP redirects are not accepted - 'net.ipv4.conf.default.secure_redirects = 0'" >> output.txt
echo "************************************************************" >> output.txt
grep "net\.ipv4\.conf\.default\.secure_redirects" /etc/sysctl.conf /etc/sysctl.d/*.conf /usr/lib/sysctl.d/*.conf /run/sysctl.d/*.conf >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 3.3.4 Ensure suspicious packets are logged - files 'net.ipv4.conf.all.log_martians = 1'
echo "************************************************************" >> output.txt
echo "3.3.4 Ensure suspicious packets are logged - files 'net.ipv4.conf.all.log_martians = 1'" >> output.txt
echo "************************************************************" >> output.txt
sysctl net.ipv4.conf.all.log_martians >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 3.3.4 Ensure suspicious packets are logged - files 'net.ipv4.conf.default.log_martians = 1'
echo "************************************************************" >> output.txt
echo "3.3.4 Ensure suspicious packets are logged - files 'net.ipv4.conf.default.log_martians = 1'" >> output.txt
echo "************************************************************" >> output.txt
sysctl net.ipv4.conf.default.log_martians >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 3.3.4 Ensure suspicious packets are logged - 'net.ipv4.conf.all.log_martians = 1'
echo "************************************************************" >> output.txt
echo "3.3.4 Ensure suspicious packets are logged - 'net.ipv4.conf.all.log_martians = 1'" >> output.txt
echo "************************************************************" >> output.txt
grep "net\.ipv4\.conf\.all\.log_martians" /etc/sysctl.conf /etc/sysctl.d/*.conf /usr/lib/sysctl.d/*.conf /run/sysctl.d/*.conf >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 3.3.4 Ensure suspicious packets are logged - 'net.ipv4.conf.default.log_martians = 1'
echo "************************************************************" >> output.txt
echo "3.3.4 Ensure suspicious packets are logged - 'net.ipv4.conf.default.log_martians = 1'" >> output.txt
echo "************************************************************" >> output.txt
grep "net\.ipv4\.conf\.default\.log_martians" /etc/sysctl.conf /etc/sysctl.d/*.conf /usr/lib/sysctl.d/*.conf /run/sysctl.d/*.conf >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 3.3.5 Ensure broadcast ICMP requests are ignored - sysctl
echo "************************************************************" >> output.txt
echo "3.3.5 Ensure broadcast ICMP requests are ignored - sysctl" >> output.txt
echo "************************************************************" >> output.txt
sysctl net.ipv4.icmp_echo_ignore_broadcasts >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 3.3.5 Ensure broadcast ICMP requests are ignored - sysctl.conf sysctl.d
echo "************************************************************" >> output.txt
echo "3.3.5 Ensure broadcast ICMP requests are ignored - sysctl.conf sysctl.d" >> output.txt
echo "************************************************************" >> output.txt
grep "net\.ipv4\.icmp_echo_ignore_broadcasts" /etc/sysctl.conf /etc/sysctl.d/*.conf /usr/lib/sysctl.d/*.conf /run/sysctl.d/*.conf >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 3.3.6 Ensure bogus ICMP responses are ignored - sysctl
echo "************************************************************" >> output.txt
echo "3.3.6 Ensure bogus ICMP responses are ignored - sysctl" >> output.txt
echo "************************************************************" >> output.txt
sysctl net.ipv4.icmp_ignore_bogus_error_responses >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 3.3.6 Ensure bogus ICMP responses are ignored - sysctl.conf sysctl.d
echo "************************************************************" >> output.txt
echo "3.3.6 Ensure bogus ICMP responses are ignored - sysctl.conf sysctl.d" >> output.txt
echo "************************************************************" >> output.txt
grep "net.ipv4.icmp_ignore_bogus_error_responses" /etc/sysctl.conf /etc/sysctl.d/*.conf /usr/lib/sysctl.d/*.conf /run/sysctl.d/*.conf >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 3.3.7 Ensure Reverse Path Filtering is enabled - files 'net.ipv4.conf.all.rp_filter = 1'
echo "************************************************************" >> output.txt
echo "3.3.7 Ensure Reverse Path Filtering is enabled - files 'net.ipv4.conf.all.rp_filter = 1'" >> output.txt
echo "************************************************************" >> output.txt
sysctl net.ipv4.conf.all.rp_filter >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 3.3.7 Ensure Reverse Path Filtering is enabled - files 'net.ipv4.conf.default.rp_filter = 1'
echo "************************************************************" >> output.txt
echo "3.3.7 Ensure Reverse Path Filtering is enabled - files 'net.ipv4.conf.default.rp_filter = 1'" >> output.txt
echo "************************************************************" >> output.txt
sysctl net.ipv4.conf.default.rp_filter >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 3.3.7 Ensure Reverse Path Filtering is enabled - 'net.ipv4.conf.all.rp_filter = 1'
echo "************************************************************" >> output.txt
echo "3.3.7 Ensure Reverse Path Filtering is enabled - 'net.ipv4.conf.all.rp_filter = 1'" >> output.txt
echo "************************************************************" >> output.txt
grep "net\.ipv4\.conf\.all\.rp_filter" /etc/sysctl.conf /etc/sysctl.d/*.conf /usr/lib/sysctl.d/*.conf /run/sysctl.d/*.conf >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 3.3.7 Ensure Reverse Path Filtering is enabled - 'net.ipv4.conf.default.rp_filter = 1'
echo "************************************************************" >> output.txt
echo "3.3.7 Ensure Reverse Path Filtering is enabled - 'net.ipv4.conf.default.rp_filter = 1'" >> output.txt
echo "************************************************************" >> output.txt
grep "net\.ipv4\.conf\.default\.rp_filter" /etc/sysctl.conf /etc/sysctl.d/*.conf /usr/lib/sysctl.d/*.conf /run/sysctl.d/*.conf >> output.txt  2>&1
echo $'\n \n' >> output.txt

# 3.3.8 Ensure TCP SYN Cookies is enabled - sysctl
echo "************************************************************" >> output.txt
echo "3.3.8 Ensure TCP SYN Cookies is enabled - sysctl" >> output.txt
echo "************************************************************" >> output.txt
sysctl net.ipv4.tcp_syncookies >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 3.3.8 Ensure TCP SYN Cookies is enabled - sysctl.conf sysctl.d
echo "************************************************************" >> output.txt
echo "3.3.8 Ensure TCP SYN Cookies is enabled - sysctl.conf sysctl.d" >> output.txt
echo "************************************************************" >> output.txt
grep "net\.ipv4\.tcp_syncookies" /etc/sysctl.conf /etc/sysctl.d/*.conf /usr/lib/sysctl.d/*.conf /run/sysctl.d/*.conf >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 3.3.9 Ensure IPv6 router advertisements are not accepted - files 'net.ipv6.conf.all.accept_ra = 0'
echo "************************************************************" >> output.txt
echo "3.3.9 Ensure IPv6 router advertisements are not accepted - files 'net.ipv6.conf.all.accept_ra = 0'" >> output.txt
echo "************************************************************" >> output.txt
sysctl net.ipv6.conf.all.accept_ra >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 3.3.9 Ensure IPv6 router advertisements are not accepted - files 'net.ipv6.conf.default.accept_ra = 0'
echo "************************************************************" >> output.txt
echo "3.3.9 Ensure IPv6 router advertisements are not accepted - files 'net.ipv6.conf.default.accept_ra = 0'" >> output.txt
echo "************************************************************" >> output.txt
sysctl net.ipv6.conf.default.accept_ra >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 3.3.9 Ensure IPv6 router advertisements are not accepted - 'net.ipv6.conf.all.accept_ra = 0'
echo "************************************************************" >> output.txt
echo "3.3.9 Ensure IPv6 router advertisements are not accepted - 'net.ipv6.conf.all.accept_ra = 0'" >> output.txt
echo "************************************************************" >> output.txt
grep "net\.ipv6\.conf\.all\.accept_ra" /etc/sysctl.conf /etc/sysctl.d/*.conf /usr/lib/sysctl.d/*.conf /run/sysctl.d/*.conf >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 3.3.9 Ensure IPv6 router advertisements are not accepted - 'net.ipv6.conf.default.accept_ra = 0'
echo "************************************************************" >> output.txt
echo "3.3.9 Ensure IPv6 router advertisements are not accepted - 'net.ipv6.conf.default.accept_ra = 0'" >> output.txt
echo "************************************************************" >> output.txt
grep "net\.ipv6\.conf\.default\.accept_ra" /etc/sysctl.conf /etc/sysctl.d/*.conf /usr/lib/sysctl.d/*.conf /run/sysctl.d/*.conf >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 3.4.1 Ensure DCCP is disabled - lsmod
echo "************************************************************" >> output.txt
echo "3.4.1 Ensure DCCP is disabled - lsmod" >> output.txt
echo "************************************************************" >> output.txt
lsmod | grep dccp >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 3.4.1 Ensure DCCP is disabled - modprobe
echo "************************************************************" >> output.txt
echo "3.4.1 Ensure DCCP is disabled - modprobe" >> output.txt
echo "************************************************************" >> output.txt
modprobe -n -v dccp >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 3.4.2 Ensure SCTP is disabled - lsmod
echo "************************************************************" >> output.txt
echo "3.4.2 Ensure SCTP is disabled - lsmod" >> output.txt
echo "************************************************************" >> output.txt
lsmod | grep sctp >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 3.4.2 Ensure SCTP is disabled - modprobe
echo "************************************************************" >> output.txt
echo "3.4.2 Ensure SCTP is disabled - modprobe" >> output.txt
echo "************************************************************" >> output.txt
modprobe -n -v sctp >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 3.5.1.1 Ensure firewalld is installed - iptables & iptables
echo "************************************************************" >> output.txt
echo "3.5.1.1 Ensure firewalld is installed - iptables & iptables" >> output.txt
echo "************************************************************" >> output.txt
rpm -q firewalld iptables >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 3.5.1.2 Ensure iptables-services not installed with firewalld
echo "************************************************************" >> output.txt
echo "3.5.1.2 Ensure iptables-services not installed with firewalld" >> output.txt
echo "************************************************************" >> output.txt
rpm -q iptables-services >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 3.5.1.3 Ensure nftables either not installed or masked with firewalld - masked
echo "************************************************************" >> output.txt
echo "3.5.1.3 Ensure nftables either not installed or masked with firewalld - masked" >> output.txt
echo "************************************************************" >> output.txt
systemctl is-enabled nftables >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 3.5.1.3 Ensure nftables either not installed or masked with firewalld - not installed
echo "************************************************************" >> output.txt
echo "3.5.1.3 Ensure nftables either not installed or masked with firewalld - not installed" >> output.txt
echo "************************************************************" >> output.txt
rpm -q nftables >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 3.5.1.3 Ensure nftables either not installed or masked with firewalld - stopped
echo "************************************************************" >> output.txt
echo "3.5.1.3 Ensure nftables either not installed or masked with firewalld - stopped" >> output.txt
echo "************************************************************" >> output.txt
systemctl status nftables | grep "Active: " | grep -E " active \((running|exited)\) " >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 3.5.1.4 Ensure firewalld service enabled and running - enabled
echo "************************************************************" >> output.txt
echo "3.5.1.4 Ensure firewalld service enabled and running - enabled" >> output.txt
echo "************************************************************" >> output.txt
systemctl is-enabled firewalld >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 3.5.1.4 Ensure firewalld service enabled and running - running
echo "************************************************************" >> output.txt
echo "3.5.1.4 Ensure firewalld service enabled and running - running" >> output.txt
echo "************************************************************" >> output.txt
firewall-cmd --state >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 3.5.1.5 Ensure firewalld default zone is set
echo "************************************************************" >> output.txt
echo "3.5.1.5 Ensure firewalld default zone is set" >> output.txt
echo "************************************************************" >> output.txt
firewall-cmd --get-default-zone >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 3.5.2.1 Ensure nftables is installed
echo "************************************************************" >> output.txt
echo "3.5.2.1 Ensure nftables is installed" >> output.txt
echo "************************************************************" >> output.txt
rpm -q nftables >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 3.5.2.10 Ensure nftables service is enabled
echo "************************************************************" >> output.txt
echo "3.5.2.10 Ensure nftables service is enabled" >> output.txt
echo "************************************************************" >> output.txt
systemctl is-enabled nftables >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 3.5.2.2 Ensure firewalld is either not installed or masked with nftables - masked
echo "************************************************************" >> output.txt
echo "3.5.2.2 Ensure firewalld is either not installed or masked with nftables - masked" >> output.txt
echo "************************************************************" >> output.txt
systemctl is-enabled firewalld >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 3.5.2.2 Ensure firewalld is either not installed or masked with nftables - not installed
echo "************************************************************" >> output.txt
echo "3.5.2.2 Ensure firewalld is either not installed or masked with nftables - not installed" >> output.txt
echo "************************************************************" >> output.txt
rpm -q firewalld >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 3.5.2.2 Ensure firewalld is either not installed or masked with nftables - stopped
echo "************************************************************" >> output.txt
echo "3.5.2.2 Ensure firewalld is either not installed or masked with nftables - stopped" >> output.txt
echo "************************************************************" >> output.txt
command -v firewall-cmd >/dev/null && firewall-cmd --state | grep 'running' >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 3.5.2.3 Ensure iptables-services not installed with nftables
echo "************************************************************" >> output.txt
echo "3.5.2.3 Ensure iptables-services not installed with nftables" >> output.txt
echo "************************************************************" >> output.txt
rpm -q iptables-services >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 3.5.2.4 Ensure iptables are flushed with nftables - ip6tables
echo "************************************************************" >> output.txt
echo "3.5.2.4 Ensure iptables are flushed with nftables - ip6tables" >> output.txt
echo "************************************************************" >> output.txt
ip6tables -L >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 3.5.2.4 Ensure iptables are flushed with nftables - iptables
echo "************************************************************" >> output.txt
echo "3.5.2.4 Ensure iptables are flushed with nftables - iptables" >> output.txt
echo "************************************************************" >> output.txt
iptables -L >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 3.5.2.5 Ensure an nftables table exists
echo "************************************************************" >> output.txt
echo "3.5.2.5 Ensure an nftables table exists" >> output.txt
echo "************************************************************" >> output.txt
nft list tables >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 3.5.2.6 Ensure nftables base chains exist - hook forward
echo "************************************************************" >> output.txt
echo "3.5.2.6 Ensure nftables base chains exist - hook forward" >> output.txt
echo "************************************************************" >> output.txt
nft list ruleset | grep 'hook forward' >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 3.5.2.6 Ensure nftables base chains exist - hook input
echo "************************************************************" >> output.txt
echo "3.5.2.6 Ensure nftables base chains exist - hook input" >> output.txt
echo "************************************************************" >> output.txt
nft list ruleset | grep 'hook input' >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 3.5.2.6 Ensure nftables base chains exist - hook output
echo "************************************************************" >> output.txt
echo "3.5.2.6 Ensure nftables base chains exist - hook output" >> output.txt
echo "************************************************************" >> output.txt
nft list ruleset | grep 'hook output' >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 3.5.2.9 Ensure nftables default deny firewall policy - forward
echo "************************************************************" >> output.txt
echo "3.5.2.9 Ensure nftables default deny firewall policy - forward" >> output.txt
echo "************************************************************" >> output.txt
nft list ruleset | grep 'hook forward' >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 3.5.2.9 Ensure nftables default deny firewall policy - input
echo "************************************************************" >> output.txt
echo "3.5.2.9 Ensure nftables default deny firewall policy - input" >> output.txt
echo "************************************************************" >> output.txt
nft list ruleset | grep 'hook input' >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 3.5.2.9 Ensure nftables default deny firewall policy - output
echo "************************************************************" >> output.txt
echo "3.5.2.9 Ensure nftables default deny firewall policy - output" >> output.txt
echo "************************************************************" >> output.txt
nft list ruleset | grep 'hook output' >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 3.5.3.1.1 Ensure iptables packages are installed - iptables
echo "************************************************************" >> output.txt
echo "3.5.3.1.1 Ensure iptables packages are installed - iptables" >> output.txt
echo "************************************************************" >> output.txt
rpm -q iptables iptables-services >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 3.5.3.1.1 Ensure iptables packages are installed - iptables-services
echo "************************************************************" >> output.txt
echo "3.5.3.1.1 Ensure iptables packages are installed - iptables-services" >> output.txt
echo "************************************************************" >> output.txt
rpm -q iptables iptables-services >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 3.5.3.1.2 Ensure nftables is not installed with iptables
echo "************************************************************" >> output.txt
echo "3.5.3.1.2 Ensure nftables is not installed with iptables" >> output.txt
echo "************************************************************" >> output.txt
rpm -q nftables >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 3.5.3.1.3 Ensure firewalld is either not installed or masked with iptables - masked
echo "************************************************************" >> output.txt
echo "3.5.3.1.3 Ensure firewalld is either not installed or masked with iptables - masked" >> output.txt
echo "************************************************************" >> output.txt
systemctl is-enabled firewalld >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 3.5.3.1.3 Ensure firewalld is either not installed or masked with iptables - not installed
echo "************************************************************" >> output.txt
echo "3.5.3.1.3 Ensure firewalld is either not installed or masked with iptables - not installed" >> output.txt
echo "************************************************************" >> output.txt
rpm -q firewalld >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 3.5.3.1.3 Ensure firewalld is either not installed or masked with iptables - stopped
echo "************************************************************" >> output.txt
echo "3.5.3.1.3 Ensure firewalld is either not installed or masked with iptables - stopped" >> output.txt
echo "************************************************************" >> output.txt
systemctl status firewalld | grep "Active: " | grep -v "active (running) " >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 3.5.3.2.1 Ensure iptables loopback traffic is configured - Chain FORWARD
echo "************************************************************" >> output.txt
echo "3.5.3.2.1 Ensure iptables loopback traffic is configured - Chain FORWARD" >> output.txt
echo "************************************************************" >> output.txt
iptables -L FORWARD -v -n >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 3.5.3.2.1 Ensure iptables loopback traffic is configured - Chain INPUT
echo "************************************************************" >> output.txt
echo "3.5.3.2.1 Ensure iptables loopback traffic is configured - Chain INPUT" >> output.txt
echo "************************************************************" >> output.txt
iptables -L INPUT -v -n >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 3.5.3.2.1 Ensure iptables loopback traffic is configured - Chain OUTPUT
echo "************************************************************" >> output.txt
echo "3.5.3.2.1 Ensure iptables loopback traffic is configured - Chain OUTPUT" >> output.txt
echo "************************************************************" >> output.txt
iptables -L OUTPUT -v -n >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 3.5.3.2.2 Ensure iptables outbound and established connections are configured - input
echo "************************************************************" >> output.txt
echo "3.5.3.2.2 Ensure iptables outbound and established connections are configured - input" >> output.txt
echo "************************************************************" >> output.txt
iptables -L -v -n >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 3.5.3.2.2 Ensure iptables outbound and established connections are configured - output
echo "************************************************************" >> output.txt
echo "3.5.3.2.2 Ensure iptables outbound and established connections are configured - output" >> output.txt
echo "************************************************************" >> output.txt
iptables -L -v -n >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 3.5.3.2.3 Ensure iptables rules exist for all open ports - firewall rules
echo "************************************************************" >> output.txt
echo "3.5.3.2.3 Ensure iptables rules exist for all open ports - firewall rules" >> output.txt
echo "************************************************************" >> output.txt
iptables -L INPUT -v -n >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 3.5.3.2.3 Ensure iptables rules exist for all open ports - open ports
echo "************************************************************" >> output.txt
echo "3.5.3.2.3 Ensure iptables rules exist for all open ports - open ports" >> output.txt
echo "************************************************************" >> output.txt
ss -4tuln >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 3.5.3.2.4 Ensure iptables default deny firewall policy
echo "************************************************************" >> output.txt
echo "3.5.3.2.4 Ensure iptables default deny firewall policy" >> output.txt
echo "************************************************************" >> output.txt
iptables -L >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 3.5.3.2.5 Ensure iptables rules are saved
echo "************************************************************" >> output.txt
echo "3.5.3.2.5 Ensure iptables rules are saved" >> output.txt
echo "************************************************************" >> output.txt
/etc/sysconfig/iptables >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 3.5.3.2.6 Ensure iptables is enabled and running - enabled
echo "************************************************************" >> output.txt
echo "3.5.3.2.6 Ensure iptables is enabled and running - enabled" >> output.txt
echo "************************************************************" >> output.txt
systemctl is-enabled iptables >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 3.5.3.2.6 Ensure iptables is enabled and running - running
echo "************************************************************" >> output.txt
echo "3.5.3.2.6 Ensure iptables is enabled and running - running" >> output.txt
echo "************************************************************" >> output.txt
systemctl status iptables | grep -E " Active: active \((running|exited)\) " >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 3.5.3.3.1 Ensure ip6tables loopback traffic is configured - Chain FORWARD
echo "************************************************************" >> output.txt
echo "3.5.3.3.1 Ensure ip6tables loopback traffic is configured - Chain FORWARD" >> output.txt
echo "************************************************************" >> output.txt
ip6tables -L FORWARD -v -n >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 3.5.3.3.1 Ensure ip6tables loopback traffic is configured - Chain INPUT
echo "************************************************************" >> output.txt
echo "3.5.3.3.1 Ensure ip6tables loopback traffic is configured - Chain INPUT" >> output.txt
echo "************************************************************" >> output.txt
ip6tables -L INPUT -v -n >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 3.5.3.3.1 Ensure ip6tables loopback traffic is configured - Chain OUTPUT
echo "************************************************************" >> output.txt
echo "3.5.3.3.1 Ensure ip6tables loopback traffic is configured - Chain OUTPUT" >> output.txt
echo "************************************************************" >> output.txt
ip6tables -L OUTPUT -v -n >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 3.5.3.3.2 Ensure ip6tables outbound and established connections are configured - INPUT
echo "************************************************************" >> output.txt
echo "3.5.3.3.2 Ensure ip6tables outbound and established connections are configured - INPUT" >> output.txt
echo "************************************************************" >> output.txt
ip6tables -L -v -n >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 3.5.3.3.2 Ensure ip6tables outbound and established connections are configured - OUTPUT
echo "************************************************************" >> output.txt
echo "3.5.3.3.2 Ensure ip6tables outbound and established connections are configured - OUTPUT" >> output.txt
echo "************************************************************" >> output.txt
ip6tables -L -v -n >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 3.5.3.3.3 Ensure ip6tables firewall rules exist for all open ports
echo "************************************************************" >> output.txt
echo "3.5.3.3.3 Ensure ip6tables firewall rules exist for all open ports" >> output.txt
echo "************************************************************" >> output.txt
ss -6tuln >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 3.5.3.3.4 Ensure ip6tables default deny firewall policy
echo "************************************************************" >> output.txt
echo "3.5.3.3.4 Ensure ip6tables default deny firewall policy" >> output.txt
echo "************************************************************" >> output.txt
ip6tables -L >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 3.5.3.3.5 Ensure ip6tables rules are saved
echo "************************************************************" >> output.txt
echo "3.5.3.3.5 Ensure ip6tables rules are saved" >> output.txt
echo "************************************************************" >> output.txt
/etc/sysconfig/ip6tables >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 3.5.3.3.6 Ensure ip6tables is enabled and running
echo "************************************************************" >> output.txt
echo "3.5.3.3.6 Ensure ip6tables is enabled and running" >> output.txt
echo "************************************************************" >> output.txt
systemctl status ip6tables | grep -E " Active: active \((running|exited)\) " >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 3.5.3.3.6 Ensure ip6tables is enabled and running - enabled
echo "************************************************************" >> output.txt
echo "3.5.3.3.6 Ensure ip6tables is enabled and running - enabled" >> output.txt
echo "************************************************************" >> output.txt
systemctl is-enabled ip6tables >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 4.1.1.1 Ensure auditd is installed - audit
echo "************************************************************" >> output.txt
echo "4.1.1.1 Ensure auditd is installed - audit" >> output.txt
echo "************************************************************" >> output.txt
rpm -q audit audit-libs >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 4.1.1.1 Ensure auditd is installed - audit-libs
echo "************************************************************" >> output.txt
echo "4.1.1.1 Ensure auditd is installed - audit-libs" >> output.txt
echo "************************************************************" >> output.txt
rpm -q audit audit-libs >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 4.1.1.2 Ensure auditd service is enabled and running - enabled
echo "************************************************************" >> output.txt
echo "4.1.1.2 Ensure auditd service is enabled and running - enabled" >> output.txt
echo "************************************************************" >> output.txt
systemctl is-enabled auditd >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 4.1.1.2 Ensure auditd service is enabled and running - running
echo "************************************************************" >> output.txt
echo "4.1.1.2 Ensure auditd service is enabled and running - running" >> output.txt
echo "************************************************************" >> output.txt
systemctl status auditd | grep 'Active: active (running) ' >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 4.1.10 Ensure unsuccessful unauthorized file access attempts are collected - auditctl EACCES
echo "************************************************************" >> output.txt
echo "4.1.10 Ensure unsuccessful unauthorized file access attempts are collected - auditctl EACCES" >> output.txt
echo "************************************************************" >> output.txt
auditctl -l | grep access >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 4.1.10 Ensure unsuccessful unauthorized file access attempts are collected - auditctl EACCES (64-bit)
echo "************************************************************" >> output.txt
echo "4.1.10 Ensure unsuccessful unauthorized file access attempts are collected - auditctl EACCES (64-bit)" >> output.txt
echo "************************************************************" >> output.txt
auditctl -l | grep access >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 4.1.10 Ensure unsuccessful unauthorized file access attempts are collected - auditctl EPERM
echo "************************************************************" >> output.txt
echo "4.1.10 Ensure unsuccessful unauthorized file access attempts are collected - auditctl EPERM" >> output.txt
echo "************************************************************" >> output.txt
auditctl -l | grep access >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 4.1.10 Ensure unsuccessful unauthorized file access attempts are collected - auditctl EPERM (64-bit)
echo "************************************************************" >> output.txt
echo "4.1.10 Ensure unsuccessful unauthorized file access attempts are collected - auditctl EPERM (64-bit)" >> output.txt
echo "************************************************************" >> output.txt
auditctl -l | grep access >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 4.1.10 Ensure unsuccessful unauthorized file access attempts are collected - EACCES
echo "************************************************************" >> output.txt
echo "4.1.10 Ensure unsuccessful unauthorized file access attempts are collected - EACCES" >> output.txt
echo "************************************************************" >> output.txt
grep access /etc/audit/rules.d/*.rules >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 4.1.10 Ensure unsuccessful unauthorized file access attempts are collected - EACCES (64-bit)
echo "************************************************************" >> output.txt
echo "4.1.10 Ensure unsuccessful unauthorized file access attempts are collected - EACCES (64-bit)" >> output.txt
echo "************************************************************" >> output.txt
grep access /etc/audit/rules.d/*.rules >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 4.1.10 Ensure unsuccessful unauthorized file access attempts are collected - EPERM
echo "************************************************************" >> output.txt
echo "4.1.10 Ensure unsuccessful unauthorized file access attempts are collected - EPERM" >> output.txt
echo "************************************************************" >> output.txt
grep access /etc/audit/rules.d/*.rules >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 4.1.10 Ensure unsuccessful unauthorized file access attempts are collected - EPERM (64-bit)
echo "************************************************************" >> output.txt
echo "4.1.10 Ensure unsuccessful unauthorized file access attempts are collected - EPERM (64-bit)" >> output.txt
echo "************************************************************" >> output.txt
grep access /etc/audit/rules.d/*.rules >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 4.1.12 Ensure successful file system mounts are collected
echo "************************************************************" >> output.txt
echo "4.1.12 Ensure successful file system mounts are collected" >> output.txt
echo "************************************************************" >> output.txt
grep mounts /etc/audit/rules.d/*.rules >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 4.1.12 Ensure successful file system mounts are collected - 64-bit
echo "************************************************************" >> output.txt
echo "4.1.12 Ensure successful file system mounts are collected - 64-bit" >> output.txt
echo "************************************************************" >> output.txt
grep mounts /etc/audit/rules.d/*.rules >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 4.1.12 Ensure successful file system mounts are collected - auditctl
echo "************************************************************" >> output.txt
echo "4.1.12 Ensure successful file system mounts are collected - auditctl" >> output.txt
echo "************************************************************" >> output.txt
auditctl -l | grep mounts >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 4.1.12 Ensure successful file system mounts are collected - auditctl (64-bit)
echo "************************************************************" >> output.txt
echo "4.1.12 Ensure successful file system mounts are collected - auditctl (64-bit)" >> output.txt
echo "************************************************************" >> output.txt
auditctl -l | grep mounts >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 4.1.13 Ensure file deletion events by users are collected
echo "************************************************************" >> output.txt
echo "4.1.13 Ensure file deletion events by users are collected" >> output.txt
echo "************************************************************" >> output.txt
grep delete /etc/audit/rules.d/*.rules >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 4.1.13 Ensure file deletion events by users are collected - 64-bit
echo "************************************************************" >> output.txt
echo "4.1.13 Ensure file deletion events by users are collected - 64-bit" >> output.txt
echo "************************************************************" >> output.txt
grep delete /etc/audit/rules.d/*.rules >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 4.1.13 Ensure file deletion events by users are collected - auditctl
echo "************************************************************" >> output.txt
echo "4.1.13 Ensure file deletion events by users are collected - auditctl" >> output.txt
echo "************************************************************" >> output.txt
auditctl -l | grep delete >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 4.1.13 Ensure file deletion events by users are collected - auditctl (64-bit)
echo "************************************************************" >> output.txt
echo "4.1.13 Ensure file deletion events by users are collected - auditctl (64-bit)" >> output.txt
echo "************************************************************" >> output.txt
auditctl -l | grep delete >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 4.1.14 Ensure changes to system administration scope (sudoers) is collected - auditctl sudoers
echo "************************************************************" >> output.txt
echo "4.1.14 Ensure changes to system administration scope (sudoers) is collected - auditctl sudoers" >> output.txt
echo "************************************************************" >> output.txt
# auditctl -l | grep scope >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 4.1.14 Ensure changes to system administration scope (sudoers) is collected - auditctl sudoers.d
echo "************************************************************" >> output.txt
echo "4.1.14 Ensure changes to system administration scope (sudoers) is collected - auditctl sudoers.d" >> output.txt
echo "************************************************************" >> output.txt
auditctl -l | grep scope >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 4.1.14 Ensure changes to system administration scope (sudoers) is collected - sudoers
echo "************************************************************" >> output.txt
echo "4.1.14 Ensure changes to system administration scope (sudoers) is collected - sudoers" >> output.txt
echo "************************************************************" >> output.txt
grep scope /etc/audit/rules.d/*.rules >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 4.1.14 Ensure changes to system administration scope (sudoers) is collected - sudoers.d
echo "************************************************************" >> output.txt
echo "4.1.14 Ensure changes to system administration scope (sudoers) is collected - sudoers.d" >> output.txt
echo "************************************************************" >> output.txt
grep scope /etc/audit/rules.d/*.rules >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 4.1.15 Ensure system administrator command executions (sudo) are collected
echo "************************************************************" >> output.txt
echo "4.1.15 Ensure system administrator command executions (sudo) are collected" >> output.txt
echo "************************************************************" >> output.txt
grep actions /etc/audit/rules.d/*.rules >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 4.1.15 Ensure system administrator command executions (sudo) are collected - auditctl
echo "************************************************************" >> output.txt
echo "4.1.15 Ensure system administrator command executions (sudo) are collected - auditctl" >> output.txt
echo "************************************************************" >> output.txt
auditctl -l | grep actions >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 4.1.16 Ensure kernel module loading and unloading is collected - auditctl init_module
echo "************************************************************" >> output.txt
echo "4.1.16 Ensure kernel module loading and unloading is collected - auditctl init_module" >> output.txt
echo "************************************************************" >> output.txt
# auditctl -l | grep modules >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 4.1.16 Ensure kernel module loading and unloading is collected - auditctl insmod
echo "************************************************************" >> output.txt
echo "4.1.16 Ensure kernel module loading and unloading is collected - auditctl insmod" >> output.txt
echo "************************************************************" >> output.txt
# auditctl -l | grep modules >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 4.1.16 Ensure kernel module loading and unloading is collected - auditctl modprobe
echo "************************************************************" >> output.txt
echo "4.1.16 Ensure kernel module loading and unloading is collected - auditctl modprobe" >> output.txt
echo "************************************************************" >> output.txt
# auditctl -l | grep modules >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 4.1.16 Ensure kernel module loading and unloading is collected - auditctl rmmod
echo "************************************************************" >> output.txt
echo "4.1.16 Ensure kernel module loading and unloading is collected - auditctl rmmod" >> output.txt
echo "************************************************************" >> output.txt
auditctl -l | grep modules >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 4.1.16 Ensure kernel module loading and unloading is collected - init_module
echo "************************************************************" >> output.txt
echo "4.1.16 Ensure kernel module loading and unloading is collected - init_module" >> output.txt
echo "************************************************************" >> output.txt
grep modules /etc/audit/rules.d/*.rules >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 4.1.16 Ensure kernel module loading and unloading is collected - insmod
echo "************************************************************" >> output.txt
echo "4.1.16 Ensure kernel module loading and unloading is collected - insmod" >> output.txt
echo "************************************************************" >> output.txt
grep modules /etc/audit/rules.d/*.rules >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 4.1.16 Ensure kernel module loading and unloading is collected - modprobe
echo "************************************************************" >> output.txt
echo "4.1.16 Ensure kernel module loading and unloading is collected - modprobe" >> output.txt
echo "************************************************************" >> output.txt
grep modules /etc/audit/rules.d/*.rules >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 4.1.16 Ensure kernel module loading and unloading is collected - rmmod
echo "************************************************************" >> output.txt
echo "4.1.16 Ensure kernel module loading and unloading is collected - rmmod" >> output.txt
echo "************************************************************" >> output.txt
grep modules /etc/audit/rules.d/*.rules >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 4.1.17 Ensure the audit configuration is immutable
echo "************************************************************" >> output.txt
echo "4.1.17 Ensure the audit configuration is immutable" >> output.txt
echo "************************************************************" >> output.txt
grep "^\s*[^#]" /etc/audit/rules.d/*.rules | tail -1 >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 4.1.2.1 Ensure audit log storage size is configured
echo "************************************************************" >> output.txt
echo "4.1.2.1 Ensure audit log storage size is configured" >> output.txt
echo "************************************************************" >> output.txt
grep max_log_file /etc/audit/auditd.conf >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 4.1.2.2 Ensure audit logs are not automatically deleted
echo "************************************************************" >> output.txt
echo "4.1.2.2 Ensure audit logs are not automatically deleted" >> output.txt
echo "************************************************************" >> output.txt
grep max_log_file_action /etc/audit/auditd.conf >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 4.1.2.3 Ensure system is disabled when audit logs are full - 'action_mail_acct = root'
echo "************************************************************" >> output.txt
echo "4.1.2.3 Ensure system is disabled when audit logs are full - 'action_mail_acct = root'" >> output.txt
echo "************************************************************" >> output.txt
grep action_mail_acct /etc/audit/auditd.conf >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 4.1.2.3 Ensure system is disabled when audit logs are full - 'admin_space_left_action = halt'
echo "************************************************************" >> output.txt
echo "4.1.2.3 Ensure system is disabled when audit logs are full - 'admin_space_left_action = halt'" >> output.txt
echo "************************************************************" >> output.txt
grep admin_space_left_action /etc/audit/auditd.conf >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 4.1.2.3 Ensure system is disabled when audit logs are full - 'space_left_action = email'
echo "************************************************************" >> output.txt
echo "4.1.2.3 Ensure system is disabled when audit logs are full - 'space_left_action = email'" >> output.txt
echo "************************************************************" >> output.txt
grep space_left_action /etc/audit/auditd.conf >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 4.1.3 Ensure events that modify date and time information are collected -  auditctl /etc/localtime
echo "************************************************************" >> output.txt
echo "4.1.3 Ensure events that modify date and time information are collected -  auditctl /etc/localtime" >> output.txt
echo "************************************************************" >> output.txt
grep time-change /etc/audit/rules.d/*.rules ; auditctl -l | grep time-change >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 4.1.3 Ensure events that modify date and time information are collected - /etc/localtime
echo "************************************************************" >> output.txt
echo "4.1.3 Ensure events that modify date and time information are collected - /etc/localtime" >> output.txt
echo "************************************************************" >> output.txt
grep time-change /etc/audit/rules.d/*.rules ; auditctl -l | grep time-change >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 4.1.3 Ensure events that modify date and time information are collected - adjtimex (32-bit)
echo "************************************************************" >> output.txt
echo "4.1.3 Ensure events that modify date and time information are collected - adjtimex (32-bit)" >> output.txt
echo "************************************************************" >> output.txt
grep time-change /etc/audit/rules.d/*.rules ; auditctl -l | grep time-change >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 4.1.3 Ensure events that modify date and time information are collected - adjtimex (64-bit)
echo "************************************************************" >> output.txt
echo "4.1.3 Ensure events that modify date and time information are collected - adjtimex (64-bit)" >> output.txt
echo "************************************************************" >> output.txt
grep time-change /etc/audit/rules.d/*.rules ; auditctl -l | grep time-change >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 4.1.3 Ensure events that modify date and time information are collected - auditctl adjtimex (32-bit)
echo "************************************************************" >> output.txt
echo "4.1.3 Ensure events that modify date and time information are collected - auditctl adjtimex (32-bit)" >> output.txt
echo "************************************************************" >> output.txt
grep time-change /etc/audit/rules.d/*.rules ; auditctl -l | grep time-change >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 4.1.3 Ensure events that modify date and time information are collected - auditctl adjtimex (64-bit)
echo "************************************************************" >> output.txt
echo "4.1.3 Ensure events that modify date and time information are collected - auditctl adjtimex (64-bit)" >> output.txt
echo "************************************************************" >> output.txt
grep time-change /etc/audit/rules.d/*.rules ; auditctl -l | grep time-change >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 4.1.3 Ensure events that modify date and time information are collected - auditctl clock_settime (32-bit)
echo "************************************************************" >> output.txt
echo "4.1.3 Ensure events that modify date and time information are collected - auditctl clock_settime (32-bit)" >> output.txt
echo "************************************************************" >> output.txt
grep time-change /etc/audit/rules.d/*.rules ; auditctl -l | grep time-change >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 4.1.3 Ensure events that modify date and time information are collected - auditctl clock_settime (64-bit)
echo "************************************************************" >> output.txt
echo "4.1.3 Ensure events that modify date and time information are collected - auditctl clock_settime (64-bit)" >> output.txt
echo "************************************************************" >> output.txt
grep time-change /etc/audit/rules.d/*.rules ; auditctl -l | grep time-change >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 4.1.3 Ensure events that modify date and time information are collected - clock_settime (32-bit)
echo "************************************************************" >> output.txt
echo "4.1.3 Ensure events that modify date and time information are collected - clock_settime (32-bit)" >> output.txt
echo "************************************************************" >> output.txt
grep time-change /etc/audit/rules.d/*.rules ; auditctl -l | grep time-change >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 4.1.3 Ensure events that modify date and time information are collected - clock_settime (64-bit)
echo "************************************************************" >> output.txt
echo "4.1.3 Ensure events that modify date and time information are collected - clock_settime (64-bit)" >> output.txt
echo "************************************************************" >> output.txt
grep time-change /etc/audit/rules.d/*.rules ; auditctl -l | grep time-change >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 4.1.4 Ensure events that modify user/group information are collected - '/etc/group'
echo "************************************************************" >> output.txt
echo "4.1.4 Ensure events that modify user/group information are collected - '/etc/group'" >> output.txt
echo "************************************************************" >> output.txt
grep identity /etc/audit/rules.d/*.rules >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 4.1.4 Ensure events that modify user/group information are collected - '/etc/gshadow'
echo "************************************************************" >> output.txt
echo "4.1.4 Ensure events that modify user/group information are collected - '/etc/gshadow'" >> output.txt
echo "************************************************************" >> output.txt
grep identity /etc/audit/rules.d/*.rules >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 4.1.4 Ensure events that modify user/group information are collected - '/etc/passwd'
echo "************************************************************" >> output.txt
echo "4.1.4 Ensure events that modify user/group information are collected - '/etc/passwd'" >> output.txt
echo "************************************************************" >> output.txt
grep identity /etc/audit/rules.d/*.rules >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 4.1.4 Ensure events that modify user/group information are collected - '/etc/security/opasswd'
echo "************************************************************" >> output.txt
echo "4.1.4 Ensure events that modify user/group information are collected - '/etc/security/opasswd'" >> output.txt
echo "************************************************************" >> output.txt
grep identity /etc/audit/rules.d/*.rules >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 4.1.4 Ensure events that modify user/group information are collected - '/etc/shadow'
echo "************************************************************" >> output.txt
echo "4.1.4 Ensure events that modify user/group information are collected - '/etc/shadow'" >> output.txt
echo "************************************************************" >> output.txt
grep identity /etc/audit/rules.d/*.rules >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 4.1.4 Ensure events that modify user/group information are collected - auditctl '/etc/group'
echo "************************************************************" >> output.txt
echo "4.1.4 Ensure events that modify user/group information are collected - auditctl '/etc/group'" >> output.txt
echo "************************************************************" >> output.txt
auditctl -l | grep identity >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 4.1.4 Ensure events that modify user/group information are collected - auditctl '/etc/gshadow'
echo "************************************************************" >> output.txt
echo "4.1.4 Ensure events that modify user/group information are collected - auditctl '/etc/gshadow'" >> output.txt
echo "************************************************************" >> output.txt
auditctl -l | grep identity >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 4.1.4 Ensure events that modify user/group information are collected - auditctl '/etc/passwd'
echo "************************************************************" >> output.txt
echo "4.1.4 Ensure events that modify user/group information are collected - auditctl '/etc/passwd'" >> output.txt
echo "************************************************************" >> output.txt
auditctl -l | grep identity >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 4.1.4 Ensure events that modify user/group information are collected - auditctl '/etc/security/opasswd'
echo "************************************************************" >> output.txt
echo "4.1.4 Ensure events that modify user/group information are collected - auditctl '/etc/security/opasswd'" >> output.txt
echo "************************************************************" >> output.txt
auditctl -l | grep identity >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 4.1.4 Ensure events that modify user/group information are collected - auditctl '/etc/shadow'
echo "************************************************************" >> output.txt
echo "4.1.4 Ensure events that modify user/group information are collected - auditctl '/etc/shadow'" >> output.txt
echo "************************************************************" >> output.txt
auditctl -l | grep identity >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 4.1.5 Ensure events that modify the system's network environment are collected - /etc/hosts
echo "************************************************************" >> output.txt
echo "4.1.5 Ensure events that modify the system's network environment are collected - /etc/hosts" >> output.txt
echo "************************************************************" >> output.txt
grep system-locale /etc/audit/rules.d/*.rules ; auditctl -l | grep system-locale >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 4.1.5 Ensure events that modify the system's network environment are collected - /etc/sysconfig/network
echo "************************************************************" >> output.txt
echo "4.1.5 Ensure events that modify the system's network environment are collected - /etc/sysconfig/network" >> output.txt
echo "************************************************************" >> output.txt
grep system-locale /etc/audit/rules.d/*.rules ; auditctl -l | grep system-locale >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 4.1.5 Ensure events that modify the system's network environment are collected - /etc/sysconfig/network-scripts
echo "************************************************************" >> output.txt
echo "4.1.5 Ensure events that modify the system's network environment are collected - /etc/sysconfig/network-scripts" >> output.txt
echo "************************************************************" >> output.txt
grep system-locale /etc/audit/rules.d/*.rules ; auditctl -l | grep system-locale >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 4.1.5 Ensure events that modify the system's network environment are collected - auditctl hosts
echo "************************************************************" >> output.txt
echo "4.1.5 Ensure events that modify the system's network environment are collected - auditctl hosts" >> output.txt
echo "************************************************************" >> output.txt
grep system-locale /etc/audit/rules.d/*.rules ; auditctl -l | grep system-locale >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 4.1.5 Ensure events that modify the system's network environment are collected - auditctl issue
echo "************************************************************" >> output.txt
echo "4.1.5 Ensure events that modify the system's network environment are collected - auditctl issue" >> output.txt
echo "************************************************************" >> output.txt
grep system-locale /etc/audit/rules.d/*.rules ; auditctl -l | grep system-locale >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 4.1.5 Ensure events that modify the system's network environment are collected - auditctl issue.net
echo "************************************************************" >> output.txt
echo "4.1.5 Ensure events that modify the system's network environment are collected - auditctl issue.net" >> output.txt
echo "************************************************************" >> output.txt
grep system-locale /etc/audit/rules.d/*.rules ; auditctl -l | grep system-locale >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 4.1.5 Ensure events that modify the system's network environment are collected - auditctl network
echo "************************************************************" >> output.txt
echo "4.1.5 Ensure events that modify the system's network environment are collected - auditctl network" >> output.txt
echo "************************************************************" >> output.txt
grep system-locale /etc/audit/rules.d/*.rules ; auditctl -l | grep system-locale >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 4.1.5 Ensure events that modify the system's network environment are collected - auditctl network-scripts
echo "************************************************************" >> output.txt
echo "4.1.5 Ensure events that modify the system's network environment are collected - auditctl network-scripts" >> output.txt
echo "************************************************************" >> output.txt
grep system-locale /etc/audit/rules.d/*.rules ; auditctl -l | grep system-locale >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 4.1.5 Ensure events that modify the system's network environment are collected - auditctl sethostname (32-bit)
echo "************************************************************" >> output.txt
echo "4.1.5 Ensure events that modify the system's network environment are collected - auditctl sethostname (32-bit)" >> output.txt
echo "************************************************************" >> output.txt
grep system-locale /etc/audit/rules.d/*.rules ; auditctl -l | grep system-locale >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 4.1.5 Ensure events that modify the system's network environment are collected - auditctl sethostname (64-bit)
echo "************************************************************" >> output.txt
echo "4.1.5 Ensure events that modify the system's network environment are collected - auditctl sethostname (64-bit)" >> output.txt
echo "************************************************************" >> output.txt
grep system-locale /etc/audit/rules.d/*.rules ; auditctl -l | grep system-locale >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 4.1.5 Ensure events that modify the system's network environment are collected - issue
echo "************************************************************" >> output.txt
echo "4.1.5 Ensure events that modify the system's network environment are collected - issue" >> output.txt
echo "************************************************************" >> output.txt
grep system-locale /etc/audit/rules.d/*.rules ; auditctl -l | grep system-locale >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 4.1.5 Ensure events that modify the system's network environment are collected - issue.net
echo "************************************************************" >> output.txt
echo "4.1.5 Ensure events that modify the system's network environment are collected - issue.net" >> output.txt
echo "************************************************************" >> output.txt
grep system-locale /etc/audit/rules.d/*.rules ; auditctl -l | grep system-locale >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 4.1.5 Ensure events that modify the system's network environment are collected - sethostname (32-bit)
echo "************************************************************" >> output.txt
echo "4.1.5 Ensure events that modify the system's network environment are collected - sethostname (32-bit)" >> output.txt
echo "************************************************************" >> output.txt
grep system-locale /etc/audit/rules.d/*.rules ; auditctl -l | grep system-locale >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 4.1.5 Ensure events that modify the system's network environment are collected - sethostname (64-bit)
echo "************************************************************" >> output.txt
echo "4.1.5 Ensure events that modify the system's network environment are collected - sethostname (64-bit)" >> output.txt
echo "************************************************************" >> output.txt
grep system-locale /etc/audit/rules.d/*.rules ; auditctl -l | grep system-locale >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 4.1.6 Ensure events that modify the system's Mandatory Access Controls are collected - /etc/selinux/
echo "************************************************************" >> output.txt
echo "4.1.6 Ensure events that modify the system's Mandatory Access Controls are collected - /etc/selinux/" >> output.txt
echo "************************************************************" >> output.txt
grep MAC-policy /etc/audit/rules.d/*.rules ; auditctl -l | grep MAC-policy >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 4.1.6 Ensure events that modify the system's Mandatory Access Controls are collected - /usr/share/selinux/
echo "************************************************************" >> output.txt
echo "4.1.6 Ensure events that modify the system's Mandatory Access Controls are collected - /usr/share/selinux/" >> output.txt
echo "************************************************************" >> output.txt
grep MAC-policy /etc/audit/rules.d/*.rules ; auditctl -l | grep MAC-policy >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 4.1.6 Ensure events that modify the system's Mandatory Access Controls are collected - auditctl /etc/selinux/
echo "************************************************************" >> output.txt
echo "4.1.6 Ensure events that modify the system's Mandatory Access Controls are collected - auditctl /etc/selinux/" >> output.txt
echo "************************************************************" >> output.txt
grep MAC-policy /etc/audit/rules.d/*.rules ; auditctl -l | grep MAC-policy >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 4.1.6 Ensure events that modify the system's Mandatory Access Controls are collected - auditctl /usr/share/selinux/
echo "************************************************************" >> output.txt
echo "4.1.6 Ensure events that modify the system's Mandatory Access Controls are collected - auditctl /usr/share/selinux/" >> output.txt
echo "************************************************************" >> output.txt
grep MAC-policy /etc/audit/rules.d/*.rules ; auditctl -l | grep MAC-policy >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 4.1.7 Ensure login and logout events are collected - /var/log/faillog
echo "************************************************************" >> output.txt
echo "4.1.7 Ensure login and logout events are collected - /var/log/faillog" >> output.txt
echo "************************************************************" >> output.txt
grep logins /etc/audit/rules.d/*.rules ; auditctl -l | grep logins >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 4.1.7 Ensure login and logout events are collected - /var/log/lastlog
echo "************************************************************" >> output.txt
echo "4.1.7 Ensure login and logout events are collected - /var/log/lastlog" >> output.txt
echo "************************************************************" >> output.txt
grep logins /etc/audit/rules.d/*.rules ; auditctl -l | grep logins >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 4.1.7 Ensure login and logout events are collected - /var/log/tallylog
echo "************************************************************" >> output.txt
echo "4.1.7 Ensure login and logout events are collected - /var/log/tallylog" >> output.txt
echo "************************************************************" >> output.txt
grep logins /etc/audit/rules.d/*.rules ; auditctl -l | grep logins >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 4.1.7 Ensure login and logout events are collected - auditctl /var/log/faillog
echo "************************************************************" >> output.txt
echo "4.1.7 Ensure login and logout events are collected - auditctl /var/log/faillog" >> output.txt
echo "************************************************************" >> output.txt
grep logins /etc/audit/rules.d/*.rules ; auditctl -l | grep logins >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 4.1.7 Ensure login and logout events are collected - auditctl /var/log/lastlog
echo "************************************************************" >> output.txt
echo "4.1.7 Ensure login and logout events are collected - auditctl /var/log/lastlog" >> output.txt
echo "************************************************************" >> output.txt
grep logins /etc/audit/rules.d/*.rules ; auditctl -l | grep logins >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 4.1.7 Ensure login and logout events are collected - auditctl /var/log/tallylog
echo "************************************************************" >> output.txt
echo "4.1.7 Ensure login and logout events are collected - auditctl /var/log/tallylog" >> output.txt
echo "************************************************************" >> output.txt
grep logins /etc/audit/rules.d/*.rules ; auditctl -l | grep logins >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 4.1.8 Ensure session initiation information is collected - auditctl btmp
echo "************************************************************" >> output.txt
echo "4.1.8 Ensure session initiation information is collected - auditctl btmp" >> output.txt
echo "************************************************************" >> output.txt
auditctl -l | grep -E '(session|logins)' >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 4.1.8 Ensure session initiation information is collected - auditctl utmp
echo "************************************************************" >> output.txt
echo "4.1.8 Ensure session initiation information is collected - auditctl utmp" >> output.txt
echo "************************************************************" >> output.txt
auditctl -l | grep -E '(session|logins)' >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 4.1.8 Ensure session initiation information is collected - auditctl wtmp
echo "************************************************************" >> output.txt
echo "4.1.8 Ensure session initiation information is collected - auditctl wtmp" >> output.txt
echo "************************************************************" >> output.txt
auditctl -l | grep -E '(session|logins)' >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 4.1.8 Ensure session initiation information is collected - btmp
echo "************************************************************" >> output.txt
echo "4.1.8 Ensure session initiation information is collected - btmp" >> output.txt
echo "************************************************************" >> output.txt
grep -E '(session|logins)' /etc/audit/rules.d/*.rules >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 4.1.8 Ensure session initiation information is collected - utmp
echo "************************************************************" >> output.txt
echo "4.1.8 Ensure session initiation information is collected - utmp" >> output.txt
echo "************************************************************" >> output.txt
grep -E '(session|logins)' /etc/audit/rules.d/*.rules >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 4.1.8 Ensure session initiation information is collected - wtmp
echo "************************************************************" >> output.txt
echo "4.1.8 Ensure session initiation information is collected - wtmp" >> output.txt
echo "************************************************************" >> output.txt
grep -E '(session|logins)' /etc/audit/rules.d/*.rules >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 4.1.9 Ensure discretionary access control permission modification events are collected - auditctl chmod/fchmod/fchmodat
echo "************************************************************" >> output.txt
echo "4.1.9 Ensure discretionary access control permission modification events are collected - auditctl chmod/fchmod/fchmodat" >> output.txt
echo "************************************************************" >> output.txt
auditctl -l | grep perm_mod >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 4.1.9 Ensure discretionary access control permission modification events are collected - auditctl chmod/fchmod/fchmodat (64-bit)
echo "************************************************************" >> output.txt
echo "4.1.9 Ensure discretionary access control permission modification events are collected - auditctl chmod/fchmod/fchmodat (64-bit)" >> output.txt
echo "************************************************************" >> output.txt
auditctl -l | grep auditctl -l | grep perm_mod >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 4.1.9 Ensure discretionary access control permission modification events are collected - auditctl chown/fchown/fchownat/lchown
echo "************************************************************" >> output.txt
echo "4.1.9 Ensure discretionary access control permission modification events are collected - auditctl chown/fchown/fchownat/lchown" >> output.txt
echo "************************************************************" >> output.txt
auditctl -l | grep perm_mod >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 4.1.9 Ensure discretionary access control permission modification events are collected - auditctl chown/fchown/fchownat/lchown (64-bit)
echo "************************************************************" >> output.txt
echo "4.1.9 Ensure discretionary access control permission modification events are collected - auditctl chown/fchown/fchownat/lchown (64-bit)" >> output.txt
echo "************************************************************" >> output.txt
auditctl -l | grep auditctl -l | grep perm_mod >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 4.1.9 Ensure discretionary access control permission modification events are collected - auditctl setxattr/lsetxattr/fsetxattr/removexattr
echo "************************************************************" >> output.txt
echo "4.1.9 Ensure discretionary access control permission modification events are collected - auditctl setxattr/lsetxattr/fsetxattr/removexattr" >> output.txt
echo "************************************************************" >> output.txt
auditctl -l | grep perm_mod >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 4.1.9 Ensure discretionary access control permission modification events are collected - auditctl xattr (64-bit)
echo "************************************************************" >> output.txt
echo "4.1.9 Ensure discretionary access control permission modification events are collected - auditctl xattr (64-bit)" >> output.txt
echo "************************************************************" >> output.txt
auditctl -l | grep auditctl -l | grep perm_mod >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 4.1.9 Ensure discretionary access control permission modification events are collected - chmod/fchmod/fchmodat
echo "************************************************************" >> output.txt
echo "4.1.9 Ensure discretionary access control permission modification events are collected - chmod/fchmod/fchmodat" >> output.txt
echo "************************************************************" >> output.txt
grep perm_mod /etc/audit/rules.d/*.rules >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 4.1.9 Ensure discretionary access control permission modification events are collected - chmod/fchmod/fchmodat (64-bit)
echo "************************************************************" >> output.txt
echo "4.1.9 Ensure discretionary access control permission modification events are collected - chmod/fchmod/fchmodat (64-bit)" >> output.txt
echo "************************************************************" >> output.txt
grep perm_mod /etc/audit/rules.d/*.rules >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 4.1.9 Ensure discretionary access control permission modification events are collected - chown/fchown/fchownat/lchown
echo "************************************************************" >> output.txt
echo "4.1.9 Ensure discretionary access control permission modification events are collected - chown/fchown/fchownat/lchown" >> output.txt
echo "************************************************************" >> output.txt
grep perm_mod /etc/audit/rules.d/*.rules >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 4.1.9 Ensure discretionary access control permission modification events are collected - chown/fchown/fchownat/lchown (64-bit)
echo "************************************************************" >> output.txt
echo "4.1.9 Ensure discretionary access control permission modification events are collected - chown/fchown/fchownat/lchown (64-bit)" >> output.txt
echo "************************************************************" >> output.txt
grep perm_mod /etc/audit/rules.d/*.rules >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 4.1.9 Ensure discretionary access control permission modification events are collected - setxattr/lsetxattr/fsetxattr/removexattr
echo "************************************************************" >> output.txt
echo "4.1.9 Ensure discretionary access control permission modification events are collected - setxattr/lsetxattr/fsetxattr/removexattr" >> output.txt
echo "************************************************************" >> output.txt
grep perm_mod /etc/audit/rules.d/*.rules >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 4.1.9 Ensure discretionary access control permission modification events are collected - xattr (64-bit)
echo "************************************************************" >> output.txt
echo "4.1.9 Ensure discretionary access control permission modification events are collected - xattr (64-bit)" >> output.txt
echo "************************************************************" >> output.txt
grep perm_mod /etc/audit/rules.d/*.rules >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 4.2.1.1 Ensure rsyslog is installed
echo "************************************************************" >> output.txt
echo "4.2.1.1 Ensure rsyslog is installed" >> output.txt
echo "************************************************************" >> output.txt
rpm -q rsyslog >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 4.2.1.2 Ensure rsyslog Service is enabled and running - enabled
echo "************************************************************" >> output.txt
echo "4.2.1.2 Ensure rsyslog Service is enabled and running - enabled" >> output.txt
echo "************************************************************" >> output.txt
systemctl is-enabled rsyslog >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 4.2.1.2 Ensure rsyslog Service is enabled and running - running
echo "************************************************************" >> output.txt
echo "4.2.1.2 Ensure rsyslog Service is enabled and running - running" >> output.txt
echo "************************************************************" >> output.txt
systemctl status rsyslog | grep 'active (running) ' >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 4.2.1.3 Ensure rsyslog default file permissions configured
echo "************************************************************" >> output.txt
echo "4.2.1.3 Ensure rsyslog default file permissions configured" >> output.txt
echo "************************************************************" >> output.txt
grep ^\$FileCreateMode /etc/rsyslog.conf /etc/rsyslog.d/*.conf >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 4.2.1.4 Ensure logging is configured
echo "************************************************************" >> output.txt
echo "4.2.1.4 Ensure logging is configured" >> output.txt
echo "************************************************************" >> output.txt
ls -l /var/log/ >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 4.2.1.5 Ensure rsyslog is configured to send logs to a remote log host
echo "************************************************************" >> output.txt
echo "4.2.1.5 Ensure rsyslog is configured to send logs to a remote log host" >> output.txt
echo "************************************************************" >> output.txt
grep -E '^\s*([^#]+\s+)?action\(([^#]+\s+)?\btarget=\"?[^#"]+\"?\b' /etc/rsyslog.conf /etc/rsyslog.d/*.conf >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 4.2.1.6 Ensure remote rsyslog messages are only accepted on designated log hosts. - imtcp.so
echo "************************************************************" >> output.txt
echo "4.2.1.6 Ensure remote rsyslog messages are only accepted on designated log hosts. - imtcp.so" >> output.txt
echo "************************************************************" >> output.txt
grep '$ModLoad imtcp' /etc/rsyslog.conf /etc/rsyslog.d/*.conf >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 4.2.1.6 Ensure remote rsyslog messages are only accepted on designated log hosts. - InputTCPServerRun 514
echo "************************************************************" >> output.txt
echo "4.2.1.6 Ensure remote rsyslog messages are only accepted on designated log hosts. - InputTCPServerRun 514" >> output.txt
echo "************************************************************" >> output.txt
grep '$InputTCPServerRun' /etc/rsyslog.conf /etc/rsyslog.d/*.conf >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 4.2.2.1 Ensure journald is configured to send logs to rsyslog
echo "************************************************************" >> output.txt
echo "4.2.2.1 Ensure journald is configured to send logs to rsyslog" >> output.txt
echo "************************************************************" >> output.txt
grep -E ^\s*ForwardToSyslog /etc/systemd/journald.conf >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 4.2.2.2 Ensure journald is configured to compress large log files
echo "************************************************************" >> output.txt
echo "4.2.2.2 Ensure journald is configured to compress large log files" >> output.txt
echo "************************************************************" >> output.txt
grep -E ^\s*Compress /etc/systemd/journald.conf >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 4.2.2.3 Ensure journald is configured to write logfiles to persistent disk
echo "************************************************************" >> output.txt
echo "4.2.2.3 Ensure journald is configured to write logfiles to persistent disk" >> output.txt
echo "************************************************************" >> output.txt
grep -E ^\s*Storage /etc/systemd/journald.conf >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 4.2.3 Ensure permissions on all logfiles are configured
echo "************************************************************" >> output.txt
echo "4.2.3 Ensure permissions on all logfiles are configured" >> output.txt
echo "************************************************************" >> output.txt
find /var/log -type f -perm /g+wx,o+rwx -exec ls -l {} \; >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 5.1.1 Ensure cron daemon is enabled and running - enabled
echo "************************************************************" >> output.txt
echo "5.1.1 Ensure cron daemon is enabled and running - enabled" >> output.txt
echo "************************************************************" >> output.txt
systemctl is-enabled crond >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 5.1.1 Ensure cron daemon is enabled and running - running
echo "************************************************************" >> output.txt
echo "5.1.1 Ensure cron daemon is enabled and running - running" >> output.txt
echo "************************************************************" >> output.txt
systemctl status crond | grep 'Active: active (running) ' >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 5.1.2 Ensure permissions on /etc/crontab are configured
echo "************************************************************" >> output.txt
echo "5.1.2 Ensure permissions on /etc/crontab are configured" >> output.txt
echo "************************************************************" >> output.txt
stat /etc/crontab >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 5.1.3 Ensure permissions on /etc/cron.hourly are configured
echo "************************************************************" >> output.txt
echo "5.1.3 Ensure permissions on /etc/cron.hourly are configured" >> output.txt
echo "************************************************************" >> output.txt
stat /etc/cron.hourly/ >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 5.1.4 Ensure permissions on /etc/cron.daily are configured
echo "************************************************************" >> output.txt
echo "5.1.4 Ensure permissions on /etc/cron.daily are configured" >> output.txt
echo "************************************************************" >> output.txt
stat /etc/cron.daily/ >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 5.1.5 Ensure permissions on /etc/cron.weekly are configured
echo "************************************************************" >> output.txt
echo "5.1.5 Ensure permissions on /etc/cron.weekly are configured" >> output.txt
echo "************************************************************" >> output.txt
stat /etc/cron.weekly >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 5.1.6 Ensure permissions on /etc/cron.monthly are configured
echo "************************************************************" >> output.txt
echo "5.1.6 Ensure permissions on /etc/cron.monthly are configured" >> output.txt
echo "************************************************************" >> output.txt
stat /etc/cron.monthly/ >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 5.1.7 Ensure permissions on /etc/cron.d are configured
echo "************************************************************" >> output.txt
echo "5.1.7 Ensure permissions on /etc/cron.d are configured" >> output.txt
echo "************************************************************" >> output.txt
stat /etc/cron.d >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 5.1.8 Ensure cron is restricted to authorized users - /etc/cron.allow
echo "************************************************************" >> output.txt
echo "5.1.8 Ensure cron is restricted to authorized users - /etc/cron.allow" >> output.txt
echo "************************************************************" >> output.txt
stat /etc/cron.allow >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 5.1.8 Ensure cron is restricted to authorized users - /etc/cron.deny
echo "************************************************************" >> output.txt
echo "5.1.8 Ensure cron is restricted to authorized users - /etc/cron.deny" >> output.txt
echo "************************************************************" >> output.txt
stat /etc/cron.deny >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 5.1.9 Ensure at is restricted to authorized users - /etc/at.allow
echo "************************************************************" >> output.txt
echo "5.1.9 Ensure at is restricted to authorized users - /etc/at.allow" >> output.txt
echo "************************************************************" >> output.txt
stat /etc/at.allow >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 5.1.9 Ensure at is restricted to authorized users - /etc/at.deny
echo "************************************************************" >> output.txt
echo "5.1.9 Ensure at is restricted to authorized users - /etc/at.deny" >> output.txt
echo "************************************************************" >> output.txt
stat /etc/at.deny >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 5.2.1 Ensure sudo is installed
echo "************************************************************" >> output.txt
echo "5.2.1 Ensure sudo is installed" >> output.txt
echo "************************************************************" >> output.txt
rpm -q sudo >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 5.2.2 Ensure sudo commands use pty
echo "************************************************************" >> output.txt
echo "5.2.2 Ensure sudo commands use pty" >> output.txt
echo "************************************************************" >> output.txt
grep -Ei '^\s*Defaults\s+([^#]\S+,\s*)?use_pty\b' /etc/sudoers /etc/sudoers.d/* >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 5.2.3 Ensure sudo log file exists
echo "************************************************************" >> output.txt
echo "5.2.3 Ensure sudo log file exists" >> output.txt
echo "************************************************************" >> output.txt
grep -Ei '^\s*Defaults\s+([^#;]+,\s*)?logfile\s*=\s*(")?[^#;]+(")?' /etc/sudoers /etc/sudoers.d/* >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 5.3.1 Ensure permissions on /etc/ssh/sshd_config are configured
echo "************************************************************" >> output.txt
echo "5.3.1 Ensure permissions on /etc/ssh/sshd_config are configured" >> output.txt
echo "************************************************************" >> output.txt
stat /etc/ssh/sshd_config >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 5.3.13 Ensure only strong Ciphers are used - weak ciphers
echo "************************************************************" >> output.txt
echo "5.3.13 Ensure only strong Ciphers are used - weak ciphers" >> output.txt
echo "************************************************************" >> output.txt
grep -Ei '^\s*ciphers\s+([^#]+,)?(3des-cbc|aes128-cbc|aes192-cbc|aes256-cbc|arcfour|arcfour128|arcfour256|blowfish-cbc|cast128-cbc|rijndael-cbc@lysator.liu.se)\b' /etc/ssh/sshd_config >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 5.3.14 Ensure only strong MAC algorithms are used - weak MACs
echo "************************************************************" >> output.txt
echo "5.3.14 Ensure only strong MAC algorithms are used - weak MACs" >> output.txt
echo "************************************************************" >> output.txt
grep -Ei '^\s*macs\s+([^#]+,)?(hmac-md5|hmac-md5-96|hmac-ripemd160|hmac-sha1|hmac-sha1-96|umac-64@openssh\.com|hmac-md5-etm@openssh\.com|hmac-md5-96-etm@openssh\.com|hmac-ripemd160-etm@openssh\.com|hmac-sha1-etm@openssh\.com|hmac-sha1-96-etm@openssh\.com|umac-64-etm@openssh\.com|umac-128-etm@openssh\.com)\b' /etc/ssh/sshd_config >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 5.3.15 Ensure only strong Key Exchange algorithms are used - weak algorithms
echo "************************************************************" >> output.txt
echo "5.3.15 Ensure only strong Key Exchange algorithms are used - weak algorithms" >> output.txt
echo "************************************************************" >> output.txt
grep -Ei '^\s*kexalgorithms\s+([^#]+,)?(diffie-hellman-group1-sha1|diffie-hellman-group14-sha1|diffie-hellman-group-exchange-sha1)\b' /etc/ssh/sshd_config >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 5.3.2 Ensure permissions on SSH private host key files are configured
echo "************************************************************" >> output.txt
echo "5.3.2 Ensure permissions on SSH private host key files are configured" >> output.txt
echo "************************************************************" >> output.txt
find /etc/ssh -xdev -type f -name 'ssh_host_*_key' -exec stat {} \; >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 5.3.3 Ensure permissions on SSH public host key files are configured
echo "************************************************************" >> output.txt
echo "5.3.3 Ensure permissions on SSH public host key files are configured" >> output.txt
echo "************************************************************" >> output.txt
find /etc/ssh -xdev -type f -name 'ssh_host_*_key.pub' -exec stat {} \; >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 5.4.1 Ensure password creation requirements are configured - dcredit
echo "************************************************************" >> output.txt
echo "5.4.1 Ensure password creation requirements are configured - dcredit" >> output.txt
echo "************************************************************" >> output.txt
grep -E '^\s*[duol]credit\s*' /etc/security/pwquality.conf >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 5.4.1 Ensure password creation requirements are configured - lcredit
echo "************************************************************" >> output.txt
echo "5.4.1 Ensure password creation requirements are configured - lcredit" >> output.txt
echo "************************************************************" >> output.txt
grep -E '^\s*[duol]credit\s*' /etc/security/pwquality.conf >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 5.4.1 Ensure password creation requirements are configured - minlen
echo "************************************************************" >> output.txt
echo "5.4.1 Ensure password creation requirements are configured - minlen" >> output.txt
echo "************************************************************" >> output.txt
grep '^\s*minlen\s*' /etc/security/pwquality.conf >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 5.4.1 Ensure password creation requirements are configured - ocredit
echo "************************************************************" >> output.txt
echo "5.4.1 Ensure password creation requirements are configured - ocredit" >> output.txt
echo "************************************************************" >> output.txt
grep -E '^\s*[duol]credit\s*' /etc/security/pwquality.conf >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 5.4.1 Ensure password creation requirements are configured - password-auth retry=3
echo "************************************************************" >> output.txt
echo "5.4.1 Ensure password creation requirements are configured - password-auth retry=3" >> output.txt
echo "************************************************************" >> output.txt
grep -P '^\s*password\s+(?:requisite|required)\s+pam_pwquality\.so\s+(?:\S+\s+)*(?!\2)(retry=[1-3]|try_first_pass)\s+(?:\S+\s+)*(?!\1)(retry=[1-3]|try_first_pass)\s*(?:\s+\S+\s*)*(?:\s+#.*)?$' /etc/pam.d/password-auth >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 5.4.1 Ensure password creation requirements are configured - password-auth try_first_pass
echo "************************************************************" >> output.txt
echo "5.4.1 Ensure password creation requirements are configured - password-auth try_first_pass" >> output.txt
echo "************************************************************" >> output.txt
grep -P '^\s*password\s+(?:requisite|required)\s+pam_pwquality\.so\s+(?:\S+\s+)*(?!\2)(retry=[1-3]|try_first_pass)\s+(?:\S+\s+)*(?!\1)(retry=[1-3]|try_first_pass)\s*(?:\s+\S+\s*)*(?:\s+#.*)?$' /etc/pam.d/password-auth >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 5.4.1 Ensure password creation requirements are configured - system-auth retry=3
echo "************************************************************" >> output.txt
echo "5.4.1 Ensure password creation requirements are configured - system-auth retry=3" >> output.txt
echo "************************************************************" >> output.txt
grep -P '^\s*password\s+(?:requisite|required)\s+pam_pwquality\.so\s+(?:\S+\s+)*(?!\2)(retry=[1-3]|try_first_pass)\s+(?:\S+\s+)*(?!\1)(retry=[1-3]|try_first_pass)\s*(?:\s+\S+\s*)*(?:\s+#.*)?$' /etc/pam.d/system-auth >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 5.4.1 Ensure password creation requirements are configured - system-auth try_first_pass
echo "************************************************************" >> output.txt
echo "5.4.1 Ensure password creation requirements are configured - system-auth try_first_pass" >> output.txt
echo "************************************************************" >> output.txt
grep -P '^\s*password\s+(?:requisite|required)\s+pam_pwquality\.so\s+(?:\S+\s+)*(?!\2)(retry=[1-3]|try_first_pass)\s+(?:\S+\s+)*(?!\1)(retry=[1-3]|try_first_pass)\s*(?:\s+\S+\s*)*(?:\s+#.*)?$' /etc/pam.d/system-auth >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 5.4.1 Ensure password creation requirements are configured - ucredit
echo "************************************************************" >> output.txt
echo "5.4.1 Ensure password creation requirements are configured - ucredit" >> output.txt
echo "************************************************************" >> output.txt
grep -E '^\s*[duol]credit\s*' /etc/security/pwquality.conf >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 5.4.2 Ensure lockout for failed password attempts is configured - password-auth
echo "************************************************************" >> output.txt
echo "5.4.2 Ensure lockout for failed password attempts is configured - password-auth" >> output.txt
echo "************************************************************" >> output.txt
grep -E '^\s*auth\s+\S+\s+pam_(tally2|unix)\.so' /etc/pam.d/system-auth /etc/pam.d/password-auth >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 5.4.2 Ensure lockout for failed password attempts is configured - password-auth 'auth sufficient pam_unix.so'
echo "************************************************************" >> output.txt
echo "5.4.2 Ensure lockout for failed password attempts is configured - password-auth 'auth sufficient pam_unix.so'" >> output.txt
echo "************************************************************" >> output.txt
grep -E '^\s*auth\s+\S+\s+pam_(faillock|unix)\.so' /etc/pam.d/system-auth /etc/pam.d/password-auth >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 5.4.2 Ensure lockout for failed password attempts is configured - system-auth
echo "************************************************************" >> output.txt
echo "5.4.2 Ensure lockout for failed password attempts is configured - system-auth" >> output.txt
echo "************************************************************" >> output.txt
grep -E '^\s*auth\s+\S+\s+pam_(tally2|unix)\.so' /etc/pam.d/system-auth /etc/pam.d/password-auth >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 5.4.2 Ensure lockout for failed password attempts is configured - system-auth 'auth sufficient pam_unix.so'
echo "************************************************************" >> output.txt
echo "5.4.2 Ensure lockout for failed password attempts is configured - system-auth 'auth sufficient pam_unix.so'" >> output.txt
echo "************************************************************" >> output.txt
grep -E '^\s*auth\s+\S+\s+pam_(faillock|unix)\.so' /etc/pam.d/system-auth /etc/pam.d/password-auth >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 5.4.3 Ensure password hashing algorithm is SHA-512 - password-auth
echo "************************************************************" >> output.txt
echo "5.4.3 Ensure password hashing algorithm is SHA-512 - password-auth" >> output.txt
echo "************************************************************" >> output.txt
grep -P '^\h*password\h+(sufficient|requisite|required)\h+pam_unix\.so\h+([^#\n\r]+)?sha512(\h+.*)?$' /etc/pam.d/system-auth /etc/pam.d/password-auth >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 5.4.3 Ensure password hashing algorithm is SHA-512 - system-auth
echo "************************************************************" >> output.txt
echo "5.4.3 Ensure password hashing algorithm is SHA-512 - system-auth" >> output.txt
echo "************************************************************" >> output.txt
grep -P '^\h*password\h+(sufficient|requisite|required)\h+pam_unix\.so\h+([^#\n\r]+)?sha512(\h+.*)?$' /etc/pam.d/system-auth /etc/pam.d/password-auth >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 5.4.4 Ensure password reuse is limited
echo "************************************************************" >> output.txt
echo "5.4.4 Ensure password reuse is limited" >> output.txt
echo "************************************************************" >> output.txt
grep -P '^\s*password\s+(requisite|required)\s+pam_pwhistory\.so\s+([^#]+\s+)*remember=([5-9]|[1-9][0-9]+)\b' /etc/pam.d/system-auth /etc/pam.d/password-auth >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 5.4.4 Ensure password reuse is limited - pam.unix.so
echo "************************************************************" >> output.txt
echo "5.4.4 Ensure password reuse is limited - pam.unix.so" >> output.txt
echo "************************************************************" >> output.txt
grep -P '^\s*password\s+(sufficient|requisite|required)\s+pam_unix\.so\s+([^#]+\s+)*remember=([5-9]|[1-9][0-9]+)\b' /etc/pam.d/system-auth /etc/pam.d/password-auth >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 5.5.1.1 Ensure password expiration is 365 days or less - login.defs
echo "************************************************************" >> output.txt
echo "5.5.1.1 Ensure password expiration is 365 days or less - login.defs" >> output.txt
echo "************************************************************" >> output.txt
grep ^\s*PASS_MAX_DAYS /etc/login.defs >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 5.5.1.1 Ensure password expiration is 365 days or less - users
echo "************************************************************" >> output.txt
echo "5.5.1.1 Ensure password expiration is 365 days or less - users" >> output.txt
echo "************************************************************" >> output.txt
grep -E '^[^:]+:[^!*]' /etc/shadow | cut -d: -f1,5 >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 5.5.1.2 Ensure minimum days between password changes is configured - /etc/login.defs
echo "************************************************************" >> output.txt
echo "5.5.1.2 Ensure minimum days between password changes is configured - /etc/login.defs" >> output.txt
echo "************************************************************" >> output.txt
grep ^\s*PASS_MIN_DAYS /etc/login.defs >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 5.5.1.2 Ensure minimum days between password changes is configured - /etc/shadow
echo "************************************************************" >> output.txt
echo "5.5.1.2 Ensure minimum days between password changes is configured - /etc/shadow" >> output.txt
echo "************************************************************" >> output.txt
grep -E ^[^:]+:[^\!*] /etc/shadow | cut -d: -f1,4 >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 5.5.1.3 Ensure password expiration warning days is 7 or more - login.defs
echo "************************************************************" >> output.txt
echo "5.5.1.3 Ensure password expiration warning days is 7 or more - login.defs" >> output.txt
echo "************************************************************" >> output.txt
grep ^\s*PASS_WARN_AGE /etc/login.defs >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 5.5.1.3 Ensure password expiration warning days is 7 or more - users
echo "************************************************************" >> output.txt
echo "5.5.1.3 Ensure password expiration warning days is 7 or more - users" >> output.txt
echo "************************************************************" >> output.txt
grep -E ^[^:]+:[^\!*] /etc/shadow | cut -d: -f1,6 >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 5.5.1.4 Ensure inactive password lock is 30 days or less - /etc/default/useradd
echo "************************************************************" >> output.txt
echo "5.5.1.4 Ensure inactive password lock is 30 days or less - /etc/default/useradd" >> output.txt
echo "************************************************************" >> output.txt
useradd -D | grep INACTIVE >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 5.5.1.4 Ensure inactive password lock is 30 days or less - users
echo "************************************************************" >> output.txt
echo "5.5.1.4 Ensure inactive password lock is 30 days or less - users" >> output.txt
echo "************************************************************" >> output.txt
grep -E ^[^:]+:[^\!*] /etc/shadow | cut -d: -f1,7 >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 5.5.1.5 Ensure all users last password change date is in the past
echo "************************************************************" >> output.txt
echo "5.5.1.5 Ensure all users last password change date is in the past" >> output.txt
echo "************************************************************" >> output.txt
for usr in $(cut -d: -f1 /etc/shadow); do [[ $(chage --list $usr | grep '^Last password change' | cut -d: -f2) > $(date) ]] && echo "$usr :$(chage --list $usr | grep '^Last password change' | cut -d: -f2)"; done >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 5.5.3 Ensure default group for the root account is GID 0
echo "************************************************************" >> output.txt
echo "5.5.3 Ensure default group for the root account is GID 0" >> output.txt
echo "************************************************************" >> output.txt
grep "^root:" /etc/passwd | cut -f4 -d: >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 5.6 Ensure root login is restricted to system console
echo "************************************************************" >> output.txt
echo "5.6 Ensure root login is restricted to system console" >> output.txt
echo "************************************************************" >> output.txt
/etc/securetty >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 5.7 Ensure access to the su command is restricted
echo "************************************************************" >> output.txt
echo "5.7 Ensure access to the su command is restricted" >> output.txt
echo "************************************************************" >> output.txt
(grep -Pi '^\h*auth\h+(?:required|requisite)\h+pam_wheel\.so\h+(?:[^#\n\r]+\h+)?((?!\2)(use_uid\b|group=\H+\b))\h+(?:[^#\n\r]+\h+)?((?!\1)(use_uid\b|group=\H+\b))(\h+.*)?$' /etc/pam.d/su ; grep <group_name> /etc/group) >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 6.1.1 Audit system file permissions
echo "************************************************************" >> output.txt
echo "6.1.1 Audit system file permissions" >> output.txt
echo "************************************************************" >> output.txt
rpm -Va --nomtime --nosize --nomd5 --nolinkto | grep -vw c >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 6.1.2 Ensure permissions on /etc/passwd are configured
echo "************************************************************" >> output.txt
echo "6.1.2 Ensure permissions on /etc/passwd are configured" >> output.txt
echo "************************************************************" >> output.txt
stat /etc/passwd >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 6.1.3 Ensure permissions on /etc/passwd- are configured
echo "************************************************************" >> output.txt
echo "6.1.3 Ensure permissions on /etc/passwd- are configured" >> output.txt
echo "************************************************************" >> output.txt
stat /etc/passwd- >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 6.1.4 Ensure permissions on /etc/shadow are configured
echo "************************************************************" >> output.txt
echo "6.1.4 Ensure permissions on /etc/shadow are configured" >> output.txt
echo "************************************************************" >> output.txt
stat /etc/shadow >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 6.1.5 Ensure permissions on /etc/shadow- are configured
echo "************************************************************" >> output.txt
echo "6.1.5 Ensure permissions on /etc/shadow- are configured" >> output.txt
echo "************************************************************" >> output.txt
stat /etc/shadow- >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 6.1.6 Ensure permissions on /etc/gshadow- are configured
echo "************************************************************" >> output.txt
echo "6.1.6 Ensure permissions on /etc/gshadow- are configured" >> output.txt
echo "************************************************************" >> output.txt
stat /etc/gshadow- >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 6.1.7 Ensure permissions on /etc/gshadow are configured
echo "************************************************************" >> output.txt
echo "6.1.7 Ensure permissions on /etc/gshadow are configured" >> output.txt
echo "************************************************************" >> output.txt
stat /etc/gshadow >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 6.1.8 Ensure permissions on /etc/group are configured
echo "************************************************************" >> output.txt
echo "6.1.8 Ensure permissions on /etc/group are configured" >> output.txt
echo "************************************************************" >> output.txt
stat /etc/group >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 6.1.9 Ensure permissions on /etc/group- are configured
echo "************************************************************" >> output.txt
echo "6.1.9 Ensure permissions on /etc/group- are configured" >> output.txt
echo "************************************************************" >> output.txt
stat /etc/group- >> output.txt  2>&1
echo $'\n \n' >> output.txt

# 1.1.22 Ensure sticky bit is set on all world-writable directories
echo "************************************************************" >> output.txt
echo "1.1.22 Ensure sticky bit is set on all world-writable directories" >> output.txt
echo "************************************************************" >> output.txt
df --local -P 2> /dev/null | awk '{if (NR!=1) print $6}' | xargs -I '{}' find '{}' -xdev -type d \( -perm -0002 -a ! -perm -1000 \) 2>/dev/null >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 1.8.2 Ensure GDM login banner is configured - banner message enabled
echo "************************************************************" >> output.txt
echo "1.8.2 Ensure GDM login banner is configured - banner message enabled" >> output.txt
echo "************************************************************" >> output.txt
grep -E '^[\s]*banner-message-enable[\s]*=[\s]*true' /etc/dconf/db/gdm.d/* | awk '{print} END {if (NR != 0) print "pass" ; else print "fail"}' >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 1.8.2 Ensure GDM login banner is configured - banner message text
echo "************************************************************" >> output.txt
echo "1.8.2 Ensure GDM login banner is configured - banner message text" >> output.txt
echo "************************************************************" >> output.txt
grep -E '^[\s]*banner-message-text[\s]*=[\s]*.Authorized uses only. All activity may be monitored and reported..' /etc/dconf/db/gdm.d/* | awk '{print} END {if (NR != 0) print "pass" ; else print "fail"}' >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 1.8.2 Ensure GDM login banner is configured - file-db
echo "************************************************************" >> output.txt
echo "1.8.2 Ensure GDM login banner is configured - file-db" >> output.txt
echo "************************************************************" >> output.txt
grep -E '^[\s]*file-db[\s]*:' /etc/dconf/profile/gdm | awk '{print} END {if (NR != 0) print "pass" ; else print "fail"}' >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 1.8.2 Ensure GDM login banner is configured - system-db:gdm
echo "************************************************************" >> output.txt
echo "1.8.2 Ensure GDM login banner is configured - system-db:gdm" >> output.txt
echo "************************************************************" >> output.txt
grep -E '^[\s]*system-db[\s]*:' /etc/dconf/profile/gdm | awk '{print} END {if (NR != 0) print "pass" ; else print "fail"}' >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 1.8.2 Ensure GDM login banner is configured - user-db:user
echo "************************************************************" >> output.txt
echo "1.8.2 Ensure GDM login banner is configured - user-db:user" >> output.txt
echo "************************************************************" >> output.txt
grep -E '^[\s]*user-db[\s]*:' /etc/dconf/profile/gdm | awk '{print} END {if (NR != 0) print "pass" ; else print "fail"}' >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 1.8.3 Ensure last logged in user display is disabled - disable user list
echo "************************************************************" >> output.txt
echo "1.8.3 Ensure last logged in user display is disabled - disable user list" >> output.txt
echo "************************************************************" >> output.txt
grep -E '^[\s]*disable-user-list[\s]*=[\s]*true' /etc/dconf/db/gdm.d/* | awk '{print} END {if (NR != 0) print "pass" ; else print "fail"}' >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 1.8.3 Ensure last logged in user display is disabled - file-db
echo "************************************************************" >> output.txt
echo "1.8.3 Ensure last logged in user display is disabled - file-db" >> output.txt
echo "************************************************************" >> output.txt
grep -E '^[\s]*file-db[\s]*:' /etc/dconf/profile/gdm | awk '{print} END {if (NR != 0) print "pass" ; else print "fail"}' >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 1.8.3 Ensure last logged in user display is disabled - system-db:gdm
echo "************************************************************" >> output.txt
echo "1.8.3 Ensure last logged in user display is disabled - system-db:gdm" >> output.txt
echo "************************************************************" >> output.txt
grep -E '^[\s]*system-db[\s]*:' /etc/dconf/profile/gdm | awk '{print} END {if (NR != 0) print "pass" ; else print "fail"}' >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 1.8.3 Ensure last logged in user display is disabled - user-db:user
echo "************************************************************" >> output.txt
echo "1.8.3 Ensure last logged in user display is disabled - user-db:user" >> output.txt
echo "************************************************************" >> output.txt
grep -E '^[\s]*user-db[\s]*:' /etc/dconf/profile/gdm | awk '{print} END {if (NR != 0) print "pass" ; else print "fail"}' >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 3.5.1.6 Ensure network interfaces are assigned to appropriate zone
echo "************************************************************" >> output.txt
echo "3.5.1.6 Ensure network interfaces are assigned to appropriate zone" >> output.txt
echo "************************************************************" >> output.txt
find /sys/class/net/* -maxdepth 1 | awk -F"/" '{print $NF}' | while read -r netint; do [ "$netint" != "lo" ] && firewall-cmd --get-active-zones | grep -B1 $netint; done >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 3.5.1.7 Ensure firewalld drops unnecessary services and ports
echo "************************************************************" >> output.txt
echo "3.5.1.7 Ensure firewalld drops unnecessary services and ports" >> output.txt
echo "************************************************************" >> output.txt
firewall-cmd --get-active-zones | awk '!/:/ {print $1}' | while read ZN; do firewall-cmd --list-all --zone=$ZN; done >> output.txt  2>&1
echo $'\n \n' >> output.txt

# # 3.5.2.11 Ensure nftables rules are permanent
# echo "************************************************************" >> output.txt
# echo "3.5.2.11 Ensure nftables rules are permanent" >> output.txt
# echo "************************************************************" >> output.txt
# awk '/hook input/,/}/' $(awk '$1 ~ /^\s*include/ { gsub("\"","",$2);print $2 }' /etc/sysconfig/nftables.conf) >> output.txt  2>&1
# echo $'\n \n' >> output.txt
# # 3.5.2.11 Ensure nftables rules are permanent - basechain
# echo "************************************************************" >> output.txt
# echo "3.5.2.11 Ensure nftables rules are permanent - basechain" >> output.txt
# echo "************************************************************" >> output.txt
# awk '/hook forward/,/}/' $(awk '$1 ~ /^\s*include/ { gsub("\"","",$2);print $2 }' /etc/sysconfig/nftables.conf) >> output.txt  2>&1
# echo $'\n \n' >> output.txt

# 3.5.2.7 Ensure nftables loopback traffic is configured - iif lo
echo "************************************************************" >> output.txt
echo "3.5.2.7 Ensure nftables loopback traffic is configured - iif lo" >> output.txt
echo "************************************************************" >> output.txt
nft list ruleset | awk '/hook input/,/}/' | grep 'iif "lo" accept' >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 3.5.2.7 Ensure nftables loopback traffic is configured - ip saddr
echo "************************************************************" >> output.txt
echo "3.5.2.7 Ensure nftables loopback traffic is configured - ip saddr" >> output.txt
echo "************************************************************" >> output.txt
nft list ruleset | awk '/hook input/,/}/' | grep 'ip saddr' >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 3.5.2.7 Ensure nftables loopback traffic is configured - ip6 saddr
echo "************************************************************" >> output.txt
echo "3.5.2.7 Ensure nftables loopback traffic is configured - ip6 saddr" >> output.txt
echo "************************************************************" >> output.txt
nft list ruleset | awk '/hook input/,/}/' | grep 'ip6 saddr' >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 3.5.2.8 Ensure nftables outbound and established connections are configured - input
echo "************************************************************" >> output.txt
echo "3.5.2.8 Ensure nftables outbound and established connections are configured - input" >> output.txt
echo "************************************************************" >> output.txt
nft list ruleset | awk '/hook input/,/}/' | grep -E 'ip protocol (tcp|udp|icmp) ct state' >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 3.5.2.8 Ensure nftables outbound and established connections are configured - output
echo "************************************************************" >> output.txt
echo "3.5.2.8 Ensure nftables outbound and established connections are configured - output" >> output.txt
echo "************************************************************" >> output.txt
nft list ruleset | awk '/hook output/,/}/' | grep -E 'ip protocol (tcp|udp|icmp) ct state' >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 4.1.11 Ensure use of privileged commands is collected
echo "************************************************************" >> output.txt
echo "4.1.11 Ensure use of privileged commands is collected" >> output.txt
echo "************************************************************" >> output.txt
(find <partition> -xdev \( -perm -4000 -o -perm -2000 \) -type f | awk '{print "-a always,exit -F path=" $1 " -F perm=x -F auid>='"$(awk '/^\s*UID_MIN/{print $2}' /etc/login.defs)"' -F auid!=4294967295 -k privileged" }' ; UIDMINVAL=$(/bin/awk '/^\s*UID_MIN/{print $2}' /etc/login.defs);IFS=$'\n'; LINES=$(find / -xdev \( -perm -4000 -o -perm -2000 \) -type f); for LINE in $LINES; do LINE="-a always,exit -F path=$LINE -F perm=x -F auid>=$UIDMINVAL -F auid!=4294967295 -k privileged"; if [ $(/bin/egrep -- "^$LINE" /etc/audit/audit.rules | wc -l) -eq 1 ] ; then echo "pass: found $LINE"; else echo "$LINE - not found in /etc/audit/audit.rules"; fi; done) >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 4.1.11 Ensure use of privileged commands is collected - auditctl
echo "************************************************************" >> output.txt
echo "4.1.11 Ensure use of privileged commands is collected - auditctl" >> output.txt
echo "************************************************************" >> output.txt
(find <partition> -xdev \( -perm -4000 -o -perm -2000 \) -type f | awk '{print "-a always,exit -F path=" $1 " -F perm=x -F auid>='"$(awk '/^\s*UID_MIN/{print $2}' /etc/login.defs)"' -F auid!=4294967295 -k privileged" }' ; UIDMINVAL=$(/bin/awk '/^s*UID_MIN/{print $2}' /etc/login.defs);IFS=$'\n'; LINES=$(find / -xdev \( -perm -4000 -o -perm -2000 \) -type f); for LINE in $LINES; do LINE="-a always,exit -S all -F path=$LINE -F perm=x -F auid>=$UIDMINVAL -F auid!=-1 -F key=privileged"; if [ $(/sbin/auditctl -l | /bin/egrep -- "^$LINE" | wc -l) -eq 1 ] ; then echo "pass: found $LINE"; else "$LINE - not found in output of auditctl -l"; fi; done) >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 4.1.14 Ensure changes to system administration scope (sudoers) is collected - auditctl sudoers.d
echo "************************************************************" >> output.txt
echo "4.1.14 Ensure changes to system administration scope (sudoers) is collected - auditctl sudoers.d" >> output.txt
echo "************************************************************" >> output.txt
auditctl -l | grep scope >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 4.2.4 Ensure logrotate is configured
echo "************************************************************" >> output.txt
echo "4.2.4 Ensure logrotate is configured" >> output.txt
echo "************************************************************" >> output.txt
OUTPUT=$(ls -l /var/log); /usr/bin/find /var/log -type f -perm g+wx,o+rwx -ls | /bin/awk -v awkvar="${OUTPUT}" '{print} END {if (NR == 0) print awkvar "\npass" ; else print "fail"}' >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 5.3.10 Ensure SSH root login is disabled
echo "************************************************************" >> output.txt
echo "5.3.10 Ensure SSH root login is disabled" >> output.txt
echo "************************************************************" >> output.txt
sshd -T -C user=root -C host="$(hostname)" -C addr="$(grep $(hostname) /etc/hosts | awk '{print $1}')" | grep permitrootlogin >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 5.3.11 Ensure SSH PermitEmptyPasswords is disabled
echo "************************************************************" >> output.txt
echo "5.3.11 Ensure SSH PermitEmptyPasswords is disabled" >> output.txt
echo "************************************************************" >> output.txt
sshd -T -C user=root -C host="$(hostname)" -C addr="$(grep $(hostname) /etc/hosts | awk '{print $1}')" | grep permitemptypasswords >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 5.3.12 Ensure SSH PermitUserEnvironment is disabled
echo "************************************************************" >> output.txt
echo "5.3.12 Ensure SSH PermitUserEnvironment is disabled" >> output.txt
echo "************************************************************" >> output.txt
sshd -T -C user=root -C host="$(hostname)" -C addr="$(grep $(hostname) /etc/hosts | awk '{print $1}')" | grep permituserenvironment >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 5.3.13 Ensure only strong Ciphers are used - approved ciphers
echo "************************************************************" >> output.txt
echo "5.3.13 Ensure only strong Ciphers are used - approved ciphers" >> output.txt
echo "************************************************************" >> output.txt
sshd -T -C user=root -C host="$(hostname)" -C addr="$(grep $(hostname) /etc/hosts | awk '{print $1}')" | grep -Ei '^\s*ciphers\s+([^#]+,)?(3des-cbc|aes128-cbc|aes192-cbc|aes256-cbc|arcfour|arcfour128|arcfour256|blowfish-cbc|cast128-cbc|rijndael-cbc@lysator.liu.se)\b' >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 5.3.14 Ensure only strong MAC algorithms are used - approved MACs
echo "************************************************************" >> output.txt
echo "5.3.14 Ensure only strong MAC algorithms are used - approved MACs" >> output.txt
echo "************************************************************" >> output.txt
sshd -T -C user=root -C host="$(hostname)" -C addr="$(grep $(hostname) /etc/hosts | awk '{print $1}')" | grep -Ei '^\s*macs\s+([^#]+,)?(hmac-md5|hmac-md5-96|hmac-ripemd160|hmac-sha1|hmac-sha1-96|umac-64@openssh\.com|hmac-md5-etm@openssh\.com|hmac-md5-96-etm@openssh\.com|hmac-ripemd160-etm@openssh\.com|hmac-sha1-etm@openssh\.com|hmac-sha1-96-etm@openssh\.com|umac-64-etm@openssh\.com|umac-128-etm@openssh\.com)\b' >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 5.3.15 Ensure only strong Key Exchange algorithms are used - approved algorithms
echo "************************************************************" >> output.txt
echo "5.3.15 Ensure only strong Key Exchange algorithms are used - approved algorithms" >> output.txt
echo "************************************************************" >> output.txt
sshd -T -C user=root -C host="$(hostname)" -C addr="$(grep $(hostname) /etc/hosts | awk '{print $1}')" | grep -Ei '^\s*kexalgorithms\s+([^#]+,)?(diffie-hellman-group1-sha1|diffie-hellman-group14-sha1|diffie-hellman-group-exchange-sha1)\b' >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 5.3.16 Ensure SSH Idle Timeout Interval is configured - ClientAliveCountMax
echo "************************************************************" >> output.txt
echo "5.3.16 Ensure SSH Idle Timeout Interval is configured - ClientAliveCountMax" >> output.txt
echo "************************************************************" >> output.txt
sshd -T -C user=root -C host="$(hostname)" -C addr="$(grep $(hostname) /etc/hosts | awk '{print $1}')" | grep clientalivecountmax >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 5.3.16 Ensure SSH Idle Timeout Interval is configured - ClientAliveInterval
echo "************************************************************" >> output.txt
echo "5.3.16 Ensure SSH Idle Timeout Interval is configured - ClientAliveInterval" >> output.txt
echo "************************************************************" >> output.txt
sshd -T -C user=root -C host="$(hostname)" -C addr="$(grep $(hostname) /etc/hosts | awk '{print $1}')" | grep clientaliveinterval >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 5.3.17 Ensure SSH LoginGraceTime is set to one minute or less
echo "************************************************************" >> output.txt
echo "5.3.17 Ensure SSH LoginGraceTime is set to one minute or less" >> output.txt
echo "************************************************************" >> output.txt
sshd -T -C user=root -C host="$(hostname)" -C addr="$(grep $(hostname) /etc/hosts | awk '{print $1}')" | grep logingracetime >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 5.3.18 Ensure SSH warning banner is configured
echo "************************************************************" >> output.txt
echo "5.3.18 Ensure SSH warning banner is configured" >> output.txt
echo "************************************************************" >> output.txt
sshd -T -C user=root -C host="$(hostname)" -C addr="$(grep $(hostname) /etc/hosts | awk '{print $1}')" | grep banner >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 5.3.19 Ensure SSH PAM is enabled
echo "************************************************************" >> output.txt
echo "5.3.19 Ensure SSH PAM is enabled" >> output.txt
echo "************************************************************" >> output.txt
sshd -T -C user=root -C host="$(hostname)" -C addr="$(grep $(hostname) /etc/hosts | awk '{print $1}')" | grep -i usepam >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 5.3.20 Ensure SSH AllowTcpForwarding is disabled
echo "************************************************************" >> output.txt
echo "5.3.20 Ensure SSH AllowTcpForwarding is disabled" >> output.txt
echo "************************************************************" >> output.txt
sshd -T -C user=root -C host="$(hostname)" -C addr="$(grep $(hostname) /etc/hosts | awk '{print $1}')" | grep -i allowtcpforwarding >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 5.3.21 Ensure SSH MaxStartups is configured
echo "************************************************************" >> output.txt
echo "5.3.21 Ensure SSH MaxStartups is configured" >> output.txt
echo "************************************************************" >> output.txt
sshd -T -C user=root -C host="$(hostname)" -C addr="$(grep $(hostname) /etc/hosts | awk '{print $1}')" | grep -i maxstartups >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 5.3.22 Ensure SSH MaxSessions is limited
echo "************************************************************" >> output.txt
echo "5.3.22 Ensure SSH MaxSessions is limited" >> output.txt
echo "************************************************************" >> output.txt
sshd -T -C user=root -C host="$(hostname)" -C addr="$(grep $(hostname) /etc/hosts | awk '{print $1}')" | grep -i maxsessions >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 5.3.4 Ensure SSH access is limited
echo "************************************************************" >> output.txt
echo "5.3.4 Ensure SSH access is limited" >> output.txt
echo "************************************************************" >> output.txt
(sshd -T -C user=root -C host="$(hostname)" -C addr="$(grep $(hostname) /etc/hosts | awk '{print $1}')" | grep -Pi '^\h*(allow|deny)(users|groups)\h+\H+(\h+.*)?$' ; grep -Pi '^\h*(allow|deny)(users|groups)\h+\H+(\h+.*)?$' /etc/ssh/sshd_config) >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 5.3.5 Ensure SSH LogLevel is appropriate
echo "************************************************************" >> output.txt
echo "5.3.5 Ensure SSH LogLevel is appropriate" >> output.txt
echo "************************************************************" >> output.txt
sshd -T -C user=root -C host="$(hostname)" -C addr="$(grep $(hostname) /etc/hosts | awk '{print $1}')" | grep loglevel >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 5.3.6 Ensure SSH X11 forwarding is disabled
echo "************************************************************" >> output.txt
echo "5.3.6 Ensure SSH X11 forwarding is disabled" >> output.txt
echo "************************************************************" >> output.txt
sshd -T -C user=root -C host="$(hostname)" -C addr="$(grep $(hostname) /etc/hosts | awk '{print $1}')" | grep -i x11forwarding >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 5.3.7 Ensure SSH MaxAuthTries is set to 4 or less
echo "************************************************************" >> output.txt
echo "5.3.7 Ensure SSH MaxAuthTries is set to 4 or less" >> output.txt
echo "************************************************************" >> output.txt
sshd -T -C user=root -C host="$(hostname)" -C addr="$(grep $(hostname) /etc/hosts | awk '{print $1}')" | grep maxauthtries >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 5.3.8 Ensure SSH IgnoreRhosts is enabled
echo "************************************************************" >> output.txt
echo "5.3.8 Ensure SSH IgnoreRhosts is enabled" >> output.txt
echo "************************************************************" >> output.txt
sshd -T -C user=root -C host="$(hostname)" -C addr="$(grep $(hostname) /etc/hosts | awk '{print $1}')" | grep ignorerhosts >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 5.3.9 Ensure SSH HostbasedAuthentication is disabled
echo "************************************************************" >> output.txt
echo "5.3.9 Ensure SSH HostbasedAuthentication is disabled" >> output.txt
echo "************************************************************" >> output.txt
sshd -T -C user=root -C host="$(hostname)" -C addr="$(grep $(hostname) /etc/hosts | awk '{print $1}')" | grep hostbasedauthentication >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 5.5.2 Ensure system accounts are secured - non-login shell
echo "************************************************************" >> output.txt
echo "5.5.2 Ensure system accounts are secured - non-login shell" >> output.txt
echo "************************************************************" >> output.txt
awk -F: '($1!="root" && $1!="sync" && $1!="shutdown" && $1!="halt" && $1!~/^\+/ && $3<'"$(awk '/^\s*UID_MIN/{print $2}' /etc/login.defs)"' && $7!="'"$(which nologin)"'" && $7!="/bin/false") {print}' /etc/passwd >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 5.5.2 Ensure system accounts are secured - unlocked non-root
echo "************************************************************" >> output.txt
echo "5.5.2 Ensure system accounts are secured - unlocked non-root" >> output.txt
echo "************************************************************" >> output.txt
awk -F: '($1!="root" && $1!~/^\+/ && $3<'"$(awk '/^\s*UID_MIN/{print $2}' /etc/login.defs)"') {print $1}' /etc/passwd | xargs -I '{}' passwd -S '{}' | awk '($2!="L" && $2!="LK") {print $1}' >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 6.1.10 Ensure no world writable files exist
echo "************************************************************" >> output.txt
echo "6.1.10 Ensure no world writable files exist" >> output.txt
echo "************************************************************" >> output.txt
df --local -P | awk '{if (NR!=1) print $6}' | xargs -I '{}' find '{}' -xdev -type f -perm -0002 >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 6.1.11 Ensure no unowned files or directories exist
echo "************************************************************" >> output.txt
echo "6.1.11 Ensure no unowned files or directories exist" >> output.txt
echo "************************************************************" >> output.txt
df --local -P | awk {'if (NR!=1) print $6'} | xargs -I '{}' find '{}' -xdev -nouser >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 6.1.12 Ensure no ungrouped files or directories exist
echo "************************************************************" >> output.txt
echo "6.1.12 Ensure no ungrouped files or directories exist" >> output.txt
echo "************************************************************" >> output.txt
df --local -P | awk '{if (NR!=1) print $6}' | xargs -I '{}' find '{}' -xdev -nogroup >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 6.1.13 Audit SUID executables
echo "************************************************************" >> output.txt
echo "6.1.13 Audit SUID executables" >> output.txt
echo "************************************************************" >> output.txt
df --local -P | awk '{if (NR!=1) print $6}' | xargs -I '{}' find '{}' -xdev -type f -perm -4000 >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 6.1.14 Audit SGID executables
echo "************************************************************" >> output.txt
echo "6.1.14 Audit SGID executables" >> output.txt
echo "************************************************************" >> output.txt
df --local -P | awk '{if (NR!=1) print $6}' | xargs -I '{}' find '{}' -xdev -type f -perm -2000 >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 6.2.1 Ensure accounts in /etc/passwd use shadowed passwords
echo "************************************************************" >> output.txt
echo "6.2.1 Ensure accounts in /etc/passwd use shadowed passwords" >> output.txt
echo "************************************************************" >> output.txt
awk -F: '($2 != "x" ) { print $1 " is not set to shadowed passwords "}' /etc/passwd >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 6.2.2 Ensure /etc/shadow password fields are not empty
echo "************************************************************" >> output.txt
echo "6.2.2 Ensure /etc/shadow password fields are not empty" >> output.txt
echo "************************************************************" >> output.txt
awk -F: '($2 == "" ) { print $1 " does not have a password "}' /etc/shadow >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 6.2.4 Ensure shadow group is empty - /etc/group
echo "************************************************************" >> output.txt
echo "6.2.4 Ensure shadow group is empty - /etc/group" >> output.txt
echo "************************************************************" >> output.txt
(awk -F: '($1=="shadow") {print $NF}' /etc/group ; awk -F: -v GID="$(awk -F: '($1=="shadow") {print $3}' /etc/group)" '($4==GID) {print $1}' /etc/passwd) >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 6.2.4 Ensure shadow group is empty - /etc/passwd
echo "************************************************************" >> output.txt
echo "6.2.4 Ensure shadow group is empty - /etc/passwd" >> output.txt
echo "************************************************************" >> output.txt
awk -F: -v GID="$(awk -F: '($1=="shadow") {print $3}' /etc/group)" '($4==GID) {print $1}' /etc/passwd >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 6.2.4 Ensure shadow group is empty - /etc/shadow
echo "************************************************************" >> output.txt
echo "6.2.4 Ensure shadow group is empty - /etc/shadow" >> output.txt
echo "************************************************************" >> output.txt
awk -F: -v GID="$(awk -F: '($1=="shadow") {print $3}' /etc/group)" '($4==GID) {print $1}' /etc/passwd >> output.txt  2>&1
echo $'\n \n' >> output.txt
# 6.2.9 Ensure root is the only UID 0 account
echo "************************************************************" >> output.txt
echo "6.2.9 Ensure root is the only UID 0 account" >> output.txt
echo "************************************************************" >> output.txt
awk -F: '($3 == 0) { print $1 }' /etc/passwd >> output.txt  2>&1
echo $'\n \n' >> output.txt

removable_exec(){
#!/usr/bin/bash 
for rmpo in $(lsblk -o RM,MOUNTPOINT | awk -F " " '/ 1 / {print $2}'); do findmnt -n "$rmpo" | grep -Ev "\bnoexec\b" >>  output.txt
done
}



# 1.1.19 Ensure removable media partitions include noexec option
echo "1.1.19 Ensure removable media partitions include noexec option" >> output.txt
echo "************************************************************" >> output.txt
removable_exec
echo $'\n \n' >> output.txt



removable_nodev(){
#!/usr/bin/bash 
for rmpo in $(lsblk -o RM,MOUNTPOINT | awk -F " " '/ 1 / {print $2}'); do findmnt -n "$rmpo" | grep -Ev "\bnodev\b" 
done
}


# 1.1.20 Ensure nodev option set on removable media partitions
echo "1.1.20 Ensure nodev option set on removable media partitions" >> output.txt
echo "************************************************************" >> output.txt
removable_nodev >> output.txt  2>&1
echo $'\n \n' >> output.txt

removable_nosuid(){
#!/usr/bin/bash 
for rmpo in $(lsblk -o RM,MOUNTPOINT | awk -F " " '/ 1 / {print $2}'); do findmnt -n "$rmpo" | grep -Ev "\bnosuid\b" 
done
}


# 1.1.21 Ensure nosuid option set on removable media partitions
echo "1.1.21 Ensure nosuid option set on removable media partitions" >> output.txt
echo "************************************************************" >> output.txt
removable_nosuid >> output.txt  2>&1
echo $'\n \n' >> output.txt

bootloaderPW_set(){
#!/bin/bash 
tst1="" tst2="" output="" 
efidir=$(find /boot/efi/EFI/* -type d -not -name 'BOOT') 
gbdir=$(find /boot -maxdepth 1 -type d -name 'grub*') 
if [ -f "$efidir"/grub.cfg ]; then 
grubdir="$efidir" && grubfile="$efidir/grub.cfg" 
elif [ -f "$gbdir"/grub.cfg ]; then 
grubdir="$gbdir" && grubfile="$gbdir/grub.cfg" 
fi 
userfile="$grubdir/user.cfg" 
[ -f "$userfile" ] && grep -Pq '^\h*GRUB2_PASSWORD\h*=\h*.+$' "$userfile" && 
output="\n PASSED: bootloader password set in \"$userfile\"\n\n" 
if [ -z "$output" ] && [ -f "$grubfile" ]; then 
grep -Piq '^\h*set\h+superusers\h*=\h*"?[^"\n\r]+"?(\h+.*)?$' "$grubfile" && tst1=pass grep -Piq '^\h*password\h+\H+\h+.+$' "$grubfile" && tst2=pass 
[ "$tst1" = pass ] && [ "$tst2" = pass ] && output="\n\n*** PASSED: bootloader password set in \"$grubfile\" ***\n\n" 
fi 
[ -n "$output" ] && echo -e "$output" || echo -e "\n\n *** FAILED: bootloader password is not set ***\n\n"

}


# 1.4.1 Ensure bootloader password is set
echo "1.4.1 Ensure bootloader password is set" >> output.txt
echo "************************************************************" >> output.txt
bootloaderPW_set >> output.txt  2>&1
echo $'\n \n' >> output.txt


bootloader_config(){
#!/bin/bash tst1="" tst2="" tst3="" tst4="" test1="" test2="" efidir="" gbdir="" 
grubdir="" grubfile="" userfile=""
 efidir=$(find /boot/efi/EFI/* -type d -not -name 'BOOT') 
gbdir=$(find /boot -maxdepth 1 -type d -name 'grub*') 
for file in "$efidir"/grub.cfg "$efidir"/grub.conf; do 
[ -f "$file" ] && grubdir="$efidir" && grubfile=$file 
done 
if [ -z "$grubdir" ]; then 
for file in "$gbdir"/grub.cfg "$gbdir"/grub.conf; do 
[ -f "$file" ] && grubdir="$gbdir" && grubfile=$file 
done 
fi 
userfile="$grubdir/user.cfg" 
stat -c "%a" "$grubfile" | grep -Pq '^\h*[0-7]00$' && tst1=pass 
output="Permissions on \"$grubfile\" are \"$(stat -c "%a" "$grubfile")\""
stat -c "%u:%g" "$grubfile" | grep -Pq '^\h*0:0$' && tst2=pass 
output2="\"$grubfile\" is owned by \"$(stat -c "%U" "$grubfile")\" and 
belongs to group \"$(stat -c "%G" "$grubfile")\"" 
[ "$tst1" = pass ] && [ "$tst2" = pass ] && test1=pass 
if [ -f "$userfile" ]; then 
stat -c "%a" "$userfile" | grep -Pq '^\h*[0-7]00$' && tst3=pass 
output3="Permissions on \"$userfile\" are \"$(stat -c "%a" "$userfile")\"" 
stat -c "%u:%g" "$userfile" | grep -Pq '^\h*0:0$' && tst4=pass output4="\"$userfile\" is owned by \"$(stat -c "%U" "$userfile")\" and belongs to group \"$(stat -c "%G" "$userfile")\"" [ "$tst3" = pass ] && [ "$tst4" = pass ] && test2=pass else test2=pass 
fi 
[ "$test1" = pass ] && [ "$test2" = pass ] && passing=true 
# If passing is true we pass 
if [ "$passing" = true ] ; then 
echo "PASSED:" 
echo "$output" 
echo "$output2" [ -n "$output3" ] && echo "$output3" [ -n "$output4" ] && echo "$output4" 
else 
# print the reason why we are failing 
echo "FAILED:" 
echo "$output" 
echo "$output2" 
[ -n "$output3" ] && echo "$output3" 
[ -n "$output4" ] && echo "$output4" 
fi


}

# 1.4.2 Ensure permissions on bootloader config are configured - grub.cfg / user.cfg
echo "1.4.2 Ensure permissions on bootloader config are configured - grub.cfg" >> output.txt
echo "************************************************************" >> output.txt
bootloader_config >> output.txt  2>&1
echo $'\n \n' >> output.txt

selinux_bootloader(){

#!/bin/bash
# IF check passes return PASSED
efidir=$(find /boot/efi/EFI/* -type d -not -name 'BOOT')
gbdir=$(find /boot -maxdepth 1 -type d -name 'grub*')
if [ -f "$efidir"/grub.cfg ]; then
grep "^\s*linux" "$efidir"/grub.cfg | grep -Eq "(selinux=0|enforcing=0)" && echo "FAILED: \"$()\" exists" || echo "PASSED"
elif [ -f "$gbdir"/grub.cfg ]; then
grep "^\s*linux" "$gbdir"/grub.cfg | grep -Eq "(selinux=0|enforcing=0)" && echo "FAILED: \"$()\" exists" || echo "PASSED" 
else
echo "FAILED"
fi
}

# 1.6.1.2 Ensure SELinux is not disabled in bootloader configuration
echo "1.6.1.2 Ensure SELinux is not disabled in bootloader configuration" >> output.txt
echo "************************************************************" >> output.txt
selinux_bootloader >> output.txt
echo $'\n \n' >> output.txt

wirelessint_disabled(){
#!/bin/bash 
if command -v nmcli >/dev/null 2>&1 ; then
if nmcli radio all | grep -Eq '\s*\S+\s+disabled\s+\S+\s+disabled\b'; then
echo "Wireless is not enabled"
else nmcli radio all
fi
elif [ -n "$(find /sys/class/net/*/ -type d -name wireless)" ]; then
t=0 mname=$(for driverdir in $(find /sys/class/net/*/ -type d -name wireless | xargs -0 dirname); do
basename "$(readlink -f "$driverdir"/device/driver/module)";done | sort -u)
for dm in $mname; do
if grep -Eq "^\s*install\s+$dm\s+/bin/(true|false)" /etc/modprobe.d/*.conf; then
/bin/true 
else echo "$dm is not disabled" 
t=1 
fi 
done 
[ "$t" -eq 0 ] && echo "Wireless is not enabled" 
else echo "Wireless is not enabled" 
fi
}
# 3.1.2 Ensure wireless interfaces are disabled
echo "3.1.2 Ensure wireless interfaces are disabled" >> output.txt
echo "************************************************************" >> output.txt
wirelessint_disabled >> output.txt
echo $'\n \n' >> output.txt

auditdProcess_enabled(){
#!/bin/bash 
# IF check passes return PASSED 
efidir=$(find /boot/efi/EFI/* -type d -not -name 'BOOT')
gbdir=$(find /boot -maxdepth 1 -type d -name 'grub*')
if [ -f "$efidir"/grub.cfg ]; then
grep "^\s*linux" "$efidir"/grub.cfg | grep -Evq "audit=1\b" && echo "FAILED" || echo "PASSED"
elif [ -f "$gbdir"/grub.cfg ]; then
grep "^\s*linux" "$gbdir"/grub.cfg | grep -Evq "audit=1\b" && echo "FAILED" || echo "PASSED"
else 
echo "FAILED"
fi
}
# 4.1.1.3 Ensure auditing for processes that start prior to auditd is enabled
echo "4.1.1.3 Ensure auditing for processes that start prior to auditd is enabled" >> output.txt
echo "************************************************************" >> output.txt
auditdProcess_enabled >> output.txt
echo $'\n \n' >> output.txt


backlogLimitSufficient(){
#!/bin/bash 
# IF check passes return PASSED 
efidir=$(find /boot/efi/EFI/* -type d -not -name 'BOOT') 
gbdir=$(find /boot -maxdepth 1 -type d -name 'grub*') 
if [ -f "$efidir"/grub.cfg ]; then 
grep "^\s*linux" "$efidir"/grub.cfg | grep -Evq "audit_backlog_limit=\S+\b" && echo -e "\n\nFAILED" || echo -e "\n\nPASSED:\n \"$(grep "audit_backlog_limit=" "$gbdir"/grub.cfg)\"" 
elif [ -f "$gbdir"/grub.cfg ]; then 
grep "^\s*linux" "$gbdir"/grub.cfg | grep -Evq "audit_backlog_limit=\S+\b" && echo -e "\n\nFAILED" || echo -e "\n\nPASSED:\n \"$(grep "audit_backlog_limit=" "$gbdir"/grub.cfg)\"" 
else 
echo "FAILED" 
fi
}

# 4.1.2.4 Ensure audit_backlog_limit is sufficient
echo "4.1.2.4 Ensure audit_backlog_limit is sufficient" >> output.txt
echo "************************************************************" >> output.txt
backlogLimitSufficient >> output.txt
echo $'\n \n' >> output.txt

shellTOConfigured(){
 #!/bin/bash 
 output1="" output2="" 
 [ -f /etc/bashrc ] && BRC="/etc/bashrc" 
 for f in "$BRC" /etc/profile /etc/profile.d/*.sh ; do 
 grep -Pq '^\s*([^#]+\s+)?TMOUT=(900|[1-8][0-9][0-9]|[1-9][0-9]|[1-9])\b' "$f" && grep -Pq '^\s*([^#]+;\s*)?readonly\s+TMOUT(\s+|\s*;|\s*$|=(900|[1-8][0-9][0-9]|[1-9][0-9]|[1-9]))\b' "$f" && grep -Pq '^\s*([^#]+;\s*)?export\s+TMOUT(\s+|\s*;|\s*$|=(900|[1-8][0-9][0-9]|[1-9][0-9]|[1-9]))\b' "$f" && output1="$f" 
 done 
 grep -Pq '^\s*([^#]+\s+)?TMOUT=(9[0-9][1-9]|9[1-9][0-9]|0+|[1-9]\d{3,})\b' /etc/profile /etc/profile.d/*.sh "$BRC" && output2=$(grep -Ps '^\s*([^#]+\s+)?TMOUT=(9[0-9][1-9]|9[1-9][0-9]|0+|[1-9]\d{3,})\b' /etc/profile /etc/profile.d/*.sh $BRC) 
 if [ -n "$output1" ] && [ -z "$output2" ]; then 
 echo -e "\nPASSED\n\nTMOUT is configured in: \"$output1\"\n" 
 else [ -z "$output1" ] && echo -e "\nFAILED\n\nTMOUT is not configured\n" [ -n "$output2" ] && echo -e "\nFAILED\n\nTMOUT is incorrectly configured in: \"$output2\"\n" 
 fi
}

# 5.5.4 Ensure default user shell timeout is configured
echo "5.5.4 Ensure default user shell timeout is configured" >> output.txt
echo "************************************************************" >> output.txt
shellTOConfigured >> output.txt
echo $'\n \n' >> output.txt



userUMask(){
#!/bin/bash 
passing="" 
grep -Eiq '^\s*UMASK\s+(0[0-7][2-7]7|[0-7][2-7]7)\b' /etc/login.defs && grep -Eqi '^\s*USERGROUPS_ENAB\s*"?no"?\b' /etc/login.defs && grep -Eq '^\s*session\s+(optional|requisite|required)\s+pam_umask\.so\b' /etc/pam.d/common-session && passing=true 
grep -REiq '^\s*UMASK\s+\s*(0[0-7][2-7]7|[0-7][2-7]7|u=(r?|w?|x?)(r?|w?|x?)(r?|w?|x?),g=(r?x?|x?r?),o=)\b' /etc/profile* /etc/bashrc* && passing=true [ "$passing" = true ] && echo "Default user umask is set"   
}

# 5.5.5 Ensure default user umask is configured - system wide default enforcing permission
echo "5.5.5 Ensure default user umask is configured - system wide default" >> output.txt
echo "************************************************************" >> output.txt
userUMask >> output.txt
echo $'\n \n' >> output.txt


# 5.5.5 Ensure default user umask is configured - system wide umask
echo "5.5.5 Ensure default user umask is configured - system wide umask" >> output.txt
echo "************************************************************" >> output.txt
grep -RPi '(^|^[^#]*)\s*umask\s+([0-7][0-7][01][0-7]\b|[0-7][0-7][0-7][0-6]\b|[0-7][01][0-7]\b|[0-7][0-7][0-6]\b|(u=[rwx]{0,3},)?(g=[rwx]{0,3},)?o=[rwx]+\b|(u=[rwx]{1,3},)?g=[^rx]{1,3}(,o=[rwx]{0,3})?\b)' /etc/login.defs /etc/profile* /etc/bashrc* >> output.txt  2>&1
echo $'\n \n' >> output.txt


rootPath_Integrity(){
#!/bin/bash RPCV="$(sudo -Hiu root env | grep '^PATH' | cut -d= -f2)" 
echo "$RPCV" | grep -q "::" && echo "root's path contains a empty directory (::)" 
echo "$RPCV" | grep -q ":$" && echo "root's path contains a trailing (:)" 
for x in $(echo "$RPCV" | tr ":" " "); do 
if [ -d "$x" ]; then 
ls -ldH "$x" | awk '$9 == "." {print "PATH contains current working directory (.)"} $3 != "root" {print $9, "is not owned by root"} substr($1,6,1) != "-" {print $9, "is group writable"} substr($1,9,1) != "-" {print $9, "is world writable"}'
else 
echo "$x is not a directory" 
fi 
done
}

# 6.2.10 Ensure root PATH Integrity
echo "6.2.10 Ensure root PATH Integrity" >> output.txt
echo "************************************************************" >> output.txt
rootPath_Integrity >> output.txt  2>&1
echo $'\n \n' >> output.txt


userHomeDirectories_Exists(){
#!/bin/bash 
awk -F: '($1!~/(halt|sync|shutdown|nfsnobody)/ && $7!~/^(\/usr)?\/sbin\/nologin(\/)?$/ && $7!~/(\/usr)?\/bin\/false(\/)?$/) { print $1 " " $6 }' /etc/passwd | while read -r user dir; do 
if [ ! -d "$dir" ]; then 
echo "User: \"$user\" home directory: \"$dir\" does not exist." 
fi 
done
}

# 6.2.11 Ensure all users' home directories exist
echo "6.2.11 Ensure all users' home directories exist" >> output.txt
echo "************************************************************" >> output.txt
userHomeDirectories_Exists >> output.txt  2>&1
echo $'\n \n' >> output.txt

userHomeDirectories_Own(){
#!/bin/bash 
awk -F: '($1!~/(halt|sync|shutdown|nfsnobody)/ && $7!~/^(\/usr)?\/sbin\/nologin(\/)?$/ && $7!~/(\/usr)?\/bin\/false(\/)?$/) { print $1 " " $6 }' /etc/passwd | while read -r user dir; do 
if [ ! -d "$dir" ]; then 
echo "User: \"$user\" home directory: \"$dir\" does not exist." 
else owner=$(stat -L -c "%U" "$dir") 
if [ "$owner" != "$user" ]; then 
echo "User: \"$user\" home directory: \"$dir\" is owned by \"$owner\"" 
fi 
fi 
done  
}
# 6.2.12 Ensure users own their home directories
echo "6.2.12 Ensure users own their home directories" >> output.txt
echo "************************************************************" >> output.txt
userHomeDirectories_Own >> output.txt  2>&1
echo $'\n \n' >> output.txt

homeDirectories_Perm(){
#!/bin/bash 
awk -F: '($1!~/(halt|sync|shutdown|nfsnobody)/ && $7!~/^(\/usr)?\/sbin\/nologin(\/)?$/ && $7!~/(\/usr)?\/bin\/false(\/)?$/) {print $1 " " $6}' /etc/passwd | while read -r user dir; do 
if [ ! -d "$dir" ]; then
echo "User: \"$user\" home directory: \"$dir\" doesn't exist" 
else dirperm=$(stat -L -c "%A" "$dir") 
if [ "$(echo "$dirperm" | cut -c6)" != "-" ] || [ "$(echo "$dirperm" | cut -c8)" != "-" ] || [ "$(echo "$dirperm" | cut -c9)" != "-" ] || [ "$(echo "$dirperm" | cut -c10)" != "-" ]; then 
echo "User: \"$user\" home directory: \"$dir\" has permissions: \"$(stat -L -c "%a" "$dir")\"" 
fi 
fi 
done 
}

# 6.2.13 Ensure users' home directories permissions are 750 or more restrictive
echo "6.2.13 Ensure users' home directories permissions are 750 or more restrictive" >> output.txt
echo "************************************************************" >> output.txt
homeDirectories_Perm >> output.txt  2>&1
echo $'\n \n' >> output.txt


dotFile_GrpWritable(){
#!/bin/bash 
awk -F: '($1!~/(halt|sync|shutdown|nfsnobody)/ && $7!~/^(\/usr)?\/sbin\/nologin(\/)?$/ && $7!~/(\/usr)?\/bin\/false(\/)?$/) { print $1 " " $6 }' /etc/passwd | while read -r user dir; do 
if [ -d "$dir" ]; then 
for file in "$dir"/.*; do 
if [ ! -h "$file" ] && [ -f "$file" ]; then 
fileperm=$(stat -L -c "%A" "$file") 
if [ "$(echo "$fileperm" | cut -c6)" != "-" ] || [ "$(echo "$fileperm" | cut -c9)" != "-" ]; then 
echo "User: \"$user\" file: \"$file\" has permissions: \"$fileperm\"" 
fi 
fi 
done 
fi 
done
}


# 6.2.14 Ensure users' dot files are not group or world writable
echo "6.2.14 Ensure users' dot files are not group or world writable" >> output.txt
echo "************************************************************" >> output.txt
dotFile_GrpWritable >> output.txt  2>&1
echo $'\n \n' >> output.txt

forwardFile(){
#!/bin/bash 
awk -F: '($1!~/(root|halt|sync|shutdown|nfsnobody)/ && $7!~/^(\/usr)?\/sbin\/nologin(\/)?$/ && $7!~/(\/usr)?\/bin\/false(\/)?$/) { print $1 " " $6 }' /etc/passwd | while read -r user dir; do 
if [ -d "$dir" ]; then file="$dir/.forward" 
if [ ! -h "$file" ] && [ -f "$file" ]; then 
echo "User: \"$user\" file: \"$file\" exists" 
fi 
fi 
done
}
# 6.2.15 Ensure no users have .forward files
echo "6.2.15 Ensure no users have .forward files" >> output.txt
echo "************************************************************" >> output.txt
forwardFile >> output.txt  2>&1
echo $'\n \n' >> output.txt


netrcFile(){
#!/bin/bash 
awk -F: '($1!~/(halt|sync|shutdown|nfsnobody)/ && $7!~/^(\/usr)?\/sbin\/nologin(\/)?$/ && $7!~/(\/usr)?\/bin\/false(\/)?$/) { print $1 " " $6 }' /etc/passwd | while read -r user dir; do 
if [ -d "$dir" ]; then 
file="$dir/.netrc" 
if [ ! -h "$file" ] && [ -f "$file" ]; then 
if stat -L -c "%A" "$file" | cut -c4-10 | grep -Eq '[^-]+'; then 
echo "FAILED: User: \"$user\" file: \"$file\" exists with permissions: \"$(stat -L -c "%a" "$file")\", remove file or excessive permissions" 
else 
echo "WARNING: User: \"$user\" file: \"$file\" exists with permissions: \"$(stat -L -c "%a" "$file")\", remove file unless required" 
fi 
fi 
fi done
}

# 6.2.16 Ensure no users have .netrc files
echo "6.2.16 Ensure no users have .netrc files" >> output.txt
echo "************************************************************" >> output.txt
netrcFile >> output.txt  2>&1
echo $'\n \n' >> output.txt

rhostsFile(){
#!/bin/bash
awk -F: '($1!~/(root|halt|sync|shutdown|nfsnobody)/ && $7!~/^(\/usr)?\/sbin\/nologin(\/)?$/ && $7!~/(\/usr)?\/bin\/false(\/)?$/) { print $1 " " $6 }' /etc/passwd | while read -r user dir; do 
if [ -d "$dir" ]; then 
file="$dir/.rhosts" 
if [ ! -h "$file" ] && [ -f "$file" ]; then 
echo "User: \"$user\" file: \"$file\" exists" 
fi 
fi 
done
}

# 6.2.17 Ensure no users have .rhosts files
echo "6.2.17 Ensure no users have .rhosts files" >> output.txt
echo "************************************************************" >> output.txt
rhostsFile >> output.txt  2>&1
echo $'\n \n' >> output.txt


grpPWDExists_InGroup(){
#!/bin/bash 
for i in $(cut -s -d: -f4 /etc/passwd | sort -u ); do 
grep -q -P "^.*?:[^:]*:$i:" /etc/group 
if [ $? -ne 0 ]; then 
echo "Group $i is referenced by /etc/passwd but does not exist in /etc/group" 
fi 
done
}

# 6.2.3 Ensure all groups in /etc/passwd exist in /etc/group
echo "6.2.3 Ensure all groups in /etc/passwd exist in /etc/group" >> output.txt
echo "************************************************************" >> output.txt
grpPWDExists_InGroup >> output.txt  2>&1
echo $'\n \n' >> output.txt


noDuplicate_Names(){
#!/bin/bash 
cut -d: -f1 /etc/passwd | sort | uniq -d | while read x; do 
echo "Duplicate login name ${x} in /etc/passwd" 
done
}

# 6.2.5 Ensure no duplicate user names exist
echo "6.2.5 Ensure no duplicate user names exist" >> output.txt
echo "************************************************************" >> output.txt
noDuplicate_Names >> output.txt  2>&1
echo $'\n \n' >> output.txt

noDuplicate_Groups(){
#!/bin/bash 
cut -d: -f1 /etc/group | sort | uniq -d | while read -r x; do 
echo "Duplicate group name ${x} in /etc/group"
done
}


# 6.2.6 Ensure no duplicate group names exist
echo "6.2.6 Ensure no duplicate group names exist" >> output.txt
echo "************************************************************" >> output.txt
noDuplicate_Groups >> output.txt  2>&1
echo $'\n \n' >> output.txt

noDuplicate_UID(){
#!/bin/bash
DuplicatedUIDs=$(/bin/egrep  -v "^ *($|\#|\+)" /etc/passwd 2>/dev/null | /bin/awk -F: '{print $3}' | /bin/sort -n | /usr/bin/uniq -d | /bin/egrep -v "^ *$"); 
for DuplicatedUID in $DuplicatedUIDs; do 
/bin/egrep  -v "^ *($|\#|\+)" /etc/passwd 2>/dev/null | /bin/awk -F: '{print "UID:"$3, "User:"$1}' | /bin/egrep "UID:$DuplicatedUID " ; 
done

}

# 6.2.7 Ensure no duplicate UIDs exist
echo "6.2.7 Ensure no duplicate UIDs exist" >> output.txt
echo "************************************************************" >> output.txt
noDuplicate_UID >> output.txt  2>&1
echo $'\n \n' >> output.txt


noDuplicate_GID(){
#!/bin/bash 
cut -d: -f3 /etc/group | sort | uniq -d | while read -r x; do 
echo "Duplicate GID ($x) in /etc/group" 
done
}

# 6.2.8 Ensure no duplicate GIDs exist
echo "6.2.8 Ensure no duplicate GIDs exist" >> output.txt
echo "************************************************************" >> output.txt
noDuplicate_GID >> output.txt  2>&1
echo $'\n \n' >> output.txt


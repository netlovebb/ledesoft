#! /bin/sh
cd /tmp
cp -rf /tmp/aria2/aria2 /koolshare/
cp -rf /tmp/aria2/scripts/* /koolshare/scripts/
cp -rf /tmp/aria2/webs/* /koolshare/webs/



cd /
rm -rf /tmp/aria2* >/dev/null 2>&1


if [ -L /koolshare/init.d/S91aria2 ];then
	ln -sf /koolshare/aria2/aria2_run.sh /etc/rc.d/S91aria2.sh
fi


if [ ! -f /koolshare/aria2/aria2.session ];then
	touch /koolshare/aria2/aria2.session
fi


if [ -f /koolshare/scripts/aria2_run.sh ];then
	rm -rf /koolshare/scripts/aria2_run.sh
fi


chmod 755 /koolshare/aria2/*
chmod 755 /koolshare/init.d/*
chmod 755 /koolshare/scripts/aria2*

dbus set softcenter_module_aria2_install=1
dbus set softcenter_module_aria2_version=0.1
dbus set softcenter_module_aria2_description="aria2下载工具"


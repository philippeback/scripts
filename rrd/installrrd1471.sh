wget http://pkgs.repoforge.org/rrdtool/perl-rrdtool-1.4.7-1.el6.rfx.x86_64.rpm
wget http://pkgs.repoforge.org/rrdtool/rrdtool-1.4.7-1.el6.rfx.x86_64.rpm
yum install libdbi -y
rpm ivh perl-rrdtool-1.4.7-1.el6.rfx.x86_64.rpm rrdtool-1.4.7-1.el6.rfx.x86_64.rpm

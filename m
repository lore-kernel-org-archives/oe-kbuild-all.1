Content-Type: multipart/mixed; boundary="===============0273488735743378009=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [plbossart-sound:sdw/sysfs-support2 3/3] drivers/soundwire/sysfs_slave_dpn.c:185:9: warning: Uninitialized variable: ret [uninitvar]
Date: Fri, 08 May 2020 01:45:27 +0800
Message-ID: <202005080117.qfaPpb14%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============0273488735743378009==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://github.com/plbossart/sound sdw/sysfs-support2
head:   3e03b2e737474483350aa87c35a3c7d0023a78f4
commit: 3e03b2e737474483350aa87c35a3c7d0023a78f4 [3/3] soundwire: add macro=
s for dpN sysfs support

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

>> drivers/soundwire/sysfs_slave_dpn.c:185:9: warning: Uninitialized variab=
le: ret [uninitvar]
    return ret;
           ^
>> drivers/soundwire/sysfs_slave_dpn.c:180:6: warning: Variable 'ret' is no=
t assigned a value. [unassignedVariable]
    int ret;
        ^

vim +185 drivers/soundwire/sysfs_slave_dpn.c

b6721f28204777 Pierre-Louis Bossart 2020-04-09  175  =

b6721f28204777 Pierre-Louis Bossart 2020-04-09  176  int sdw_slave_sysfs_dp=
n_init(struct sdw_slave *slave,
b6721f28204777 Pierre-Louis Bossart 2020-04-09  177  			     int i,
b6721f28204777 Pierre-Louis Bossart 2020-04-09  178  			     bool src)
b6721f28204777 Pierre-Louis Bossart 2020-04-09  179  {
b6721f28204777 Pierre-Louis Bossart 2020-04-09 @180  	int ret;
b6721f28204777 Pierre-Louis Bossart 2020-04-09  181  =

b6721f28204777 Pierre-Louis Bossart 2020-04-09  182  	if (!SDW_VALID_PORT_R=
ANGE(i))
b6721f28204777 Pierre-Louis Bossart 2020-04-09  183  		return -EINVAL;
b6721f28204777 Pierre-Louis Bossart 2020-04-09  184  =

b6721f28204777 Pierre-Louis Bossart 2020-04-09 @185  	return ret;

:::::: The code at line 185 was first introduced by commit
:::::: b6721f28204777a8df609e59d09c12318fa6398e soundwire: add Slave sysfs =
support

:::::: TO: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
:::::: CC: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0273488735743378009==--


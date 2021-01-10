Content-Type: multipart/mixed; boundary="===============7254270809830101225=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [arm:clearfog 2/11] drivers/net/dsa/mv88e6xxx/mv88e6xxx_debugfs.c:739:6: warning: %d in format string (no. 1) requires 'int but the argument type is 'unsigned int
Date: Mon, 11 Jan 2021 03:43:12 +0800
Message-ID: <202101110302.dPDSgUua-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============7254270809830101225==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Russell,

First bad commit (maybe !=3D root cause):

tree:   git://git.armlinux.org.uk/~rmk/linux-arm.git clearfog
head:   07a1ccb17f683656e261f119ae1e3eb81dd94216
commit: 01ebbcc9469d78d3e5f05982d01ae0588fbddcb4 [2/11] net: dsa: mv88e6xxx=
: debugfs hacks to fix the compile
compiler: m68k-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

   In file included from drivers/net/dsa/mv88e6xxx/chip.c:
>> drivers/net/dsa/mv88e6xxx/mv88e6xxx_debugfs.c:739:6: warning: %d in form=
at string (no. 1) requires 'int *' but the argument type is 'unsigned int *=
'. [invalidScanfArgType_int]
    if (sscanf(cmd, "%d %d %x", &src_dev, &src_port, &pvlan) !=3D 3)
        ^
   drivers/net/dsa/mv88e6xxx/mv88e6xxx_debugfs.c:739:6: warning: %d in form=
at string (no. 2) requires 'int *' but the argument type is 'unsigned int *=
'. [invalidScanfArgType_int]
    if (sscanf(cmd, "%d %d %x", &src_dev, &src_port, &pvlan) !=3D 3)
        ^
>> drivers/net/dsa/mv88e6xxx/mv88e6xxx_debugfs.c:162:8: warning: sscanf() w=
ithout field width limits can crash with huge input data. [invalidscanf]
    ret =3D sscanf(cmd, "%s %x %x", name, &reg, &val);
          ^

vim +739 drivers/net/dsa/mv88e6xxx/mv88e6xxx_debugfs.c

775257bb9c01c293 Vivien Didelot 2015-10-22  725  =

775257bb9c01c293 Vivien Didelot 2015-10-22  726  static ssize_t mv88e6xxx_p=
vt_write(struct file *file, const char __user *buf,
775257bb9c01c293 Vivien Didelot 2015-10-22  727  				    size_t count, loff=
_t *ppos)
775257bb9c01c293 Vivien Didelot 2015-10-22  728  {
775257bb9c01c293 Vivien Didelot 2015-10-22  729  	struct seq_file *s =3D fi=
le->private_data;
775257bb9c01c293 Vivien Didelot 2015-10-22  730  	struct mv88e6xxx_chip *ch=
ip =3D s->private;
775257bb9c01c293 Vivien Didelot 2015-10-22  731  	const u16 mask =3D (1 << =
mv88e6xxx_num_ports(chip)) - 1;
775257bb9c01c293 Vivien Didelot 2015-10-22  732  	char cmd[32];
775257bb9c01c293 Vivien Didelot 2015-10-22  733  	unsigned int src_dev, src=
_port, pvlan;
775257bb9c01c293 Vivien Didelot 2015-10-22  734  	int ret;
775257bb9c01c293 Vivien Didelot 2015-10-22  735  =

775257bb9c01c293 Vivien Didelot 2015-10-22  736  	if (copy_from_user(cmd, b=
uf, sizeof(cmd)))
775257bb9c01c293 Vivien Didelot 2015-10-22  737  		return -EFAULT;
775257bb9c01c293 Vivien Didelot 2015-10-22  738  =

775257bb9c01c293 Vivien Didelot 2015-10-22 @739  	if (sscanf(cmd, "%d %d %x=
", &src_dev, &src_port, &pvlan) !=3D 3)
775257bb9c01c293 Vivien Didelot 2015-10-22  740  		return -EINVAL;
775257bb9c01c293 Vivien Didelot 2015-10-22  741  =

775257bb9c01c293 Vivien Didelot 2015-10-22  742  	if (src_dev >=3D 32 || sr=
c_port >=3D 16 || pvlan & ~mask)
775257bb9c01c293 Vivien Didelot 2015-10-22  743  		return -ERANGE;
775257bb9c01c293 Vivien Didelot 2015-10-22  744  =

775257bb9c01c293 Vivien Didelot 2015-10-22  745  	mutex_lock(&chip->reg_loc=
k);
775257bb9c01c293 Vivien Didelot 2015-10-22  746  	ret =3D _mv88e6xxx_pvt_wr=
ite(chip, src_dev, src_port, pvlan);
775257bb9c01c293 Vivien Didelot 2015-10-22  747  	mutex_unlock(&chip->reg_l=
ock);
775257bb9c01c293 Vivien Didelot 2015-10-22  748  =

775257bb9c01c293 Vivien Didelot 2015-10-22  749  	return ret < 0 ? ret : co=
unt;
775257bb9c01c293 Vivien Didelot 2015-10-22  750  }
775257bb9c01c293 Vivien Didelot 2015-10-22  751  =


:::::: The code@line 739 was first introduced by commit
:::::: 775257bb9c01c29344d4746b4b0e313c0654077f net: dsa: mv88e6xxx: add de=
bugfs interface

:::::: TO: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
:::::: CC: Russell King <rmk+kernel@armlinux.org.uk>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7254270809830101225==--


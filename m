Content-Type: multipart/mixed; boundary="===============5639176532487732063=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [plbossart-sound:sdw/sysfs-support2 3/3] drivers/soundwire/sysfs_slave_dpn.c:34:13: warning: incompatible implicit declaration of built-in function 'strdup'
Date: Thu, 07 May 2020 11:00:33 +0800
Message-ID: <202005071126.T7UpHhp3%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============5639176532487732063==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://github.com/plbossart/sound sdw/sysfs-support2
head:   3e03b2e737474483350aa87c35a3c7d0023a78f4
commit: 3e03b2e737474483350aa87c35a3c7d0023a78f4 [3/3] soundwire: add macro=
s for dpN sysfs support
config: microblaze-randconfig-a001-20200507 (attached as .config)
compiler: microblaze-linux-gcc (GCC) 9.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git checkout 3e03b2e737474483350aa87c35a3c7d0023a78f4
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day GCC_VERSION=3D9.3.0 make.cross A=
RCH=3Dmicroblaze =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/soundwire/sysfs_slave_dpn.c:27:13: warning: 'struct slave' decla=
red inside parameter list will not be visible outside of this definition or=
 declaration
      27 |      struct slave **slv)
         |             ^~~~~
   drivers/soundwire/sysfs_slave_dpn.c: In function 'get_port_N_dir':
   drivers/soundwire/sysfs_slave_dpn.c:34:13: error: implicit declaration o=
f function 'strdup' [-Werror=3Dimplicit-function-declaration]
      34 |  filename =3D strdup(kobj->name);
         |             ^~~~~~
>> drivers/soundwire/sysfs_slave_dpn.c:34:13: warning: incompatible implici=
t declaration of built-in function 'strdup'
   drivers/soundwire/sysfs_slave_dpn.c:38:2: error: 'token' undeclared (fir=
st use in this function); did you mean 'to_kset'?
      38 |  token =3D filename;
         |  ^~~~~
         |  to_kset
   drivers/soundwire/sysfs_slave_dpn.c:38:2: note: each undeclared identifi=
er is reported only once for each function it appears in
   drivers/soundwire/sysfs_slave_dpn.c:39:2: error: 'end' undeclared (first=
 use in this function)
      39 |  end =3D filename;
         |  ^~~
   drivers/soundwire/sysfs_slave_dpn.c:70:7: error: assignment to 'struct s=
lave *' from incompatible pointer type 'struct sdw_slave *' [-Werror=3Dinco=
mpatible-pointer-types]
      70 |  *slv =3D dev_to_sdw_dev(dev);
         |       ^
   drivers/soundwire/sysfs_slave_dpn.c:73:2: error: implicit declaration of=
 function 'free' [-Werror=3Dimplicit-function-declaration]
      73 |  free(filename);
         |  ^~~~
>> drivers/soundwire/sysfs_slave_dpn.c:73:2: warning: incompatible implicit=
 declaration of built-in function 'free'
   drivers/soundwire/sysfs_slave_dpn.c:12:1: note: include '<stdlib.h>' or =
provide a declaration of 'free'
      11 | #include "sysfs_local.h"
     +++ |+#include <stdlib.h>
      12 | =

   drivers/soundwire/sysfs_slave_dpn.c: In function 'dpn_attr_show':
   drivers/soundwire/sysfs_slave_dpn.c:88:2: error: 'ret' undeclared (first=
 use in this function)
      88 |  ret =3D get_port_N_dir(kobj, &N, &dir, &codec);
         |  ^~~
   drivers/soundwire/sysfs_slave_dpn.c:88:40: error: 'codec' undeclared (fi=
rst use in this function)
      88 |  ret =3D get_port_N_dir(kobj, &N, &dir, &codec);
         |                                        ^~~~~
   drivers/soundwire/sysfs_slave_dpn.c:91:24: error: passing argument 1 of =
'dpn_attr->show' from incompatible pointer type [-Werror=3Dincompatible-poi=
nter-types]
      91 |  return dpn_attr->show(slave, N, dir, dpn_attr, buf);
         |                        ^~~~~
         |                        |
         |                        struct slave *
   drivers/soundwire/sysfs_slave_dpn.c:91:24: note: expected 'struct device=
 *' but argument is of type 'struct slave *'
   drivers/soundwire/sysfs_slave_dpn.c: At top level:
   drivers/soundwire/sysfs_slave_dpn.c:111:27: warning: 'struct slave' decl=
ared inside parameter list will not be visible outside of this definition o=
r declaration
     111 | dpn_##field##_show(struct slave *slave,     \
         |                           ^~~~~
   drivers/soundwire/sysfs_slave_dpn.c:143:1: note: in expansion of macro '=
sdw_dpn_attr'
     143 | sdw_dpn_attr(max_word, "%d\n");
         | ^~~~~~~~~~~~
   drivers/soundwire/sysfs_slave_dpn.c: In function 'dpn_max_word_show':
   drivers/soundwire/sysfs_slave_dpn.c:124:14: error: dereferencing pointer=
 to incomplete type 'struct slave'
     124 |   dpn =3D slave->prop.src_dpn_prop;    \
         |              ^~
   drivers/soundwire/sysfs_slave_dpn.c:143:1: note: in expansion of macro '=
sdw_dpn_attr'
     143 | sdw_dpn_attr(max_word, "%d\n");
         | ^~~~~~~~~~~~
   In file included from include/linux/kobject.h:20,
                    from include/linux/device.h:17,
                    from drivers/soundwire/sysfs_slave_dpn.c:4:
   drivers/soundwire/sysfs_slave_dpn.c: At top level:
   drivers/soundwire/sysfs_slave_dpn.c:141:59: error: '_field_show' undecla=
red here (not in a function)
     141 | static struct dpn_attribute dpn_attr_##_field =3D __ATTR_RO(_fie=
ld);
         |                                                           ^~~~~~
   include/linux/sysfs.h:117:10: note: in definition of macro '__ATTR_RO'
     117 |  .show =3D _name##_show,      \
         |          ^~~~~
   drivers/soundwire/sysfs_slave_dpn.c:143:1: note: in expansion of macro '=
sdw_dpn_attr'
     143 | sdw_dpn_attr(max_word, "%d\n");
         | ^~~~~~~~~~~~
   drivers/soundwire/sysfs_slave_dpn.c:111:27: warning: 'struct slave' decl=
ared inside parameter list will not be visible outside of this definition o=
r declaration
     111 | dpn_##field##_show(struct slave *slave,     \
         |                           ^~~~~
   drivers/soundwire/sysfs_slave_dpn.c:144:1: note: in expansion of macro '=
sdw_dpn_attr'
     144 | sdw_dpn_attr(min_word, "%d\n");
         | ^~~~~~~~~~~~
   drivers/soundwire/sysfs_slave_dpn.c: In function 'dpn_min_word_show':
   drivers/soundwire/sysfs_slave_dpn.c:124:14: error: dereferencing pointer=
 to incomplete type 'struct slave'
     124 |   dpn =3D slave->prop.src_dpn_prop;    \
         |              ^~
   drivers/soundwire/sysfs_slave_dpn.c:144:1: note: in expansion of macro '=
sdw_dpn_attr'
     144 | sdw_dpn_attr(min_word, "%d\n");
         | ^~~~~~~~~~~~
   drivers/soundwire/sysfs_slave_dpn.c: At top level:
   drivers/soundwire/sysfs_slave_dpn.c:141:29: error: redefinition of 'dpn_=
attr__field'
     141 | static struct dpn_attribute dpn_attr_##_field =3D __ATTR_RO(_fie=
ld);
         |                             ^~~~~~~~~
   drivers/soundwire/sysfs_slave_dpn.c:144:1: note: in expansion of macro '=
sdw_dpn_attr'
     144 | sdw_dpn_attr(min_word, "%d\n");
         | ^~~~~~~~~~~~
   drivers/soundwire/sysfs_slave_dpn.c:141:29: note: previous definition of=
 'dpn_attr__field' was here
     141 | static struct dpn_attribute dpn_attr_##_field =3D __ATTR_RO(_fie=
ld);
         |                             ^~~~~~~~~
   drivers/soundwire/sysfs_slave_dpn.c:143:1: note: in expansion of macro '=
sdw_dpn_attr'
     143 | sdw_dpn_attr(max_word, "%d\n");
         | ^~~~~~~~~~~~
   drivers/soundwire/sysfs_slave_dpn.c:111:27: warning: 'struct slave' decl=
ared inside parameter list will not be visible outside of this definition o=
r declaration
     111 | dpn_##field##_show(struct slave *slave,     \
         |                           ^~~~~
   drivers/soundwire/sysfs_slave_dpn.c:145:1: note: in expansion of macro '=
sdw_dpn_attr'
     145 | sdw_dpn_attr(max_grouping, "%d\n");
         | ^~~~~~~~~~~~
   drivers/soundwire/sysfs_slave_dpn.c: In function 'dpn_max_grouping_show':
   drivers/soundwire/sysfs_slave_dpn.c:124:14: error: dereferencing pointer=
 to incomplete type 'struct slave'
     124 |   dpn =3D slave->prop.src_dpn_prop;    \
         |              ^~
   drivers/soundwire/sysfs_slave_dpn.c:145:1: note: in expansion of macro '=
sdw_dpn_attr'
     145 | sdw_dpn_attr(max_grouping, "%d\n");
         | ^~~~~~~~~~~~
   drivers/soundwire/sysfs_slave_dpn.c: At top level:
   drivers/soundwire/sysfs_slave_dpn.c:141:29: error: redefinition of 'dpn_=
attr__field'
     141 | static struct dpn_attribute dpn_attr_##_field =3D __ATTR_RO(_fie=
ld);
         |                             ^~~~~~~~~
   drivers/soundwire/sysfs_slave_dpn.c:145:1: note: in expansion of macro '=
sdw_dpn_attr'
     145 | sdw_dpn_attr(max_grouping, "%d\n");
         | ^~~~~~~~~~~~
   drivers/soundwire/sysfs_slave_dpn.c:141:29: note: previous definition of=
 'dpn_attr__field' was here
     141 | static struct dpn_attribute dpn_attr_##_field =3D __ATTR_RO(_fie=
ld);
         |                             ^~~~~~~~~
   drivers/soundwire/sysfs_slave_dpn.c:144:1: note: in expansion of macro '=
sdw_dpn_attr'
     144 | sdw_dpn_attr(min_word, "%d\n");
         | ^~~~~~~~~~~~
   drivers/soundwire/sysfs_slave_dpn.c:111:27: warning: 'struct slave' decl=
ared inside parameter list will not be visible outside of this definition o=
r declaration
     111 | dpn_##field##_show(struct slave *slave,     \
         |                           ^~~~~
   drivers/soundwire/sysfs_slave_dpn.c:146:1: note: in expansion of macro '=
sdw_dpn_attr'

vim +/strdup +34 drivers/soundwire/sysfs_slave_dpn.c

    25	=

    26	static int get_port_N_dir(struct kobject *kobj, int *N, int *dir,
    27				  struct slave **slv)
    28	{
    29		struct device *dev =3D kobj_to_dev(kobj->parent->parent);
    30		char *filename;
    31		ssize_t ret;
    32	=

    33		/* the filename is dp:<N>:<sink/src> */
  > 34		filename =3D strdup(kobj->name);
    35		if (!filename)
    36			return -ENOMEM;
    37	=

    38		token =3D filename;
    39		end =3D filename;
    40	=

    41		/* skip dp */
    42		token =3D strsep(&filename, ":");
    43		if (!token) {
    44			ret =3D -EINVAL;
    45			goto err;
    46		}
    47	=

    48		/* extract N */
    49		token =3D strsep(&filename, ":");
    50		if (!token) {
    51			ret =3D -EINVAL;
    52			goto err;
    53		}
    54	=

    55		ret =3D kstrtoint(token, 10, N);
    56		if (ret < 0)
    57			goto err;
    58	=

    59		/* extract direction */
    60		token =3D strsep(&filename, ":");
    61		if (!token) {
    62			ret =3D -EINVAL;
    63			goto err;
    64		}
    65		if (!strcmp(token, "sink"))
    66			*dir =3D 0;
    67		else
    68			*dir =3D 1;
    69	=

    70		*slv =3D dev_to_sdw_dev(dev);
    71	=

    72	err:
  > 73		free(filename);
    74		return ret;
    75	}
    76	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============5639176532487732063==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
sSwC0erqBpDzNeDkBWA5E4jHgf8Hdti7flGDAQA=
--===============5639176532487732063==--


Content-Type: multipart/mixed; boundary="===============3120433631942657556=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [plbossart-sound:sdw/sysfs-support2 3/3] drivers/soundwire/sysfs_slave_dpn.c:34:13: error: implicit declaration of function 'strdup'; did you mean 'kstrdup'?
Date: Thu, 07 May 2020 09:46:38 +0800
Message-ID: <202005070935.SZBkuXRj%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============3120433631942657556==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://github.com/plbossart/sound sdw/sysfs-support2
head:   3e03b2e737474483350aa87c35a3c7d0023a78f4
commit: 3e03b2e737474483350aa87c35a3c7d0023a78f4 [3/3] soundwire: add macro=
s for dpN sysfs support
config: um-allmodconfig (attached as .config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce:
        git checkout 3e03b2e737474483350aa87c35a3c7d0023a78f4
        # save the attached .config to linux build tree
        make ARCH=3Dum =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>

All error/warnings (new ones prefixed by >>):

>> drivers/soundwire/sysfs_slave_dpn.c:27:13: warning: 'struct slave' decla=
red inside parameter list will not be visible outside of this definition or=
 declaration
         struct slave **slv)
                ^~~~~
   drivers/soundwire/sysfs_slave_dpn.c: In function 'get_port_N_dir':
>> drivers/soundwire/sysfs_slave_dpn.c:34:13: error: implicit declaration o=
f function 'strdup'; did you mean 'kstrdup'? [-Werror=3Dimplicit-function-d=
eclaration]
     filename =3D strdup(kobj->name);
                ^~~~~~
                kstrdup
>> drivers/soundwire/sysfs_slave_dpn.c:34:11: warning: assignment makes poi=
nter from integer without a cast [-Wint-conversion]
     filename =3D strdup(kobj->name);
              ^
>> drivers/soundwire/sysfs_slave_dpn.c:38:2: error: 'token' undeclared (fir=
st use in this function); did you mean 'to_kset'?
     token =3D filename;
     ^~~~~
     to_kset
   drivers/soundwire/sysfs_slave_dpn.c:38:2: note: each undeclared identifi=
er is reported only once for each function it appears in
>> drivers/soundwire/sysfs_slave_dpn.c:39:2: error: 'end' undeclared (first=
 use in this function)
     end =3D filename;
     ^~~
>> drivers/soundwire/sysfs_slave_dpn.c:70:7: error: assignment from incompa=
tible pointer type [-Werror=3Dincompatible-pointer-types]
     *slv =3D dev_to_sdw_dev(dev);
          ^
>> drivers/soundwire/sysfs_slave_dpn.c:73:2: error: implicit declaration of=
 function 'free'; did you mean 'kfree'? [-Werror=3Dimplicit-function-declar=
ation]
     free(filename);
     ^~~~
     kfree
   drivers/soundwire/sysfs_slave_dpn.c: In function 'dpn_attr_show':
>> drivers/soundwire/sysfs_slave_dpn.c:88:2: error: 'ret' undeclared (first=
 use in this function); did you mean 'kset'?
     ret =3D get_port_N_dir(kobj, &N, &dir, &codec);
     ^~~
     kset
>> drivers/soundwire/sysfs_slave_dpn.c:88:40: error: 'codec' undeclared (fi=
rst use in this function)
     ret =3D get_port_N_dir(kobj, &N, &dir, &codec);
                                           ^~~~~
>> drivers/soundwire/sysfs_slave_dpn.c:91:24: error: passing argument 1 of =
'dpn_attr->show' from incompatible pointer type [-Werror=3Dincompatible-poi=
nter-types]
     return dpn_attr->show(slave, N, dir, dpn_attr, buf);
                           ^~~~~
   drivers/soundwire/sysfs_slave_dpn.c:91:24: note: expected 'struct device=
 *' but argument is of type 'struct slave *'
   drivers/soundwire/sysfs_slave_dpn.c: At top level:
   drivers/soundwire/sysfs_slave_dpn.c:111:27: warning: 'struct slave' decl=
ared inside parameter list will not be visible outside of this definition o=
r declaration
    dpn_##field##_show(struct slave *slave,     \
                              ^
>> drivers/soundwire/sysfs_slave_dpn.c:143:1: note: in expansion of macro '=
sdw_dpn_attr'
    sdw_dpn_attr(max_word, "%d\n");
    ^~~~~~~~~~~~
   drivers/soundwire/sysfs_slave_dpn.c: In function 'dpn_max_word_show':
>> drivers/soundwire/sysfs_slave_dpn.c:124:14: error: dereferencing pointer=
 to incomplete type 'struct slave'
      dpn =3D slave->prop.src_dpn_prop;    \
                 ^
>> drivers/soundwire/sysfs_slave_dpn.c:143:1: note: in expansion of macro '=
sdw_dpn_attr'
    sdw_dpn_attr(max_word, "%d\n");
    ^~~~~~~~~~~~
   In file included from include/linux/kobject.h:20:0,
                    from include/linux/device.h:17,
                    from drivers/soundwire/sysfs_slave_dpn.c:4:
   drivers/soundwire/sysfs_slave_dpn.c: At top level:
>> drivers/soundwire/sysfs_slave_dpn.c:141:59: error: '_field_show' undecla=
red here (not in a function); did you mean 'yield_to'?
    static struct dpn_attribute dpn_attr_##_field =3D __ATTR_RO(_field);
                                                              ^
   include/linux/sysfs.h:117:10: note: in definition of macro '__ATTR_RO'
     .show =3D _name##_show,      \
             ^~~~~
>> drivers/soundwire/sysfs_slave_dpn.c:143:1: note: in expansion of macro '=
sdw_dpn_attr'
    sdw_dpn_attr(max_word, "%d\n");
    ^~~~~~~~~~~~
   drivers/soundwire/sysfs_slave_dpn.c:111:27: warning: 'struct slave' decl=
ared inside parameter list will not be visible outside of this definition o=
r declaration
    dpn_##field##_show(struct slave *slave,     \
                              ^
   drivers/soundwire/sysfs_slave_dpn.c:144:1: note: in expansion of macro '=
sdw_dpn_attr'
    sdw_dpn_attr(min_word, "%d\n");
    ^~~~~~~~~~~~
   drivers/soundwire/sysfs_slave_dpn.c: In function 'dpn_min_word_show':
>> drivers/soundwire/sysfs_slave_dpn.c:124:14: error: dereferencing pointer=
 to incomplete type 'struct slave'
      dpn =3D slave->prop.src_dpn_prop;    \
                 ^
   drivers/soundwire/sysfs_slave_dpn.c:144:1: note: in expansion of macro '=
sdw_dpn_attr'
    sdw_dpn_attr(min_word, "%d\n");
    ^~~~~~~~~~~~
   drivers/soundwire/sysfs_slave_dpn.c: At top level:
>> drivers/soundwire/sysfs_slave_dpn.c:141:29: error: redefinition of 'dpn_=
attr__field'
    static struct dpn_attribute dpn_attr_##_field =3D __ATTR_RO(_field);
                                ^
   drivers/soundwire/sysfs_slave_dpn.c:144:1: note: in expansion of macro '=
sdw_dpn_attr'
    sdw_dpn_attr(min_word, "%d\n");
    ^~~~~~~~~~~~
   drivers/soundwire/sysfs_slave_dpn.c:141:29: note: previous definition of=
 'dpn_attr__field' was here
    static struct dpn_attribute dpn_attr_##_field =3D __ATTR_RO(_field);
                                ^
>> drivers/soundwire/sysfs_slave_dpn.c:143:1: note: in expansion of macro '=
sdw_dpn_attr'
    sdw_dpn_attr(max_word, "%d\n");
    ^~~~~~~~~~~~
   drivers/soundwire/sysfs_slave_dpn.c:111:27: warning: 'struct slave' decl=
ared inside parameter list will not be visible outside of this definition o=
r declaration
    dpn_##field##_show(struct slave *slave,     \
                              ^
   drivers/soundwire/sysfs_slave_dpn.c:145:1: note: in expansion of macro '=
sdw_dpn_attr'
    sdw_dpn_attr(max_grouping, "%d\n");
    ^~~~~~~~~~~~
   drivers/soundwire/sysfs_slave_dpn.c: In function 'dpn_max_grouping_show':
>> drivers/soundwire/sysfs_slave_dpn.c:124:14: error: dereferencing pointer=
 to incomplete type 'struct slave'
      dpn =3D slave->prop.src_dpn_prop;    \
                 ^
   drivers/soundwire/sysfs_slave_dpn.c:145:1: note: in expansion of macro '=
sdw_dpn_attr'
    sdw_dpn_attr(max_grouping, "%d\n");
    ^~~~~~~~~~~~
   drivers/soundwire/sysfs_slave_dpn.c: At top level:
>> drivers/soundwire/sysfs_slave_dpn.c:141:29: error: redefinition of 'dpn_=
attr__field'
    static struct dpn_attribute dpn_attr_##_field =3D __ATTR_RO(_field);
                                ^
   drivers/soundwire/sysfs_slave_dpn.c:145:1: note: in expansion of macro '=
sdw_dpn_attr'
    sdw_dpn_attr(max_grouping, "%d\n");
    ^~~~~~~~~~~~
   drivers/soundwire/sysfs_slave_dpn.c:141:29: note: previous definition of=
 'dpn_attr__field' was here
    static struct dpn_attribute dpn_attr_##_field =3D __ATTR_RO(_field);
                                ^
   drivers/soundwire/sysfs_slave_dpn.c:144:1: note: in expansion of macro '=
sdw_dpn_attr'
    sdw_dpn_attr(min_word, "%d\n");
    ^~~~~~~~~~~~
   drivers/soundwire/sysfs_slave_dpn.c:111:27: warning: 'struct slave' decl=
ared inside parameter list will not be visible outside of this definition o=
r declaration
    dpn_##field##_show(struct slave *slave,     \
                              ^
   drivers/soundwire/sysfs_slave_dpn.c:146:1: note: in expansion of macro '=
sdw_dpn_attr'
    sdw_dpn_attr(imp_def_interrupts, "%d\n");
    ^~~~~~~~~~~~
   drivers/soundwire/sysfs_slave_dpn.c: In function 'dpn_imp_def_interrupts=
_show':
   drivers/soundwire/sysfs_slave_dpn.c:124:14: error: dereferencing pointer=
 to incomplete type 'struct slave'
      dpn =3D slave->prop.src_dpn_prop;    \
                 ^
   drivers/soundwire/sysfs_slave_dpn.c:146:1: note: in expansion of macro '=
sdw_dpn_attr'
    sdw_dpn_attr(imp_def_interrupts, "%d\n");
    ^~~~~~~~~~~~
   drivers/soundwire/sysfs_slave_dpn.c: At top level:
   drivers/soundwire/sysfs_slave_dpn.c:141:29: error: redefinition of 'dpn_=
attr__field'
    static struct dpn_attribute dpn_attr_##_field =3D __ATTR_RO(_field);
                                ^
   drivers/soundwire/sysfs_slave_dpn.c:146:1: note: in expansion of macro '=
sdw_dpn_attr'
    sdw_dpn_attr(imp_def_interrupts, "%d\n");
    ^~~~~~~~~~~~
   drivers/soundwire/sysfs_slave_dpn.c:141:29: note: previous definition of=
 'dpn_attr__field' was here
    static struct dpn_attribute dpn_attr_##_field =3D __ATTR_RO(_field);
                                ^
   drivers/soundwire/sysfs_slave_dpn.c:145:1: note: in expansion of macro '=
sdw_dpn_attr'
    sdw_dpn_attr(max_grouping, "%d\n");
    ^~~~~~~~~~~~
   drivers/soundwire/sysfs_slave_dpn.c:111:27: warning: 'struct slave' decl=
ared inside parameter list will not be visible outside of this definition o=
r declaration
    dpn_##field##_show(struct slave *slave,     \
                              ^
   drivers/soundwire/sysfs_slave_dpn.c:147:1: note: in expansion of macro '=
sdw_dpn_attr'
    sdw_dpn_attr(max_ch, "%d\n");
    ^~~~~~~~~~~~
   drivers/soundwire/sysfs_slave_dpn.c: In function 'dpn_max_ch_show':
   drivers/soundwire/sysfs_slave_dpn.c:124:14: error: dereferencing pointer=
 to incomplete type 'struct slave'
      dpn =3D slave->prop.src_dpn_prop;    \
                 ^
   drivers/soundwire/sysfs_slave_dpn.c:147:1: note: in expansion of macro '=
sdw_dpn_attr'
    sdw_dpn_attr(max_ch, "%d\n");
    ^~~~~~~~~~~~
   drivers/soundwire/sysfs_slave_dpn.c: At top level:
   drivers/soundwire/sysfs_slave_dpn.c:141:29: error: redefinition of 'dpn_=
attr__field'
    static struct dpn_attribute dpn_attr_##_field =3D __ATTR_RO(_field);
                                ^
   drivers/soundwire/sysfs_slave_dpn.c:147:1: note: in expansion of macro '=
sdw_dpn_attr'
    sdw_dpn_attr(max_ch, "%d\n");
    ^~~~~~~~~~~~
   drivers/soundwire/sysfs_slave_dpn.c:141:29: note: previous definition of=
 'dpn_attr__field' was here
    static struct dpn_attribute dpn_attr_##_field =3D __ATTR_RO(_field);
                                ^
   drivers/soundwire/sysfs_slave_dpn.c:146:1: note: in expansion of macro '=
sdw_dpn_attr'
    sdw_dpn_attr(imp_def_interrupts, "%d\n");
    ^~~~~~~~~~~~
   drivers/soundwire/sysfs_slave_dpn.c:111:27: warning: 'struct slave' decl=
ared inside parameter list will not be visible outside of this definition o=
r declaration
    dpn_##field##_show(struct slave *slave,     \
                              ^
   drivers/soundwire/sysfs_slave_dpn.c:148:1: note: in expansion of macro '=
sdw_dpn_attr'
    sdw_dpn_attr(min_ch, "%d\n");
    ^~~~~~~~~~~~
   drivers/soundwire/sysfs_slave_dpn.c: In function 'dpn_min_ch_show':
   drivers/soundwire/sysfs_slave_dpn.c:124:14: error: dereferencing pointer=
 to incomplete type 'struct slave'
      dpn =3D slave->prop.src_dpn_prop;    \
                 ^
   drivers/soundwire/sysfs_slave_dpn.c:148:1: note: in expansion of macro '=
sdw_dpn_attr'
    sdw_dpn_attr(min_ch, "%d\n");
    ^~~~~~~~~~~~
   drivers/soundwire/sysfs_slave_dpn.c: At top level:
   drivers/soundwire/sysfs_slave_dpn.c:141:29: error: redefinition of 'dpn_=
attr__field'
    static struct dpn_attribute dpn_attr_##_field =3D __ATTR_RO(_field);
                                ^
   drivers/soundwire/sysfs_slave_dpn.c:148:1: note: in expansion of macro '=
sdw_dpn_attr'
    sdw_dpn_attr(min_ch, "%d\n");
    ^~~~~~~~~~~~
   drivers/soundwire/sysfs_slave_dpn.c:141:29: note: previous definition of=
 'dpn_attr__field' was here
    static struct dpn_attribute dpn_attr_##_field =3D __ATTR_RO(_field);
                                ^
   drivers/soundwire/sysfs_slave_dpn.c:147:1: note: in expansion of macro '=
sdw_dpn_attr'
    sdw_dpn_attr(max_ch, "%d\n");
    ^~~~~~~~~~~~
   drivers/soundwire/sysfs_slave_dpn.c:111:27: warning: 'struct slave' decl=
ared inside parameter list will not be visible outside of this definition o=
r declaration
    dpn_##field##_show(struct slave *slave,     \
                              ^
   drivers/soundwire/sysfs_slave_dpn.c:149:1: note: in expansion of macro '=
sdw_dpn_attr'
    sdw_dpn_attr(modes, "%d\n");
    ^~~~~~~~~~~~
   drivers/soundwire/sysfs_slave_dpn.c: In function 'dpn_modes_show':
   drivers/soundwire/sysfs_slave_dpn.c:124:14: error: dereferencing pointer=
 to incomplete type 'struct slave'
      dpn =3D slave->prop.src_dpn_prop;    \
                 ^
   drivers/soundwire/sysfs_slave_dpn.c:149:1: note: in expansion of macro '=
sdw_dpn_attr'

vim +34 drivers/soundwire/sysfs_slave_dpn.c

    25	=

    26	static int get_port_N_dir(struct kobject *kobj, int *N, int *dir,
  > 27				  struct slave **slv)
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

  > 38		token =3D filename;
  > 39		end =3D filename;
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

  > 70		*slv =3D dev_to_sdw_dev(dev);
    71	=

    72	err:
  > 73		free(filename);
    74		return ret;
    75	}
    76	=

    77	static ssize_t dpn_attr_show(struct kobject *kobj, struct attribute =
*attr,
    78				     char *buf)
    79	{
    80		struct dpn_attribute *dpn_attr =3D
    81			container_of(attr, struct dpn_attribute, attr);
    82		struct slave *slave;
    83		int N;
    84		int dir;
    85	=

    86		if (!dpn_attr->show)
    87			return -EIO;
  > 88		ret =3D get_port_N_dir(kobj, &N, &dir, &codec);
    89		if (ret < 0)
    90			return ret;
  > 91		return dpn_attr->show(slave, N, dir, dpn_attr, buf);
    92	}
    93	=

    94	static const struct sysfs_ops dpn_sysfs_ops =3D {
    95		.show	=3D dpn_attr_show,
    96	};
    97	=

    98	static void dpn_release(struct kobject *kobj)
    99	{
   100		kfree(kobj);
   101	}
   102	=

   103	static struct kobj_type dpn_ktype =3D {
   104		.release	=3D dpn_release,
   105		.sysfs_ops	=3D &dpn_sysfs_ops,
   106	};
   107	=

   108	#define sdw_dpn_attr(field, format_string)				\
   109										\
   110	static ssize_t								\
   111	dpn_##field##_show(struct slave *slave,					\
   112				int N,						\
   113				int dir,					\
   114				struct device_attribute *attr,			\
   115				char *buf)					\
   116	{									\
   117		struct sdw_dpn_prop *dpn;					\
   118		unsigned long mask;						\
   119		int bit;							\
   120		int i;								\
   121										\
   122		/* convert src to source */					\
   123		if (dir) {							\
 > 124			dpn =3D slave->prop.src_dpn_prop;				\
   125			mask =3D slave->prop.source_ports;			\
   126		} else {							\
   127			dpn =3D slave->prop.sink_dpn_prop;			\
   128			mask =3D slave->prop.sink_ports;				\
   129		}								\
   130		i =3D 0;								\
   131		for_each_set_bit(bit, &mask, 32) {				\
   132			if (bit =3D=3D N) {						\
   133				return sprintf(buf, format_string,		\
   134					       dpn[i].field);			\
   135			}							\
   136			i++;							\
   137		}								\
   138		return -EINVAL;							\
   139	}									\
   140										\
 > 141	static struct dpn_attribute dpn_attr_##_field =3D __ATTR_RO(_field);
   142	=

 > 143	sdw_dpn_attr(max_word, "%d\n");
   144	sdw_dpn_attr(min_word, "%d\n");
   145	sdw_dpn_attr(max_grouping, "%d\n");
   146	sdw_dpn_attr(imp_def_interrupts, "%d\n");
   147	sdw_dpn_attr(max_ch, "%d\n");
   148	sdw_dpn_attr(min_ch, "%d\n");
   149	sdw_dpn_attr(modes, "%d\n");
   150	sdw_dpn_attr(max_async_buffer, "%d\n");
   151	sdw_dpn_attr(block_pack_mode, "%d\n");
   152	sdw_dpn_attr(port_encoding, "%d\n");
 > 153	sdw_dpn_attr(simple_ch_prep_sm, "%d\n");
 > 154	sdw_dpn_attr(ch_prep_timeout, "%d\n");
   155	=

   156	static struct attribute dpn_attrs[] =3D {
 > 157		&dpn_attr_max_word.attr,
 > 158		&dpn_attr_min_word.attr,
 > 159		&dpn_attr_max_grouping.attr,
 > 160		&dpn_attr_imp_def_interrupts.attr,
 > 161		&dpn_attr_max_ch.attr,
 > 162		&dpn_attr_min_ch.attr,
 > 163		&dpn_attr_modes.attr,
 > 164		&dpn_attr_max_async_buffer.attr,
 > 165		&dpn_attr_block_pack_mode.attr,
 > 166		&dpn_attr_port_encoding.attr,
 > 167		&dpn_attr_simple_ch_prep_sm.attr,
 > 168		&dpn_attr_ch_prep_timeout.attr,
   169		NULL,
   170	};
   171	=

   172	static const struct attribute_group dpn_group =3D {
 > 173		.attrs =3D dpn_attrs,
   174	};
   175	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============3120433631942657556==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============3120433631942657556==--


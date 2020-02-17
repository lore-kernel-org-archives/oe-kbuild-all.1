Content-Type: multipart/mixed; boundary="===============6957593963357555944=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [brauner:rtm_newlink_device_ownership 1/10] include/linux/sysfs.h:528:19: error: two or more data types in declaration specifiers
Date: Tue, 18 Feb 2020 07:40:34 +0800
Message-ID: <202002180733.sbuOBlXR%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============6957593963357555944==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/brauner/linux.git r=
tm_newlink_device_ownership
head:   165c3e827404a9e4b990a7c3036cb62ce0cb3f59
commit: 3ea9e884992b972986f7970f9a51a1af01f74817 [1/10] sysfs: add sysfs_fi=
le_change_owner{_by_name}()
config: openrisc-allnoconfig (attached as .config)
compiler: or1k-linux-gcc (GCC) 9.2.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git checkout 3ea9e884992b972986f7970f9a51a1af01f74817
        # save the attached .config to linux build tree
        GCC_VERSION=3D9.2.0 make.cross ARCH=3Dopenrisc =


If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from include/linux/kobject.h:20,
                    from include/linux/irqdesc.h:6,
                    from include/linux/irq.h:545,
                    from include/asm-generic/hardirq.h:13,
                    from ./arch/openrisc/include/generated/asm/hardirq.h:1,
                    from include/linux/hardirq.h:9,
                    from include/linux/highmem.h:10,
                    from include/linux/pagemap.h:11,
                    from fs///ramfs/inode.c:27:
>> include/linux/sysfs.h:528:19: error: two or more data types in declarati=
on specifiers
     528 | static inline int int sysfs_file_change_owner(struct kobject *ko=
bj)
         |                   ^~~

vim +528 include/linux/sysfs.h

   527	=

 > 528	static inline int int sysfs_file_change_owner(struct kobject *kobj)
   529	{
   530		return 0;
   531	}
   532	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============6957593963357555944==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
sSmcTL5IAAA=
--===============6957593963357555944==--


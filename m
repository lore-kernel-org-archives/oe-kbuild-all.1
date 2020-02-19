Content-Type: multipart/mixed; boundary="===============0021476869273347389=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [brauner:rtm_newlink_device_ownership_v3 1/10] include/linux/sysfs.h:528:19: error: two or more data types in declaration specifiers
Date: Thu, 20 Feb 2020 07:27:42 +0800
Message-ID: <202002200705.bFL3Pq9s%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============0021476869273347389==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Christian,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/brauner/linux.git r=
tm_newlink_device_ownership_v3
head:   165c3e827404a9e4b990a7c3036cb62ce0cb3f59
commit: 3ea9e884992b972986f7970f9a51a1af01f74817 [1/10] sysfs: add sysfs_fi=
le_change_owner{_by_name}()
config: h8300-edosk2674_defconfig (attached as .config)
compiler: h8300-linux-gcc (GCC) 7.5.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git checkout 3ea9e884992b972986f7970f9a51a1af01f74817
        # save the attached .config to linux build tree
        GCC_VERSION=3D7.5.0 make.cross ARCH=3Dh8300 =


If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from include/linux/kobject.h:20:0,
                    from include/linux/of.h:17,
                    from include/linux/irqdomain.h:35,
                    from include/linux/acpi.h:13,
                    from include/linux/irqchip.h:14,
                    from arch/h8300/include/asm/irq.h:5,
                    from include/linux/irq.h:23,
                    from include/asm-generic/hardirq.h:13,
                    from ./arch/h8300/include/generated/asm/hardirq.h:1,
                    from include/linux/hardirq.h:9,
                    from include/linux/interrupt.h:11,
                    from include/linux/kernel_stat.h:9,
                    from arch/h8300/kernel/asm-offsets.c:14:
>> include/linux/sysfs.h:528:19: error: two or more data types in declarati=
on specifiers
    static inline int int sysfs_file_change_owner(struct kobject *kobj)
                      ^~~
   make[2]: *** [scripts/Makefile.build:101: arch/h8300/kernel/asm-offsets.=
s] Error 1
   make[2]: Target '__build' not remade because of errors.
   make[1]: *** [Makefile:1112: prepare0] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:179: sub-make] Error 2
   11 real  3 user  3 sys  60.73% cpu 	make prepare

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

--===============0021476869273347389==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============0021476869273347389==--


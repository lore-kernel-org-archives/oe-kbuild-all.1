Content-Type: multipart/mixed; boundary="===============7684609495996582496=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [linuxppc:next-test 6/37] include/linux/sysfs.h:515:12: error: 'compat_only_sysfs_link_entry_to_kobj' defined but not used
Date: Mon, 10 Feb 2020 22:41:04 +0800
Message-ID: <202002102201.pGgxgAzK%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============7684609495996582496==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://github.com/linuxppc/linux next-test
head:   36468c325e3aeb621c7565f8a8313a2eaafeda08
commit: d86bf077e526b577d167870a9ed7336309573fe9 [6/37] sysfs: Wrap __compa=
t_only_sysfs_link_entry_to_kobj function to change the symlink name
config: sh-allnoconfig (attached as .config)
compiler: sh4-linux-gcc (GCC) 7.5.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git checkout d86bf077e526b577d167870a9ed7336309573fe9
        # save the attached .config to linux build tree
        GCC_VERSION=3D7.5.0 make.cross ARCH=3Dsh =


If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from include/linux/kobject.h:20:0,
                    from include/linux/module.h:20,
                    from arch/sh/kernel/io.c:8:
>> include/linux/sysfs.h:515:12: error: 'compat_only_sysfs_link_entry_to_ko=
bj' defined but not used [-Werror=3Dunused-function]
    static int compat_only_sysfs_link_entry_to_kobj(struct kobject *kobj,
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors

vim +/compat_only_sysfs_link_entry_to_kobj +515 include/linux/sysfs.h

   514	=

 > 515	static int compat_only_sysfs_link_entry_to_kobj(struct kobject *kobj,
   516							struct kobject *target_kobj,
   517							const char *target_name,
   518							const char *symlink_name)
   519	{
   520		return 0;
   521	}
   522	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============7684609495996582496==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
HV5vYwxKQbrQAKaIv7DiUwAA
--===============7684609495996582496==--


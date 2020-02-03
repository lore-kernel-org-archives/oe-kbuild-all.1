Content-Type: multipart/mixed; boundary="===============2819269612773371341=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH net] device property: change device_get_phy_mode() to prevent signedess bugs
Date: Mon, 03 Feb 2020 13:11:49 +0800
Message-ID: <202002031247.fhmzF9z1%lkp@intel.com>
In-Reply-To: <20200131045953.wbj66jkvijnmf5s2@kili.mountain>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============2819269612773371341==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Dan,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on net/master]
[also build test WARNING on driver-core/driver-core-testing linus/master v5=
.5 next-20200131]
[cannot apply to sparc-next/master]
[if your patch is applied to the wrong git tree, please drop us a note to h=
elp
improve the system. BTW, we also suggest to use '--base' option to specify =
the
base tree in git format-patch, please see https://stackoverflow.com/a/37406=
982]

url:    https://github.com/0day-ci/linux/commits/Dan-Carpenter/device-prope=
rty-change-device_get_phy_mode-to-prevent-signedess-bugs/20200203-043126
base:   https://git.kernel.org/pub/scm/linux/kernel/git/davem/net.git b7c3a=
17c6062701d97a0959890a2c882bfaac537
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-154-g1dc00f87-dirty
        make ARCH=3Dx86_64 allmodconfig
        make C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__'

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

   arch/x86/boot/compressed/cmdline.c:5:20: sparse: sparse: multiple defini=
tions for function 'set_fs'
>> arch/x86/include/asm/uaccess.h:29:20: sparse:  the previous one is here
   arch/x86/boot/compressed/../cmdline.c:28:5: sparse: sparse: symbol '__cm=
dline_find_option' was not declared. Should it be static?
   arch/x86/boot/compressed/../cmdline.c:100:5: sparse: sparse: symbol '__c=
mdline_find_option_bool' was not declared. Should it be static?

vim +29 arch/x86/include/asm/uaccess.h

ca23386216b9d4 include/asm-x86/uaccess.h      Glauber Costa   2008-06-13  2=
7  =

13d4ea097d18b4 arch/x86/include/asm/uaccess.h Andy Lutomirski 2016-07-14  2=
8  #define get_fs()	(current->thread.addr_limit)
5ea0727b163cb5 arch/x86/include/asm/uaccess.h Thomas Garnier  2017-06-14 @2=
9  static inline void set_fs(mm_segment_t fs)
5ea0727b163cb5 arch/x86/include/asm/uaccess.h Thomas Garnier  2017-06-14  3=
0  {
5ea0727b163cb5 arch/x86/include/asm/uaccess.h Thomas Garnier  2017-06-14  3=
1  	current->thread.addr_limit =3D fs;
5ea0727b163cb5 arch/x86/include/asm/uaccess.h Thomas Garnier  2017-06-14  3=
2  	/* On user-mode return, check fs is correct */
5ea0727b163cb5 arch/x86/include/asm/uaccess.h Thomas Garnier  2017-06-14  3=
3  	set_thread_flag(TIF_FSCHECK);
5ea0727b163cb5 arch/x86/include/asm/uaccess.h Thomas Garnier  2017-06-14  3=
4  }
ca23386216b9d4 include/asm-x86/uaccess.h      Glauber Costa   2008-06-13  3=
5  =


:::::: The code at line 29 was first introduced by commit
:::::: 5ea0727b163cb5575e36397a12eade68a1f35f24 x86/syscalls: Check address=
 limit on user-mode return

:::::: TO: Thomas Garnier <thgarnie@google.com>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

---
0-DAY kernel test infrastructure                 Open Source Technology Cen=
ter
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org Intel Corpor=
ation
--===============2819269612773371341==--


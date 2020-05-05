Content-Type: multipart/mixed; boundary="===============5374351754959039632=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [arnd-playground:randconfig-20200504 174/355] arch/x86/um/os-Linux/task_size.c:81:22: warning: variable 'original' set but not used
Date: Tue, 05 May 2020 11:32:05 +0800
Message-ID: <202005051132.b9BKjC0G%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============5374351754959039632==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git=
 randconfig-20200504
head:   5867adb94a59773ef2e3262b70538803fe896906
commit: a2659f82a7fab416ea15f3cc1f6692930e277452 [174/355] move warning set=
tings into header
config: um-i386_defconfig (attached as .config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce:
        git checkout a2659f82a7fab416ea15f3cc1f6692930e277452
        # save the attached .config to linux build tree
        make ARCH=3Dum SUBARCH=3Di386

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   arch/x86/um/os-Linux/task_size.c: In function 'os_get_top_address':
>> arch/x86/um/os-Linux/task_size.c:81:22: warning: variable 'original' set=
 but not used [-Wunused-but-set-variable]
     unsigned long test, original;
                         ^~~~~~~~

vim +/original +81 arch/x86/um/os-Linux/task_size.c

536788fe2d28e1 arch/um/os-Linux/sys-i386/task_size.c Jeff Dike      2008-02=
-08   67  =

40fb16a360d9c6 arch/um/os-Linux/sys-i386/task_size.c Tom Spink      2008-06=
-05   68  unsigned long os_get_top_address(void)
536788fe2d28e1 arch/um/os-Linux/sys-i386/task_size.c Jeff Dike      2008-02=
-08   69  {
536788fe2d28e1 arch/um/os-Linux/sys-i386/task_size.c Jeff Dike      2008-02=
-08   70  	struct sigaction sa, old;
536788fe2d28e1 arch/um/os-Linux/sys-i386/task_size.c Jeff Dike      2008-02=
-08   71  	unsigned long bottom =3D 0;
536788fe2d28e1 arch/um/os-Linux/sys-i386/task_size.c Jeff Dike      2008-02=
-08   72  	/*
536788fe2d28e1 arch/um/os-Linux/sys-i386/task_size.c Jeff Dike      2008-02=
-08   73  	 * A 32-bit UML on a 64-bit host gets confused about the VDSO at
536788fe2d28e1 arch/um/os-Linux/sys-i386/task_size.c Jeff Dike      2008-02=
-08   74  	 * 0xffffe000.  It is mapped, is readable, can be reprotected wr=
iteable
536788fe2d28e1 arch/um/os-Linux/sys-i386/task_size.c Jeff Dike      2008-02=
-08   75  	 * and written.  However, exec discovers later that it can't be
536788fe2d28e1 arch/um/os-Linux/sys-i386/task_size.c Jeff Dike      2008-02=
-08   76  	 * unmapped.  So, just set the highest address to be checked to =
just
536788fe2d28e1 arch/um/os-Linux/sys-i386/task_size.c Jeff Dike      2008-02=
-08   77  	 * below it.  This might waste some address space on 4G/4G 32-bit
536788fe2d28e1 arch/um/os-Linux/sys-i386/task_size.c Jeff Dike      2008-02=
-08   78  	 * hosts, but shouldn't hurt otherwise.
536788fe2d28e1 arch/um/os-Linux/sys-i386/task_size.c Jeff Dike      2008-02=
-08   79  	 */
536788fe2d28e1 arch/um/os-Linux/sys-i386/task_size.c Jeff Dike      2008-02=
-08   80  	unsigned long top =3D 0xffffd000 >> UM_KERN_PAGE_SHIFT;
40fb16a360d9c6 arch/um/os-Linux/sys-i386/task_size.c Tom Spink      2008-06=
-05  @81  	unsigned long test, original;
536788fe2d28e1 arch/um/os-Linux/sys-i386/task_size.c Jeff Dike      2008-02=
-08   82  =

40fb16a360d9c6 arch/um/os-Linux/sys-i386/task_size.c Tom Spink      2008-06=
-05   83  	printf("Locating the bottom of the address space ... ");
536788fe2d28e1 arch/um/os-Linux/sys-i386/task_size.c Jeff Dike      2008-02=
-08   84  	fflush(stdout);
536788fe2d28e1 arch/um/os-Linux/sys-i386/task_size.c Jeff Dike      2008-02=
-08   85  =

536788fe2d28e1 arch/um/os-Linux/sys-i386/task_size.c Jeff Dike      2008-02=
-08   86  	/*
536788fe2d28e1 arch/um/os-Linux/sys-i386/task_size.c Jeff Dike      2008-02=
-08   87  	 * We're going to be longjmping out of the signal handler, so
536788fe2d28e1 arch/um/os-Linux/sys-i386/task_size.c Jeff Dike      2008-02=
-08   88  	 * SA_DEFER needs to be set.
536788fe2d28e1 arch/um/os-Linux/sys-i386/task_size.c Jeff Dike      2008-02=
-08   89  	 */
536788fe2d28e1 arch/um/os-Linux/sys-i386/task_size.c Jeff Dike      2008-02=
-08   90  	sa.sa_handler =3D segfault;
536788fe2d28e1 arch/um/os-Linux/sys-i386/task_size.c Jeff Dike      2008-02=
-08   91  	sigemptyset(&sa.sa_mask);
536788fe2d28e1 arch/um/os-Linux/sys-i386/task_size.c Jeff Dike      2008-02=
-08   92  	sa.sa_flags =3D SA_NODEFER;
4415d8a5aaec20 arch/um/os-Linux/sys-i386/task_size.c WANG Cong      2008-04=
-28   93  	if (sigaction(SIGSEGV, &sa, &old)) {
40fb16a360d9c6 arch/um/os-Linux/sys-i386/task_size.c Tom Spink      2008-06=
-05   94  		perror("os_get_top_address");
4415d8a5aaec20 arch/um/os-Linux/sys-i386/task_size.c WANG Cong      2008-04=
-28   95  		exit(1);
4415d8a5aaec20 arch/um/os-Linux/sys-i386/task_size.c WANG Cong      2008-04=
-28   96  	}
536788fe2d28e1 arch/um/os-Linux/sys-i386/task_size.c Jeff Dike      2008-02=
-08   97  =

40fb16a360d9c6 arch/um/os-Linux/sys-i386/task_size.c Tom Spink      2008-06=
-05   98  	/* Manually scan the address space, bottom-up, until we find
40fb16a360d9c6 arch/um/os-Linux/sys-i386/task_size.c Tom Spink      2008-06=
-05   99  	 * the first valid page (or run out of them).
40fb16a360d9c6 arch/um/os-Linux/sys-i386/task_size.c Tom Spink      2008-06=
-05  100  	 */
40fb16a360d9c6 arch/um/os-Linux/sys-i386/task_size.c Tom Spink      2008-06=
-05  101  	for (bottom =3D 0; bottom < top; bottom++) {
40fb16a360d9c6 arch/um/os-Linux/sys-i386/task_size.c Tom Spink      2008-06=
-05  102  		if (page_ok(bottom))
40fb16a360d9c6 arch/um/os-Linux/sys-i386/task_size.c Tom Spink      2008-06=
-05  103  			break;
40fb16a360d9c6 arch/um/os-Linux/sys-i386/task_size.c Tom Spink      2008-06=
-05  104  	}
40fb16a360d9c6 arch/um/os-Linux/sys-i386/task_size.c Tom Spink      2008-06=
-05  105  =

40fb16a360d9c6 arch/um/os-Linux/sys-i386/task_size.c Tom Spink      2008-06=
-05  106  	/* If we've got this far, we ran out of pages. */
40fb16a360d9c6 arch/um/os-Linux/sys-i386/task_size.c Tom Spink      2008-06=
-05  107  	if (bottom =3D=3D top) {
40fb16a360d9c6 arch/um/os-Linux/sys-i386/task_size.c Tom Spink      2008-06=
-05  108  		fprintf(stderr, "Unable to determine bottom of address "
40fb16a360d9c6 arch/um/os-Linux/sys-i386/task_size.c Tom Spink      2008-06=
-05  109  			"space.\n");
536788fe2d28e1 arch/um/os-Linux/sys-i386/task_size.c Jeff Dike      2008-02=
-08  110  		exit(1);
536788fe2d28e1 arch/um/os-Linux/sys-i386/task_size.c Jeff Dike      2008-02=
-08  111  	}
536788fe2d28e1 arch/um/os-Linux/sys-i386/task_size.c Jeff Dike      2008-02=
-08  112  =

ad32a1f3c36b04 arch/x86/um/os-Linux/task_size.c      Colin Ian King 2016-01=
-23  113  	printf("0x%lx\n", bottom << UM_KERN_PAGE_SHIFT);
40fb16a360d9c6 arch/um/os-Linux/sys-i386/task_size.c Tom Spink      2008-06=
-05  114  	printf("Locating the top of the address space ... ");
40fb16a360d9c6 arch/um/os-Linux/sys-i386/task_size.c Tom Spink      2008-06=
-05  115  	fflush(stdout);
40fb16a360d9c6 arch/um/os-Linux/sys-i386/task_size.c Tom Spink      2008-06=
-05  116  =

40fb16a360d9c6 arch/um/os-Linux/sys-i386/task_size.c Tom Spink      2008-06=
-05  117  	original =3D bottom;
40fb16a360d9c6 arch/um/os-Linux/sys-i386/task_size.c Tom Spink      2008-06=
-05  118  =

536788fe2d28e1 arch/um/os-Linux/sys-i386/task_size.c Jeff Dike      2008-02=
-08  119  	/* This could happen with a 4G/4G split */
536788fe2d28e1 arch/um/os-Linux/sys-i386/task_size.c Jeff Dike      2008-02=
-08  120  	if (page_ok(top))
536788fe2d28e1 arch/um/os-Linux/sys-i386/task_size.c Jeff Dike      2008-02=
-08  121  		goto out;
536788fe2d28e1 arch/um/os-Linux/sys-i386/task_size.c Jeff Dike      2008-02=
-08  122  =

536788fe2d28e1 arch/um/os-Linux/sys-i386/task_size.c Jeff Dike      2008-02=
-08  123  	do {
536788fe2d28e1 arch/um/os-Linux/sys-i386/task_size.c Jeff Dike      2008-02=
-08  124  		test =3D bottom + (top - bottom) / 2;
536788fe2d28e1 arch/um/os-Linux/sys-i386/task_size.c Jeff Dike      2008-02=
-08  125  		if (page_ok(test))
536788fe2d28e1 arch/um/os-Linux/sys-i386/task_size.c Jeff Dike      2008-02=
-08  126  			bottom =3D test;
536788fe2d28e1 arch/um/os-Linux/sys-i386/task_size.c Jeff Dike      2008-02=
-08  127  		else
536788fe2d28e1 arch/um/os-Linux/sys-i386/task_size.c Jeff Dike      2008-02=
-08  128  			top =3D test;
536788fe2d28e1 arch/um/os-Linux/sys-i386/task_size.c Jeff Dike      2008-02=
-08  129  	} while (top - bottom > 1);
536788fe2d28e1 arch/um/os-Linux/sys-i386/task_size.c Jeff Dike      2008-02=
-08  130  =

536788fe2d28e1 arch/um/os-Linux/sys-i386/task_size.c Jeff Dike      2008-02=
-08  131  out:
536788fe2d28e1 arch/um/os-Linux/sys-i386/task_size.c Jeff Dike      2008-02=
-08  132  	/* Restore the old SIGSEGV handling */
4415d8a5aaec20 arch/um/os-Linux/sys-i386/task_size.c WANG Cong      2008-04=
-28  133  	if (sigaction(SIGSEGV, &old, NULL)) {
40fb16a360d9c6 arch/um/os-Linux/sys-i386/task_size.c Tom Spink      2008-06=
-05  134  		perror("os_get_top_address");
4415d8a5aaec20 arch/um/os-Linux/sys-i386/task_size.c WANG Cong      2008-04=
-28  135  		exit(1);
4415d8a5aaec20 arch/um/os-Linux/sys-i386/task_size.c WANG Cong      2008-04=
-28  136  	}
536788fe2d28e1 arch/um/os-Linux/sys-i386/task_size.c Jeff Dike      2008-02=
-08  137  	top <<=3D UM_KERN_PAGE_SHIFT;
ad32a1f3c36b04 arch/x86/um/os-Linux/task_size.c      Colin Ian King 2016-01=
-23  138  	printf("0x%lx\n", top);
536788fe2d28e1 arch/um/os-Linux/sys-i386/task_size.c Jeff Dike      2008-02=
-08  139  =

536788fe2d28e1 arch/um/os-Linux/sys-i386/task_size.c Jeff Dike      2008-02=
-08  140  	return top;
536788fe2d28e1 arch/um/os-Linux/sys-i386/task_size.c Jeff Dike      2008-02=
-08  141  }
51d34749051a63 arch/um/os-Linux/sys-x86/task_size.c  Al Viro        2011-08=
-18  142  =


:::::: The code@line 81 was first introduced by commit
:::::: 40fb16a360d9c6459afee91dc793c1e3374feb94 uml: deal with inaccessible=
 address space start

:::::: TO: Tom Spink <tspink@gmail.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============5374351754959039632==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
hJUbNk+oTe88eV/7P8SMgDU4hwAA
--===============5374351754959039632==--


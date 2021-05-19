Content-Type: multipart/mixed; boundary="===============7591790622315364951=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: arch/parisc/kernel/sys_parisc.c:415:17: warning: no previous prototype for 'parisc_compat_signalfd4'
Date: Wed, 19 May 2021 18:53:29 +0800
Message-ID: <202105191822.gRrRIfRt-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============7591790622315364951==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   8ac91e6c6033ebc12c5c1e4aa171b81a662bd70f
commit: 44a4c9e443674e6cd3368d3e642dfe9c429d5525 parisc: Add wrapper syscal=
ls to fix O_NONBLOCK flag usage
date:   7 months ago
config: parisc-randconfig-r001-20210519 (attached as .config)
compiler: hppa64-linux-gcc (GCC) 9.3.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D44a4c9e443674e6cd3368d3e642dfe9c429d5525
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 44a4c9e443674e6cd3368d3e642dfe9c429d5525
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cross =
ARCH=3Dparisc =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   arch/parisc/kernel/sys_parisc.c:228:15: warning: no previous prototype f=
or 'arch_mmap_rnd' [-Wmissing-prototypes]
     228 | unsigned long arch_mmap_rnd(void)
         |               ^~~~~~~~~~~~~
   arch/parisc/kernel/sys_parisc.c:256:26: warning: no previous prototype f=
or 'sys_mmap2' [-Wmissing-prototypes]
     256 | asmlinkage unsigned long sys_mmap2(unsigned long addr, unsigned =
long len,
         |                          ^~~~~~~~~
   arch/parisc/kernel/sys_parisc.c:266:26: warning: no previous prototype f=
or 'sys_mmap' [-Wmissing-prototypes]
     266 | asmlinkage unsigned long sys_mmap(unsigned long addr, unsigned l=
ong len,
         |                          ^~~~~~~~
   arch/parisc/kernel/sys_parisc.c:281:17: warning: no previous prototype f=
or 'parisc_truncate64' [-Wmissing-prototypes]
     281 | asmlinkage long parisc_truncate64(const char __user * path,
         |                 ^~~~~~~~~~~~~~~~~
   arch/parisc/kernel/sys_parisc.c:287:17: warning: no previous prototype f=
or 'parisc_ftruncate64' [-Wmissing-prototypes]
     287 | asmlinkage long parisc_ftruncate64(unsigned int fd,
         |                 ^~~~~~~~~~~~~~~~~~
   arch/parisc/kernel/sys_parisc.c:295:17: warning: no previous prototype f=
or 'sys_truncate64' [-Wmissing-prototypes]
     295 | asmlinkage long sys_truncate64(const char __user * path, unsigne=
d long length)
         |                 ^~~~~~~~~~~~~~
   arch/parisc/kernel/sys_parisc.c:299:17: warning: no previous prototype f=
or 'sys_ftruncate64' [-Wmissing-prototypes]
     299 | asmlinkage long sys_ftruncate64(unsigned int fd, unsigned long l=
ength)
         |                 ^~~~~~~~~~~~~~~
   arch/parisc/kernel/sys_parisc.c:303:17: warning: no previous prototype f=
or 'sys_fcntl64' [-Wmissing-prototypes]
     303 | asmlinkage long sys_fcntl64(unsigned int fd, unsigned int cmd, u=
nsigned long arg)
         |                 ^~~~~~~~~~~
   arch/parisc/kernel/sys_parisc.c:322:20: warning: no previous prototype f=
or 'parisc_pread64' [-Wmissing-prototypes]
     322 | asmlinkage ssize_t parisc_pread64(unsigned int fd, char __user *=
buf, size_t count,
         |                    ^~~~~~~~~~~~~~
   arch/parisc/kernel/sys_parisc.c:328:20: warning: no previous prototype f=
or 'parisc_pwrite64' [-Wmissing-prototypes]
     328 | asmlinkage ssize_t parisc_pwrite64(unsigned int fd, const char _=
_user *buf,
         |                    ^~~~~~~~~~~~~~~
   arch/parisc/kernel/sys_parisc.c:334:20: warning: no previous prototype f=
or 'parisc_readahead' [-Wmissing-prototypes]
     334 | asmlinkage ssize_t parisc_readahead(int fd, unsigned int high, u=
nsigned int low,
         |                    ^~~~~~~~~~~~~~~~
   arch/parisc/kernel/sys_parisc.c:340:17: warning: no previous prototype f=
or 'parisc_fadvise64_64' [-Wmissing-prototypes]
     340 | asmlinkage long parisc_fadvise64_64(int fd,
         |                 ^~~~~~~~~~~~~~~~~~~
   arch/parisc/kernel/sys_parisc.c:348:17: warning: no previous prototype f=
or 'parisc_sync_file_range' [-Wmissing-prototypes]
     348 | asmlinkage long parisc_sync_file_range(int fd,
         |                 ^~~~~~~~~~~~~~~~~~~~~~
   arch/parisc/kernel/sys_parisc.c:356:17: warning: no previous prototype f=
or 'parisc_fallocate' [-Wmissing-prototypes]
     356 | asmlinkage long parisc_fallocate(int fd, int mode, u32 offhi, u3=
2 offlo,
         |                 ^~~~~~~~~~~~~~~~
   arch/parisc/kernel/sys_parisc.c:363:6: warning: no previous prototype fo=
r 'parisc_personality' [-Wmissing-prototypes]
     363 | long parisc_personality(unsigned long personality)
         |      ^~~~~~~~~~~~~~~~~~
   arch/parisc/kernel/sys_parisc.c:401:17: warning: no previous prototype f=
or 'parisc_timerfd_create' [-Wmissing-prototypes]
     401 | asmlinkage long parisc_timerfd_create(int clockid, int flags)
         |                 ^~~~~~~~~~~~~~~~~~~~~
   arch/parisc/kernel/sys_parisc.c:407:17: warning: no previous prototype f=
or 'parisc_signalfd4' [-Wmissing-prototypes]
     407 | asmlinkage long parisc_signalfd4(int ufd, sigset_t __user *user_=
mask,
         |                 ^~~~~~~~~~~~~~~~
>> arch/parisc/kernel/sys_parisc.c:415:17: warning: no previous prototype f=
or 'parisc_compat_signalfd4' [-Wmissing-prototypes]
     415 | asmlinkage long parisc_compat_signalfd4(int ufd,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~
   arch/parisc/kernel/sys_parisc.c:424:17: warning: no previous prototype f=
or 'parisc_eventfd2' [-Wmissing-prototypes]
     424 | asmlinkage long parisc_eventfd2(unsigned int count, int flags)
         |                 ^~~~~~~~~~~~~~~
   arch/parisc/kernel/sys_parisc.c:430:17: warning: no previous prototype f=
or 'parisc_userfaultfd' [-Wmissing-prototypes]
     430 | asmlinkage long parisc_userfaultfd(int flags)
         |                 ^~~~~~~~~~~~~~~~~~
   arch/parisc/kernel/sys_parisc.c:436:17: warning: no previous prototype f=
or 'parisc_pipe2' [-Wmissing-prototypes]
     436 | asmlinkage long parisc_pipe2(int __user *fildes, int flags)
         |                 ^~~~~~~~~~~~
   arch/parisc/kernel/sys_parisc.c:442:17: warning: no previous prototype f=
or 'parisc_inotify_init1' [-Wmissing-prototypes]
     442 | asmlinkage long parisc_inotify_init1(int flags)
         |                 ^~~~~~~~~~~~~~~~~~~~


vim +/parisc_compat_signalfd4 +415 arch/parisc/kernel/sys_parisc.c

   362	=

 > 363	long parisc_personality(unsigned long personality)
   364	{
   365		long err;
   366	=

   367		if (personality(current->personality) =3D=3D PER_LINUX32
   368		    && personality(personality) =3D=3D PER_LINUX)
   369			personality =3D (personality & ~PER_MASK) | PER_LINUX32;
   370	=

   371		err =3D sys_personality(personality);
   372		if (personality(err) =3D=3D PER_LINUX32)
   373			err =3D (err & ~PER_MASK) | PER_LINUX;
   374	=

   375		return err;
   376	}
   377	=

   378	/*
   379	 * Up to kernel v5.9 we defined O_NONBLOCK as 000200004,
   380	 * since then O_NONBLOCK is defined as 000200000.
   381	 *
   382	 * The following wrapper functions mask out the old
   383	 * O_NDELAY bit from calls which use O_NONBLOCK.
   384	 *
   385	 * XXX: Remove those in year 2022 (or later)?
   386	 */
   387	=

   388	#define O_NONBLOCK_OLD		000200004
   389	#define O_NONBLOCK_MASK_OUT	(O_NONBLOCK_OLD & ~O_NONBLOCK)
   390	=

   391	static int FIX_O_NONBLOCK(int flags)
   392	{
   393		if (flags & O_NONBLOCK_MASK_OUT) {
   394			struct task_struct *tsk =3D current;
   395			pr_warn_once("%s(%d) uses a deprecated O_NONBLOCK value.\n",
   396				tsk->comm, tsk->pid);
   397		}
   398		return flags & ~O_NONBLOCK_MASK_OUT;
   399	}
   400	=

   401	asmlinkage long parisc_timerfd_create(int clockid, int flags)
   402	{
   403		flags =3D FIX_O_NONBLOCK(flags);
   404		return sys_timerfd_create(clockid, flags);
   405	}
   406	=

   407	asmlinkage long parisc_signalfd4(int ufd, sigset_t __user *user_mask,
   408		size_t sizemask, int flags)
   409	{
   410		flags =3D FIX_O_NONBLOCK(flags);
   411		return sys_signalfd4(ufd, user_mask, sizemask, flags);
   412	}
   413	=

   414	#ifdef CONFIG_COMPAT
 > 415	asmlinkage long parisc_compat_signalfd4(int ufd,
   416		compat_sigset_t __user *user_mask,
   417		compat_size_t sizemask, int flags)
   418	{
   419		flags =3D FIX_O_NONBLOCK(flags);
   420		return compat_sys_signalfd4(ufd, user_mask, sizemask, flags);
   421	}
   422	#endif
   423	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============7591790622315364951==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
Tj+7Rx07T6mW+x/BSaI2FRYBAA==
--===============7591790622315364951==--


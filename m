Content-Type: multipart/mixed; boundary="===============3465669284825081002=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [zen-kernel-zen-kernel:5.10/muqss 11/23] kernel/time/timer.c:2049:62: error: 'pm_freezing' undeclared
Date: Sat, 02 Jan 2021 03:32:21 +0800
Message-ID: <202101020346.GrwIuhW5-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============3465669284825081002==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://github.com/zen-kernel/zen-kernel 5.10/muqss
head:   76154be76bebec4ef22db220f7e98bc2f7ed940c
commit: a809bb5c75fc246f155872631258828a6df3485d [11/23] muqss: Reduce impa=
ct on non-MuQSS build
config: powerpc-allnoconfig (attached as .config)
compiler: powerpc-linux-gcc (GCC) 9.3.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/zen-kernel/zen-kernel/commit/a809bb5c75fc246f1=
55872631258828a6df3485d
        git remote add zen-kernel-zen-kernel https://github.com/zen-kernel/=
zen-kernel
        git fetch --no-tags zen-kernel-zen-kernel 5.10/muqss
        git checkout a809bb5c75fc246f155872631258828a6df3485d
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cross =
ARCH=3Dpowerpc =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

Note: the zen-kernel-zen-kernel/5.10/muqss HEAD 76154be76bebec4ef22db220f7e=
98bc2f7ed940c builds fine.
      It only hurts bisectibility.

All errors (new ones prefixed by >>):

   kernel/time/timer.c: In function 'schedule_timeout':
   kernel/time/timer.c:1896:1: warning: label 'out_timeout' defined but not=
 used [-Wunused-label]
    1896 | out_timeout:
         | ^~~~~~~~~~~
   kernel/time/timer.c: In function 'msleep':
>> kernel/time/timer.c:2049:62: error: 'pm_freezing' undeclared (first use =
in this function)
    2049 |  if (jiffs < 5 && hrtimer_resolution < NSEC_PER_SEC / HZ && !pm_=
freezing) {
         |                                                              ^~~=
~~~~~~~~
   kernel/time/timer.c:2049:62: note: each undeclared identifier is reporte=
d only once for each function it appears in
   kernel/time/timer.c: In function 'msleep_interruptible':
   kernel/time/timer.c:2071:62: error: 'pm_freezing' undeclared (first use =
in this function)
    2071 |  if (jiffs < 5 && hrtimer_resolution < NSEC_PER_SEC / HZ && !pm_=
freezing) {
         |                                                              ^~~=
~~~~~~~~
--
   kernel/time/hrtimer.c:120:21: warning: initialized field overwritten [-W=
override-init]
     120 |  [CLOCK_REALTIME] =3D HRTIMER_BASE_REALTIME,
         |                     ^~~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:120:21: note: (near initialization for 'hrtimer_cl=
ock_to_base_table[0]')
   kernel/time/hrtimer.c:121:22: warning: initialized field overwritten [-W=
override-init]
     121 |  [CLOCK_MONOTONIC] =3D HRTIMER_BASE_MONOTONIC,
         |                      ^~~~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:121:22: note: (near initialization for 'hrtimer_cl=
ock_to_base_table[1]')
   kernel/time/hrtimer.c:122:21: warning: initialized field overwritten [-W=
override-init]
     122 |  [CLOCK_BOOTTIME] =3D HRTIMER_BASE_BOOTTIME,
         |                     ^~~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:122:21: note: (near initialization for 'hrtimer_cl=
ock_to_base_table[7]')
   kernel/time/hrtimer.c:123:17: warning: initialized field overwritten [-W=
override-init]
     123 |  [CLOCK_TAI]  =3D HRTIMER_BASE_TAI,
         |                 ^~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:123:17: note: (near initialization for 'hrtimer_cl=
ock_to_base_table[11]')
   kernel/time/hrtimer.c: In function '__run_hrtimer':
   kernel/time/hrtimer.c:1482:7: warning: variable 'expires_in_hardirq' set=
 but not used [-Wunused-but-set-variable]
    1482 |  bool expires_in_hardirq;
         |       ^~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c: At top level:
   kernel/time/hrtimer.c:2226:14: error: redefinition of 'schedule_msec_hrt=
imeout'
    2226 | long __sched schedule_msec_hrtimeout(long timeout)
         |              ^~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/ratelimit.h:6,
                    from include/linux/dev_printk.h:16,
                    from include/linux/device.h:15,
                    from include/linux/node.h:18,
                    from include/linux/cpu.h:17,
                    from kernel/time/hrtimer.c:25:
   include/linux/sched.h:234:20: note: previous definition of 'schedule_mse=
c_hrtimeout' was here
     234 | static inline long schedule_msec_hrtimeout(long timeout)
         |                    ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c: In function 'schedule_msec_hrtimeout':
>> kernel/time/hrtimer.c:2243:62: error: 'pm_freezing' undeclared (first us=
e in this function); did you mean 'freezing'?
    2243 |  if (jiffs > 4 || hrtimer_resolution >=3D NSEC_PER_SEC / HZ || p=
m_freezing)
         |                                                              ^~~=
~~~~~~~~
         |                                                              fre=
ezing
   kernel/time/hrtimer.c:2243:62: note: each undeclared identifier is repor=
ted only once for each function it appears in
   kernel/time/hrtimer.c: At top level:
   kernel/time/hrtimer.c:2311:14: error: redefinition of 'schedule_min_hrti=
meout'
    2311 | long __sched schedule_min_hrtimeout(void)
         |              ^~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/ratelimit.h:6,
                    from include/linux/dev_printk.h:16,
                    from include/linux/device.h:15,
                    from include/linux/node.h:18,
                    from include/linux/cpu.h:17,
                    from kernel/time/hrtimer.c:25:
   include/linux/sched.h:239:20: note: previous definition of 'schedule_min=
_hrtimeout' was here
     239 | static inline long schedule_min_hrtimeout(void)
         |                    ^~~~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:2318:14: error: redefinition of 'schedule_msec_hrt=
imeout_interruptible'
    2318 | long __sched schedule_msec_hrtimeout_interruptible(long timeout)
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/ratelimit.h:6,
                    from include/linux/dev_printk.h:16,
                    from include/linux/device.h:15,
                    from include/linux/node.h:18,
                    from include/linux/cpu.h:17,
                    from kernel/time/hrtimer.c:25:
   include/linux/sched.h:244:20: note: previous definition of 'schedule_mse=
c_hrtimeout_interruptible' was here
     244 | static inline long schedule_msec_hrtimeout_interruptible(long ti=
meout)
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:2325:14: error: redefinition of 'schedule_msec_hrt=
imeout_uninterruptible'
    2325 | long __sched schedule_msec_hrtimeout_uninterruptible(long timeou=
t)
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/ratelimit.h:6,
                    from include/linux/dev_printk.h:16,
                    from include/linux/device.h:15,
                    from include/linux/node.h:18,
                    from include/linux/cpu.h:17,
                    from kernel/time/hrtimer.c:25:
   include/linux/sched.h:249:20: note: previous definition of 'schedule_mse=
c_hrtimeout_uninterruptible' was here
     249 | static inline long schedule_msec_hrtimeout_uninterruptible(long =
timeout)
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/pm_freezing +2049 kernel/time/timer.c

^1da177e4c3f415 kernel/timer.c      Linus Torvalds      2005-04-16  2035  =

^1da177e4c3f415 kernel/timer.c      Linus Torvalds      2005-04-16  2036  /=
**
^1da177e4c3f415 kernel/timer.c      Linus Torvalds      2005-04-16  2037   =
* msleep - sleep safely even with waitqueue interruptions
^1da177e4c3f415 kernel/timer.c      Linus Torvalds      2005-04-16  2038   =
* @msecs: Time in milliseconds to sleep for
^1da177e4c3f415 kernel/timer.c      Linus Torvalds      2005-04-16  2039   =
*/
^1da177e4c3f415 kernel/timer.c      Linus Torvalds      2005-04-16  2040  v=
oid msleep(unsigned int msecs)
^1da177e4c3f415 kernel/timer.c      Linus Torvalds      2005-04-16  2041  {
c68e24eb9e7ff9c kernel/time/timer.c Con Kolivas         2016-11-04  2042  	=
int jiffs =3D msecs_to_jiffies(msecs);
c68e24eb9e7ff9c kernel/time/timer.c Con Kolivas         2016-11-04  2043  	=
unsigned long timeout;
c68e24eb9e7ff9c kernel/time/timer.c Con Kolivas         2016-11-04  2044  =

c68e24eb9e7ff9c kernel/time/timer.c Con Kolivas         2016-11-04  2045  	=
/*
c68e24eb9e7ff9c kernel/time/timer.c Con Kolivas         2016-11-04  2046  	=
 * Use high resolution timers where the resolution of tick based
c68e24eb9e7ff9c kernel/time/timer.c Con Kolivas         2016-11-04  2047  	=
 * timers is inadequate.
c68e24eb9e7ff9c kernel/time/timer.c Con Kolivas         2016-11-04  2048  	=
 */
31a1b5cfd19718a kernel/time/timer.c Con Kolivas         2017-02-20 @2049  	=
if (jiffs < 5 && hrtimer_resolution < NSEC_PER_SEC / HZ && !pm_freezing) {
c68e24eb9e7ff9c kernel/time/timer.c Con Kolivas         2016-11-04  2050  	=
	while (msecs)
c68e24eb9e7ff9c kernel/time/timer.c Con Kolivas         2016-11-04  2051  	=
		msecs =3D schedule_msec_hrtimeout_uninterruptible(msecs);
c68e24eb9e7ff9c kernel/time/timer.c Con Kolivas         2016-11-04  2052  	=
	return;
c68e24eb9e7ff9c kernel/time/timer.c Con Kolivas         2016-11-04  2053  	}
31a1b5cfd19718a kernel/time/timer.c Con Kolivas         2017-02-20  2054  	=
timeout =3D jiffs + 1;
^1da177e4c3f415 kernel/timer.c      Linus Torvalds      2005-04-16  2055  =

75bcc8c5e1de786 kernel/timer.c      Nishanth Aravamudan 2005-09-10  2056  	=
while (timeout)
75bcc8c5e1de786 kernel/timer.c      Nishanth Aravamudan 2005-09-10  2057  	=
	timeout =3D schedule_timeout_uninterruptible(timeout);
^1da177e4c3f415 kernel/timer.c      Linus Torvalds      2005-04-16  2058  }
^1da177e4c3f415 kernel/timer.c      Linus Torvalds      2005-04-16  2059  =


:::::: The code@line 2049 was first introduced by commit
:::::: 31a1b5cfd19718a53b207ee66850516a97964c9a Don't use hrtimer overlay w=
hen pm_freezing since some drivers still don't correctly use freezable time=
outs.

:::::: TO: Con Kolivas <kernel@kolivas.org>
:::::: CC: Steven Barrett <steven@liquorix.net>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============3465669284825081002==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
BdXkFWqlRvIDLbfU93FaAAA=
--===============3465669284825081002==--


Content-Type: multipart/mixed; boundary="===============5442877198184989168=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [zen-kernel-zen-kernel:5.5/muqss 11/16] kernel/time/timer.c:2072:62: error: 'pm_freezing' undeclared
Date: Thu, 06 Feb 2020 00:36:19 +0800
Message-ID: <202002060003.qy58dX2O%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============5442877198184989168==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://github.com/zen-kernel/zen-kernel 5.5/muqss
head:   ac994d428ce6eaa4c05a2b4a2083a32fcc55c682
commit: 7b7af7a285eec9992478fa7c6bfae459d61814f7 [11/16] muqss: Reduce impa=
ct on non-MuQSS build
config: nds32-defconfig (attached as .config)
compiler: nds32le-linux-gcc (GCC) 9.2.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git checkout 7b7af7a285eec9992478fa7c6bfae459d61814f7
        # save the attached .config to linux build tree
        GCC_VERSION=3D9.2.0 make.cross ARCH=3Dnds32 =


If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>

Note: the zen-kernel-zen-kernel/5.5/muqss HEAD ac994d428ce6eaa4c05a2b4a2083=
a32fcc55c682 builds fine.
      It only hurts bisectibility.

All errors (new ones prefixed by >>):

   kernel/time/timer.c: In function 'msleep':
>> kernel/time/timer.c:2072:62: error: 'pm_freezing' undeclared (first use =
in this function)
    2072 |  if (jiffs < 5 && hrtimer_resolution < NSEC_PER_SEC / HZ && !pm_=
freezing) {
         |                                                              ^~~=
~~~~~~~~
   kernel/time/timer.c:2072:62: note: each undeclared identifier is reporte=
d only once for each function it appears in
   kernel/time/timer.c: In function 'msleep_interruptible':
   kernel/time/timer.c:2094:62: error: 'pm_freezing' undeclared (first use =
in this function)
    2094 |  if (jiffs < 5 && hrtimer_resolution < NSEC_PER_SEC / HZ && !pm_=
freezing) {
         |                                                              ^~~=
~~~~~~~~

vim +/pm_freezing +2072 kernel/time/timer.c

^1da177e4c3f41 kernel/timer.c      Linus Torvalds      2005-04-16  2058  =

^1da177e4c3f41 kernel/timer.c      Linus Torvalds      2005-04-16  2059  /**
^1da177e4c3f41 kernel/timer.c      Linus Torvalds      2005-04-16  2060   *=
 msleep - sleep safely even with waitqueue interruptions
^1da177e4c3f41 kernel/timer.c      Linus Torvalds      2005-04-16  2061   *=
 @msecs: Time in milliseconds to sleep for
^1da177e4c3f41 kernel/timer.c      Linus Torvalds      2005-04-16  2062   */
^1da177e4c3f41 kernel/timer.c      Linus Torvalds      2005-04-16  2063  vo=
id msleep(unsigned int msecs)
^1da177e4c3f41 kernel/timer.c      Linus Torvalds      2005-04-16  2064  {
7b36d80a31c58f kernel/time/timer.c Con Kolivas         2016-11-04  2065  	i=
nt jiffs =3D msecs_to_jiffies(msecs);
7b36d80a31c58f kernel/time/timer.c Con Kolivas         2016-11-04  2066  	u=
nsigned long timeout;
7b36d80a31c58f kernel/time/timer.c Con Kolivas         2016-11-04  2067  =

7b36d80a31c58f kernel/time/timer.c Con Kolivas         2016-11-04  2068  	/*
7b36d80a31c58f kernel/time/timer.c Con Kolivas         2016-11-04  2069  	 =
* Use high resolution timers where the resolution of tick based
7b36d80a31c58f kernel/time/timer.c Con Kolivas         2016-11-04  2070  	 =
* timers is inadequate.
7b36d80a31c58f kernel/time/timer.c Con Kolivas         2016-11-04  2071  	 =
*/
5f4147bbea544c kernel/time/timer.c Con Kolivas         2017-02-20 @2072  	i=
f (jiffs < 5 && hrtimer_resolution < NSEC_PER_SEC / HZ && !pm_freezing) {
7b36d80a31c58f kernel/time/timer.c Con Kolivas         2016-11-04  2073  		=
while (msecs)
7b36d80a31c58f kernel/time/timer.c Con Kolivas         2016-11-04  2074  		=
	msecs =3D schedule_msec_hrtimeout_uninterruptible(msecs);
7b36d80a31c58f kernel/time/timer.c Con Kolivas         2016-11-04  2075  		=
return;
7b36d80a31c58f kernel/time/timer.c Con Kolivas         2016-11-04  2076  	}
5f4147bbea544c kernel/time/timer.c Con Kolivas         2017-02-20  2077  	t=
imeout =3D jiffs + 1;
^1da177e4c3f41 kernel/timer.c      Linus Torvalds      2005-04-16  2078  =

75bcc8c5e1de78 kernel/timer.c      Nishanth Aravamudan 2005-09-10  2079  	w=
hile (timeout)
75bcc8c5e1de78 kernel/timer.c      Nishanth Aravamudan 2005-09-10  2080  		=
timeout =3D schedule_timeout_uninterruptible(timeout);
^1da177e4c3f41 kernel/timer.c      Linus Torvalds      2005-04-16  2081  }
^1da177e4c3f41 kernel/timer.c      Linus Torvalds      2005-04-16  2082  =


:::::: The code@line 2072 was first introduced by commit
:::::: 5f4147bbea544c0e753f1c05ad76df4625496807 Don't use hrtimer overlay w=
hen pm_freezing since some drivers still don't correctly use freezable time=
outs.

:::::: TO: Con Kolivas <kernel@kolivas.org>
:::::: CC: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>

---
0-DAY kernel test infrastructure                 Open Source Technology Cen=
ter
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org Intel Corpor=
ation

--===============5442877198184989168==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
Pu4VxT3fYWVL/R8sfPj6xKYAAA==
--===============5442877198184989168==--


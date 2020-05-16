Content-Type: multipart/mixed; boundary="===============5684701363377771092=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [block:for-5.8/block 60/79] include/linux/blkdev.h:1834:26: error: 'sysctl_hung_task_timeout_secs' undeclared
Date: Sun, 17 May 2020 06:13:57 +0800
Message-ID: <202005170655.2wE4z7lC%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============5684701363377771092==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.g=
it for-5.8/block
head:   870c153cf0e6df1b8b5226af41b19945e8e0d143
commit: e6249cdd46e43a7d3bdb8cce5fe24565d6c11e94 [60/79] block: add blk_io_=
schedule() for avoiding task hung in sync dio
config: m68k-allnoconfig (attached as .config)
compiler: m68k-linux-gcc (GCC) 9.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git checkout e6249cdd46e43a7d3bdb8cce5fe24565d6c11e94
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day GCC_VERSION=3D9.3.0 make.cross A=
RCH=3Dm68k =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>

Note: the block/for-5.8/block HEAD 870c153cf0e6df1b8b5226af41b19945e8e0d143=
 builds fine.
      It only hurts bisectibility.

All errors (new ones prefixed by >>, old ones prefixed by <<):

In file included from include/linux/backing-dev.h:15,
from fs/open.c:16:
include/linux/blkdev.h: In function 'blk_io_schedule':
>> include/linux/blkdev.h:1834:26: error: 'sysctl_hung_task_timeout_secs' u=
ndeclared (first use in this function)
1834 |  unsigned long timeout =3D sysctl_hung_task_timeout_secs * HZ / 2;
|                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
include/linux/blkdev.h:1834:26: note: each undeclared identifier is reporte=
d only once for each function it appears in

vim +/sysctl_hung_task_timeout_secs +1834 include/linux/blkdev.h

  1830	=

  1831	static inline void blk_io_schedule(void)
  1832	{
  1833		/* Prevent hang_check timer from firing at us during very long I/O =
*/
> 1834		unsigned long timeout =3D sysctl_hung_task_timeout_secs * HZ / 2;
  1835	=

  1836		if (timeout)
  1837			io_schedule_timeout(timeout);
  1838		else
  1839			io_schedule();
  1840	}
  1841	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============5684701363377771092==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
03YanrPH7oXwJnL5DwtU8Z6qRAAA
--===============5684701363377771092==--


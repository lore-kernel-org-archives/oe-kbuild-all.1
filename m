Content-Type: multipart/mixed; boundary="===============5533740937937459272=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [peterz-queue:locking/irqstate 2/6] arch/sparc/include/asm/percpu_64.h:7:24: warning: call-clobbered register used for global register variable
Date: Fri, 29 May 2020 14:16:40 +0800
Message-ID: <202005291433.yhREej7W%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============5533740937937459272==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git lo=
cking/irqstate
head:   53a5109bcbaecd7ee2639bd53422eeea18b1eb2a
commit: d2706a31db9d55bf0c4c6d2c60beb02b4459805e [2/6] lockdep: Change hard=
irq{s_enabled,_context} to per-cpu variables
config: sparc64-allnoconfig (attached as .config)
compiler: sparc64-linux-gcc (GCC) 9.3.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git checkout d2706a31db9d55bf0c4c6d2c60beb02b4459805e
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cross =
ARCH=3Dsparc64 =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>

All warnings (new ones prefixed by >>, old ones prefixed by <<):

In file included from arch/sparc/include/asm/percpu.h:5,
from include/linux/irqflags.h:17,
from include/asm-generic/cmpxchg-local.h:6,
from arch/sparc/include/asm/cmpxchg_64.h:111,
from arch/sparc/include/asm/cmpxchg.h:5,
from arch/sparc/include/asm/atomic_64.h:12,
from arch/sparc/include/asm/atomic.h:5,
from include/linux/atomic.h:7,
from include/asm-generic/bitops/lock.h:5,
from arch/sparc/include/asm/bitops_64.h:52,
from arch/sparc/include/asm/bitops.h:5,
from include/linux/bitops.h:29,
from include/linux/kernel.h:12,
from arch/sparc/vdso/vclock_gettime.c:15:
>> arch/sparc/include/asm/percpu_64.h:7:24: warning: call-clobbered registe=
r used for global register variable
7 | register unsigned long __local_per_cpu_offset asm("g5");
|                        ^~~~~~~~~~~~~~~~~~~~~~
arch/sparc/vdso/vclock_gettime.c:254:1: warning: no previous prototype for =
'__vdso_clock_gettime' [-Wmissing-prototypes]
254 | __vdso_clock_gettime(clockid_t clock, struct __kernel_old_timespec *t=
s)
| ^~~~~~~~~~~~~~~~~~~~
arch/sparc/vdso/vclock_gettime.c:282:1: warning: no previous prototype for =
'__vdso_clock_gettime_stick' [-Wmissing-prototypes]
282 | __vdso_clock_gettime_stick(clockid_t clock, struct __kernel_old_times=
pec *ts)
| ^~~~~~~~~~~~~~~~~~~~~~~~~~
arch/sparc/vdso/vclock_gettime.c:307:1: warning: no previous prototype for =
'__vdso_gettimeofday' [-Wmissing-prototypes]
307 | __vdso_gettimeofday(struct __kernel_old_timeval *tv, struct timezone =
*tz)
| ^~~~~~~~~~~~~~~~~~~
arch/sparc/vdso/vclock_gettime.c:343:1: warning: no previous prototype for =
'__vdso_gettimeofday_stick' [-Wmissing-prototypes]
343 | __vdso_gettimeofday_stick(struct __kernel_old_timeval *tv, struct tim=
ezone *tz)
| ^~~~~~~~~~~~~~~~~~~~~~~~~

vim +7 arch/sparc/include/asm/percpu_64.h

f5e706ad886b6a include/asm-sparc/percpu_64.h Sam Ravnborg 2008-07-17  6  =

f5e706ad886b6a include/asm-sparc/percpu_64.h Sam Ravnborg 2008-07-17 @7  re=
gister unsigned long __local_per_cpu_offset asm("g5");
f5e706ad886b6a include/asm-sparc/percpu_64.h Sam Ravnborg 2008-07-17  8  =


:::::: The code at line 7 was first introduced by commit
:::::: f5e706ad886b6a5eb59637830110b09ccebf01c5 sparc: join the remaining h=
eader files

:::::: TO: Sam Ravnborg <sam@ravnborg.org>
:::::: CC: David S. Miller <davem@davemloft.net>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============5533740937937459272==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============5533740937937459272==--


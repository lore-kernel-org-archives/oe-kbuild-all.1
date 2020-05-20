Content-Type: multipart/mixed; boundary="===============7409173908817774414=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [hch-misc:kernel_setsockopt 6/32] net/core/sock.c:758:19: warning: comparison is always true due to limited range of data type
Date: Wed, 20 May 2020 21:39:56 +0800
Message-ID: <202005202153.nm1QXqGD%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============7409173908817774414==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   git://git.infradead.org/users/hch/misc.git kernel_setsockopt
head:   43d0f0870df329db68ecbae8e699615ff0c009f1
commit: f7fa6070e761f3e00b46dac42bd9d550367e26a7 [6/32] net: add sock_set_s=
ndtimeo
config: um-defconfig (attached as .config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce:
        git checkout f7fa6070e761f3e00b46dac42bd9d550367e26a7
        # save the attached .config to linux build tree
        make ARCH=3Dum =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>

All warnings (new ones prefixed by >>, old ones prefixed by <<):

cc1: warning: arch/um/include/uapi: No such file or directory [-Wmissing-in=
clude-dirs]
In file included from include/linux/kernel.h:11:0,
from include/linux/unaligned/access_ok.h:5,
from arch/x86/include/asm/unaligned.h:9,
from net/core/sock.c:88:
include/asm-generic/fixmap.h: In function 'fix_to_virt':
include/asm-generic/fixmap.h:32:19: warning: comparison of unsigned express=
ion >=3D 0 is always true [-Wtype-limits]
BUILD_BUG_ON(idx >=3D __end_of_fixed_addresses);
^
include/linux/compiler.h:330:9: note: in definition of macro '__compiletime=
_assert'
if (!(condition))                 ^~~~~~~~~
include/linux/compiler.h:350:2: note: in expansion of macro '_compiletime_a=
ssert'
_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
^~~~~~~~~~~~~~~~~~~
include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_a=
ssert'
#define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
^~~~~~~~~~~~~~~~~~
include/linux/build_bug.h:50:2: note: in expansion of macro 'BUILD_BUG_ON_M=
SG'
BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
^~~~~~~~~~~~~~~~
include/asm-generic/fixmap.h:32:2: note: in expansion of macro 'BUILD_BUG_O=
N'
BUILD_BUG_ON(idx >=3D __end_of_fixed_addresses);
^~~~~~~~~~~~
In file included from include/linux/uaccess.h:11:0,
from include/linux/sched/task.h:11,
from include/linux/sched/signal.h:9,
from include/linux/rcuwait.h:6,
from include/linux/percpu-rwsem.h:7,
from include/linux/fs.h:34,
from include/linux/huge_mm.h:8,
from include/linux/mm.h:679,
from include/linux/bvec.h:13,
from include/linux/skbuff.h:17,
from include/linux/ip.h:16,
from include/net/ip.h:22,
from include/linux/errqueue.h:6,
from net/core/sock.c:91:
arch/um/include/asm/uaccess.h: In function '__access_ok':
arch/um/include/asm/uaccess.h:17:29: warning: comparison of unsigned expres=
sion >=3D 0 is always true [-Wtype-limits]
(((unsigned long) (addr) >=3D FIXADDR_USER_START) &&                       =
          ^
arch/um/include/asm/uaccess.h:45:3: note: in expansion of macro '__access_o=
k_vsyscall'
__access_ok_vsyscall(addr, size) ||
^~~~~~~~~~~~~~~~~~~~
net/core/sock.c: In function 'sock_set_sndtimeo':
>> net/core/sock.c:758:19: warning: comparison is always true due to limite=
d range of data type [-Wtype-limits]
if (secs && secs < MAX_SCHEDULE_TIMEOUT / HZ - 1)
^

vim +758 net/core/sock.c

   754	=

   755	void sock_set_sndtimeo(struct sock *sk, unsigned int secs)
   756	{
   757		lock_sock(sk);
 > 758		if (secs && secs < MAX_SCHEDULE_TIMEOUT / HZ - 1)
   759			sk->sk_sndtimeo =3D secs * HZ;
   760		else
   761			sk->sk_sndtimeo =3D MAX_SCHEDULE_TIMEOUT;
   762		release_sock(sk);
   763	}
   764	EXPORT_SYMBOL(sock_set_sndtimeo);
   765	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============7409173908817774414==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============7409173908817774414==--


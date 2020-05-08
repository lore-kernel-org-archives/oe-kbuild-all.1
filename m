Content-Type: multipart/mixed; boundary="===============8062455602839132842=="
MIME-Version: 1.0
From: Minchan Kim <minchan@kernel.org>
To: kbuild-all@lists.01.org
Subject: Re: [linux-next:master 6698/6711] <stdin>:1520:2: warning: #warning syscall process_madvise not implemented
Date: Thu, 07 May 2020 22:25:17 -0700
Message-ID: <20200508052517.GA197378@google.com>
In-Reply-To: <202005080716.cUcbCQ3i%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============8062455602839132842==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, May 08, 2020 at 07:37:19AM +0800, kbuild test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it master
> head:   7def1ef0f72c3ebe3e42467d2f73c4e56153fa49
> commit: db22c0ad9503eda042475aca2675cdce55249b4b [6698/6711] mm/madvise: =
introduce process_madvise() syscall: an external memory hinting API
> config: mips-ip27_defconfig (attached as .config)
> compiler: mips64-linux-gcc (GCC) 9.3.0
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         git checkout db22c0ad9503eda042475aca2675cdce55249b4b
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=3D$HOME/0day GCC_VERSION=3D9.3.0 make.cross=
 ARCH=3Dmips =

> =

> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kbuild test robot <lkp@intel.com>
> =

> All warnings (new ones prefixed by >>):
> =

> >> <stdin>:1520:2: warning: #warning syscall process_madvise not implemen=
ted [-Wcpp]
> --
> >> <stdin>:1520:2: warning: #warning syscall process_madvise not implemen=
ted [-Wcpp]
> --
> >> <stdin>:1520:2: warning: #warning syscall process_madvise not implemen=
ted [-Wcpp]
> =

> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

Thanks for the report. This patch should fix it.

>From 2b93b6abc2a32683cdccb6f109617e1a597466c8 Mon Sep 17 00:00:00 2001
From: Minchan Kim <minchan@kernel.org>
Date: Thu, 7 May 2020 22:18:21 -0700
Subject: [PATCH] mm: fix build error for mips of process_madvise

kbuild test rebot reported build break of process_madvise for mips[1].
This patch should fix it.

[1] https://lore.kernel.org/linux-mm/202005080716.cUcbCQ3i%25lkp(a)intel.co=
m/
Reported-by: kbuild test robot <lkp@intel.com>
Signed-off-by: Minchan Kim <minchan@kernel.org>
---
 arch/mips/kernel/syscalls/syscall_o32.tbl | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/kernel/syscalls/syscall_o32.tbl b/arch/mips/kernel/s=
yscalls/syscall_o32.tbl
index ac586774c980..940c7f49a731 100644
--- a/arch/mips/kernel/syscalls/syscall_o32.tbl
+++ b/arch/mips/kernel/syscalls/syscall_o32.tbl
@@ -425,3 +425,4 @@
 435	o32	clone3				__sys_clone3
 437	o32	openat2				sys_openat2
 438	o32	pidfd_getfd			sys_pidfd_getfd
+439	o32	process_madvise			sys_process_madvise		compat_sys_process_madvise
-- =

2.26.2.645.ge9eca65c58-goog


--===============8062455602839132842==--


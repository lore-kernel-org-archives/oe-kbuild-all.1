Content-Type: multipart/mixed; boundary="===============2575460418896159374=="
MIME-Version: 1.0
From: Stephen Boyd <swboyd@chromium.org>
To: kbuild-all@lists.01.org
Subject: Re: [linux-next:master 3136/3150] init/main.c:925:2: error: implicit declaration of function 'init_vmlinux_build_id'
Date: Sat, 15 May 2021 14:15:17 -0700
Message-ID: <CAE-0n51UjTbay8N9FXAyE7_aR2+ePrQnKSRJ0gbmRsXtcLBVaw@mail.gmail.com>
In-Reply-To: <202105160413.SU0hW0he-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============2575460418896159374==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Quoting kernel test robot (2021-05-15 13:25:22)
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it master
> head:   cd557f1c605fc5a2c0eb0b540610f50dc67dd849
> commit: 9bbb6ec7e7a5cbc59222379498d5a3b8ac21080a [3136/3150] buildid: sta=
sh away kernels build ID on init
> config: x86_64-randconfig-a005-20210514 (attached as .config)
> compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
> reproduce (this is a W=3D1 build):
>         # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git/commit/?id=3D9bbb6ec7e7a5cbc59222379498d5a3b8ac21080a
>         git remote add linux-next https://git.kernel.org/pub/scm/linux/ke=
rnel/git/next/linux-next.git
>         git fetch --no-tags linux-next master
>         git checkout 9bbb6ec7e7a5cbc59222379498d5a3b8ac21080a
>         # save the attached .config to linux build tree
>         make W=3D1 W=3D1 ARCH=3Dx86_64
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
> Note: the linux-next/master HEAD cd557f1c605fc5a2c0eb0b540610f50dc67dd849=
 builds fine.
>       It may have been fixed somewhere.
>
> All errors (new ones prefixed by >>):
>
>    init/main.c: In function 'start_kernel':
> >> init/main.c:925:2: error: implicit declaration of function 'init_vmlin=
ux_build_id' [-Werror=3Dimplicit-function-declaration]
>      925 |  init_vmlinux_build_id();
>          |  ^~~~~~~~~~~~~~~~~~~~~
>    cc1: some warnings being treated as errors

Thanks. This patch should fix it. Andrew, can it be squashed in?

diff --git a/init/main.c b/init/main.c
index eaede2f41327..38982b688431 100644
--- a/init/main.c
+++ b/init/main.c
@@ -44,6 +44,7 @@
 #include <linux/rcupdate.h>
 #include <linux/moduleparam.h>
 #include <linux/kallsyms.h>
+#include <linux/buildid.h>
 #include <linux/writeback.h>
 #include <linux/cpu.h>
 #include <linux/cpuset.h>
--===============2575460418896159374==--


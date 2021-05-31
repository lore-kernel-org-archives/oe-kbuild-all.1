Content-Type: multipart/mixed; boundary="===============7013796483772522644=="
MIME-Version: 1.0
From: Andrew Morton <akpm@linux-foundation.org>
To: kbuild-all@lists.01.org
Subject: Re: [linux-next:master 5596/5886] arch/x86/include/asm/fixmap.h:103:48: error: use of undeclared identifier 'NR_CPUS'
Date: Mon, 31 May 2021 15:05:54 -0700
Message-ID: <20210531150554.bb7769cdedb4fd9bf471b891@linux-foundation.org>
In-Reply-To: <20210531093917.GL3672@suse.de>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============7013796483772522644==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, 31 May 2021 10:39:17 +0100 Mel Gorman <mgorman@suse.de> wrote:

> On Sun, May 30, 2021 at 07:58:14PM +0800, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git master
> > head:   3e029760e6f8ce90c122c267a039ae73b3f1f5a4
> > commit: 366e9aec4a22d77b869f1b7641a74fdd96f02b4c [5596/5886] mm/early_i=
oremap: add prototype for early_memremap_pgprot_adjust
> > config: x86_64-randconfig-a006-20210530 (attached as .config)
> > compiler: clang version 13.0.0 (https://github.com/llvm/llvm-project bc=
6799f2f79f0ae87e9f1ebf9d25ba799fbd25a9)
> > reproduce (this is a W=3D1 build):
> >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/s=
bin/make.cross -O ~/bin/make.cross
> >         chmod +x ~/bin/make.cross
> >         # install x86_64 cross compiling tool for clang build
> >         # apt-get install binutils-x86-64-linux-gnu
> >         # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-ne=
xt.git/commit/?id=3D366e9aec4a22d77b869f1b7641a74fdd96f02b4c
> >         git remote add linux-next https://git.kernel.org/pub/scm/linux/=
kernel/git/next/linux-next.git
> >         git fetch --no-tags linux-next master
> >         git checkout 366e9aec4a22d77b869f1b7641a74fdd96f02b4c
> >         # save the attached .config to linux build tree
> >         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross =
ARCH=3Dx86_64 =

> > =

> =

> Hi Andrew,
> =

> Can you please drop the patch
> mm-early_ioremap-add-prototype-for-early_memremap_pgprot_adjust.patch?

Didn't I fix this with
mm-early_ioremap-add-prototype-for-early_memremap_pgprot_adjust-fix.patch?

This fix is lame - x86's fixmap.h should be standalone.  But this gets us
moving ahead with the MM changes for now.



From: Andrew Morton <akpm@linux-foundation.org>
Subject: mm-early_ioremap-add-prototype-for-early_memremap_pgprot_adjust-fix

x86_64 asm/fixmap.h needs linux/threads.h for NR_CPUS

Cc: Dan Streetman <ddstreet@ieee.org>
Cc: David Hildenbrand <david@redhat.com>
Cc: Mel Gorman <mgorman@techsingularity.net>
Cc: Michal Hocko <mhocko@kernel.org>
Cc: Vlastimil Babka <vbabka@suse.cz>
Cc: Yang Shi <shy828301@gmail.com>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 include/asm-generic/early_ioremap.h |    1 +
 1 file changed, 1 insertion(+)

--- a/include/asm-generic/early_ioremap.h~mm-early_ioremap-add-prototype-fo=
r-early_memremap_pgprot_adjust-fix
+++ a/include/asm-generic/early_ioremap.h
@@ -3,6 +3,7 @@
 #define _ASM_EARLY_IOREMAP_H_
 =

 #include <linux/types.h>
+#include <linux/threads.h>	/* x86 fixmap.h needs NR_CPUS */
 #include <asm/fixmap.h>
 =

 /*
_

--===============7013796483772522644==--


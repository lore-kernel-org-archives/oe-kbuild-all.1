Content-Type: multipart/mixed; boundary="===============7472407775829202956=="
MIME-Version: 1.0
From: Mike Rapoport <rppt@kernel.org>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH v4 1/4] mm: rename memmap_init() and memmap_init_zone()
Date: Thu, 21 Jan 2021 10:25:22 +0200
Message-ID: <20210121082522.GS1106298@kernel.org>
In-Reply-To: <20210121081727.GG20161@MiWiFi-R3L-srv>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============7472407775829202956==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 21, 2021 at 04:17:27PM +0800, Baoquan He wrote:
> On 01/20/21 at 11:47pm, kernel test robot wrote:
> > Hi Baoquan,
> > =

> > I love your patch! Perhaps something to improve:
> > =

> > [auto build test WARNING on linux/master]
> > [also build test WARNING on linus/master v5.11-rc4 next-20210120]
> > [cannot apply to mmotm/master hnaz-linux-mm/master ia64/next]
> > [If your patch is applied to the wrong git tree, kindly drop us a note.
> > And when submitting patch, we suggest to use '--base' as documented in
> > https://git-scm.com/docs/git-format-patch]
> > =

> > url:    https://github.com/0day-ci/linux/commits/Baoquan-He/mm-clean-up=
-names-and-parameters-of-memmap_init_xxxx-functions/20210120-135239
> > base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.=
git 1e2a199f6ccdc15cf111d68d212e2fd4ce65682e
> > config: mips-randconfig-r036-20210120 (attached as .config)
> > compiler: mips-linux-gcc (GCC) 9.3.0
> > reproduce (this is a W=3D1 build):
> >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/s=
bin/make.cross -O ~/bin/make.cross
> >         chmod +x ~/bin/make.cross
> >         # https://github.com/0day-ci/linux/commit/1bbb0b35dd2fae4a7a380=
98e63899677c2e53108
> >         git remote add linux-review https://github.com/0day-ci/linux
> >         git fetch --no-tags linux-review Baoquan-He/mm-clean-up-names-a=
nd-parameters-of-memmap_init_xxxx-functions/20210120-135239
> >         git checkout 1bbb0b35dd2fae4a7a38098e63899677c2e53108
> >         # save the attached .config to linux build tree
> >         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cr=
oss ARCH=3Dmips =

> > =

> > If you fix the issue, kindly add following tag as appropriate
> > Reported-by: kernel test robot <lkp@intel.com>
> > =

> > All warnings (new ones prefixed by >>):
> > =

> >    mm/page_alloc.c:3597:15: warning: no previous prototype for 'should_=
fail_alloc_page' [-Wmissing-prototypes]
> >     3597 | noinline bool should_fail_alloc_page(gfp_t gfp_mask, unsigne=
d int order)
> >          |               ^~~~~~~~~~~~~~~~~~~~~~
> > >> mm/page_alloc.c:6258:23: warning: no previous prototype for 'memmap_=
init_zone' [-Wmissing-prototypes]
> >     6258 | void __meminit __weak memmap_init_zone(unsigned long size, i=
nt nid,
> =

> This is not introduced by this patch, but existing issue, should
> be not related to this patchset. I will investigate and see what we
> should do with memmap_init_zone(), adding static or adding it to header
> file, or just leave it as should_fail_alloc_page().
> =

> =

> By the way, I tried to reproduce on a fedora 32 system of x86 arch, but
> met below issue. could you help check what I can do to fix the error.
> =

> =

> [root(a)dell-per710-01 linux]# COMPILER_INSTALL_PATH=3D~/0day COMPILER=3D=
gcc-9.3.0 ~/bin/make.cross ARCH=3Dmips
> Compiler will be installed in /root/0day
> make W=3D1 CONFIG_OF_ALL_DTBS=3Dy CONFIG_DTC=3Dy CROSS_COMPILE=3D/root/0d=
ay/gcc-9.3.0-nolibc/mips-linux/bin/mips-linux- --jobs=3D16 ARCH=3Dmips
>   HOSTCXX scripts/gcc-plugins/latent_entropy_plugin.so
>   HOSTCXX scripts/gcc-plugins/structleak_plugin.so
>   HOSTCXX scripts/gcc-plugins/randomize_layout_plugin.so
> In file included from /root/0day/gcc-9.3.0-nolibc/mips-linux/bin/../lib/g=
cc/mips-linux/9.3.0/plugin/include/gcc-plugin.h:28,
>                  from scripts/gcc-plugins/gcc-common.h:7,
>                  from scripts/gcc-plugins/latent_entropy_plugin.c:78:
> /root/0day/gcc-9.3.0-nolibc/mips-linux/bin/../lib/gcc/mips-linux/9.3.0/pl=
ugin/include/system.h:687:10: fatal error: gmp.h: No such file or directy
>   687 | #include <gmp.h>
>       |          ^~~~~~~
> compilation terminated.
> make[2]: *** [scripts/gcc-plugins/Makefile:47: scripts/gcc-plugins/latent=
_entropy_plugin.so] Error 1
> make[2]: *** Waiting for unfinished jobs..

Do you have gmp-devel installed?
 =

> Thanks
> Baoquan
> =

> >          |                       ^~~~~~~~~~~~~~~~
> > =

> > =

> > vim +/memmap_init_zone +6258 mm/page_alloc.c
> > =

> >   6257	=

> > > 6258	void __meminit __weak memmap_init_zone(unsigned long size, int n=
id,
> >   6259					  unsigned long zone,
> >   6260					  unsigned long range_start_pfn)
> >   6261	{
> >   6262		unsigned long start_pfn, end_pfn;
> >   6263		unsigned long range_end_pfn =3D range_start_pfn + size;
> >   6264		int i;
> >   6265	=

> >   6266		for_each_mem_pfn_range(i, nid, &start_pfn, &end_pfn, NULL) {
> >   6267			start_pfn =3D clamp(start_pfn, range_start_pfn, range_end_pfn);
> >   6268			end_pfn =3D clamp(end_pfn, range_start_pfn, range_end_pfn);
> >   6269	=

> >   6270			if (end_pfn > start_pfn) {
> >   6271				size =3D end_pfn - start_pfn;
> >   6272				memmap_init_range(size, nid, zone, start_pfn, range_end_pfn,
> >   6273						 MEMINIT_EARLY, NULL, MIGRATE_MOVABLE);
> >   6274			}
> >   6275		}
> >   6276	}
> >   6277	=

> > =

> > ---
> > 0-DAY CI Kernel Test Service, Intel Corporation
> > https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
> =

> =


-- =

Sincerely yours,
Mike.
--===============7472407775829202956==--


Content-Type: multipart/mixed; boundary="===============2231649698562134285=="
MIME-Version: 1.0
From: Baoquan He <bhe@redhat.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH v4 1/4] mm: rename memmap_init() and memmap_init_zone()
Date: Fri, 22 Jan 2021 15:13:16 +0800
Message-ID: <20210122071316.GJ20161@MiWiFi-R3L-srv>
In-Reply-To: <202101202302.EE9LLAFu-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============2231649698562134285==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 01/20/21 at 11:47pm, kernel test robot wrote:
> Hi Baoquan,
> =

> I love your patch! Perhaps something to improve:
> =

> [auto build test WARNING on linux/master]
> [also build test WARNING on linus/master v5.11-rc4 next-20210120]
> [cannot apply to mmotm/master hnaz-linux-mm/master ia64/next]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
> =

> url:    https://github.com/0day-ci/linux/commits/Baoquan-He/mm-clean-up-n=
ames-and-parameters-of-memmap_init_xxxx-functions/20210120-135239
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t 1e2a199f6ccdc15cf111d68d212e2fd4ce65682e
> config: mips-randconfig-r036-20210120 (attached as .config)
> compiler: mips-linux-gcc (GCC) 9.3.0
> reproduce (this is a W=3D1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://github.com/0day-ci/linux/commit/1bbb0b35dd2fae4a7a38098=
e63899677c2e53108
>         git remote add linux-review https://github.com/0day-ci/linux
>         git fetch --no-tags linux-review Baoquan-He/mm-clean-up-names-and=
-parameters-of-memmap_init_xxxx-functions/20210120-135239
>         git checkout 1bbb0b35dd2fae4a7a38098e63899677c2e53108
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cros=
s ARCH=3Dmips =

> =

> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> =

> All warnings (new ones prefixed by >>):
> =

>    mm/page_alloc.c:3597:15: warning: no previous prototype for 'should_fa=
il_alloc_page' [-Wmissing-prototypes]
>     3597 | noinline bool should_fail_alloc_page(gfp_t gfp_mask, unsigned =
int order)
>          |               ^~~~~~~~~~~~~~~~~~~~~~
> >> mm/page_alloc.c:6258:23: warning: no previous prototype for 'memmap_in=
it_zone' [-Wmissing-prototypes]
>     6258 | void __meminit __weak memmap_init_zone(unsigned long size, int=
 nid,
>          |                       ^~~~~~~~~~~~~~~~

Have posted a patch to fix this warning as below. The patch is based on
this patchset.

https://lore.kernel.org/linux-mm/20210122070359.24010-1-bhe(a)redhat.com/

Thanks
Baoquan

--===============2231649698562134285==--


Content-Type: multipart/mixed; boundary="===============5838440686301356465=="
MIME-Version: 1.0
From: Masami Hiramatsu <mhiramat@kernel.org>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH 1/2] kprobes: Allow architectures to override optinsn page allocation
Date: Thu, 13 May 2021 09:33:28 +0900
Message-ID: <20210513093328.2e4c6da04bd285e0ac688a5d@kernel.org>
In-Reply-To: <202105130218.8xHlehr7-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============5838440686301356465==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, 13 May 2021 03:04:51 +0800
kernel test robot <lkp@intel.com> wrote:

> Hi Christophe,
> =

> I love your patch! Perhaps something to improve:
> =

> [auto build test WARNING on powerpc/next]
> [also build test WARNING on linus/master v5.13-rc1 next-20210512]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
> =

> url:    https://github.com/0day-ci/linux/commits/Christophe-Leroy/kprobes=
-Allow-architectures-to-override-optinsn-page-allocation/20210512-223121
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git=
 next
> config: i386-randconfig-r012-20210512 (attached as .config)
> compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
> reproduce (this is a W=3D1 build):
>         # https://github.com/0day-ci/linux/commit/2a1f135a9ce3c4d86d3bdef=
ed561aa17760f430f
>         git remote add linux-review https://github.com/0day-ci/linux
>         git fetch --no-tags linux-review Christophe-Leroy/kprobes-Allow-a=
rchitectures-to-override-optinsn-page-allocation/20210512-223121
>         git checkout 2a1f135a9ce3c4d86d3bdefed561aa17760f430f
>         # save the attached .config to linux build tree
>         make W=3D1 W=3D1 ARCH=3Di386 =

> =

> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> =

> All warnings (new ones prefixed by >>):
> =

> >> kernel/kprobes.c:324:14: warning: no previous prototype for 'alloc_opt=
insn_page' [-Wmissing-prototypes]
>      324 | void __weak *alloc_optinsn_page(void)
>          |              ^~~~~~~~~~~~~~~~~~
> >> kernel/kprobes.c:329:13: warning: no previous prototype for 'free_opti=
nsn_page' [-Wmissing-prototypes]
>      329 | void __weak free_optinsn_page(void *page)
>          |             ^~~~~~~~~~~~~~~~~

Ah, we need a prototype for those in include/linux/kprobes.h
as same as alloc_insn_page() and free_insn_page().

Thank you,

-- =

Masami Hiramatsu <mhiramat@kernel.org>
--===============5838440686301356465==--


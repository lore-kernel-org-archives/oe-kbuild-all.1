Content-Type: multipart/mixed; boundary="===============3822968945485486878=="
MIME-Version: 1.0
From: Andrew Morton <akpm@linux-foundation.org>
To: kbuild-all@lists.01.org
Subject: Re: [linux-next:master 7592/7905] arch/riscv/mm/ptdump.c:57:3: error: 'FIXADDR_START' undeclared here (not in a function); did you mean 'XAS_RESTART'?
Date: Wed, 13 May 2020 18:07:45 -0700
Message-ID: <20200513180745.30cfb5d0011c8e12972bdb8d@linux-foundation.org>
In-Reply-To: <202005091847.zkVHPjis%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============3822968945485486878==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sat, 9 May 2020 18:46:50 +0800 kbuild test robot <lkp@intel.com> wrote:

> Hi Zong,
> =

> First bad commit (maybe !=3D root cause):
> =

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it master
> head:   30e2206e11ce27ae910cc0dab21472429e400a87
> commit: c0eba2d72e70b4208ca6fd82820ba7428090e350 [7592/7905] riscv: suppo=
rt DEBUG_WX
> config: riscv-randconfig-r003-20200509 (attached as .config)
> compiler: riscv64-linux-gcc (GCC) 9.3.0
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         git checkout c0eba2d72e70b4208ca6fd82820ba7428090e350
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=3D$HOME/0day GCC_VERSION=3D9.3.0 make.cross=
 ARCH=3Driscv =

> =

> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kbuild test robot <lkp@intel.com>
> =

> All error/warnings (new ones prefixed by >>):
> =

> >> arch/riscv/mm/ptdump.c:57:3: error: 'FIXADDR_START' undeclared here (n=
ot in a function); did you mean 'XAS_RESTART'?
>       57 |  {FIXADDR_START,  "Fixmap start"},
>          |   ^~~~~~~~~~~~~
>          |   XAS_RESTART

argh, I can't figure out how to make riscv compile :(

Are you using the riscv32 toolchain or riscv64?

And arch/riscv/include/asm/perf_event.h does

#ifdef CONFIG_RISCV_BASE_PMU
#define RISCV_MAX_COUNTERS	2
#endif

#ifndef RISCV_MAX_COUNTERS
#error "Please provide a valid RISCV_MAX_COUNTERS for the PMU."
#endif

where is RISCV_MAX_COUNTERS supposed to come from?  Surely this should
be implemented in Kconfig somehow?

Sigh.  Zong, did you take a look at this?
--===============3822968945485486878==--


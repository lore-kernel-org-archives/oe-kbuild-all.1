Content-Type: multipart/mixed; boundary="===============3069767479016392655=="
MIME-Version: 1.0
From: Randy Dunlap <rdunlap@infradead.org>
To: kbuild-all@lists.01.org
Subject: Re: arch/csky/mm/tcm.c:14:2: error: #error "You should define DTCM_RAM_BASE"
Date: Fri, 14 May 2021 16:22:01 -0700
Message-ID: <a386406d-40fd-d382-b272-e524f046ca71@infradead.org>
In-Reply-To: <202105150718.cdDLUzFD-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============3069767479016392655==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 5/14/21 4:08 PM, kernel test robot wrote:
> Hi Guo,
> =

> First bad commit (maybe !=3D root cause):
> =

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t master
> head:   25a1298726e97b9d25379986f5d54d9e62ad6e93
> commit: 18c07d23da5a48525b2955aa269b8bb108c19300 csky: Fixup calltrace pa=
nic
> date:   1 year ago
> config: csky-randconfig-r036-20210515 (attached as .config)
> compiler: csky-linux-gcc (GCC) 9.3.0
> reproduce (this is a W=3D1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.=
git/commit/?id=3D18c07d23da5a48525b2955aa269b8bb108c19300
>         git remote add linus https://git.kernel.org/pub/scm/linux/kernel/=
git/torvalds/linux.git
>         git fetch --no-tags linus master
>         git checkout 18c07d23da5a48525b2955aa269b8bb108c19300
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cros=
s W=3D1 ARCH=3Dcsky =

> =

> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> =

> All errors (new ones prefixed by >>):
> =

>>> arch/csky/mm/tcm.c:14:2: error: #error "You should define DTCM_RAM_BASE"
>       14 | #error "You should define DTCM_RAM_BASE"
>          |  ^~~~~
>    arch/csky/mm/tcm.c:109:7: warning: no previous prototype for 'tcm_allo=
c' [-Wmissing-prototypes]
>      109 | void *tcm_alloc(size_t len)
>          |       ^~~~~~~~~
>    arch/csky/mm/tcm.c:124:6: warning: no previous prototype for 'tcm_free=
' [-Wmissing-prototypes]
>      124 | void tcm_free(void *addr, size_t len)
>          |      ^~~~~~~~
> =

> =

> vim +14 arch/csky/mm/tcm.c
> =

> f525bb2c9e7cf1 Guo Ren 2019-11-27  11  =

> f525bb2c9e7cf1 Guo Ren 2019-11-27  12  #ifdef CONFIG_HAVE_DTCM
> f525bb2c9e7cf1 Guo Ren 2019-11-27  13  #if (CONFIG_DTCM_RAM_BASE =3D=3D 0=
xffffffff)
> f525bb2c9e7cf1 Guo Ren 2019-11-27 @14  #error "You should define DTCM_RAM=
_BASE"
> f525bb2c9e7cf1 Guo Ren 2019-11-27  15  #endif
> f525bb2c9e7cf1 Guo Ren 2019-11-27  16  =



I.e., the person or bot that is running the kernel configurator should
set/define the Kconfig symbol CONFIG_DTCM_RAM_BASE.

Please do so in your scripts.
Thanks.

> :::::: The code at line 14 was first introduced by commit
> :::::: f525bb2c9e7cf1e3c43ab57704c9e1c836d30b34 csky: Tightly-Coupled Mem=
ory or Sram support
> =

> :::::: TO: Guo Ren <guoren@linux.alibaba.com>
> :::::: CC: Guo Ren <guoren@linux.alibaba.com>



-- =

~Randy

--===============3069767479016392655==--


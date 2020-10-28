Content-Type: multipart/mixed; boundary="===============4675422248875883262=="
MIME-Version: 1.0
From: Nick Desaulniers <ndesaulniers@google.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH] bpf: don't rely on GCC __attribute__((optimize)) to disable GCSE
Date: Wed, 28 Oct 2020 10:59:56 -0700
Message-ID: <CAKwvOdkkTLFtk-NSsaVaz=f-xqmOTukozEns2DKtnEj3JuZSkA@mail.gmail.com>
In-Reply-To: <202010281330.KCaqOzGW-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============4675422248875883262==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

+ Ard

(I think we knew about this in the v1, but just cc'ing you since 0day
bot did not)

On Tue, Oct 27, 2020 at 10:39 PM kernel test robot <lkp@intel.com> wrote:
>
> In-Reply-To: <20201027205723.12514-1-ardb@kernel.org>
> References: <20201027205723.12514-1-ardb@kernel.org>
> TO: Ard Biesheuvel <ardb@kernel.org>
> TO: linux-kernel(a)vger.kernel.org
> CC: netdev(a)vger.kernel.org
> CC: bpf(a)vger.kernel.org
> CC: arnd(a)arndb.de
> CC: Ard Biesheuvel <ardb@kernel.org>
> CC: Nick Desaulniers <ndesaulniers@google.com>
> CC: Arvind Sankar <nivedita@alum.mit.edu>
> CC: Randy Dunlap <rdunlap@infradead.org>
> CC: Josh Poimboeuf <jpoimboe@redhat.com>
> CC: Thomas Gleixner <tglx@linutronix.de>
>
> Hi Ard,
>
> I love your patch! Perhaps something to improve:
>
> [auto build test WARNING on bpf-next/master]
> [also build test WARNING on bpf/master linus/master linux/master v5.10-rc=
1 next-20201027]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
>
> url:    https://github.com/0day-ci/linux/commits/Ard-Biesheuvel/bpf-don-t=
-rely-on-GCC-__attribute__-optimize-to-disable-GCSE/20201028-045850
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git =
master
> config: x86_64-randconfig-a001-20201026 (attached as .config)
> compiler: clang version 12.0.0 (https://github.com/llvm/llvm-project f2c2=
5c70791de95d2466e09b5b58fc37f6ccd7a4)
> reproduce (this is a W=3D1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install x86_64 cross compiling tool for clang build
>         # apt-get install binutils-x86-64-linux-gnu
>         # https://github.com/0day-ci/linux/commit/edebf279098c74782e939d7=
35bd82311c0030968
>         git remote add linux-review https://github.com/0day-ci/linux
>         git fetch --no-tags linux-review Ard-Biesheuvel/bpf-don-t-rely-on=
-GCC-__attribute__-optimize-to-disable-GCSE/20201028-045850
>         git checkout edebf279098c74782e939d735bd82311c0030968
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross AR=
CH=3Dx86_64
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
> All warnings (new ones prefixed by >>):
>
> >> clang-12: warning: optimization flag '-fno-gcse' is not supported [-Wi=
gnored-optimization-argument]
>    kernel/bpf/core.c:1358:12: warning: no previous prototype for function=
 'bpf_probe_read_kernel' [-Wmissing-prototypes]
>    u64 __weak bpf_probe_read_kernel(void *dst, u32 size, const void *unsa=
fe_ptr)
>               ^
>    kernel/bpf/core.c:1358:1: note: declare 'static' if the function is no=
t intended to be used outside of this translation unit
>    u64 __weak bpf_probe_read_kernel(void *dst, u32 size, const void *unsa=
fe_ptr)
>    ^
>    static
>    1 warning generated.
>
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
>
> --
> You received this message because you are subscribed to the Google Groups=
 "Clang Built Linux" group.
> To unsubscribe from this group and stop receiving emails from it, send an=
 email to clang-built-linux+unsubscribe(a)googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgi=
d/clang-built-linux/202010281330.KCaqOzGW-lkp%40intel.com.



-- =

Thanks,
~Nick Desaulniers
--===============4675422248875883262==--


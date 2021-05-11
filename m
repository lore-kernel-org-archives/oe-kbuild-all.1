Content-Type: multipart/mixed; boundary="===============5844630475354719776=="
MIME-Version: 1.0
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: kbuild-all@lists.01.org
Subject: Re: arch/powerpc/kernel/optprobes.c:34:1: error: unused function 'is_kprobe_ppc_optinsn_slot'
Date: Tue, 11 May 2021 18:47:10 +0200
Message-ID: <48747467-cb93-c66d-4cf9-097be0568488@csgroup.eu>
In-Reply-To: <202105120059.uTLH58Lm-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============5844630475354719776==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi All,

Le 11/05/2021 =C3=A0 18:30, kernel test robot a =C3=A9crit=C2=A0:
> Hi Christophe,
> =

> First bad commit (maybe !=3D root cause):
> =

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t master
> head:   1140ab592e2ebf8153d2b322604031a8868ce7a5
> commit: eacf4c0202654adfa94bbb17b5c5c77c0be14af8 powerpc: Enable OPTPROBE=
S on PPC32
> date:   3 weeks ago
> config: powerpc-randconfig-r033-20210511 (attached as .config)
> compiler: clang version 13.0.0 (https://github.com/llvm/llvm-project a0fe=
d635fe1701470062495a6ffee1c608f3f1bc)

A clang issue ?


> reproduce (this is a W=3D1 build):
>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sb=
in/make.cross -O ~/bin/make.cross
>          chmod +x ~/bin/make.cross
>          # install powerpc cross compiling tool for clang build
>          # apt-get install binutils-powerpc-linux-gnu
>          # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux=
.git/commit/?id=3Deacf4c0202654adfa94bbb17b5c5c77c0be14af8
>          git remote add linus https://git.kernel.org/pub/scm/linux/kernel=
/git/torvalds/linux.git
>          git fetch --no-tags linus master
>          git checkout eacf4c0202654adfa94bbb17b5c5c77c0be14af8
>          # save the attached .config to linux build tree
>          COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross W=
=3D1 ARCH=3Dpowerpc
> =

> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> =

> All errors (new ones prefixed by >>):
> =

>>> arch/powerpc/kernel/optprobes.c:34:1: error: unused function 'is_kprobe=
_ppc_optinsn_slot' [-Werror,-Wunused-function]
>     DEFINE_INSN_CACHE_OPS(ppc_optinsn);
>     ^
>     include/linux/kprobes.h:306:20: note: expanded from macro 'DEFINE_INS=
N_CACHE_OPS'
>     static inline bool is_kprobe_##__name##_slot(unsigned long addr)     =
   \

That's a 'static inline', shouldn't generate an 'unused function' warning.

>                        ^
>     <scratch space>:16:1: note: expanded from here
>     is_kprobe_ppc_optinsn_slot
>     ^
>     1 error generated.
> =

> =

> vim +/is_kprobe_ppc_optinsn_slot +34 arch/powerpc/kernel/optprobes.c
> =

> 51c9c084399352 Anju T 2017-02-08  20
> 51c9c084399352 Anju T 2017-02-08  21  #define TMPL_CALL_HDLR_IDX	\
> 51c9c084399352 Anju T 2017-02-08  22  	(optprobe_template_call_handler - =
optprobe_template_entry)
> 51c9c084399352 Anju T 2017-02-08  23  #define TMPL_EMULATE_IDX	\
> 51c9c084399352 Anju T 2017-02-08  24  	(optprobe_template_call_emulate - =
optprobe_template_entry)
> 51c9c084399352 Anju T 2017-02-08  25  #define TMPL_RET_IDX		\
> 51c9c084399352 Anju T 2017-02-08  26  	(optprobe_template_ret - optprobe_=
template_entry)
> 51c9c084399352 Anju T 2017-02-08  27  #define TMPL_OP_IDX		\
> 51c9c084399352 Anju T 2017-02-08  28  	(optprobe_template_op_address - op=
tprobe_template_entry)
> 51c9c084399352 Anju T 2017-02-08  29  #define TMPL_INSN_IDX		\
> 51c9c084399352 Anju T 2017-02-08  30  	(optprobe_template_insn - optprobe=
_template_entry)
> 51c9c084399352 Anju T 2017-02-08  31  #define TMPL_END_IDX		\
> 51c9c084399352 Anju T 2017-02-08  32  	(optprobe_template_end - optprobe_=
template_entry)
> 51c9c084399352 Anju T 2017-02-08  33
> 51c9c084399352 Anju T 2017-02-08 @34  DEFINE_INSN_CACHE_OPS(ppc_optinsn);
> 51c9c084399352 Anju T 2017-02-08  35
> =

> :::::: The code at line 34 was first introduced by commit
> :::::: 51c9c0843993528bffc920c54c2121d9e6f8b090 powerpc/kprobes: Implemen=
t Optprobes
> =

> :::::: TO: Anju T <anju@linux.vnet.ibm.com>
> :::::: CC: Michael Ellerman <mpe@ellerman.id.au>
> =

> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
>=20
--===============5844630475354719776==--


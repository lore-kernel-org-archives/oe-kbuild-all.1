Content-Type: multipart/mixed; boundary="===============2240275463845946337=="
MIME-Version: 1.0
From: Nathan Chancellor <nathan@kernel.org>
To: kbuild-all@lists.01.org
Subject: Re: arch/powerpc/kernel/optprobes.c:34:1: error: unused function 'is_kprobe_ppc_optinsn_slot'
Date: Tue, 11 May 2021 11:46:03 -0700
Message-ID: <208186f3-aab0-d94e-bcf4-8347983cc1a6@kernel.org>
In-Reply-To: <48747467-cb93-c66d-4cf9-097be0568488@csgroup.eu>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============2240275463845946337==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 5/11/2021 9:47 AM, Christophe Leroy wrote:
> Hi All,
> =

> Le 11/05/2021 =C3=A0 18:30, kernel test robot a =C3=A9crit=C2=A0:
>> Hi Christophe,
>>
>> First bad commit (maybe !=3D root cause):
>>
>> tree:   =

>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
>> head:=C2=A0=C2=A0 1140ab592e2ebf8153d2b322604031a8868ce7a5
>> commit: eacf4c0202654adfa94bbb17b5c5c77c0be14af8 powerpc: Enable =

>> OPTPROBES on PPC32
>> date:=C2=A0=C2=A0 3 weeks ago
>> config: powerpc-randconfig-r033-20210511 (attached as .config)
>> compiler: clang version 13.0.0 (https://github.com/llvm/llvm-project =

>> a0fed635fe1701470062495a6ffee1c608f3f1bc)
> =

> A clang issue ?
> =

> =

>> reproduce (this is a W=3D1 build):
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 wget =

>> https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross =

>> -O ~/bin/make.cross
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 chmod +x ~/bin/make.cro=
ss
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # install powerpc cross=
 compiling tool for clang build
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # apt-get install binut=
ils-powerpc-linux-gnu
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # =

>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commi=
t/?id=3Deacf4c0202654adfa94bbb17b5c5c77c0be14af8 =

>>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 git remote add linus =

>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 git fetch --no-tags lin=
us master
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 git checkout eacf4c0202=
654adfa94bbb17b5c5c77c0be14af8
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # save the attached .co=
nfig to linux build tree
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 COMPILER_INSTALL_PATH=
=3D$HOME/0day COMPILER=3Dclang make.cross =

>> W=3D1 ARCH=3Dpowerpc
>>
>> If you fix the issue, kindly add following tag as appropriate
>> Reported-by: kernel test robot <lkp@intel.com>
>>
>> All errors (new ones prefixed by >>):
>>
>>>> arch/powerpc/kernel/optprobes.c:34:1: error: unused function =

>>>> 'is_kprobe_ppc_optinsn_slot' [-Werror,-Wunused-function]
>> =C2=A0=C2=A0=C2=A0 DEFINE_INSN_CACHE_OPS(ppc_optinsn);
>> =C2=A0=C2=A0=C2=A0 ^
>> =C2=A0=C2=A0=C2=A0 include/linux/kprobes.h:306:20: note: expanded from m=
acro =

>> 'DEFINE_INSN_CACHE_OPS'
>> =C2=A0=C2=A0=C2=A0 static inline bool is_kprobe_##__name##_slot(unsigned=
 long =

>> addr)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> =

> That's a 'static inline', shouldn't generate an 'unused function' warning.
This is a W=3D1 build, which means that "inline" does not silence unused =

function warnings with clang because of commit 6863f5643dd7 ("kbuild: =

allow Clang to find unused static inline functions for W=3D1 build").

Cheers,
Nathan

>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^
>> =C2=A0=C2=A0=C2=A0 <scratch space>:16:1: note: expanded from here
>> =C2=A0=C2=A0=C2=A0 is_kprobe_ppc_optinsn_slot
>> =C2=A0=C2=A0=C2=A0 ^
>> =C2=A0=C2=A0=C2=A0 1 error generated.
>>
>>
>> vim +/is_kprobe_ppc_optinsn_slot +34 arch/powerpc/kernel/optprobes.c
>>
>> 51c9c084399352 Anju T 2017-02-08=C2=A0 20
>> 51c9c084399352 Anju T 2017-02-08=C2=A0 21=C2=A0 #define TMPL_CALL_HDLR_I=
DX=C2=A0=C2=A0=C2=A0 \
>> 51c9c084399352 Anju T 2017-02-08=C2=A0 22      =

>> (optprobe_template_call_handler - optprobe_template_entry)
>> 51c9c084399352 Anju T 2017-02-08=C2=A0 23=C2=A0 #define TMPL_EMULATE_IDX=
=C2=A0=C2=A0=C2=A0 \
>> 51c9c084399352 Anju T 2017-02-08=C2=A0 24      =

>> (optprobe_template_call_emulate - optprobe_template_entry)
>> 51c9c084399352 Anju T 2017-02-08=C2=A0 25=C2=A0 #define TMPL_RET_IDX=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>> 51c9c084399352 Anju T 2017-02-08=C2=A0 26=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
(optprobe_template_ret - =

>> optprobe_template_entry)
>> 51c9c084399352 Anju T 2017-02-08=C2=A0 27=C2=A0 #define TMPL_OP_IDX=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>> 51c9c084399352 Anju T 2017-02-08=C2=A0 28      =

>> (optprobe_template_op_address - optprobe_template_entry)
>> 51c9c084399352 Anju T 2017-02-08=C2=A0 29=C2=A0 #define TMPL_INSN_IDX=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>> 51c9c084399352 Anju T 2017-02-08=C2=A0 30=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
(optprobe_template_insn - =

>> optprobe_template_entry)
>> 51c9c084399352 Anju T 2017-02-08=C2=A0 31=C2=A0 #define TMPL_END_IDX=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>> 51c9c084399352 Anju T 2017-02-08=C2=A0 32=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
(optprobe_template_end - =

>> optprobe_template_entry)
>> 51c9c084399352 Anju T 2017-02-08=C2=A0 33
>> 51c9c084399352 Anju T 2017-02-08 @34=C2=A0 DEFINE_INSN_CACHE_OPS(ppc_opt=
insn);
>> 51c9c084399352 Anju T 2017-02-08=C2=A0 35
>>
>> :::::: The code at line 34 was first introduced by commit
>> :::::: 51c9c0843993528bffc920c54c2121d9e6f8b090 powerpc/kprobes: =

>> Implement Optprobes
>>
>> :::::: TO: Anju T <anju@linux.vnet.ibm.com>
>> :::::: CC: Michael Ellerman <mpe@ellerman.id.au>
>>
>> ---
>> 0-DAY CI Kernel Test Service, Intel Corporation
>> https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
>>
>=20

--===============2240275463845946337==--


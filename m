Content-Type: multipart/mixed; boundary="===============7096195682259556724=="
MIME-Version: 1.0
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: kbuild-all@lists.01.org
Subject: Re: arch/powerpc/kernel/optprobes.c:34:1: error: unused function 'is_kprobe_ppc_optinsn_slot'
Date: Wed, 12 May 2021 17:12:32 +0200
Message-ID: <8d12be5a-d700-c0aa-86ee-ebb97927c34c@csgroup.eu>
In-Reply-To: <20210513000649.23ac7bc69e30d8b9421a6ff6@kernel.org>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============7096195682259556724==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



Le 12/05/2021 =C3=A0 17:06, Masami Hiramatsu a =C3=A9crit=C2=A0:
> On Wed, 12 May 2021 21:50:57 +0900
> Masami Hiramatsu <mhiramat@kernel.org> wrote:
> =

>> On Wed, 12 May 2021 11:52:30 +0200
>> Christophe Leroy <christophe.leroy@csgroup.eu> wrote:
> =

>>>
>>> Le 12/05/2021 =C3=A0 11:36, Christophe Leroy a =C3=A9crit=C2=A0:
>>>>
>>>>
>>>> Le 11/05/2021 =C3=A0 20:46, Nathan Chancellor a =C3=A9crit=C2=A0:
>>>>> On 5/11/2021 9:47 AM, Christophe Leroy wrote:
>>>>>> Hi All,
>>>>>>
>>>>>> Le 11/05/2021 =C3=A0 18:30, kernel test robot a =C3=A9crit=C2=A0:
>>>>>>> Hi Christophe,
>>>>>>>
>>>>>>> First bad commit (maybe !=3D root cause):
>>>>>>>
>>>>>>> tree: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linu=
x.git master
>>>>>>> head:=C2=A0=C2=A0 1140ab592e2ebf8153d2b322604031a8868ce7a5
>>>>>>> commit: eacf4c0202654adfa94bbb17b5c5c77c0be14af8 powerpc: Enable OP=
TPROBES on PPC32
>>>>
>>>> Ok, the problem appears on PPC32 with that patch, but it must have bee=
n there on PPC64 since the
>>>> implementation of optprobes with commit 51c9c0843993 ("powerpc/kprobes=
: Implement Optprobes")
>>>>
>>>>
>>>>>>> date:=C2=A0=C2=A0 3 weeks ago
>>>>>>> config: powerpc-randconfig-r033-20210511 (attached as .config)
>>>>>>> compiler: clang version 13.0.0 (https://github.com/llvm/llvm-project
>>>>>>> a0fed635fe1701470062495a6ffee1c608f3f1bc)
>>>>>>
>>>>>> A clang issue ?
>>>>>>
>>>>>>
>>>>>>> reproduce (this is a W=3D1 build):
>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 wget https://raw.=
githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O
>>>>>>> ~/bin/make.cross
>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 chmod +x ~/bin/ma=
ke.cross
>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # install powerpc=
 cross compiling tool for clang build
>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # apt-get install=
 binutils-powerpc-linux-gnu
>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #
>>>>>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/=
commit/?id=3Deacf4c0202654adfa94bbb17b5c5c77c0be14af8
>>>>>>>
>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 git remote add li=
nus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 git fetch --no-ta=
gs linus master
>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 git checkout eacf=
4c0202654adfa94bbb17b5c5c77c0be14af8
>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # save the attach=
ed .config to linux build tree
>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 COMPILER_INSTALL_=
PATH=3D$HOME/0day COMPILER=3Dclang make.cross W=3D1 ARCH=3Dpowerpc
>>>>>>>
>>>>>>> If you fix the issue, kindly add following tag as appropriate
>>>>>>> Reported-by: kernel test robot <lkp@intel.com>
>>>>>>>
>>>>>>> All errors (new ones prefixed by >>):
>>>>>>>
>>>>>>>>> arch/powerpc/kernel/optprobes.c:34:1: error: unused function 'is_=
kprobe_ppc_optinsn_slot'
>>>>>>>>> [-Werror,-Wunused-function]
>>>>>>>  =C2=A0=C2=A0=C2=A0 DEFINE_INSN_CACHE_OPS(ppc_optinsn);
>>>>>>>  =C2=A0=C2=A0=C2=A0 ^
>>>>>>>  =C2=A0=C2=A0=C2=A0 include/linux/kprobes.h:306:20: note: expanded =
from macro 'DEFINE_INSN_CACHE_OPS'
>>>>>>>  =C2=A0=C2=A0=C2=A0 static inline bool is_kprobe_##__name##_slot(un=
signed long addr)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>>>>>>
>>>>>> That's a 'static inline', shouldn't generate an 'unused function' wa=
rning.
>>>>> This is a W=3D1 build, which means that "inline" does not silence unu=
sed function warnings with
>>>>> clang because of commit 6863f5643dd7 ("kbuild: allow Clang to find un=
used static inline functions
>>>>> for W=3D1 build").
>>>>
>>>> Ok, I didn't know that.
>>>
>>> After looking at it in more details, I don't really know what should be=
 done to avoid that.
>>
>> Ah, thanks for reporting!
>>
>>>
>>> This unused function is defined as part of DEFINE_INSN_CACHE_OPS(ppc_op=
tinsn).
>>>
>>> The code uses other items defined by macro DEFINE_INSN_CACHE_OPS, so it=
 cannot be removed.
>>>
>>> Solution could be to hide that in a .h, but is that worth it ?
>>
>> The best solution is to remove ppc_optinsn, but that is defined in kerne=
l/kprobes.c
>> just because page allocation is different.
>> I think the easiest fix is to add weak alloc_optinsn_page() and override=
 it
>> in arch/powerpc/kernel/optprobe.c.
> =

> Please try this patch.
> =

> Thank you,


Yeah, look pretty similar to the two patches I sent 30 minutes ago.



> =

>  From 7782fa154349923ed52baa8843cc1d5eed26e82d Mon Sep 17 00:00:00 2001
> From: Masami Hiramatsu <mhiramat@kernel.org>
> Date: Wed, 12 May 2021 23:33:10 +0900
> Subject: [PATCH] powerpc/kprobes: Define arch specific optinsn memory
>   allocation
> =


> @@ -203,14 +193,14 @@ int arch_prepare_optimized_kprobe(struct optimized_=
kprobe *op, struct kprobe *p)
>   	unsigned long nip, size;
>   	int rc, i;
>   =

> -	kprobe_ppc_optinsn_slots.insn_size =3D MAX_OPTINSN_SIZE;
> +	kprobe_optinsn_slots.insn_size =3D MAX_OPTINSN_SIZE;

Is this still needed ? It looks like it is already done by init_kprobes() i=
n kernel/kprobes.c

>   =

>   	nip =3D can_optimize(p);
>   	if (!nip)
>   		return -EILSEQ;
>   =

>   	/* Allocate instruction slot for detour buffer */
> -	buff =3D get_ppc_optinsn_slot();
> +	buff =3D get_optinsn_slot();
>   	if (!buff)
>   		return -ENOMEM;
>   =


Christophe
--===============7096195682259556724==--


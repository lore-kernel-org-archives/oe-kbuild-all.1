Content-Type: multipart/mixed; boundary="===============2629131079678941223=="
MIME-Version: 1.0
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: kbuild-all@lists.01.org
Subject: Re: [powerpc:next-test 8/8] arch/powerpc/lib/feature-fixups.c:304:30: error: cast to smaller integer type 'enum l1d_flush_type' from 'void *'
Date: Tue, 04 May 2021 20:41:42 +0200
Message-ID: <c6f6d3d7-8331-9be0-6f15-271f9c5755a1@csgroup.eu>
In-Reply-To: <202105050231.wjhXNTzu-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============2629131079678941223==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



Le 04/05/2021 =C3=A0 20:31, kernel test robot a =C3=A9crit=C2=A0:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git=
 next-test
> head:   a5014a5c936a2a9a223e699e1f3abd54d5f68d2c
> commit: a5014a5c936a2a9a223e699e1f3abd54d5f68d2c [8/8] powerpc/64s: Fix c=
rashes when toggling entry flush barrier
> config: powerpc-randconfig-r022-20210503 (attached as .config)
> compiler: clang version 13.0.0 (https://github.com/llvm/llvm-project 8f5a=
2a5836cc8e4c1def2bdeb022e7b496623439)
> reproduce (this is a W=3D1 build):
>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sb=
in/make.cross -O ~/bin/make.cross
>          chmod +x ~/bin/make.cross
>          # install powerpc cross compiling tool for clang build
>          # apt-get install binutils-powerpc-linux-gnu
>          # https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.=
git/commit/?id=3Da5014a5c936a2a9a223e699e1f3abd54d5f68d2c
>          git remote add powerpc https://git.kernel.org/pub/scm/linux/kern=
el/git/powerpc/linux.git
>          git fetch --no-tags powerpc next-test
>          git checkout a5014a5c936a2a9a223e699e1f3abd54d5f68d2c
>          # save the attached .config to linux build tree
>          COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross W=
=3D1 ARCH=3Dpowerpc
> =

> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> =

> All errors (new ones prefixed by >>):
> =

>     arch/powerpc/lib/feature-fixups.c:233:32: error: cast to smaller inte=
ger type 'enum stf_barrier_type' from 'void *' [-Werror,-Wvoid-pointer-to-e=
num-cast]
>             enum stf_barrier_type types =3D (enum stf_barrier_type)data;
>                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>>> arch/powerpc/lib/feature-fixups.c:304:30: error: cast to smaller intege=
r type 'enum l1d_flush_type' from 'void *' [-Werror,-Wvoid-pointer-to-enum-=
cast]
>             enum l1d_flush_type types =3D (enum l1d_flush_type)data;
>                                         ^~~~~~~~~~~~~~~~~~~~~~~~~
>     2 errors generated.
> =

> =

> vim +304 arch/powerpc/lib/feature-fixups.c
> =

>     301	=

>     302	static int __do_entry_flush_fixups(void *data)
>     303	{
>   > 304		enum l1d_flush_type types =3D (enum l1d_flush_type)data;

That looks strange to use an enumeration for 'types', as we perform logical=
 ops with it below (eg: =

types & L1D_FLUSH_ORI).

I think it should be an int.

>     305		unsigned int instrs[3], *dest;
>     306		long *start, *end;
>     307		int i;
>     308	=

>     309		instrs[0] =3D 0x60000000; /* nop */
>     310		instrs[1] =3D 0x60000000; /* nop */
>     311		instrs[2] =3D 0x60000000; /* nop */
>     312	=

>     313		i =3D 0;
>     314		if (types =3D=3D L1D_FLUSH_FALLBACK) {
>     315			instrs[i++] =3D 0x7d4802a6; /* mflr r10		*/
>     316			instrs[i++] =3D 0x60000000; /* branch patched below */
>     317			instrs[i++] =3D 0x7d4803a6; /* mtlr r10		*/
>     318		}
>     319	=

>     320		if (types & L1D_FLUSH_ORI) {
>     321			instrs[i++] =3D 0x63ff0000; /* ori 31,31,0 speculation barrier =
*/
>     322			instrs[i++] =3D 0x63de0000; /* ori 30,30,0 L1d flush*/
>     323		}
>     324	=

>     325		if (types & L1D_FLUSH_MTTRIG)
>     326			instrs[i++] =3D 0x7c12dba6; /* mtspr TRIG2,r0 (SPR #882) */
>     327	=

>     328		start =3D PTRRELOC(&__start___entry_flush_fixup);
>     329		end =3D PTRRELOC(&__stop___entry_flush_fixup);
>     330		for (i =3D 0; start < end; start++, i++) {
>     331			dest =3D (void *)start + *start;
>     332	=

>     333			pr_devel("patching dest %lx\n", (unsigned long)dest);
>     334	=

>     335			patch_instruction((struct ppc_inst *)dest, ppc_inst(instrs[0]));
>     336	=

>     337			if (types =3D=3D L1D_FLUSH_FALLBACK)
>     338				patch_branch((struct ppc_inst *)(dest + 1), (unsigned long)&en=
try_flush_fallback,
>     339					     BRANCH_SET_LINK);
>     340			else
>     341				patch_instruction((struct ppc_inst *)(dest + 1), ppc_inst(inst=
rs[1]));
>     342	=

>     343			patch_instruction((struct ppc_inst *)(dest + 2), ppc_inst(instr=
s[2]));
>     344		}
>     345	=

>     346		start =3D PTRRELOC(&__start___scv_entry_flush_fixup);
>     347		end =3D PTRRELOC(&__stop___scv_entry_flush_fixup);
>     348		for (; start < end; start++, i++) {
>     349			dest =3D (void *)start + *start;
>     350	=

>     351			pr_devel("patching dest %lx\n", (unsigned long)dest);
>     352	=

>     353			patch_instruction((struct ppc_inst *)dest, ppc_inst(instrs[0]));
>     354	=

>     355			if (types =3D=3D L1D_FLUSH_FALLBACK)
>     356				patch_branch((struct ppc_inst *)(dest + 1), (unsigned long)&sc=
v_entry_flush_fallback,
>     357					     BRANCH_SET_LINK);
>     358			else
>     359				patch_instruction((struct ppc_inst *)(dest + 1), ppc_inst(inst=
rs[1]));
>     360	=

>     361			patch_instruction((struct ppc_inst *)(dest + 2), ppc_inst(instr=
s[2]));
>     362		}
>     363	=

>     364	=

>     365		printk(KERN_DEBUG "entry-flush: patched %d locations (%s flush)\=
n", i,
>     366			(types =3D=3D L1D_FLUSH_NONE)       ? "no" :
>     367			(types =3D=3D L1D_FLUSH_FALLBACK)   ? "fallback displacement" :
>     368			(types &  L1D_FLUSH_ORI)        ? (types & L1D_FLUSH_MTTRIG)
>     369								? "ori+mttrig type"
>     370								: "ori type" :
>     371			(types &  L1D_FLUSH_MTTRIG)     ? "mttrig type"
>     372							: "unknown");
>     373	=

>     374		return 0;
>     375	}
>     376	=

> =

> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
>=20
--===============2629131079678941223==--


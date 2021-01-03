Content-Type: multipart/mixed; boundary="===============4785246946808236087=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: kernel/bpf/verifier.c:9689:12: warning: stack frame size of 2128 bytes in function 'resolve_pseudo_ldimm64'
Date: Sun, 03 Jan 2021 12:20:18 +0800
Message-ID: <202101031213.bzS2ybwQ-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============4785246946808236087==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Hao,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   3516bd729358a2a9b090c1905bd2a3fa926e24c6
commit: eaa6bcb71ef6ed3dc18fc525ee7e293b06b4882b bpf: Introduce bpf_per_cpu=
_ptr()
date:   3 months ago
config: powerpc-randconfig-r004-20210103 (attached as .config)
compiler: clang version 12.0.0 (https://github.com/llvm/llvm-project 20670b=
a44066df0aae536822b7f7834ee3198c0d)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install powerpc cross compiling tool for clang build
        # apt-get install binutils-powerpc-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Deaa6bcb71ef6ed3dc18fc525ee7e293b06b4882b
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout eaa6bcb71ef6ed3dc18fc525ee7e293b06b4882b
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dpowerpc =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   __do_insb
   ^
   arch/powerpc/include/asm/io.h:541:56: note: expanded from macro '__do_in=
sb'
   #define __do_insb(p, b, n)      readsb((PCI_IO_ADDR)_IO_BASE+(p), (b), (=
n))
                                          ~~~~~~~~~~~~~~~~~~~~~^
   In file included from kernel/bpf/verifier.c:12:
   In file included from include/linux/bpf_verifier.h:8:
   In file included from include/linux/filter.h:13:
   In file included from include/linux/skbuff.h:31:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/powerpc/include/asm/io.h:604:
   arch/powerpc/include/asm/io-defs.h:45:1: warning: performing pointer ari=
thmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   DEF_PCI_AC_NORET(insw, (unsigned long p, void *b, unsigned long c),
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:601:3: note: expanded from macro 'DEF_PCI_=
AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:222:1: note: expanded from here
   __do_insw
   ^
   arch/powerpc/include/asm/io.h:542:56: note: expanded from macro '__do_in=
sw'
   #define __do_insw(p, b, n)      readsw((PCI_IO_ADDR)_IO_BASE+(p), (b), (=
n))
                                          ~~~~~~~~~~~~~~~~~~~~~^
   In file included from kernel/bpf/verifier.c:12:
   In file included from include/linux/bpf_verifier.h:8:
   In file included from include/linux/filter.h:13:
   In file included from include/linux/skbuff.h:31:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/powerpc/include/asm/io.h:604:
   arch/powerpc/include/asm/io-defs.h:47:1: warning: performing pointer ari=
thmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   DEF_PCI_AC_NORET(insl, (unsigned long p, void *b, unsigned long c),
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:601:3: note: expanded from macro 'DEF_PCI_=
AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:224:1: note: expanded from here
   __do_insl
   ^
   arch/powerpc/include/asm/io.h:543:56: note: expanded from macro '__do_in=
sl'
   #define __do_insl(p, b, n)      readsl((PCI_IO_ADDR)_IO_BASE+(p), (b), (=
n))
                                          ~~~~~~~~~~~~~~~~~~~~~^
   In file included from kernel/bpf/verifier.c:12:
   In file included from include/linux/bpf_verifier.h:8:
   In file included from include/linux/filter.h:13:
   In file included from include/linux/skbuff.h:31:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/powerpc/include/asm/io.h:604:
   arch/powerpc/include/asm/io-defs.h:49:1: warning: performing pointer ari=
thmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   DEF_PCI_AC_NORET(outsb, (unsigned long p, const void *b, unsigned long c=
),
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   arch/powerpc/include/asm/io.h:601:3: note: expanded from macro 'DEF_PCI_=
AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:226:1: note: expanded from here
   __do_outsb
   ^
   arch/powerpc/include/asm/io.h:544:58: note: expanded from macro '__do_ou=
tsb'
   #define __do_outsb(p, b, n)     writesb((PCI_IO_ADDR)_IO_BASE+(p),(b),(n=
))
                                           ~~~~~~~~~~~~~~~~~~~~~^
   In file included from kernel/bpf/verifier.c:12:
   In file included from include/linux/bpf_verifier.h:8:
   In file included from include/linux/filter.h:13:
   In file included from include/linux/skbuff.h:31:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/powerpc/include/asm/io.h:604:
   arch/powerpc/include/asm/io-defs.h:51:1: warning: performing pointer ari=
thmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   DEF_PCI_AC_NORET(outsw, (unsigned long p, const void *b, unsigned long c=
),
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   arch/powerpc/include/asm/io.h:601:3: note: expanded from macro 'DEF_PCI_=
AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:228:1: note: expanded from here
   __do_outsw
   ^
   arch/powerpc/include/asm/io.h:545:58: note: expanded from macro '__do_ou=
tsw'
   #define __do_outsw(p, b, n)     writesw((PCI_IO_ADDR)_IO_BASE+(p),(b),(n=
))
                                           ~~~~~~~~~~~~~~~~~~~~~^
   In file included from kernel/bpf/verifier.c:12:
   In file included from include/linux/bpf_verifier.h:8:
   In file included from include/linux/filter.h:13:
   In file included from include/linux/skbuff.h:31:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/powerpc/include/asm/io.h:604:
   arch/powerpc/include/asm/io-defs.h:53:1: warning: performing pointer ari=
thmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   DEF_PCI_AC_NORET(outsl, (unsigned long p, const void *b, unsigned long c=
),
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   arch/powerpc/include/asm/io.h:601:3: note: expanded from macro 'DEF_PCI_=
AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:230:1: note: expanded from here
   __do_outsl
   ^
   arch/powerpc/include/asm/io.h:546:58: note: expanded from macro '__do_ou=
tsl'
   #define __do_outsl(p, b, n)     writesl((PCI_IO_ADDR)_IO_BASE+(p),(b),(n=
))
                                           ~~~~~~~~~~~~~~~~~~~~~^
>> kernel/bpf/verifier.c:9689:12: warning: stack frame size of 2128 bytes i=
n function 'resolve_pseudo_ldimm64' [-Wframe-larger-than=3D]
   static int resolve_pseudo_ldimm64(struct bpf_verifier_env *env)
              ^
   kernel/bpf/verifier.c:10747:12: warning: stack frame size of 2368 bytes =
in function 'fixup_bpf_calls' [-Wframe-larger-than=3D]
   static int fixup_bpf_calls(struct bpf_verifier_env *env)
              ^
   kernel/bpf/verifier.c:9163:12: warning: stack frame size of 5744 bytes i=
n function 'do_check' [-Wframe-larger-than=3D]
   static int do_check(struct bpf_verifier_env *env)
              ^
   15 warnings generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for HOTPLUG_CPU
   Depends on SMP && (PPC_PSERIES || PPC_PMAC || PPC_POWERNV || FSL_SOC_BOO=
KE
   Selected by
   - PM_SLEEP_SMP && SMP && (ARCH_SUSPEND_POSSIBLE || ARCH_HIBERNATION_POSS=
IBLE && PM_SLEEP


vim +/resolve_pseudo_ldimm64 +9689 kernel/bpf/verifier.c

b741f1630346def Roman Gushchin     2018-09-28  9681  =

4976b718c3551fa Hao Luo            2020-09-29  9682  /* find and rewrite ps=
eudo imm in ld_imm64 instructions:
4976b718c3551fa Hao Luo            2020-09-29  9683   *
4976b718c3551fa Hao Luo            2020-09-29  9684   * 1. if it accesses m=
ap FD, replace it with actual map pointer.
4976b718c3551fa Hao Luo            2020-09-29  9685   * 2. if it accesses b=
tf_id of a VAR, replace it with pointer to the var.
4976b718c3551fa Hao Luo            2020-09-29  9686   *
4976b718c3551fa Hao Luo            2020-09-29  9687   * NOTE: btf_vmlinux i=
s required for converting pseudo btf_id.
0246e64d9a5fcd4 Alexei Starovoitov 2014-09-26  9688   */
4976b718c3551fa Hao Luo            2020-09-29 @9689  static int resolve_pse=
udo_ldimm64(struct bpf_verifier_env *env)
0246e64d9a5fcd4 Alexei Starovoitov 2014-09-26  9690  {
0246e64d9a5fcd4 Alexei Starovoitov 2014-09-26  9691  	struct bpf_insn *insn=
 =3D env->prog->insnsi;
0246e64d9a5fcd4 Alexei Starovoitov 2014-09-26  9692  	int insn_cnt =3D env-=
>prog->len;
fdc15d388d600d5 Alexei Starovoitov 2016-09-01  9693  	int i, j, err;
0246e64d9a5fcd4 Alexei Starovoitov 2014-09-26  9694  =

f1f7714ea51c56b Daniel Borkmann    2017-01-13  9695  	err =3D bpf_prog_calc=
_tag(env->prog);
aafe6ae9cee32df Daniel Borkmann    2016-12-18  9696  	if (err)
aafe6ae9cee32df Daniel Borkmann    2016-12-18  9697  		return err;
aafe6ae9cee32df Daniel Borkmann    2016-12-18  9698  =

0246e64d9a5fcd4 Alexei Starovoitov 2014-09-26  9699  	for (i =3D 0; i < ins=
n_cnt; i++, insn++) {
9bac3d6d548e5cc Alexei Starovoitov 2015-03-13  9700  		if (BPF_CLASS(insn->=
code) =3D=3D BPF_LDX &&
d691f9e8d4405c3 Alexei Starovoitov 2015-06-04  9701  		    (BPF_MODE(insn->=
code) !=3D BPF_MEM || insn->imm !=3D 0)) {
61bd5218eef349f Jakub Kicinski     2017-10-09  9702  			verbose(env, "BPF_L=
DX uses reserved fields\n");
9bac3d6d548e5cc Alexei Starovoitov 2015-03-13  9703  			return -EINVAL;
9bac3d6d548e5cc Alexei Starovoitov 2015-03-13  9704  		}
9bac3d6d548e5cc Alexei Starovoitov 2015-03-13  9705  =

d691f9e8d4405c3 Alexei Starovoitov 2015-06-04  9706  		if (BPF_CLASS(insn->=
code) =3D=3D BPF_STX &&
d691f9e8d4405c3 Alexei Starovoitov 2015-06-04  9707  		    ((BPF_MODE(insn-=
>code) !=3D BPF_MEM &&
d691f9e8d4405c3 Alexei Starovoitov 2015-06-04  9708  		      BPF_MODE(insn-=
>code) !=3D BPF_XADD) || insn->imm !=3D 0)) {
61bd5218eef349f Jakub Kicinski     2017-10-09  9709  			verbose(env, "BPF_S=
TX uses reserved fields\n");
d691f9e8d4405c3 Alexei Starovoitov 2015-06-04  9710  			return -EINVAL;
d691f9e8d4405c3 Alexei Starovoitov 2015-06-04  9711  		}
d691f9e8d4405c3 Alexei Starovoitov 2015-06-04  9712  =

0246e64d9a5fcd4 Alexei Starovoitov 2014-09-26  9713  		if (insn[0].code =3D=
=3D (BPF_LD | BPF_IMM | BPF_DW)) {
d8eca5bbb2be9bc Daniel Borkmann    2019-04-09  9714  			struct bpf_insn_aux=
_data *aux;
0246e64d9a5fcd4 Alexei Starovoitov 2014-09-26  9715  			struct bpf_map *map;
0246e64d9a5fcd4 Alexei Starovoitov 2014-09-26  9716  			struct fd f;
d8eca5bbb2be9bc Daniel Borkmann    2019-04-09  9717  			u64 addr;
0246e64d9a5fcd4 Alexei Starovoitov 2014-09-26  9718  =

0246e64d9a5fcd4 Alexei Starovoitov 2014-09-26  9719  			if (i =3D=3D insn_c=
nt - 1 || insn[1].code !=3D 0 ||
0246e64d9a5fcd4 Alexei Starovoitov 2014-09-26  9720  			    insn[1].dst_reg=
 !=3D 0 || insn[1].src_reg !=3D 0 ||
0246e64d9a5fcd4 Alexei Starovoitov 2014-09-26  9721  			    insn[1].off !=
=3D 0) {
61bd5218eef349f Jakub Kicinski     2017-10-09  9722  				verbose(env, "inva=
lid bpf_ld_imm64 insn\n");
0246e64d9a5fcd4 Alexei Starovoitov 2014-09-26  9723  				return -EINVAL;
0246e64d9a5fcd4 Alexei Starovoitov 2014-09-26  9724  			}
0246e64d9a5fcd4 Alexei Starovoitov 2014-09-26  9725  =

d8eca5bbb2be9bc Daniel Borkmann    2019-04-09  9726  			if (insn[0].src_reg=
 =3D=3D 0)
0246e64d9a5fcd4 Alexei Starovoitov 2014-09-26  9727  				/* valid generic l=
oad 64-bit imm */
0246e64d9a5fcd4 Alexei Starovoitov 2014-09-26  9728  				goto next_insn;
0246e64d9a5fcd4 Alexei Starovoitov 2014-09-26  9729  =

4976b718c3551fa Hao Luo            2020-09-29  9730  			if (insn[0].src_reg=
 =3D=3D BPF_PSEUDO_BTF_ID) {
4976b718c3551fa Hao Luo            2020-09-29  9731  				aux =3D &env->insn=
_aux_data[i];
4976b718c3551fa Hao Luo            2020-09-29  9732  				err =3D check_pseu=
do_btf_id(env, insn, aux);
4976b718c3551fa Hao Luo            2020-09-29  9733  				if (err)
4976b718c3551fa Hao Luo            2020-09-29  9734  					return err;
4976b718c3551fa Hao Luo            2020-09-29  9735  				goto next_insn;
4976b718c3551fa Hao Luo            2020-09-29  9736  			}
4976b718c3551fa Hao Luo            2020-09-29  9737  =

d8eca5bbb2be9bc Daniel Borkmann    2019-04-09  9738  			/* In final convert=
_pseudo_ld_imm64() step, this is
d8eca5bbb2be9bc Daniel Borkmann    2019-04-09  9739  			 * converted into r=
egular 64-bit imm load insn.
d8eca5bbb2be9bc Daniel Borkmann    2019-04-09  9740  			 */
d8eca5bbb2be9bc Daniel Borkmann    2019-04-09  9741  			if ((insn[0].src_re=
g !=3D BPF_PSEUDO_MAP_FD &&
d8eca5bbb2be9bc Daniel Borkmann    2019-04-09  9742  			     insn[0].src_re=
g !=3D BPF_PSEUDO_MAP_VALUE) ||
d8eca5bbb2be9bc Daniel Borkmann    2019-04-09  9743  			    (insn[0].src_re=
g =3D=3D BPF_PSEUDO_MAP_FD &&
d8eca5bbb2be9bc Daniel Borkmann    2019-04-09  9744  			     insn[1].imm !=
=3D 0)) {
d8eca5bbb2be9bc Daniel Borkmann    2019-04-09  9745  				verbose(env,
d8eca5bbb2be9bc Daniel Borkmann    2019-04-09  9746  					"unrecognized bpf=
_ld_imm64 insn\n");
0246e64d9a5fcd4 Alexei Starovoitov 2014-09-26  9747  				return -EINVAL;
0246e64d9a5fcd4 Alexei Starovoitov 2014-09-26  9748  			}
0246e64d9a5fcd4 Alexei Starovoitov 2014-09-26  9749  =

20182390c413447 Daniel Borkmann    2019-03-04  9750  			f =3D fdget(insn[0]=
.imm);
c210129760a010b Daniel Borkmann    2015-10-29  9751  			map =3D __bpf_map_g=
et(f);
0246e64d9a5fcd4 Alexei Starovoitov 2014-09-26  9752  			if (IS_ERR(map)) {
61bd5218eef349f Jakub Kicinski     2017-10-09  9753  				verbose(env, "fd %=
d is not pointing to valid bpf_map\n",
20182390c413447 Daniel Borkmann    2019-03-04  9754  					insn[0].imm);
0246e64d9a5fcd4 Alexei Starovoitov 2014-09-26  9755  				return PTR_ERR(map=
);
0246e64d9a5fcd4 Alexei Starovoitov 2014-09-26  9756  			}
0246e64d9a5fcd4 Alexei Starovoitov 2014-09-26  9757  =

61bd5218eef349f Jakub Kicinski     2017-10-09  9758  			err =3D check_map_p=
rog_compatibility(env, map, env->prog);
fdc15d388d600d5 Alexei Starovoitov 2016-09-01  9759  			if (err) {
fdc15d388d600d5 Alexei Starovoitov 2016-09-01  9760  				fdput(f);
fdc15d388d600d5 Alexei Starovoitov 2016-09-01  9761  				return err;
fdc15d388d600d5 Alexei Starovoitov 2016-09-01  9762  			}
fdc15d388d600d5 Alexei Starovoitov 2016-09-01  9763  =

d8eca5bbb2be9bc Daniel Borkmann    2019-04-09  9764  			aux =3D &env->insn_=
aux_data[i];
d8eca5bbb2be9bc Daniel Borkmann    2019-04-09  9765  			if (insn->src_reg =
=3D=3D BPF_PSEUDO_MAP_FD) {
d8eca5bbb2be9bc Daniel Borkmann    2019-04-09  9766  				addr =3D (unsigned=
 long)map;
d8eca5bbb2be9bc Daniel Borkmann    2019-04-09  9767  			} else {
d8eca5bbb2be9bc Daniel Borkmann    2019-04-09  9768  				u32 off =3D insn[1=
].imm;
d8eca5bbb2be9bc Daniel Borkmann    2019-04-09  9769  =

d8eca5bbb2be9bc Daniel Borkmann    2019-04-09  9770  				if (off >=3D BPF_M=
AX_VAR_OFF) {
d8eca5bbb2be9bc Daniel Borkmann    2019-04-09  9771  					verbose(env, "dir=
ect value offset of %u is not allowed\n", off);
d8eca5bbb2be9bc Daniel Borkmann    2019-04-09  9772  					fdput(f);
d8eca5bbb2be9bc Daniel Borkmann    2019-04-09  9773  					return -EINVAL;
d8eca5bbb2be9bc Daniel Borkmann    2019-04-09  9774  				}
d8eca5bbb2be9bc Daniel Borkmann    2019-04-09  9775  =

d8eca5bbb2be9bc Daniel Borkmann    2019-04-09  9776  				if (!map->ops->map=
_direct_value_addr) {
d8eca5bbb2be9bc Daniel Borkmann    2019-04-09  9777  					verbose(env, "no =
direct value access support for this map type\n");
d8eca5bbb2be9bc Daniel Borkmann    2019-04-09  9778  					fdput(f);
d8eca5bbb2be9bc Daniel Borkmann    2019-04-09  9779  					return -EINVAL;
d8eca5bbb2be9bc Daniel Borkmann    2019-04-09  9780  				}
d8eca5bbb2be9bc Daniel Borkmann    2019-04-09  9781  =

d8eca5bbb2be9bc Daniel Borkmann    2019-04-09  9782  				err =3D map->ops->=
map_direct_value_addr(map, &addr, off);
d8eca5bbb2be9bc Daniel Borkmann    2019-04-09  9783  				if (err) {
d8eca5bbb2be9bc Daniel Borkmann    2019-04-09  9784  					verbose(env, "inv=
alid access to map value pointer, value_size=3D%u off=3D%u\n",
d8eca5bbb2be9bc Daniel Borkmann    2019-04-09  9785  						map->value_size,=
 off);
d8eca5bbb2be9bc Daniel Borkmann    2019-04-09  9786  					fdput(f);
d8eca5bbb2be9bc Daniel Borkmann    2019-04-09  9787  					return err;
d8eca5bbb2be9bc Daniel Borkmann    2019-04-09  9788  				}
d8eca5bbb2be9bc Daniel Borkmann    2019-04-09  9789  =

d8eca5bbb2be9bc Daniel Borkmann    2019-04-09  9790  				aux->map_off =3D o=
ff;
d8eca5bbb2be9bc Daniel Borkmann    2019-04-09  9791  				addr +=3D off;
d8eca5bbb2be9bc Daniel Borkmann    2019-04-09  9792  			}
d8eca5bbb2be9bc Daniel Borkmann    2019-04-09  9793  =

d8eca5bbb2be9bc Daniel Borkmann    2019-04-09  9794  			insn[0].imm =3D (u3=
2)addr;
d8eca5bbb2be9bc Daniel Borkmann    2019-04-09  9795  			insn[1].imm =3D add=
r >> 32;
0246e64d9a5fcd4 Alexei Starovoitov 2014-09-26  9796  =

0246e64d9a5fcd4 Alexei Starovoitov 2014-09-26  9797  			/* check whether we=
 recorded this map already */
d8eca5bbb2be9bc Daniel Borkmann    2019-04-09  9798  			for (j =3D 0; j < e=
nv->used_map_cnt; j++) {
0246e64d9a5fcd4 Alexei Starovoitov 2014-09-26  9799  				if (env->used_maps=
[j] =3D=3D map) {
d8eca5bbb2be9bc Daniel Borkmann    2019-04-09  9800  					aux->map_index =
=3D j;
0246e64d9a5fcd4 Alexei Starovoitov 2014-09-26  9801  					fdput(f);
0246e64d9a5fcd4 Alexei Starovoitov 2014-09-26  9802  					goto next_insn;
0246e64d9a5fcd4 Alexei Starovoitov 2014-09-26  9803  				}
d8eca5bbb2be9bc Daniel Borkmann    2019-04-09  9804  			}
0246e64d9a5fcd4 Alexei Starovoitov 2014-09-26  9805  =

0246e64d9a5fcd4 Alexei Starovoitov 2014-09-26  9806  			if (env->used_map_c=
nt >=3D MAX_USED_MAPS) {
0246e64d9a5fcd4 Alexei Starovoitov 2014-09-26  9807  				fdput(f);
0246e64d9a5fcd4 Alexei Starovoitov 2014-09-26  9808  				return -E2BIG;
0246e64d9a5fcd4 Alexei Starovoitov 2014-09-26  9809  			}
0246e64d9a5fcd4 Alexei Starovoitov 2014-09-26  9810  =

0246e64d9a5fcd4 Alexei Starovoitov 2014-09-26  9811  			/* hold the map. If=
 the program is rejected by verifier,
0246e64d9a5fcd4 Alexei Starovoitov 2014-09-26  9812  			 * the map will be =
released by release_maps() or it
0246e64d9a5fcd4 Alexei Starovoitov 2014-09-26  9813  			 * will be used by =
the valid program until it's unloaded
ab7f5bf0928be2f Jakub Kicinski     2018-05-03  9814  			 * and all maps are=
 released in free_used_maps()
0246e64d9a5fcd4 Alexei Starovoitov 2014-09-26  9815  			 */
1e0bd5a091e5d9e Andrii Nakryiko    2019-11-17  9816  			bpf_map_inc(map);
d8eca5bbb2be9bc Daniel Borkmann    2019-04-09  9817  =

d8eca5bbb2be9bc Daniel Borkmann    2019-04-09  9818  			aux->map_index =3D =
env->used_map_cnt;
92117d8443bc5af Alexei Starovoitov 2016-04-27  9819  			env->used_maps[env-=
>used_map_cnt++] =3D map;
92117d8443bc5af Alexei Starovoitov 2016-04-27  9820  =

b741f1630346def Roman Gushchin     2018-09-28  9821  			if (bpf_map_is_cgro=
up_storage(map) &&
e47304232b37336 Daniel Borkmann    2019-12-17  9822  			    bpf_cgroup_stor=
age_assign(env->prog->aux, map)) {
b741f1630346def Roman Gushchin     2018-09-28  9823  				verbose(env, "only=
 one cgroup storage of each type is allowed\n");
de9cbbaadba5adf Roman Gushchin     2018-08-02  9824  				fdput(f);
de9cbbaadba5adf Roman Gushchin     2018-08-02  9825  				return -EBUSY;
de9cbbaadba5adf Roman Gushchin     2018-08-02  9826  			}
de9cbbaadba5adf Roman Gushchin     2018-08-02  9827  =

0246e64d9a5fcd4 Alexei Starovoitov 2014-09-26  9828  			fdput(f);
0246e64d9a5fcd4 Alexei Starovoitov 2014-09-26  9829  next_insn:
0246e64d9a5fcd4 Alexei Starovoitov 2014-09-26  9830  			insn++;
0246e64d9a5fcd4 Alexei Starovoitov 2014-09-26  9831  			i++;
5e581dad4fec0e6 Daniel Borkmann    2018-01-26  9832  			continue;
5e581dad4fec0e6 Daniel Borkmann    2018-01-26  9833  		}
5e581dad4fec0e6 Daniel Borkmann    2018-01-26  9834  =

5e581dad4fec0e6 Daniel Borkmann    2018-01-26  9835  		/* Basic sanity chec=
k before we invest more work here. */
5e581dad4fec0e6 Daniel Borkmann    2018-01-26  9836  		if (!bpf_opcode_in_i=
nsntable(insn->code)) {
5e581dad4fec0e6 Daniel Borkmann    2018-01-26  9837  			verbose(env, "unkno=
wn opcode %02x\n", insn->code);
5e581dad4fec0e6 Daniel Borkmann    2018-01-26  9838  			return -EINVAL;
0246e64d9a5fcd4 Alexei Starovoitov 2014-09-26  9839  		}
0246e64d9a5fcd4 Alexei Starovoitov 2014-09-26  9840  	}
0246e64d9a5fcd4 Alexei Starovoitov 2014-09-26  9841  =

0246e64d9a5fcd4 Alexei Starovoitov 2014-09-26  9842  	/* now all pseudo BPF=
_LD_IMM64 instructions load valid
0246e64d9a5fcd4 Alexei Starovoitov 2014-09-26  9843  	 * 'struct bpf_map *'=
 into a register instead of user map_fd.
0246e64d9a5fcd4 Alexei Starovoitov 2014-09-26  9844  	 * These pointers wil=
l be used later by verifier to validate map access.
0246e64d9a5fcd4 Alexei Starovoitov 2014-09-26  9845  	 */
0246e64d9a5fcd4 Alexei Starovoitov 2014-09-26  9846  	return 0;
0246e64d9a5fcd4 Alexei Starovoitov 2014-09-26  9847  }
0246e64d9a5fcd4 Alexei Starovoitov 2014-09-26  9848  =


:::::: The code at line 9689 was first introduced by commit
:::::: 4976b718c3551faba2c0616ef55ebeb74db1c5ca bpf: Introduce pseudo_btf_id

:::::: TO: Hao Luo <haoluo@google.com>
:::::: CC: Alexei Starovoitov <ast@kernel.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============4785246946808236087==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

H4sICO5C8V8AAy5jb25maWcAlFxLdyO3jt7nV+g4mzuLdCz50Z2Z4wWriiWxVS+TVZLsDY8iyx1P
bKtHVifp++sHYL1AFqX2zSKJABB8Ax9AlH/+6ecR+3bYvawPT5v18/P30Zft63a/PmwfRo9Pz9v/
GUX5KMvLEY9E+QGEk6fXb//8+nX393b/dTO6+vDbh/Nf9pvr0Xy7f90+j8Ld6+PTl2+g4Gn3+tPP
P4V5FoupDkO94FKJPNMlX5U3Z5vn9euX0V/b/RvIjcaTD+cfzkf/+vJ0+O9ff4V/vzzt97v9r8/P
f73or/vd/243h9HH9eP1enxxeXX+afMw3nx8/Hi1ud5eXF6ON9vLi+vHyeT88eJ8fflfZ22v077b
m/OWmERDGsgJpcOEZdOb70QQiEkS9SQj0TUfT87hH6JjxpRmKtXTvMxJI5uh86osqtLLF1kiMk5Y
eaZKWYVlLlVPFfJWL3M57ylBJZKoFCnXJQsSrlUuSQflTHIGk8niHP4FIgqbwub8PJqazX4evW0P
37722yUyUWqeLTSTsA4iFeXNxQTEu2GlhYBuSq7K0dPb6HV3QA3dwuUhS9pFOjvr21GGZlWZexqb
qWjFkhKbNsQZW3A95zLjiZ7ei6Kfm5cY8ZhVSWmmQbS05Fmuyoyl/ObsX6+7121/XtSSES3qTi1E
EQ4I+N+wTHp6kSux0ultxSvupw6aLFkZznTbol9YmSulU57m8k6zsmThzLNEleKJCHplrIK72f80
i8Uk6DcM7JoliSPeU805gCM1evv2+9v3t8P2pT8HU55xKUJz4tQsX/ZKXI5O+IInfn4qppKVeBis
IxzlKRMOTYnUJsS5DHnUHGFBr6cqmFQchegK0n4jHlTTWNEV/Hm0fX0Y7R6dCbujNldpMVi5lh3C
QZ7DfLOS3Eqz4niRSxHOdSBzFoVMlSdbnxRLc6WrImIlb3epfHoBg+nbKNNnnnHYCqIqy/XsHm9r
ata+WyQgFtBHHonQXhyrnYgS7jl9NTOu6MLAf9Cs61KycF7vEjEWNq/e0uP9erqcielMS67MvhhL
2O3jYEl6bYXkPC1K0Jr5u2sFFnlSZSWTd56uGxlyrZtGYQ5tBuT6kJvNCovq13L99ufoAEMcrWG4
b4f14W203mx2314PT69f+u1bCAkai0qz0Oi1DrqHiYfEvifmxPpaG2ugwhlcIraYNteltbUqgoHn
IQejA21Lum0uTy8uvIuI3kSVrFS+xVOCrJASnQWOhEI/FdGdfMd6dccNFkOoPGF0vWVYjZTnZsDG
aOANd7AmdhOBn5qv4F74XJqyNBidDgmXweho7q+H5ZLwRjhjQwWwmknS31rCyTjsouLTMEgENRmG
l4cBLgxdUntJbA8biGxCBinm9f8MKeYUUPIMLDGneCTJUWkMfkDE5c34I6XjVqVsRfmTfiNEVs7B
18fc1XFR76na/LF9+Pa83Y8et+vDt/32rb5ajR8EOJYWZjG9Nt7T2sFc0P948smyVlOZV4XvMCNi
AJ8DF4LKV2DEM+W9GQgVjrDAg0uH166JiIBBe8h4eUwN3OpwXuQwC7SOABL9dq65/YC3zOT8Mncq
VnA/4XKE4HEir5DkCfMZySCZQ9OFwVuSwGXzm6WgWOUVGH0LDMrIoDaPOuAEwJmQAx7p5D5l1nWN
9OreP0oU9kFLw7h0lNyrMvJNKc/RxttXAk5NDjY+FfccvRg6UfhPyrLQRnGOmIL/8Xk1tMxwEyME
52EecQ2+nmmOeDtz8JKLH+vfYK9CbpxObUuIZS9iOqKjdi0FayzwNBLVU16mcKX0AP7UZ2RAjmcs
A6jgIt/OV1u33f2ts5T4CMBr/Q+exLAsks6KAeCzkUdcAbhwfsIlIlqK3JqDmGYsickhNeOkBAPN
KEHNAJEToCdIcCdyXUnL4bJoIRRvl4ksACgJmJSCLvYcRe5SNaTUk8UbV4qFvbNkC3p3DeTPELSx
ZMnuFEBBf9wgU3POJKiUtk64+Alg0Z6I0sZb06XoQG4/GY1DCQDb+bAwEVN3WejsJ+B3C7yDMI8i
7ruP5rLgfdMd7jauoEk7FNv9427/sn7dbEf8r+0r4AYGTiBE5AD4sIcDtorOVbxTTQfJ0lpHjQJb
SNoB3rRgJUD7uQ9IJCygwiqpgiNisHhyylvMZDcCbgwgBGGAlnD98tRv1S3BGZMRgBPf8qpZFccQ
0RcMeoT9hEAd3Il19Uue1gYKjo6IRehYKEAJsUha7N8sq51e6ESL8Pqy3cBiv9ts3952e8DwX7/u
9gfq4UESLfH8QunrS5+3bPlcG41uCFVQ2NfJ2rSYCqGAw09TBFdwmGc+XcgmdJA1VpKsXEpSCpnE
MSlMphBNUZ7LgDf3uVm54bJ0Zy9S+QXxjYiwArw8WSQY2ZDry4BmBaxxmvuZpqzQMkMoCCAGQBoZ
lk8AYvXxJ79Ae+RbRT0GPCGH+sZ2mMLLqsArWoc7EPKTpUPs27KModCxkHCqw1mVza0lhhhH3Vz1
OBNcDIAx4hMAYYfzGn2rqijsZJkhg4o4YVM15GPwDjBpyGgPHQoEMPT5kDVbcohkS+scEb/DZHI3
dJMsaxISeQXA+FOfbzRrOcxODegG/eUpOIcYwBjccQSM1PybhJDZqeGQLY9cm3URcFnjE/T0SgTU
9xuRZm0wfSHzgCv74oCDrFMz4N2mR3mChepm4udFp3gL4J1b14styWTv8wxsakpOVjGtk6Ymg6Vu
Lhu79Lw+oC8gZqlb0Dxtc0vUKscqAZxbGwY/EJ+D35hWTtK0934FKwBTMskw4j9i7fK4hqaIqwHZ
WNli5IO5AVC3gh2vT3ybihjF++3/fdu+br6P3jbrZyv7gDcKnMStbVOQoqf5AvOQEq+m5eNaAQz9
/bFJK9HG/KiKAOb/oFG+BA8L9uH9TRC7mFjt/U3yLOIwMH/g420BPOhmYfCZZ7e8bcxlrEqRHFlr
O6LwSrSrcfPi5XdTB/5w/O+f6X8yQ3dm3aF7dA/d6GH/9FcNyGjix3M6Wx3i4XnbtAJSpxnJFCmY
lJCTsLR6qBsQClVs5Y+1LEOvmoFJoAh09xVfvKz8xOxej8/PvcsMrMnVUdaF3cpSd05Se/c3Y/IA
VRv6mcRcMPH7rJyBv6wSB6/Z9Daq6kbhsGdLXWUiLRKeAuz1I/S8LJJq2uWgiFEy7xyRVoXI0Dv6
8h7Gb+AmGo+BcQ+H+MfxKzwzhrp5H2k6/JGMhP9bWPH5nK946BmDoQOqGPgzjGRqZlHJKSLjOyuL
wA1exn79d0oCeNRRlfqSHZi8Nfk+xIU9iqmoh8ogaFNNaqxDYHDR0VzgmqG0EYIr4GR+63VIMItr
tLieGtY5LNvVwuAwcSXMMwsINCtLQt8k4VOWtHhCL1hS8Zvzf64etuuH37fbx/P6HxsK1j2ZXbY9
1+XcRB8OIDABiZs4bB40G/JlSzbRiStrXhtMChI9fw4RkMT0onVnVEqfY9PIuNX+3ZCvwNvqkkE0
BlEjeZVskBD3hcAEJnmJWmWswOcazJzRCAJcaoQooBRl835KWAnnhS2MFDvIACrm+oaySzbn5v75
qc1DL5gUcnspf+q7NEVq3fYGGXkEl7e179I8huhRYPTsCW0Rdk6bk+gPaXmICNdroB1TbGxx8O2N
2GYC1ZIgpAEXleuxNxy+PI4R/Jz/szm3/+nNhnmCBiQkT4kVszsFUXMv2Al0c0PcV7FE3JsTQqdo
Pdav95s/ng7bDaa0f3nYfoUZbF8Pw1nWdsdOudRmzEfjSezYDgFWxfB6el6H+dyRJOTeytbY33MS
PoMl1AkLuOVxEElCwDHndwrNUnykuMD01x+hKoP1mmaY3w7xrcqxXmgk8b2jFJkO7Of9eoqwEBic
wljdF/S5G7vUVMlLLyMv/PRGjUYf6yRpDT+ustDYAy5lDrFr9pmHjtFAMStN2r/wG40zCDiGkRtG
AoiIGmvpcWlgGksR37XJeUe9SvEWNtUa7qwwctOAIetQull7zQp3kE2Gj5JIBs4zK8xRobWpCrAO
JcfKF9PCp8QOH3u6eV2pB4ZO17du1hFsIU9aaXDuM2hcB4SYOPOy8b3tByK13xL3QyhRb2b96hWm
xSqcuRBmydm8RUCwtLeVkK6aJYOzL4x/xCKIttjGI9SkXN4lmycRkfetW2N9ESRZKQQjEQ6rACgb
zhom0u4d8sm372MS9gN4fZV/+AoOx7nFNDzEFCbZuTyqACQZe4HvDph39+jnK1HiTTalKnjAPLfK
NDcpWWv3+zW00mqncnIk3eZpTXJpx5RQESfVZgSzhWQpWC6iIEwwP4JYZgk3kTDwbCgxVRUsXkZL
4uo+GjZzbFfDvZjAGMzueBYMHaMuczspgzaA5ti7hP80zBe//L5+2z6M/qzd/df97vHJzmigUOOX
PR0abuOxtF3gM+T0uexTHbsJ7x+46LY/ONcpvlhRr2HefVSKvZ/bxxMXWJv0QDk4uS6hwb32k07D
qjIvuW7RMftQsPcCvhfEZmgy7Ar76Ir2I3dUkvkcSdMQIVD5IxE1Y+N3yEwml++Rurp+h9TFJ9+b
hC1zNZ74FkOb94Sztz/WIHDm8PHSSAvLOIy23NEdV8df+aqoGiF83VnqVCiFdrSragC0Z3K2fadV
BtYQbvVdGuTJYDCqroJJAHtUxMUGeHHpzznEWEqAQb3FxKfNwZqBQE29RKvCsS8wKPlUivLuBEuX
43O6Nq0Ahn/el37gNzFf7SGlrXwZlK46IOn01ntC6t4wER37botZD0zHFyyxu6lLfyH+CeVdYRtR
L1vHTczZGsZivT88oXkZld+/bumTZxtLYpYcM4vW7WYQC2S9jC81I1YkHiVNcxX7G/bKU3AJp5VD
MCQs9e0pY6GXrKJc+YeDFWuRUHMD6/zXV2QwF1UFp0aEdWVSwB36dO0bQAUqwDXyvis6hiRKT05X
Tb2ThSBYHltlVZ3enjkDh+BTymNxROOdWlx/OqmUXAjSvs2DOifNuvuD9yc8vemtAXG0cALJJndQ
1x/nfbUWObrQTuR1jgarZExehqS1CXt+F3DpS681/CC+NS3b8l+rv/6mYAqJIAaVja2dry8h5jGN
nxzgv+7hi5UA/0ItU1IybTx93RjuYr7MqKWRS8XTY0yzrkd4falFKvIlsZnu704wQyXgrBNWFOgC
WBQZp1G/GnTyGNrcm57MDvF/tptvh/Xvz1vzXcjI1EkcyF4FIovT0k4jdAB0yIIfdhYCf5l4rXsw
QSQ9KDZsdKlQisI2zDUDHJsvTYXam2CwOwTHpmTmm25fdvvvo3T9uv6yffHmV04mT/u8acqyivk4
Pck8bptarAI8tJOoJRnYFWazuY+1gH8h7HeTtAMJN/3AVKmn1IObczLHrCIW79iH3CSaWx5+T0KO
25GkvE1vxnOU3W593n4I0991J6HvM65FAlFGUdZmCPPpl043AYIf2xiaIxoeMYMmipcc77QVTnq+
aDBRDF4lXbqlFwEEMPRmzRXZ+nbGZvdgTY2Om8vz367JGBMOfpuBIfOMMZYQdjeprb5Fyjyi966Y
IXSwMZd9gTaPE1b6ujvaJLnP36X60+XE65xPKPZD9lMNZv4PG442OVIFekz+5uz537szV+99kedJ
rzKojqt0RC/iPImGq+dImaAw91k3j/jN2b8vHnfPD4NR9lfMpwhVWAM5MgvPiI+Ors1I1gUuTcqV
toUhcSkx1jAfu9XXDouH/XXVUVuo1iaafDe3fhkzXybQrsDU6QBQ9Cxl3vq8PitR8jpPxKwswHG3
0NvysvWZ2fbw927/J757D5wHGJ05p6VA5jegSjbtX/YRbNrQExxf6lDsJquowCqUOaehHCHW4mRF
wM768uxAxW8MMeOHS0VbtCwweSanA4ucFv5tAFE3VdiRaDjSRQOp9UMnjBa4qJL4qSmTNO6UIppy
97degIImWWkZ8IadUhVG9tP5ZHzro+npQlqHlrBSYHmPasRD/+omSWiFDUk48QdHyZy6ioUGzJZw
QyY4WBRR5HtbXk2uCIhkBUGDxSzHg9odG8E5x8lckTLKnqazpPkfU0kusAiAQhoiWR8zC6WzsOb5
v/niZf0K6xl/FJIRR5nCrxzypC5d7nEfnBNmYluv/kVz7o91Djhjbu6EL2NSJINPMZCmp8r3fYFh
ybwyWOGFnHedqVlPmClr/Ley9AUukmZlZWw+wqL4ckX52IfEj2zUnbbr3YNb+qMuErfbxZgOqp9+
bbM1Omzfms/UOvM3YDkMaup6nJlKFpnYr0lUbP7cHkZy/fC0wxzqYbfZPRPLyPDYkvODv3XEAHmq
hHmBH0xD5mm/wjJXGCea3tjqw+Rq9NqM+2H719Nma1UhtZs3F8qXsblGw9yrDopbjg88hMLusCAQ
35ziaOWlzwydnFjDASTs6e+OpTRQPTn8Lrihdb/wQ0u2tMq/gBSEqac35EwHsp/Hv138Nnh+Bs4o
qgcQdetHWi1wGI6mxQpb+ftVSd2AkKxSCCSELAnx/QK/pnE+K0XDnvAT+qdyoD/UfpIuAO1iZt3h
hR8/njsDQpIWivnInRaLJ2KB/40jd/ipdgZvc9WJpfvMTCmYs9o8BdwSpoBZjmot8G3xBzKNdpzl
6f7pstka8rh0AEF3hFQhRk/4OcXjerN1jtBMXIzHK3sT0rCYXI1XbhcNOXbKGNv6vmFH3QAqFRwd
wCf0sSDgbhWurGnnXQ6uIuRO7H2fqkYToc0XDA0C0gfzCdiJLsy+DdRV7ZUj03amZ18vUyHNF6L9
ipG0c642MVc+ALMU+EBN3yjCeIpufmw5TAMbxuYPRWB+xDe5phkOiyc5Vvgvmczg9Hh0m2cE6Nl8
xgXxguTTKPCI4TNuU5ZjRExVibWnfa91NFQc+cKylxv8LQFXJJQRI58FDHUs+cr7DV6Nj0imsaWY
QESGHoYMMVcA4ZJVwEC4XVrhPVI3Zy9Pr2+H/fZZ/3E4GwgCwp9ZqZiWkfDI+yTY8j1F8lSpamM4
f+xgq4EGWeWZRZa7fzSlYwFQDAAJ1O39g0hSfrRgrZOC+OaEjlk51DCUwq+zf9iRCJTqenKZhTo1
kSL5sXrMxc5OKZktTfb1h5PBA1F/z/de4VCxd8u2Ez0tWkbJu+Tqw9N+p/ejbcZnWVMsakp3zntr
h181vVg/G8313z3pCjVkPBcUf9e/zU0ZEEVW/x2gvpC4pk8L4QsvEKz/Rj8mM7/bh5UXhzzY5pCJ
2B8Exd66TsWw3NvWK2IrJ5ssyyrLjjy2xUwk+Mzg0Q0IusRUVRN+OSlp3ocpxmcfw5xFGDIZ9QOs
UQ31qzXFFEHoUKgBHCnCXzbr/cPo9/3TwxcDBfo6y6dN0+MoH1b2V3VlyownhXeC4MvKtKCfAbYU
nTZ/N4TWPWYRS078kRLTVyxkat4dzZ9vGEwlftq//L3eb0fPu/WD+VSi3YalmT/NwHQkk0WL8O8u
kHcZU+zc9kbKj/tWpr6unrtPKWHTR+qBHClz6A/NUg/y3B1KcefYXUdmaokX9JGnjR1NsYOf56cW
qb7NlZ5X+CewSqtkAX9pVts98wV1U8bencC6UcvjTnPyVaop0HZq4AGoWM8z9W8tJiEJbGuaonWW
DW05HojhC+BQH/0DMBEG1TMm60MQ0/1EVsyzkHd/WsAuchrej67cuo5S7eg6X5XeRJgyH5Xgqgf0
+4d0JhqCVaDdau6wVw7mB2tE6a2fZsoP5lJvjj8qaX2z9WcT8hgzrOX/c3ZtzW3jyPqv6OnUbtVm
wzuph32gSEpiTIoMQUm0X1QexzNxrWO7bGcn8++3G+AFABv01nmIY/fXxP3SDXQ3DJbIgOIlSauY
gAJRHHOT0FW1+aIQ+rtXhab0UIW2iOiEhReEWamVTlzjUiE5AMQeHMTApNpnTSYHLBKWguiO2lvO
cnML1aXVRABmadkdabBqbJU7IAkCuRgjTpF3bCPTuIJrUNxFUbgOqKRthzTCGuBDxQs7NweaLaCH
U5mtmO7riVRhLf9DIYm7WhCnpO0Y6SBByZeCnLaNNzDtmTxEBZ3adjkiXE20ZAQRDa5qrTA9slX8
GZT6iBvth7c7aW4OEzA7sKpB5w/mFifLSZWjt9R3fJB06oqaALBwltfqcIV6rl2HeZa0GsEiUlTs
iFobjGOuespZ1ClbgwAWF5RwlrPCWVuWKx1Uc4pjTZShBi0gvq8cigzQZm+HIe1uN7DwcqytjnI5
KJPA9Z0px5TZQST9jVMd6nXJktodgsbIpWhiOjxDhwETQNZMt6Q/GpoyXJqWSVdA9alGf3BJ5XX4
DO0PO7MMNpVy7rIs6Je4dTypX0aiL0+Qnoy+XQm1svQ4SMBBFPqz5NZu0gVEemu367zAnF6etpdo
va8z1s3SzDLbsjz5oEOrqIiOd//r9m2VoyL78weP3fH2HaSFb6v319unN+RbPT483a++wTx4eMFf
5fh5IIfJGfw/EqNmFN+qZyOVI2JjF2fUj+/3r7erbb2LV78PQs635z+fUNBZ/XhGM6XV39BF9uH1
HkrlJH+XjsvxcitGMbIuhgTzp/f7x1WZJ6v/W4FWz6O5EuE1TlWNuywpbC0lIXVusidvQoaRO56l
Dden8hqkSP15KrsWpmPMw/rx/vbtHhIHDeD5jvcFjy37+eHbPf775+vbO1rurL7fP758fnj6/Xn1
/LSCBMQpubTSAQ1v1LjsNLMORZABSq1BAO2Uw1tBuWjsBIwnkKQNaJ8l3xXmZPhQbQwe4+ySV0oM
KKRjbLbLdjSOx2rffX94gdyGzvr8288/fn/4pYpjQ17D+e1sN0Sb3eG2gQiAwHI0d5IEzjhPeZwA
qT7Ipf7VW/hP6yLS+hrQJeizXr3/9QITAObav/+xer99uf/HKkk/wQIgTYOhSkwqVrJvBE25jxyp
9MnBCKuxV9VSj3saJdIiQ4KRe2MlQCinF9Vup91kcDoe9gvdgm6Jdlh23rR+gAVmbHk1yW0iAFMR
c/6T6DWYCMyQJiJFvoH/zG3Dmnqe8RSUT6uN1jpnLY6sKCQPeSEC66glPW7ZPklnxRRkcnhrbKr9
+UjlVtaVBmz7iLVqEeo6nuWfl4Z4TBy8yetLVtc2tRtOHAw116RttEKIcx09Q3EIZEpvaNZBwJ7E
CXFAEu9j23ekfbenzyrc07/CKM6TGZldl76b+Oq9lCj03jwWtFVm3NZaSRHAlZmHbZbnTR+Lih/x
cudJ2oJCeJhIrYi0mqv8Ykl8fnp/fX5EQ+DVnw/v3yGJp09su109wT7zn/vpLkVeQHki8T7Jl8YY
x5PsJFWEk75WTf5VoqHX+nY7lAezvtPLdPfz7f35xypFsz6qPJjGpkxVqz+xf+bVp+enx7/0dGVL
JGyQmeqFxNmtKCeDbikhypHZ77ePj7/d3v179Xn1eP/H7d1f5FU7pYb3SkxvEzzytgmIhtwKlfoG
QHTVyiv9k5oPLcLuBrQnPI8aVCzVTCU/tBVGauAHOEaLkf7+jFbeFKXtUm8K1XKqp80Prnux7eXn
u3HbnR0Xc4LpEkaA2y2eGhTaKZvA0FBE04Q1DmGse1XGZOAKzlLG6LmALMNQOL7dvz5i+F7qjrX/
qELPIn7Xr+U4IHj8fKR0MY2NJU2WHS7dv2zL8ZZ5rv8VBpHK8qW6ViwOBDU7IfGHThTLrtRPpnNp
8cFVdr2pYjka6kABrbr2/SiSzg1VZE0h7dUmJehfW9tSdV4FCqlAMhKHYwcWkWraW0U1QeQTcHGF
hZlXDC8uyKIgwMebIbDsyNgmceCRG6PMEnl2ROYjRuPS10UZuY5L1QkAlwJA0Q1df03nl1BTb4Lr
xnZsIs1Ddm5VM/QRqmqQLWERXEyYtdU5PsfXRB+w44HunPwrC+Q9fsoRJq9H0NvSubTVMdkDhYC7
VuQzr0IS17bddcs9Xbbo/5NT5x7S/FXuKSse8oZRlpICY1mD5ro/VKowmcSKSOfLHNkkpb8OPf2D
5DpWZTpBztDgE3Rv+myZs5xY13UxrRUKDsPdXl/+60Nct3nC1FN/HdTsU8a1jGHkp4XlnIcsoA7y
ehibSCyW0p3HRERVDcMI52oEbJkjTlkYebTvrMoXRmFI7eg605ouisDUZiJw5fRFwRvYMOyF79sS
xOWyUyQEheEIC1reJTkldcqMm6NjW7ZrSofDzvqDRJJ9XqNffp4cIteO6DIn11HSlrHtWUv4zraN
eNuyWosNQzAYG63HRaOTtRUcHs/jgyqn8dqSz1wVDKdCU5lG4T4ua7bPP8wiy1pjSTGyVUwvYXO2
fuH5KLsucYXRHgFuj1/ylh1pcFdVad7R2D5PMc4TieVFDqOrM9WRBew6DGiveSX74+GGvpxWqnfV
bh3bCT9mLAxWjypT9SHPOUYz2nNkWfYHTS84jQMXtnjbjuQ7CwVNmK8ZWypwyWybuoNSmLJiiz6a
ubzTKgxig6K7seyCY3FpWWIa8fkh68h9RcniKuTBCMgUQOrglgkfjeEUdIrW76yALir/vemD3JIZ
8d/POWXZqrDll7h0Xb/rq00VmS+/dDnOaRuFXdd3OT16QOCzKVlRZoKtltspVCxvM+MISGw3jNz/
ISmxXNDVQbyOD4p9vo67pRnL2wUwa4/NpjLjfIqb4bRMsB9sayH7RhOxZgxphlcVVwuFQAOJuLh8
kBA+olab4S8xazPDkOFNUSy0Q+bkZvDmum0q5fZt3swgRiWerxjq6kx8ri6kEbPrhRbgv+eguLnG
GcYSviF9tB4An2NZnXa9PecwrFgC9JfAkAabEnDjppQXWUweEClMzLyas9Z2XIPkwNpy2zIDdmy2
cZK5SwIM66LA4MikVL9mgW+FH60uN1kbOLI2qoDi3JJuwWpf9qKj4WvQ9vxOEhl6nSqXF1NBA1HZ
9rq5QiHoRoVHYWLqRZfOxIVp0Ap5AY36xwZkV9/Si5y5nQVVbVvl+bj+7KkLw2DtgsCHipHcZz2D
WJgv9bkRKSwUsizjyPOp4xKB8yOMDYhaspGUBKUZPuHS6MXn2CnfNDHRwi3GxSmrNqNU2vEYidXo
0cP55lW86tovlPYwHPGdMwwXlelFvoa1GC0vtdImpW2t55k02Q4DAVdN39LG/BrYZ6bW1lM/ihPM
WfJ1svWtwHXx+YSFHgK2yA/pyddznMu+i8wtAiyiO2bF4F3VVPgQHN7vYW8u5CX0k0t1gB4y5oZM
gSuY5hkKCeSyOCzjtCtcj1ZEBEfOnX6OxjLASuAEa6K+SRmjPrKUNGzZNQbaLeC3Demu1tezOTkB
bCVieDC94zkc+MtwOIebMve07YmTNKmO0xh51y6gcqMlsLVcyTCyp4hNU+N00t5qQ+eX/TV6iqNT
XCUQVU+jVAUB+f5wB7S/ff3GjUDyz9VKv/XlpVyy49M4+J+XPLI8aVMURPipGvgJch03yhmioBb5
pmaOal6F9CY+GyyrEO1tnLqaGY7uBFtvxSIyUAvDnFIECVY/aBKKO643BFWcPzOpg45DI01mo3HJ
A32QN5VUh0yWMsStjbjv+n77env3fv86N7tr5RhmJzn8dAWjreBWtwcmoq8zmXNgoGh6fOj9meSe
yBg0R31VFSMKrKNL3ar+UsIajJOpW7UU7X3QprmPHSguMu9fH24fpQtAqUtAyudmsonyyJkAIkc3
4hvJ0gN1/Im1yvAwnvyJHfi+FV9OMZAO5DOVMvcW48hdkWW6yEuTTC+5DrihwUNzOcYYV8+j0AYD
lZbZEkvWtdkhzVK6TGV8QJdvJXCfjMesxthCJ8zA1KjcAhztOD9sSxGSV2el6iU7yCopnJXAfipk
KmDTOlFECdM9E3EhfXh++oTfAjcfhdyMiDCB61MAUdK1yVcXFIaOKCG2bJGTsXJ6DvVEVSLOZ2cP
snybnzIiM5Ykh466jR1xO8hZ2FEFHTGjTD9jNMn1PWO/aH9p4x22wv/AqrOpTPm2C7rAmjVHv4fA
FtIPYy1t2UVyohlbFzGYlmLW2LOi8uDw9XJJOU9+QAd0skjwV9Zxt5R8lyewLDYzFlw1bmzXl61O
tSVT/yJpm2K4ZFWhgzA3S8WF82RvcNmnBd3X+LiCeHFof7psrmFe70l3c/RjVvy7D8eiwO2LVoLF
o1qgWlB21Kdkenpw/ASpx3RDeS72leMRQY/KfiQhvFGgPPrePdSzEa9dTcba9Xxg1LVy5S+sqUa2
SVyty/wiXrtsNCquPxc1eqCg8+e7uAsXibBWDUzDIWFhwkOa8iMJLS+mHE8IElOd+2SMvzWfVju9
xKgbVtvtRAa5QASuViQIQRLPZOaVErZuQjex59pESlPYx6m/RyyBriOCBPTRCe7MwhOaSXILBdWr
At0BMRSMZ5Er+QTLN2QsaRyvkyehMf/hE+gepRng7yvNN4dH1iZnCEjL/SSgZkh82PFHfUVzS0c7
CfyrS6qFW/UFDs6Z02JRjxl0pQGF3UEc2WjZ9xCsevkhq5RQHzJ+OJ6qlgwuhlxEwieoAd4td9fz
DFnruje17LWgI7Mjfh037WGwqRTXJuv3ueQ+qmp9qzdH1nK71NG7UpgGwdY6t9ySjyqxjbgJRB8/
cZrIzvB4HzWTEeQPeJ7UpMpjN8g85c/H94eXx/tfUGwsR/L94YWSeXgHNxuhFUGiRZEddpT80qev
bTkTVeStkYs28Vz5fmgA6iRe+55tAn4pi1oPNRm1LwxoWXRJXaTy5F1sA/n73kEVlRZp9XXw3Qzc
a5RCxsWuwoiOMyKUfLQJg8xGLRF9FaeGnwYGf4h99Rt6MootfvW3H89v749/re5//Hb/7dv9t9Xn
nusTCLBoyv93ZRhdEigc0R9phhExuH9wf16iNKUEm2IoaWxz009kmGfMx5DwMRRPl1SNPqavsrIu
aLsv3pE1eZ4ISMXtoNT8oMUNZWN5ifc+Ck0IjkMXZb9gQj+BfAXQZ+hm6Ibbb7cvfJbPjPiwOfIK
TX6O+uwd3CIVYlNtqnZ7vLm5VLAXq1gbVwxkgFLvljYH5Y2O+YLwKa/RvFk4ufMaVO/fxbjuiy+N
JDlKl3EsqtmzVn17WAUXx4mIqaCa6k4ITo3FTzXXXnnRlNJzqYGh+D6j80OJ932NRsvGyNK4/Je3
b9jJk6W3ZLQ5iZToSMG1FDrXS9wJbwtYLJV4I0iD1WETy3IcJx5bFOAKaV9DcgL7xUEW6pA4TT2N
fp55zQgqOnfTChfgoCPy4FhG/Q14dEs0BSzK0LoUBalpAizUn41aVP7+qeLuBsRKjHK1YZoquUKT
JpUKameUs8BSjxgR4NqwsaxllxvUWQA72FENvhiI8vXBUMmb68PXsr7svs4qFZfjjOTDS9pzqCMG
LKNqzDx+Wvfh7/ohKsu4NR9tin0y75nRgj1T3ZoQbIsscDqDoysmqE9qCS0pmXAv+3DtuSfOJLmI
o2qWa24FE/nxAT0npzphAijETEnWNVP+GMOWCE2gZkMic6EKuUELwNgYV4O0LGm3I8gPJynFcGKZ
LegS1m95Y3n+4C+8vD+/znb4uq2htM93/yZfMm/ri+1HET6woxppiq3piYchr/fXMK1WaD1vDLL6
/rxCZ0jYCWD3+sbj8MOWxjN++6e8C8zLIxUnP6DeTDQL1lc5ousJPFI4DyAkYkVK72tXW9FKs0/y
5ms/zadTdpQXuCeXIe8hTIaamrDCtiZRV4Th/XH78gIyE1/KCEcT/mXodZ15teQsxmVfSMjjeq1+
lZ7jmt4/hVDU4n+WTamickUJcUbAjSptceK+OKez5uTeWCcy8jJvuk0UsLDTUiqzw43thBqVxWXs
pw6Mj2pz1LG86rRegY5MVE2Qk43LqmjtMr1sk70sACx05yg8c+r9rxeYHMpCKdLUXSp66qHWW/V8
GTSG+fCiF86JwaHvYcXtEiox7kcMpD9GD+Pttt5LbZ0nTmRbsopDNIaYE9t03kjaQG/ym+pgHOmb
FEpol+eTVgrdFpcThVg/a8midtceZQvXo1HoB/6slmguEwUUeW3rGbdfy47zqhnP7flm+HqtWQ8M
w2/ecuMOvTjsYG2xA2++VLn22tbnihhitj4NE9eNIms2p+ucVYw6IhITrEEzb1eeQkRZhTsWqBeL
dVC0jDE54jN9LO12oJ2jVYhx4eHvOE7NwEMUjYmcbTxgne2E9qc/H3qtZSYTwSdC2r+kzPHW0ime
isixOWTEPpdaCXrI4JUxMbBdLrcOUUi58Ozx9j+qwz2kxGWvC8YOpuXRkYWB9kIXRuBYQ9nuTgUi
I3DBZ0DVYFwKh+2aPg0MgGP4IrJ8rZ2nb1xqBVQ59GEiQdTConIY6u9bHQ2EkWUCjOWIMos2Q1KZ
7JBcbdRBIslk/HXk+ESf3QoUY0GRtxwcxeCjhaRryVQ9rqSCaWGL6jQWuLws9dZKOICOlF7Y48N3
PZXHTBO0sZVRBdjx+P+1bwVKK29iVJmvL8nZsWyfbIiBBbsooAaTzCB3rkK3DXRnTmcbNi+7Qizj
QzwRZyXdfHXCrqPkoTFrscH+Nf8WXRNCy1uqZ89ClJwjjhJQuS/+YHI3R3JWY2rKvUoPQXLR2nLJ
Xhl4cIN3KM+ugUH3EZ0S5224nHjrBj7l6zEwjE8GY829wA8M1eBmo4tZQZ95tk/1mcKxtqgcEHJ8
2hNG5gldfzkDH4ow7yIEIjpnVm5cj2r+YUjs4uMuwzN6Z+0Rc6Bpfct1qZSbdu359IwcWI4Jsy2L
svEaS56u12tfus3RFh7+J0gkqcYxnDgKZVIYeIjoDITWN0b0SkPXptdpicUjfXcUBmlLmeglOhCa
AGX7UyHaOVLlWX/M41LTQOaww5As3drxiNhpcdqGnU3GTkPIJbVYmcMzf+zZtIuZwhPQj0IpPKTy
pHLQDc/c5U9ZEgZkZ3b5ZYvR/atD21TyE27jl2hdRdDbrrapoiTwI86bS1I3hsPXnpFfEbegYi2U
O2UBFQcPo9NRtektluM0mRd4G/pu6LP5RzuWzImDXT0mNf+i8O1INRmRIMdiZDiegQO29JhIE/qH
oIq7pwOV1T7fB7a7HPIv35QxKWpLDHXWzTP+knhEcUDKaWyH6hGMTw6bGwHwddg3ASFVsx7SjbgM
XHT8OQTXVEHbBHY9Yuwg4Nh0QT3HIVqDAx45HzkULPeN4Fla5LjTpmyFLQOBFRCF5Yi9NgABsc4j
sCa7gWv5obO8bAmmD4YhRlKECbtc1SBw6XIHgecYyhcEpD+LwrEmdglRamp8lEntkttemwTytj7y
Z4etY2/KpN/oiX0n6bp5FxZl4BJDqgwtijekeanRWlK7IlAjcpyW0VL7YcQQKrGIzDgiMyYnIezR
dHHWlPorwb7jEp3AAY/cjgRECaEDx6FNxJlFzlrZCWLEkxaULLK8hzopQ0MYkHHNxFPPNS0f1KVm
naN/ey5Nqz/bt/ZSrQCnRjGQ3V8kOSG4M9gGPcul8gfIsQ2aksQToJa7yMRKlnhhaa+X1xnWtiwk
NaMpoTKglkSYgLYTpREt5DJQiMmpwaFwUQaF6kVUI+eH2LGItQzpHbHZAt116DUnJEZ7uy8Tn4oO
XNa2RexTnE7MY04n6w6IR0YckBkccr4B4tvLw+IcuWHo0tawE0dkp1T6CK1tyntW4XDSeX05QLQD
p5PbuEBwCupXiRRrEUa+wftC5gnkp/NGiB8tKVaOuCTFdKaDvSuVF/rYV4zl4o3kqZykDc4mwYfV
J3aJrBzzIBsGJ8S3D03J9I8C7PBZ+6RU362XcfogWrDIV+Pc5uD3n093/B322bN2/XflNp2Z6SAt
TtoI5E5DoCJk4C67/H21ipKQJ559kcgKBQI8rJIlz2VOlS6X1Ly62rHMTgnIUqKJJXVthRGkptMz
6Yte2WFqtN8BCcgYUgPo6iUEqu3TQhyHi4MpvV3cZniNrylSvE6gRHV6I/VEVWyXATUwFAK1Ezhr
lbbPQSi0eeNIByktWq6xPHHVltLjgiFtfreH1Oi/jD3bktu4jr/iOg9bcx5OrS6WLe/WPOhmmdO6
RZTcdl5UPYmT6ZpOOtvdqTr5+wVIySIp0H0eMtMGwBtIgSAIAmEDGpGdDxJP24jkLJ7cdbCl7WIj
wXa7ucFpSRBS8eFm9G4xf9JweaPdbuOTpuQJqWrJAjbptWpL2UfhykpnghVfoolVcNotnALHF9U6
RDHdzqrS9IIatnPqK5nQukeBqH9h8BPQu9AJreNoq6DbuHY8Z+vt5rQI8qTTlAG5hwrc3TmEhaJs
1lF8ChyHFGUc9lTKT1HgpHuCtty1wDKRKbrk7bXOog7d4XqVRXgx7TqBJTyUuMwmDWZTWAij/vn2
WxuZgHvmJZLRsSbc+pSVWsHL+3aq6tBWcHHxrkKXMuiKWYit+8L1tr7xhlswuvQD32T0dLGvbg7S
Y0GfpRFouv6rKPqJg/gK+XpbeGu9xvsyQO3QWFsIde3SSHgUUMb2KzI0Wxn1mAVMd2u9ll/rzMDo
JSdzxPdJurNFCGjFfXJDfIqqu7xNjZiavoZ/UN63XyNCGNeKM2LPTvjwtC66KM8oAnwa1Mu3crwv
M7J2fKbNG3xTplDNw7vSwdaThxvqQ5hpUOkJ1TOQgkoDfxdSGEWXIZq96jQ092cmCW3kPyDaUCd8
jcTTDe0GjhKpypREVeAHQUBXILAhafKYiczrOyU0iFA6bhaWJMfAdyhWM17sfIecH0BtvK0bUTiQ
JBv/RGJAmG9durcCR2ltKkm49SwVg1QlO0rIWwXZJX4QUtFadJrNdkPVjepTENpQ4Wa9s6I2JMOF
WqRusxpq0qRoXOjRHRnVVCNoh4bfhnS1gAp1y5eKbFzYJN/7hOB4TUcPVknCUI/mq+PeESJl8wHO
zzQ7QVF0XRvGowcNmIAUPKbaOWPQkXAdkF1YXusruH3/EfPokLgjfPcbi2ARyHfEgqDZ2Sq4p46Q
M36pg864SRe8WQEv8sB16KFxKO9sIkvt5zD0bHunTrWlo/TMVKAEBS7M882eoqbk+fTnKPVAep0o
miPdtNAg3206cH3LByY1wndZMWl6N1s6oj2IbsYadFEj0RQf8ZBfkybJIMPNj78L1mqBMUVeYxG+
ifakEnhbCP8kS4x4DQip6o7tmaqilFnKIoGbMz6rVRy2vqexGqEW646I/NgXPAuRSo1RE2NmnYof
ohRzgWTaMGUPxtYXbpT5y8OPvx4/Ee8mUtXTHH5gUFI2pDGjoFwznyA8bYaoP01vUYnRINFdyacE
od/04vsY3+xnZS9D21jKi4ytML50TkS67EZCJk1DZJ6VgzDKGTlKp67ZcFiOH0r4L4VVkzvgb54c
sus7ILReXb5/ev58eVmNyajgL5GLSWP9+JB36zgbkzXyEWPhbmiflYkE33Z1oOztyIgoC6pg4Ttu
66ZMRdaWWv7OsZwK1ngCLNPXzREYrEP6tNABbRK1+ITtkJbMZILAFUcypYWoXoZmyJter7OJKpE2
SGYMfnz98fTwa9U8fL88ab5BV1I4KJaYPYbDMiwo+4FCyXs+fHScbujKoAmGqgMderch2h/iOgMl
F/Uqb7tLbRTd0XXc+74cqmKxCCTVDQZIApk2lWogK1gaDXepH3SuvqnONPuMnVg13EE3BlZ6cUQ6
bWn056jKh/3Z2TreOmXeJvIdcnwMQ+Hcwf92hvwjSNguDF3a6KtQV1Vd4CNxZ7v7mFA24Jn2j5SB
Ag19LDMn0PSBmeaOVXnKeFNEZ+CSs9umaoBTZQqyKMVuFt0d1HXw3fXm3jJZMyU0ekjd0OLApUxf
VPK+wsBZO9q3U6kdqGLHDz6ol1c6Ol8H6hX4jKxw6ypCZx0eCtele1/Vxwh7L1a1xdhBUu8cUtOe
aeuCldlpKJIU/6x6WHI13Ye6ZRw9Nw9D3aGFeUdfTCgFeIr/YP12XhBuh8Anr5bmAvDfiGPs3uF4
PLnO3vHXFb0+2og3cda2Z3xOqWREIEnPKYPPuC03W3fnvkMSepYG6yquhzaGZZv6Ds2gab3wTepu
0tsLZqbN/ENELhqFZOP/4ZwccvVoVCXZd4UkDCNngJ+gq2d7h2SGSh1FdIUZu6uHtX9/3Ls5SQB6
RzMUH2DqW5efLA1JIu742+M2vX+HaO13bpFZiJgI+XwaeLfd/ickFomrEYU72l6kkNfVeYiS09pb
R3f0hcKSONgE0R110ppJu6YGrcDxwg6+NnI0I8XaL7ssslM0YxoJojtd2xfncZPcDvcfTvltoX1k
HBTB+oTfyM7b7ag2QXQ0GaycU9M4QZB4W09VaoztXi0etyxVrY/KRjxhNI2BTTmrVvHL4+evF0N5
S9KKC6XYGHlygNntMMgxaHY+fcEvtNZx40mmvOVWStQABjzE2HTcEiMyHliDzh9pc0KjS54NcRg4
R3/Y3+tcRG2w6Sp/vSEmrY0wkSgPN55dC7jSrI3PFhRW+MdCzRNVItjOUc1nE1DzUZJAkQJ+nBAN
1R1YhW+mko0PDMEcX2b3MWEbi6NBmNa2G8qXmyDbGs3o2NDAwkawb9auswDzahPAagg3ywJN6nrc
cQOzv7AP4XPdE/xx2vik65VJtg1PBhuv2LTRESIuTXrcBsvdXkHdODnNWvkSKA6gxGe3/GbUwllX
RUd2NLszgm86coihtkmTU8GNxXmtdL3eV1cexppAzOEU+sE2XSJQ6/R0/3wV5a/JVCIKxVq/qJtQ
JQOp6n+gYyBORC0G3CMDf00UsD1oJl4FvvWDVp8XGZSVEm6gUGVVJ07Yw4eetXd8OqfuXx6+XVZ/
/vzyBaOgmIHV9jGcjTH5myIyASbMH2cVNHdkOqCL47pWKoF/e1YULUg6hV4ikro5Q6logYDTU57F
BdOL8DOn60IEWRci6Lr2dZuxvBqyKmWR5okDyLjuDiOGnEokYTlBMeOhvQ7k2bV6YxS1GvICgGm2
B3UzSwc1ggI2EyV3hcikolKXsCWM1gmukeMxFofayXCCy8n+awoItPASgtLHPHK1dQ2w/phxausG
1DVJnc5yNzVcWhBY8qTf6zDNIoBzHsO3fOrWgaohY6/kDaHOgAw1qbrMdGgMO5DR8gjDeBWZMcsT
yuZzBCQNhsStWAd/20g4nEB8061kFI7kdyYmJX749PfT49e/3lb/tYKzkTXdJ56bkiLifLRWKgZP
wBTrvQPbodfpGqdAlRxEUb63eOIIku7oB84HynyHaCkkT3qLQjyqshaBXVp769LswTHPvbXvRdRu
XCh5mfW64HTgb3b7XLeMjSMKHPdu71C3o0ggxb1ZDA6TPsh6ag1fPy6dxb+W+Kujwuyvd8XRFxsz
3oybMGM+iMxVhfp2aEaObgJEsSjFGyrHito6lo6O90I3eysuUp2IrkEgqatLhaQJg4Ds9tKhZ8bp
LklKbcfAc7ZFQ3cnTjeuxaFLYUmbnJKKktJKM5kW9uCdj3MqD+KSd1GnfJNHlmY1LZyFQjUnm359
fgIZPOpOUhZTAYOgiSkALaX99GV5Xsax1cDw/6IvK/576ND4tr7nv3uBItPaqMzifg8bEtX2HB3z
9iiUr7DOa7KGxfXEXIbXfaV5MMt4UixdisiDqnHAj/nJdtfCcbE7aHFnWWrLVNBj7UsmY41TNKIp
3NePyyeM0IwFFvso0kdrtGPpvYqSpDfSu0lw259MSgANIhe4Cm00W+8VxLTbFQHm5IsJgepBQyr0
WuKsuFPTu0tYVzeDFhYYoSyPMUuh0bPkgJYynRQOpfDrbLB+evlI8l/i+5zMMILIMkqiojibw03E
HZilTALj7Rj6P8VOsHYWZc+ww3Mbt2Cp5HWFZkn94mmCAicsJbOSL9iEGQ91JmVFBjuACauNYh8x
bcwvfTmWMVN9RAVw35YGWQEngLrnOvRQj/nXZkYIiH0webcJ/VZvDfpkpCcT0LOxQvtEhKXSgfdR
oeVuQ9iRZffCNGsM6tyK84s5bwzDcVlXER2HHzF/REbSHwR296yiw57LkVYctGktkxHCi8QIciGA
mTErRVbVx9psEZmCEsK60IFnMvOxURAOyaj4WkdeRuc9qDIHKwEcMcTytdfAkrbm9Z4+wwoKNHK1
ZL4jge6LjhFro+qYzpqqa1mu09QtLk2NCo6yaB2ApaxIeQW4+MymHJYmtIuKc3UyBVKDcfkTOi6t
wMNHK/P90W4EgqbFy74bLIcKbqzWtk4SMtozIkFaLlgyWtANYK3F10RrsMkZ8UxdJPzSwV0WleZC
A2BWYHz9zD5u6ERTWLeatjTmO8cblIgzLY7pFWgXP7yM2u6P+oxtzTWq0MVIQeLXeuMgcHhmfpxo
WMxLE4YxvcdwsqqJR4Hb+9qjdjE03DfEoLf/mOmpiqUgNN7V6FjGMNubpaUTg2WujxqbGJl0rWiC
2bv88ZyCwmFKN/noajj0MQlPgBdwdhmTYulKSaGaNoRESBrPG5/CTXHKCA3qGqiM1PLQDUZqesb3
S3+7I7nhnKIFNlObmYN3U22LSOFMOyIsaK85otRalc7Uh4TZjEKIXzgQjUlnZWQUbVywyQwoOy1O
RH0hog4rkyCrqiojQCeCReKwQ8SHQ5JqGLPRqKpAqibZUGX3lOeUfI/2+Prp8vT08P3y/PNVMPn5
B/qUv+rzmGYyVjiekBjvzKYwsTe+6CpZVVu8twRHu/wWDpMJpH3SFdCChVPASC44KeLW8Hg5ARgY
HrRp2FNAGwQF7vy7pzdUEsHrxOJ6fn2jQ02rc7LZnhxHsF6bqxOuFRqaxnkSNXonBaJJMI1klfGI
E8WWthaRZJZsR0Dbuu7w6x+6xfQIfNfhQhDOTxbmCrI9L+gmReaZek/WfVCMQ5bK6xOmPT0047LV
6sDYVe7mhChL6T0sDyi+WPMi5gG+mSNqrceeWZdc7/reTQJehK57o1dtGG02eFsqZ0QXZYl4UEmd
cia0iLGGtofJyoDLUNocV8nTw+vr8qgqVnhS6jyYUuVowPu0NBnSlcli5VewX/3PSgy2q0HPzFaf
Lz9AML6unr+veMLZ6s+fb6u4uBM5e3i6+vbwawqc/PD0+rz687L6frl8vnz+3xWGN1ZrOlyefqy+
PL+svj2/XFaP37886wMZ6fTlNgKv71P0CRmRrUxJbZ+4qZKoi/YR9UZYpdqDRiNPdWQljKcemZhG
JYK/o85WA0/T1qGMcCaR+jhBxf3Rlw0/1NYGoiLqU9r5RiWrq2yRypckvIta68qdaMaD+AAsVnPo
qSQg3IY+3hh5AcWnFy23Ilz97NvD18fvXzVXRvVrT5PQOhXiHCRVb7UQo55RqSI9rThlYBVVik81
bROz/xJRc/rMdaXIozQn4z5eKVJ8SdVKY6CMRv708AbfzLdV/vTzsioefl1epu+tFPIBJubb8+eL
yhpREwZVqquCOuSJhu4T3xwFwoTyYR2FoLg5TkFxc5yC4p1xys12xSkdEsp7umxDiOjVVFn+8Pnr
5e2/058PT/96QQsncmj1cvm/n48vF6nWSJJJ0cNo7CC5LiJ8+2dzmYn6hQC6NWxPZE27w+TcPMPj
HBkbXSyxA8OMAJHJ/wkOhxDqYl8jGYdLoUpuaAlXDCtPFsxsHzX24a16TaEAl1vvFYEhFMapXWzr
SCBXhyCx8nOiva4TUjyIqSNCBwqRwvnWo/0ghUwSmefIWnUdmNxzs5JtjEUIIPUtldiZ075TTcOy
3SPPcp2uyPK6001RAmzqdZOITc7bRA2sJHHCBcOYq1TaoLRq913KDFOm6CyaokfHprmAgA7lnom8
ATL+42LXYaBgx8fcvuEUNo0Js+MmmUjkrb1LFZ2v76O2ZSZY5MvQOX/gsJyE9rRnp65viZWHl0R7
y60BEJyhEG3/EQ18FHw70c/WhOjvccHFXuCebNrFgcOBCP7wA8eYugmz3ujxWgXnMD0ezAgcb3CA
VqkQ1VwzMosZ7YzlIMxHxg2GKH7CCwsd1mdRXmSLKk5CsbmmZ8XPpfnr1+vjp4cnuTnR30tz0C4S
qrqRtSUZoy6vxV4pgpprp+AuOhxrcbRVzToTUAqe+DwdTi31omSR8ds1W4JlFFqPhNwyZ2iUZjKy
6Z4VFnPbktS2O4xUOHS8qbj/3SOwk0pV9eUgb/q4QjfM6Uu5sseKcV5eHn/8dXmBkc6HW32ypsNV
ny70nLy9sTdNxx99xTSnyNMfvAll53ijIkT6huzjVWO8H5ugUI84bOoYDJO183RYnCbjoHSVgy+v
bZEctGPPIx8XKxNxTU22OIRODFS1BHFvO50O1dVHzoq2GbAYkwrWnHUGD/biBGiAYJcoDC18WhUm
NMONY1GeIN0PdZydTFi1bDxbgpoDHjYWrfQxX0LbCrYhE1iiewd5QtzDp2RCDixd9MBMICskn/jT
LD9BJy78IpGLc/cVI9hEoyproewWZuIUTSAZZux5c/GMtlBrRHJ+3qdTp8G2GU20e1iCsBCtHdsb
MtBGRd/qG0Sz0cNWTZeUpLo3ngR+vFw+PX/78fx6+YyJsL48fv358jCZPrU60SJvM5l1B1PSAUhO
kF29QFfFG5OU46q5KYUWH0BfJXjpaoeLnhq8UrC3O6wQjucGmyDXP1pqM+xQo7Tt1Tkph4hk0GKq
U5l3lRCRqHHcscV5K8dvGI5LNzgv7kKtvVuImRzNu82yHYTKXlMJtRUaSuLghZSie6iZXd5duoqe
dG5Id3HRAroR8XvWJdqiKEuqQJmVvGOJ5oAwwZanZCXNF397/PQ3EdxuKttXPNqjMQ8DxChPtHnT
1kOM+dZmZpf8Clm08K7l/triaDccVcpJOc3uxb3C3ANxyyAcDNUxz9BhcWO/JBELycggL9Bxi2eT
Cs91h3vU5KtcuBOKYQHFkmGiWFT5jhfstDUtERiMlHSwFK0l5cb3QmNsAhqEi7qS1nHctUuG1hcE
WeEGnuPjG029RuFu6SwqFGBKo5qxvsEf9FhUw3RfgTvNsxWh1/gceqMypZe1VTMUjmwAA4hZh43Y
wCMKBYEImlKWFv+MkQydP+140V9LVLIrwYYMFybQUyiqLur0q2SBXcYw0rGJ6625EwaLpW54yerI
a9wHO0mceiH5QFkypfODnW+sokWYGXnfl0QYRMOEFkmwc/UIT9dVFfzb1q4aAlCFM+67+8J3d8sK
R5R3WuYCnb9XcdHx59Pj979/c/8phHWbxwIPZX5iJi7qCn312+zV8E/ji4/RFlAueiOD41mHV5xg
agy2YjQuY7giz+25yxbVy6h5xJq+jrd7efz6dSmgxltZU4xOl7Uy1SeNA1VU3G6YK3DCg25CbaMa
zSGL2i7O1GOhhieeZWj4pOktvYtA9zmy7mztniU8iD6E8QJdeG0IVj7+eEPj8+vqTfJzXifV5e3L
4xNmPpab++o3ZPvbwwvs/eYiubK3jSqOj4csg0giYP9y85jQTVQx+kmFRgZHBjp4iFEZevNWFkZH
fco0v5ooSTKM1YvxBajbiwxk1ACiBh0MeNL2So5TgVr4YSBUbUBQyUdXyxSmOtVCnVGRSZPsvGBu
p+2SQaZcvVaCILH/k02kGA+X9sMAVNzvl84X/FwlwsqkeIrdC6iiM8rCiju5+D2U9TFbvAEbcTwr
9mhg1DScEQefUmMMYHo6qPfyajTuT7MheXb2SdfrbUjve3fccS2RSlmZY2YXxoaCvHg/dO7mTtUa
xizA11AiV7AMICBTBDsGuK0FUwMdLLUx2CM414IfNmMMkLq74v7xjwmJRnJ8thIXQ73X/CNUDK0f
KBQ2ndIY1lhCO8tZcuTiM6wxQDVle5QhWeaaxxAtsEH2C2AcFUWthmQd4axqekWiTlWUuoalgKd3
ipRD0kyfNtTt81EYfFndqZYuATR+mmMQMM0cJUHo32DC0JeWj/5e80vN0Vfq08vz6/OXt9Xh14/L
y7+Oq68/L69v2iuQKT7nO6TzWPM2O1vyJXRRztTc9LAnZ6nSYfnbjOR5hcoNR3zs7GM23MW/e846
vEFWRieV0lGWqSQuGU+oBWXSMR7dWHcjUZOUCbvSqctlJEhi0E65uxmSG7UAhRMCxYIrFeI+DFsM
P2zFwk7krS34IoqbROLMnlXIinqwOBiPRB/66P8re7LmNnKc/4oqT7tVmYkly479kAequyV11Jf7
sGW/dCmyJlHFllySXJN8v/4DyD5AEtTMbs2ORwDI5k0AxCFDo8B3srNdkIpi5yj45e0NG7etbwtU
gJGLrU4A3K+WTJ0KgQ98Z1sFNEU404PmN9j7eHFzwaZGbAhuRjSvTA+8YipDcF3wr4kNyUL9xSTr
55eCcyZ7RLOvVCC2dm+L3fNhv33WYmc1oI6LKYN65sefR2Oa7bmop9lM4NWgHclJCJxGkQlePkK/
X4e9fiwPIVRrJcDNOXKKhkZG1cYI4vhzc+KigBmYtu3LMMJUaeihPaU+zGEQ+fIxKrgn5sox6iDw
qCqkqSpl4HJv2eDalGsR6y2PdcibVzuLH/TYyLM08qehwyFCiSXAYnHywPwBpJpEaolat72X/frn
oNi/H9ZsykFpMoQ2ETCk5fV4wjI9bCWdakmE0STVnBRaQ8g6nldsJ1Ta+jqGcpy6TdWo3r27QQqh
4xVhddWMb3abw3Y9kMhBtgL5AEUK7X2rXQL/QEr4L/klealMbT4137zuT5u3w35t66nyAK3fYYL1
sI4dtPZcxt1Mreprb6/H78yHsrigsavxp2SMTJh0151JB4pXFwYBJrZjjfoWai3peye9Hh/C3LZX
waQi/yl+H0+b10G6G3g/tm//HRxRBfAXzEOvo1THz+vL/juAi72nrdP2KGLQqhxUuHl2FrOxypX9
sF89r/evrnIsXpmLLrNP08Nmc1yvYPHc7Q/hnVVJMzJ3Veh5wEjBWct7o/5TXUpK/jNeuppp4STy
7n31Am13do7Fd3cDrNKy8/pdbl+2u19GRf3hGSbL+t6rqJKeK9F5UPyrBdGx/TGev9M8uGtb0/wc
zPZAuNvTxjQoODvv27A8aeIHsUiIzRYlyoIcjyg0xnEQoHlSIe41BREl6CK8M0eYVhEIw8DbmJ3w
7QXT97gO7uHu48TwZelJKUSWC36d1vtdazFtaf0VcT0txO34RlNNNxiH3qbB4qP+5ZWmFu0xViJi
nSIrk6shDfXcwPPy5vbzpbDgRXx1pSdjaxCtYQzPKsDJmj+yqJDtWfZAnpwxDZvUhmh3F+ZmK0AY
LbkHSMTKtDN6tAEEqwQcjjJSfy3T6ymvnfxOhi5l3HbyuyZXMLksgSHx2APEqqerJkO7zImuDG9M
ZMIs9UrdELC7qNCsrGdg9EsMcZPci4tygr88R+wjRRjKoGKzB+dXMAiVSnLS2qbMH+Eu/naUx0M/
IM1za2NPZQObcL+GudXEi+sFZtNAEzUk4+YFCqNLLjoIlWmeK9VhP6cE7Rs1sERFGOR8qidKJCLq
5ocoXG1hvLyJ7/RXOdW5JQwj7SJBZktRj26SWJrTOVDYf7NXscik8UMd+/H1NWtNjmSpF0RpiavG
DwqzDsk9KFM+R3FCEWpWVYhsAypi8xzlS8AN25wRzXrX1wipEs9qR4oij2hL4QfsU6+zwN4c0Bpq
tVujvfRue9ofOFXGObJuUYuCE6TaLZz4eWp6/TmELF8QS5rkHo4442d3ZqnwEg+D02G1RpcB6zAp
SlIWfqDoUaIqqwg1abBFYJSnUi8h7bd0EDB8eZPWJKXRHQiuf4ogy0YdCeWcHQWmG500BtIlXT+N
8JDl9TnHBixVx7O8Iy8cmXU6woaf0TIBdcjQC8YXDc7+Riy8+TIdnfuCGSSwaRZ63jyREIJd3U1r
slyGhK8yXp6UVefBLKS+sOmUh0ugP41sSD3VolIRKHbPgTF7pCFd367FVEtINS3YbEdoOgBdXspX
uz5t4NvL5pdmcNtzAhUI4P7s8+3IkRpQ4Yvh+ILNHQVoI8UYQDotLs05ZLSBcKtpRpwcizBd6r/w
Oja8WYsojCc02AUC1MlpZiKQ5j+eir7JaoAq0xgMOBhUwfl8JM5e8C/hUISzU1qR993XdMpSJSPP
cj+mA2Iwnip02xZkGXVCE1b0XmB07zKo0fJO5AV9CQUQiNzUQxR4v5Fm49gA6qUoy9yiw1SXGHHS
i2xUEXhVrt4ue8xlrTN9Daivh38fa6jaKnnud2zXPf5XdY9ddetEzgc6RC4qDPzWPms1mK8Tf6T/
MjXmaOY48eAQ09JdhTBLaEeodacDA7HH+x92JFLlESZTjhMn1XezatfgGjeGzp7or1bjv/5DfV+d
9VjOmJIUA1WiXRWvpFzK7zOfmU2LkdGySZm7qJMwsumnIxc5NpayEK7tgWq0aWFDlJVZjcEeiUIU
5GkEa68xKFyjAcyjA482l4mXP2YyGg4PhntwpndMw4aJfCqTv/lrvsBcCPxmnBbd028vwCsQLzIq
nBTs+Y8Ju3SDuqvSkuT6kz/xwU3q1+TZPRVU0yAtIxuyB5EnauCI6ggRrq1+N43L+n6oFZAgjpeW
VXklmXsMEDAtmnNKg2mgaYXRoujLkAru057o6kmTEqQwFRgkmodhHJ8Qw6DW8Kf/DEcgogchI45G
UfrAkoaJTy3OCQaD9cvusNg4gMFIs+5F01utf+hettNCHoS8IlxRK3L/jzyNP/n3vrzy+huvX09F
egvylcPvxZ+2W7qtnK9QKY3S4tNUlJ+CJf47KY1PduuzVGPfsz0FlOQbcN9Rk9LtYyjG787wkX98
+ZnDhykqm9E+/8P2uMe8ZH8MP9CN0pNW5ZTjuGRPav0Acnzh/fTXTWdrkJRqmb5qAOM+k7D8gY7u
2RFU0uBx8/68H/zFjay8yQxFEYIWpvxBkajfoPtOAnFUMQJHqHn/qceBeRj5eUCOykWQJ3SIWsmv
+VnGmfWTO+wVwuCdFBA2ix9c05yigUw1iiHoaCop+ae/T1vJ2B4y+rRUKMMdaHUZOGzO4YjELNMu
upYqIt2EH+0q0VYfQbfLt4blS+dMw32+5DKg6iSfSTgCDXNDdZsGZuT85M0VFzbdIHG3+IZN9WyQ
DF3tou67BubSWWbsLHPlxFw7MbfOrt1ecilZdBI9iIJRnPdU1YnGXAQKvYmfx/pQwBmO66u+cfRp
ODrTKkByQdmRRtp36XW2nxry4BHfsEsePOYruTLb2iKuncPXUvAxaymFa3S7jjnaOnSM+dDYfIs0
vKlzBlaZyyoWXg13qSMSekvhBeig4Gi0IgDGrcpTfSwlJk+B9ReJOZwS95iHUWRq7A2imQiis9/G
IHMLrvrQQ092zi6wo0iqsOSKyiHho7+3JGWVL8Jirg8yXuGah08SekZ0wJblSeuHO3pDaNoA9Sq8
Wb8ftqfftqXnInjUblj8DTzhXYV+7gxT1t6dKiIXzBWWAL56xl0hJYbCC3z1EfrMpISNBsObagaP
tT/H0PEqsCdXPdKoXIueoqEdaUXK2o+DQj6AlHno8QLNWQVAi2QZujmmzJbJDRPoDQoxyOjWaLfo
6bEGLKIzKODloghNx4lgAHIiyklK2UuVw9B1T5bEmE5mJkIWjabS8y8fPh2/bXef3o+bA8Yt+UNl
9+uu9JYn7MdRkPeOqIi/fEALlef937uPv1evq48v+9Xz23b38bj6awMjtH3+uN2dNt9x2X389vbX
B7USF5vDbvMi0wtsdqh57lck8bAabHfb03b1sv0/6WDWL1fPk0HoUNSo70WuYu63lt+/z1I1gRU7
uTNE93Z8sUvSRAvlQFAwDW3tDulVIzVdNnU6KXjDuiBW+dxubkhRSU3t98n+doxRi3YPcWcTYB4H
3cDhtkw7Oe3w++20H6wxjlaX/pEKW4oc+MiMNTRUWBHNBE1Xr4FHNjwQPgu0SYuFF2ZzutwNhF0E
lsWcBdqkOY2c2sNYwo43NgsIZ0uEq/GLLLOpF1TN3daA9no2KVw3wAfZ9TZwu0BV6DpsnR7dYMQk
CpSC0z3Ns+lwdBNXkVV9UkU80G5JJv9agyj/MIuiKudB4jFNd8QwabDKOKh7j3z/9rJd//Fz83uw
luv9Owab/02OnGaWC2G1wLfXUuB5VvsDz58zwNwvhN3XKr8PRldXw9v2EUa8n35sdqftenXaPA+C
nWwl7NrB39vTj4E4HvfrrUT5q9PKarZH/f3bqWJgIPjDP6OLLI0eh5cXV/ZKDmZhMZQ+neZwF8Fd
yOeo6/o6F3CuaTTKJEwaOeL1c7RbPvHsVk4nNqy017pHVfFdI+yyUf5gwdLphOljBs1xL6ml7tHS
btrg8SFnH8jbXTDvhtta3OgJUFb2RKHT0n27Nuar4w/X8MXCHr95LLj9sjzbuXtVSOnEtt83x5P9
sdy7HDHThWBrJS2X8hR+tZoxicQiGLG21pSgYA4Irxxe+OHUXursge9c5LE/ts9Nn6O7wsCkNm0I
K10aj3hM//LYhw3k7h7iaRy0Hjy6uubAmGDHuvvmYsgCZYPNSgCBdTP0V8MRt9XngjO3arHxpf2F
EhiZSWrfpeUsH97aq+MhU19WfIYMV2MvbhHY+xtgdRkywy6SauIIM9FS5B7nhN2tuvQBTcOtL7aI
PvyysSxFHIBQyhzyQlnbx/S1nuCumF4gnFcYtJeRw62pZdLc7zntcTUXT4KTcduZFFEhmBXXXh3s
zcCG/e2weYYGYNaSicfspe7w1WjQD6lpv6+W0P717bA5HnUxoh2yaaTl5WmvhaeUacDNmHWIaYuM
mUkD6PzMyfpUlF1K+Hy1e96/DpL312+bgzKcb2Ufe0EXYe1lwHe6q/bzyUw5pJmdkxjHRaBwrrwQ
lAhu3fMft777NUQ5KkA7x+zRwiITWgtqBmQg6ubScGA7WcBJofh5szMdGkWMc71GSfoM+4utk8/u
hvD0sv12WIGwdti/n7Y75p6Owgl7nEk4nEssorkISTxNa+X1VGcWbThpdm9XE/c1RcKjOnb1H9rS
E55vjh/Y1zvC2ysb+PDwKfgyPEdyri/k6mebabDB5xvruD3nNlOJYayTpQMsHa8w5Ka9VwEvyhgT
24/sy7vHclJHj8VmXoztawgpiM+JjcRAOUsv4Kw2CJWHKc/5z8cyq089W0b/hDdfE0XxGGPyRsCi
mg/DCrHIrJpEDU1RTRqy3myxJyyzmFIxXVpeXdzWXpA3CsXAspnKFl5xg1YEmNVeVsZRfG6dtXts
rzaVeBlDdMEmxinCGSoCs0CZd6CZRavd7A6WzeGEvhsg8x1l+I/j9vtudXo/bAbrH5v1z+3uO4lB
lPoVBl0Kpbb0y4c1FD5+whJAVoPQ++fb5rXT+anHQKq2zTXjEhtfEI/0Bhssy1zQcbTKWxTSVfjL
+OL2WlO7pokv8kezObySVtUMJx7G2yhKnrh99P8XI6jijjgPb7SQEXmdo+O+/kItpEEOM7WTEDhh
dLclA9La1AOTnHio982l/TZdUpQkChIHNgnw0T+MdDE0zX32vQMTEcmgnhPl/dvuFszxgQYoXpwt
vflMWhflgSZVebDd4SKn29kbXusUtizm1WFZUTNnJRlqpw4AuvgQjotYksB2DyaPfBQHjYRn6SWB
yB/UwjRKwhzxha7HWo/1X5+JXjyc2LKwRx4yG+G3t/gTiZ/GpOs9CvhNaYds3g1PePUAq6Gzrk/q
9lTQvj1PaX+7aFBSM4GPmbsIoRw1cq8MuQRz7V4+IZgMhfxdL2+uLZj0Lchs2lDQx/EGKGg+ux5W
zmF9Wwh0jrbrnXhfLZg+GX2H6slTSNWuBBM9xcKBGNt7lnkkEkWReqFKRCjyXGiPRNJil3omKJCM
QqJZ8iLc11oSC922sAHUk8dM0ClNAgwpr/BRmxOT4hAB36pVPtO+3XhyIE74fl6X9fUYdpL+ORiN
SOTowjAPci1ikCyX9RElertBioBmcfflLFLjSF52pCex+RDmZVWda6Pk3xG19CxKJ/qvfkOSZ1nd
mseLnupSaNrCML9DFpPjmOIsVGF7+qNi6pNhSGUKuBlcXjl1/kBHmzQyhhpnOEO3FO1lpUMBJg9w
mnABCjTtA7aCoatUEKR6GlXF3DBFtohiD9lB0jKYYjWg/S1c4p3rOMWby9e6U/VnwZZ/kdC3w3Z3
+jkAyXjw/Lo50sdCYhKG4S5loC/+pVrhMSMo683hNeltgRON4HqOuqecz06KuyoMyi/jbmIbds+q
YUyWcpOqymVdquFVBGrCNcWTFJncIM+BSnOdRWr4P7AVk7TJPtqMs3PsOq3I9mXzx2n72jA9R0m6
VvADN9JBIt+B4gqVV6YhekMjcwJL41oV9kVbGhmcb+hJxZqbzUH+Bm4ELjY4W+iLUbP7AxkLFg3c
YlHSnJEmRn5d5iShw/GvO6yFOGiWpb/59v5dZogJd8fT4f11szvpnjCYiBOZ0PyOm9wmErt2tjUw
eXo94L/Z1duR4SucpJQ5K898pKmwedTubgR5ocDgLGb+hNvkk0IkwBclYYmxeLQJkDjadkVcGk8b
BnqCIQpYI1yJRkNF4xPnPq+OsFi7N6QYpRr3qnUUhCwogWdf2DrUGvEozs6rOfpoEBrYOTyaV/iu
DmK4KrMQLUtMCEvVwhKepSHmr6VilQ6HqVMjodnQGzSO4NCy+02r4RKIArFgJlsRoORfCWujKfdu
aYZgrJ9mI6K1Axp3TzUz8cbkYiFw6G0FjMKi1anqYT/VwDAEhWbgag2sennCn4N0/3b8OIj265/v
b2oDz1e779RoGEMKov1EqjE8GhgdoyrUIXWjK5cSSjtVxl5a5z+uTKzgUHl+l4GAyYroTS4YtD7w
eIMtgiBTS0PJn/g62i/S/xzftjt8MYVWvL6fNr828B+b0/rPP/+kARrTNkCyjDdkxSl8gDOkKoMl
lTj62/l/+GJ3AOOKwKRE5MCRZzCaxFQJvgEA56gEne4dUQ7oT7UNn1en1QD33xplcO1gxYGBWcOM
angr5pV0UTkzR44qlYrdq7jtCmDJHsp7R05DWpVfRsO+ar2gtinaIOUyK5OW5VnDzuCwnPM07dU/
NYZQVSCBwHvhqQ/soaelN5YkaPEuG46UcEIk9O1bUnhNQVULOUBl3V4TuqgdDVw0KtcHC2zul+KB
8tJYk77YiEdkboTr6HkCgTFDuDuCHFXS+zpsrrVAi0CoLPoaGut8ftv/vTm8rY3t2J4HmdcZtoCo
macca4hECkkOEulDpEy+/CADAel6TOmDGAMUoxSF7wV9OcylhyHBgD2cBgL9PhUPpSuPoAKUIDCt
Nka1ZwKd00+JPHo09aYGAo9zT1lGEoIGWMM6z6qSaN8YGhlrUZEMRzeEv7SGlzLy5eZ4wgMED0kP
I8esvm+I0Wmlbpfe2lO6UDLRnwwKh2GPQgZLuZ7aEFZGUblFHCZM3XJbeOm9dWvBXQXgZrdQpURD
3X8IyRouWUpeOV7XrOUqUiKnm1fI0+gMj0LCMgBxWaiRv/g1voD/ddsRtjFq8LA/KqYcDTwZLXya
T0ndbagTLXBr6vA4TGTgVQPcUBLfUJlqLkoxDJpTQaei5V6Pz6vx5AfmwdKHHcHZDMvvK0FSCfGF
2bgyLzz6hKj06QAuqfu3hMrtOjWAtuDagmUQOnerq4rNESJxS6WveTWKtJySq1iO6sASl4zRH/25
U4JCXxg9iRbmREMn0swcsftY6Uh0qHz69FJrJCfZ1ISgWn2OMjAG56ORBMLEx0/WkyDx5rHIOZmw
SZmWx8AUBEYHTHct9ZvsdqovwVlmEUQXbwSwg7YV1oGgei/TNLsXoLSbNg3X1Z6Bk1HA0jpTFt8A
QlNUgXIS2nv4B7HJf509Pi0DX6Us+X8FyHpylV8BAA==
--===============4785246946808236087==--


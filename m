Content-Type: multipart/mixed; boundary="===============8786828926116829260=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: kernel/bpf/verifier.c:11541:12: warning: stack frame size of 2176 bytes in function 'do_misc_fixups'
Date: Sat, 29 May 2021 13:36:40 +0800
Message-ID: <202105291338.InwTq6PU-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============8786828926116829260==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Brendan,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   6799d4f2da496cab9b3fd26283a8ce3639b1a88d
commit: e6ac593372aadacc14e02b198e4a1acfef1db595 bpf: Rename fixup_bpf_call=
s and add some comments
date:   3 months ago
config: powerpc64-randconfig-r036-20210529 (attached as .config)
compiler: clang version 13.0.0 (https://github.com/llvm/llvm-project bc6799=
f2f79f0ae87e9f1ebf9d25ba799fbd25a9)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install powerpc64 cross compiling tool for clang build
        # apt-get install binutils-powerpc64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3De6ac593372aadacc14e02b198e4a1acfef1db595
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout e6ac593372aadacc14e02b198e4a1acfef1db595
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dpowerpc64 =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   __do_insb
   ^
   arch/powerpc/include/asm/io.h:556:56: note: expanded from macro '__do_in=
sb'
   #define __do_insb(p, b, n)      readsb((PCI_IO_ADDR)_IO_BASE+(p), (b), (=
n))
                                          ~~~~~~~~~~~~~~~~~~~~~^
   In file included from kernel/bpf/verifier.c:12:
   In file included from include/linux/bpf_verifier.h:9:
   In file included from include/linux/filter.h:13:
   In file included from include/linux/skbuff.h:31:
   In file included from include/linux/dma-mapping.h:10:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/powerpc/include/asm/io.h:619:
   arch/powerpc/include/asm/io-defs.h:45:1: warning: performing pointer ari=
thmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   DEF_PCI_AC_NORET(insw, (unsigned long p, void *b, unsigned long c),
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:616:3: note: expanded from macro 'DEF_PCI_=
AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:17:1: note: expanded from here
   __do_insw
   ^
   arch/powerpc/include/asm/io.h:557:56: note: expanded from macro '__do_in=
sw'
   #define __do_insw(p, b, n)      readsw((PCI_IO_ADDR)_IO_BASE+(p), (b), (=
n))
                                          ~~~~~~~~~~~~~~~~~~~~~^
   In file included from kernel/bpf/verifier.c:12:
   In file included from include/linux/bpf_verifier.h:9:
   In file included from include/linux/filter.h:13:
   In file included from include/linux/skbuff.h:31:
   In file included from include/linux/dma-mapping.h:10:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/powerpc/include/asm/io.h:619:
   arch/powerpc/include/asm/io-defs.h:47:1: warning: performing pointer ari=
thmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   DEF_PCI_AC_NORET(insl, (unsigned long p, void *b, unsigned long c),
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:616:3: note: expanded from macro 'DEF_PCI_=
AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:19:1: note: expanded from here
   __do_insl
   ^
   arch/powerpc/include/asm/io.h:558:56: note: expanded from macro '__do_in=
sl'
   #define __do_insl(p, b, n)      readsl((PCI_IO_ADDR)_IO_BASE+(p), (b), (=
n))
                                          ~~~~~~~~~~~~~~~~~~~~~^
   In file included from kernel/bpf/verifier.c:12:
   In file included from include/linux/bpf_verifier.h:9:
   In file included from include/linux/filter.h:13:
   In file included from include/linux/skbuff.h:31:
   In file included from include/linux/dma-mapping.h:10:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/powerpc/include/asm/io.h:619:
   arch/powerpc/include/asm/io-defs.h:49:1: warning: performing pointer ari=
thmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   DEF_PCI_AC_NORET(outsb, (unsigned long p, const void *b, unsigned long c=
),
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   arch/powerpc/include/asm/io.h:616:3: note: expanded from macro 'DEF_PCI_=
AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:21:1: note: expanded from here
   __do_outsb
   ^
   arch/powerpc/include/asm/io.h:559:58: note: expanded from macro '__do_ou=
tsb'
   #define __do_outsb(p, b, n)     writesb((PCI_IO_ADDR)_IO_BASE+(p),(b),(n=
))
                                           ~~~~~~~~~~~~~~~~~~~~~^
   In file included from kernel/bpf/verifier.c:12:
   In file included from include/linux/bpf_verifier.h:9:
   In file included from include/linux/filter.h:13:
   In file included from include/linux/skbuff.h:31:
   In file included from include/linux/dma-mapping.h:10:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/powerpc/include/asm/io.h:619:
   arch/powerpc/include/asm/io-defs.h:51:1: warning: performing pointer ari=
thmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   DEF_PCI_AC_NORET(outsw, (unsigned long p, const void *b, unsigned long c=
),
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   arch/powerpc/include/asm/io.h:616:3: note: expanded from macro 'DEF_PCI_=
AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:23:1: note: expanded from here
   __do_outsw
   ^
   arch/powerpc/include/asm/io.h:560:58: note: expanded from macro '__do_ou=
tsw'
   #define __do_outsw(p, b, n)     writesw((PCI_IO_ADDR)_IO_BASE+(p),(b),(n=
))
                                           ~~~~~~~~~~~~~~~~~~~~~^
   In file included from kernel/bpf/verifier.c:12:
   In file included from include/linux/bpf_verifier.h:9:
   In file included from include/linux/filter.h:13:
   In file included from include/linux/skbuff.h:31:
   In file included from include/linux/dma-mapping.h:10:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/powerpc/include/asm/io.h:619:
   arch/powerpc/include/asm/io-defs.h:53:1: warning: performing pointer ari=
thmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   DEF_PCI_AC_NORET(outsl, (unsigned long p, const void *b, unsigned long c=
),
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   arch/powerpc/include/asm/io.h:616:3: note: expanded from macro 'DEF_PCI_=
AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:25:1: note: expanded from here
   __do_outsl
   ^
   arch/powerpc/include/asm/io.h:561:58: note: expanded from macro '__do_ou=
tsl'
   #define __do_outsl(p, b, n)     writesl((PCI_IO_ADDR)_IO_BASE+(p),(b),(n=
))
                                           ~~~~~~~~~~~~~~~~~~~~~^
>> kernel/bpf/verifier.c:11541:12: warning: stack frame size of 2176 bytes =
in function 'do_misc_fixups' [-Wframe-larger-than=3D]
   static int do_misc_fixups(struct bpf_verifier_env *env)
              ^
   kernel/bpf/verifier.c:9848:12: warning: stack frame size of 5280 bytes i=
n function 'do_check' [-Wframe-larger-than=3D]
   static int do_check(struct bpf_verifier_env *env)
              ^
   15 warnings generated.


vim +/do_misc_fixups +11541 kernel/bpf/verifier.c

 11537	=

 11538	/* Do various post-verification rewrites in a single program pass.
 11539	 * These rewrites simplify JIT and interpreter implementations.
 11540	 */
 11541	static int do_misc_fixups(struct bpf_verifier_env *env)
 11542	{
 11543		struct bpf_prog *prog =3D env->prog;
 11544		bool expect_blinding =3D bpf_jit_blinding_enabled(prog);
 11545		struct bpf_insn *insn =3D prog->insnsi;
 11546		const struct bpf_func_proto *fn;
 11547		const int insn_cnt =3D prog->len;
 11548		const struct bpf_map_ops *ops;
 11549		struct bpf_insn_aux_data *aux;
 11550		struct bpf_insn insn_buf[16];
 11551		struct bpf_prog *new_prog;
 11552		struct bpf_map *map_ptr;
 11553		int i, ret, cnt, delta =3D 0;
 11554	=

 11555		for (i =3D 0; i < insn_cnt; i++, insn++) {
 11556			/* Make divide-by-zero exceptions impossible. */
 11557			if (insn->code =3D=3D (BPF_ALU64 | BPF_MOD | BPF_X) ||
 11558			    insn->code =3D=3D (BPF_ALU64 | BPF_DIV | BPF_X) ||
 11559			    insn->code =3D=3D (BPF_ALU | BPF_MOD | BPF_X) ||
 11560			    insn->code =3D=3D (BPF_ALU | BPF_DIV | BPF_X)) {
 11561				bool is64 =3D BPF_CLASS(insn->code) =3D=3D BPF_ALU64;
 11562				bool isdiv =3D BPF_OP(insn->code) =3D=3D BPF_DIV;
 11563				struct bpf_insn *patchlet;
 11564				struct bpf_insn chk_and_div[] =3D {
 11565					/* [R,W]x div 0 -> 0 */
 11566					BPF_RAW_INSN((is64 ? BPF_JMP : BPF_JMP32) |
 11567						     BPF_JNE | BPF_K, insn->src_reg,
 11568						     0, 2, 0),
 11569					BPF_ALU32_REG(BPF_XOR, insn->dst_reg, insn->dst_reg),
 11570					BPF_JMP_IMM(BPF_JA, 0, 0, 1),
 11571					*insn,
 11572				};
 11573				struct bpf_insn chk_and_mod[] =3D {
 11574					/* [R,W]x mod 0 -> [R,W]x */
 11575					BPF_RAW_INSN((is64 ? BPF_JMP : BPF_JMP32) |
 11576						     BPF_JEQ | BPF_K, insn->src_reg,
 11577						     0, 1 + (is64 ? 0 : 1), 0),
 11578					*insn,
 11579					BPF_JMP_IMM(BPF_JA, 0, 0, 1),
 11580					BPF_MOV32_REG(insn->dst_reg, insn->dst_reg),
 11581				};
 11582	=

 11583				patchlet =3D isdiv ? chk_and_div : chk_and_mod;
 11584				cnt =3D isdiv ? ARRAY_SIZE(chk_and_div) :
 11585					      ARRAY_SIZE(chk_and_mod) - (is64 ? 2 : 0);
 11586	=

 11587				new_prog =3D bpf_patch_insn_data(env, i + delta, patchlet, cnt);
 11588				if (!new_prog)
 11589					return -ENOMEM;
 11590	=

 11591				delta    +=3D cnt - 1;
 11592				env->prog =3D prog =3D new_prog;
 11593				insn      =3D new_prog->insnsi + i + delta;
 11594				continue;
 11595			}
 11596	=

 11597			/* Implement LD_ABS and LD_IND with a rewrite, if supported by the=
 program type. */
 11598			if (BPF_CLASS(insn->code) =3D=3D BPF_LD &&
 11599			    (BPF_MODE(insn->code) =3D=3D BPF_ABS ||
 11600			     BPF_MODE(insn->code) =3D=3D BPF_IND)) {
 11601				cnt =3D env->ops->gen_ld_abs(insn, insn_buf);
 11602				if (cnt =3D=3D 0 || cnt >=3D ARRAY_SIZE(insn_buf)) {
 11603					verbose(env, "bpf verifier is misconfigured\n");
 11604					return -EINVAL;
 11605				}
 11606	=

 11607				new_prog =3D bpf_patch_insn_data(env, i + delta, insn_buf, cnt);
 11608				if (!new_prog)
 11609					return -ENOMEM;
 11610	=

 11611				delta    +=3D cnt - 1;
 11612				env->prog =3D prog =3D new_prog;
 11613				insn      =3D new_prog->insnsi + i + delta;
 11614				continue;
 11615			}
 11616	=

 11617			/* Rewrite pointer arithmetic to mitigate speculation attacks. */
 11618			if (insn->code =3D=3D (BPF_ALU64 | BPF_ADD | BPF_X) ||
 11619			    insn->code =3D=3D (BPF_ALU64 | BPF_SUB | BPF_X)) {
 11620				const u8 code_add =3D BPF_ALU64 | BPF_ADD | BPF_X;
 11621				const u8 code_sub =3D BPF_ALU64 | BPF_SUB | BPF_X;
 11622				struct bpf_insn insn_buf[16];
 11623				struct bpf_insn *patch =3D &insn_buf[0];
 11624				bool issrc, isneg;
 11625				u32 off_reg;
 11626	=

 11627				aux =3D &env->insn_aux_data[i + delta];
 11628				if (!aux->alu_state ||
 11629				    aux->alu_state =3D=3D BPF_ALU_NON_POINTER)
 11630					continue;
 11631	=

 11632				isneg =3D aux->alu_state & BPF_ALU_NEG_VALUE;
 11633				issrc =3D (aux->alu_state & BPF_ALU_SANITIZE) =3D=3D
 11634					BPF_ALU_SANITIZE_SRC;
 11635	=

 11636				off_reg =3D issrc ? insn->src_reg : insn->dst_reg;
 11637				if (isneg)
 11638					*patch++ =3D BPF_ALU64_IMM(BPF_MUL, off_reg, -1);
 11639				*patch++ =3D BPF_MOV32_IMM(BPF_REG_AX, aux->alu_limit - 1);
 11640				*patch++ =3D BPF_ALU64_REG(BPF_SUB, BPF_REG_AX, off_reg);
 11641				*patch++ =3D BPF_ALU64_REG(BPF_OR, BPF_REG_AX, off_reg);
 11642				*patch++ =3D BPF_ALU64_IMM(BPF_NEG, BPF_REG_AX, 0);
 11643				*patch++ =3D BPF_ALU64_IMM(BPF_ARSH, BPF_REG_AX, 63);
 11644				if (issrc) {
 11645					*patch++ =3D BPF_ALU64_REG(BPF_AND, BPF_REG_AX,
 11646								 off_reg);
 11647					insn->src_reg =3D BPF_REG_AX;
 11648				} else {
 11649					*patch++ =3D BPF_ALU64_REG(BPF_AND, off_reg,
 11650								 BPF_REG_AX);
 11651				}
 11652				if (isneg)
 11653					insn->code =3D insn->code =3D=3D code_add ?
 11654						     code_sub : code_add;
 11655				*patch++ =3D *insn;
 11656				if (issrc && isneg)
 11657					*patch++ =3D BPF_ALU64_IMM(BPF_MUL, off_reg, -1);
 11658				cnt =3D patch - insn_buf;
 11659	=

 11660				new_prog =3D bpf_patch_insn_data(env, i + delta, insn_buf, cnt);
 11661				if (!new_prog)
 11662					return -ENOMEM;
 11663	=

 11664				delta    +=3D cnt - 1;
 11665				env->prog =3D prog =3D new_prog;
 11666				insn      =3D new_prog->insnsi + i + delta;
 11667				continue;
 11668			}
 11669	=

 11670			if (insn->code !=3D (BPF_JMP | BPF_CALL))
 11671				continue;
 11672			if (insn->src_reg =3D=3D BPF_PSEUDO_CALL)
 11673				continue;
 11674	=

 11675			if (insn->imm =3D=3D BPF_FUNC_get_route_realm)
 11676				prog->dst_needed =3D 1;
 11677			if (insn->imm =3D=3D BPF_FUNC_get_prandom_u32)
 11678				bpf_user_rnd_init_once();
 11679			if (insn->imm =3D=3D BPF_FUNC_override_return)
 11680				prog->kprobe_override =3D 1;
 11681			if (insn->imm =3D=3D BPF_FUNC_tail_call) {
 11682				/* If we tail call into other programs, we
 11683				 * cannot make any assumptions since they can
 11684				 * be replaced dynamically during runtime in
 11685				 * the program array.
 11686				 */
 11687				prog->cb_access =3D 1;
 11688				if (!allow_tail_call_in_subprogs(env))
 11689					prog->aux->stack_depth =3D MAX_BPF_STACK;
 11690				prog->aux->max_pkt_offset =3D MAX_PACKET_OFF;
 11691	=

 11692				/* mark bpf_tail_call as different opcode to avoid
 11693				 * conditional branch in the interpeter for every normal
 11694				 * call and to prevent accidental JITing by JIT compiler
 11695				 * that doesn't support bpf_tail_call yet
 11696				 */
 11697				insn->imm =3D 0;
 11698				insn->code =3D BPF_JMP | BPF_TAIL_CALL;
 11699	=

 11700				aux =3D &env->insn_aux_data[i + delta];
 11701				if (env->bpf_capable && !expect_blinding &&
 11702				    prog->jit_requested &&
 11703				    !bpf_map_key_poisoned(aux) &&
 11704				    !bpf_map_ptr_poisoned(aux) &&
 11705				    !bpf_map_ptr_unpriv(aux)) {
 11706					struct bpf_jit_poke_descriptor desc =3D {
 11707						.reason =3D BPF_POKE_REASON_TAIL_CALL,
 11708						.tail_call.map =3D BPF_MAP_PTR(aux->map_ptr_state),
 11709						.tail_call.key =3D bpf_map_key_immediate(aux),
 11710						.insn_idx =3D i + delta,
 11711					};
 11712	=

 11713					ret =3D bpf_jit_add_poke_descriptor(prog, &desc);
 11714					if (ret < 0) {
 11715						verbose(env, "adding tail call poke descriptor failed\n");
 11716						return ret;
 11717					}
 11718	=

 11719					insn->imm =3D ret + 1;
 11720					continue;
 11721				}
 11722	=

 11723				if (!bpf_map_ptr_unpriv(aux))
 11724					continue;
 11725	=

 11726				/* instead of changing every JIT dealing with tail_call
 11727				 * emit two extra insns:
 11728				 * if (index >=3D max_entries) goto out;
 11729				 * index &=3D array->index_mask;
 11730				 * to avoid out-of-bounds cpu speculation
 11731				 */
 11732				if (bpf_map_ptr_poisoned(aux)) {
 11733					verbose(env, "tail_call abusing map_ptr\n");
 11734					return -EINVAL;
 11735				}
 11736	=

 11737				map_ptr =3D BPF_MAP_PTR(aux->map_ptr_state);
 11738				insn_buf[0] =3D BPF_JMP_IMM(BPF_JGE, BPF_REG_3,
 11739							  map_ptr->max_entries, 2);
 11740				insn_buf[1] =3D BPF_ALU32_IMM(BPF_AND, BPF_REG_3,
 11741							    container_of(map_ptr,
 11742									 struct bpf_array,
 11743									 map)->index_mask);
 11744				insn_buf[2] =3D *insn;
 11745				cnt =3D 3;
 11746				new_prog =3D bpf_patch_insn_data(env, i + delta, insn_buf, cnt);
 11747				if (!new_prog)
 11748					return -ENOMEM;
 11749	=

 11750				delta    +=3D cnt - 1;
 11751				env->prog =3D prog =3D new_prog;
 11752				insn      =3D new_prog->insnsi + i + delta;
 11753				continue;
 11754			}
 11755	=

 11756			/* BPF_EMIT_CALL() assumptions in some of the map_gen_lookup
 11757			 * and other inlining handlers are currently limited to 64 bit
 11758			 * only.
 11759			 */
 11760			if (prog->jit_requested && BITS_PER_LONG =3D=3D 64 &&
 11761			    (insn->imm =3D=3D BPF_FUNC_map_lookup_elem ||
 11762			     insn->imm =3D=3D BPF_FUNC_map_update_elem ||
 11763			     insn->imm =3D=3D BPF_FUNC_map_delete_elem ||
 11764			     insn->imm =3D=3D BPF_FUNC_map_push_elem   ||
 11765			     insn->imm =3D=3D BPF_FUNC_map_pop_elem    ||
 11766			     insn->imm =3D=3D BPF_FUNC_map_peek_elem)) {
 11767				aux =3D &env->insn_aux_data[i + delta];
 11768				if (bpf_map_ptr_poisoned(aux))
 11769					goto patch_call_imm;
 11770	=

 11771				map_ptr =3D BPF_MAP_PTR(aux->map_ptr_state);
 11772				ops =3D map_ptr->ops;
 11773				if (insn->imm =3D=3D BPF_FUNC_map_lookup_elem &&
 11774				    ops->map_gen_lookup) {
 11775					cnt =3D ops->map_gen_lookup(map_ptr, insn_buf);
 11776					if (cnt =3D=3D -EOPNOTSUPP)
 11777						goto patch_map_ops_generic;
 11778					if (cnt <=3D 0 || cnt >=3D ARRAY_SIZE(insn_buf)) {
 11779						verbose(env, "bpf verifier is misconfigured\n");
 11780						return -EINVAL;
 11781					}
 11782	=

 11783					new_prog =3D bpf_patch_insn_data(env, i + delta,
 11784								       insn_buf, cnt);
 11785					if (!new_prog)
 11786						return -ENOMEM;
 11787	=

 11788					delta    +=3D cnt - 1;
 11789					env->prog =3D prog =3D new_prog;
 11790					insn      =3D new_prog->insnsi + i + delta;
 11791					continue;
 11792				}
 11793	=

 11794				BUILD_BUG_ON(!__same_type(ops->map_lookup_elem,
 11795					     (void *(*)(struct bpf_map *map, void *key))NULL));
 11796				BUILD_BUG_ON(!__same_type(ops->map_delete_elem,
 11797					     (int (*)(struct bpf_map *map, void *key))NULL));
 11798				BUILD_BUG_ON(!__same_type(ops->map_update_elem,
 11799					     (int (*)(struct bpf_map *map, void *key, void *value,
 11800						      u64 flags))NULL));
 11801				BUILD_BUG_ON(!__same_type(ops->map_push_elem,
 11802					     (int (*)(struct bpf_map *map, void *value,
 11803						      u64 flags))NULL));
 11804				BUILD_BUG_ON(!__same_type(ops->map_pop_elem,
 11805					     (int (*)(struct bpf_map *map, void *value))NULL));
 11806				BUILD_BUG_ON(!__same_type(ops->map_peek_elem,
 11807					     (int (*)(struct bpf_map *map, void *value))NULL));
 11808	patch_map_ops_generic:
 11809				switch (insn->imm) {
 11810				case BPF_FUNC_map_lookup_elem:
 11811					insn->imm =3D BPF_CAST_CALL(ops->map_lookup_elem) -
 11812						    __bpf_call_base;
 11813					continue;
 11814				case BPF_FUNC_map_update_elem:
 11815					insn->imm =3D BPF_CAST_CALL(ops->map_update_elem) -
 11816						    __bpf_call_base;
 11817					continue;
 11818				case BPF_FUNC_map_delete_elem:
 11819					insn->imm =3D BPF_CAST_CALL(ops->map_delete_elem) -
 11820						    __bpf_call_base;
 11821					continue;
 11822				case BPF_FUNC_map_push_elem:
 11823					insn->imm =3D BPF_CAST_CALL(ops->map_push_elem) -
 11824						    __bpf_call_base;
 11825					continue;
 11826				case BPF_FUNC_map_pop_elem:
 11827					insn->imm =3D BPF_CAST_CALL(ops->map_pop_elem) -
 11828						    __bpf_call_base;
 11829					continue;
 11830				case BPF_FUNC_map_peek_elem:
 11831					insn->imm =3D BPF_CAST_CALL(ops->map_peek_elem) -
 11832						    __bpf_call_base;
 11833					continue;
 11834				}
 11835	=

 11836				goto patch_call_imm;
 11837			}
 11838	=

 11839			/* Implement bpf_jiffies64 inline. */
 11840			if (prog->jit_requested && BITS_PER_LONG =3D=3D 64 &&
 11841			    insn->imm =3D=3D BPF_FUNC_jiffies64) {
 11842				struct bpf_insn ld_jiffies_addr[2] =3D {
 11843					BPF_LD_IMM64(BPF_REG_0,
 11844						     (unsigned long)&jiffies),
 11845				};
 11846	=

 11847				insn_buf[0] =3D ld_jiffies_addr[0];
 11848				insn_buf[1] =3D ld_jiffies_addr[1];
 11849				insn_buf[2] =3D BPF_LDX_MEM(BPF_DW, BPF_REG_0,
 11850							  BPF_REG_0, 0);
 11851				cnt =3D 3;
 11852	=

 11853				new_prog =3D bpf_patch_insn_data(env, i + delta, insn_buf,
 11854							       cnt);
 11855				if (!new_prog)
 11856					return -ENOMEM;
 11857	=

 11858				delta    +=3D cnt - 1;
 11859				env->prog =3D prog =3D new_prog;
 11860				insn      =3D new_prog->insnsi + i + delta;
 11861				continue;
 11862			}
 11863	=

 11864	patch_call_imm:
 11865			fn =3D env->ops->get_func_proto(insn->imm, env->prog);
 11866			/* all functions that have prototype and verifier allowed
 11867			 * programs to call them, must be real in-kernel functions
 11868			 */
 11869			if (!fn->func) {
 11870				verbose(env,
 11871					"kernel subsystem misconfigured func %s#%d\n",
 11872					func_id_name(insn->imm), insn->imm);
 11873				return -EFAULT;
 11874			}
 11875			insn->imm =3D fn->func - __bpf_call_base;
 11876		}
 11877	=

 11878		/* Since poke tab is now finalized, publish aux to tracker. */
 11879		for (i =3D 0; i < prog->aux->size_poke_tab; i++) {
 11880			map_ptr =3D prog->aux->poke_tab[i].tail_call.map;
 11881			if (!map_ptr->ops->map_poke_track ||
 11882			    !map_ptr->ops->map_poke_untrack ||
 11883			    !map_ptr->ops->map_poke_run) {
 11884				verbose(env, "bpf verifier is misconfigured\n");
 11885				return -EINVAL;
 11886			}
 11887	=

 11888			ret =3D map_ptr->ops->map_poke_track(map_ptr, prog->aux);
 11889			if (ret < 0) {
 11890				verbose(env, "tracking tail call prog failed\n");
 11891				return ret;
 11892			}
 11893		}
 11894	=

 11895		return 0;
 11896	}
 11897	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--===============8786828926116829260==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============8786828926116829260==--


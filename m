Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28CA57E
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Jan 2023 08:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674377663; x=1705913663;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NAMclrHoxvdUAhFvOYnKU/maUyivas4hjLKfPktgJ1U=;
  b=oKKB3/KOvpwhBpv03dWWyhHm6yzEMpkRWpjMGSVxYR0qS2urXvaqxIol
   ToPj1fx/aQq3s7xJHWabxsHOOYKo8tXkHFYJIh/6nZrulrtFoAGqPZFb+
   ZhsyDmb7X8mif/Nmr8U2qACb4NPVk19G8MZXiP6kJ9w26Kqmg3JI0aBE3
   StgD5QcEHpmCynSSN0ShVM4c2AAPkvo1hCuvzFPvqephhBaKJbrh04cFy
   2E+4JEx6Q0KOcF3I//H/pSL+wtOGqGvtAMESc3OuQ4WUp49PB2rB7jzRj
   mp1EQjfUH7+Nu30ai2WgRHqrk4WJtSlDuu2OBWNA8T7PvJFB45KkgawTg
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10597"; a="390382290"
X-IronPort-AV: E=Sophos;i="5.97,235,1669104000"; 
   d="scan'208";a="390382290"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2023 00:54:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10597"; a="693328237"
X-IronPort-AV: E=Sophos;i="5.97,235,1669104000"; 
   d="scan'208";a="693328237"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 22 Jan 2023 00:54:21 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pJW7I-0004u4-12;
	Sun, 22 Jan 2023 08:54:20 +0000
Date: Sun, 22 Jan 2023 16:53:29 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:bpf/tracing_multi_1 3/27]
 arch/arm64/net/bpf_jit_comp.c:1649:31: error: invalid use of undefined type
 'struct bpf_tramp_link'
Message-ID: <202301221629.4I1ietVK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bpf/tracing_multi_1
head:   747784185d106a06b429736196d8817cb2d12a6f
commit: 324c55013d2669f7b7ffbcc5db9e0783031536c6 [3/27] bpf: Store trampoline progs in arrays
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20230122/202301221629.4I1ietVK-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git/commit/?id=324c55013d2669f7b7ffbcc5db9e0783031536c6
        git remote add jolsa-perf https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git
        git fetch --no-tags jolsa-perf bpf/tracing_multi_1
        git checkout 324c55013d2669f7b7ffbcc5db9e0783031536c6
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   arch/arm64/net/bpf_jit_comp.c:1642:57: warning: 'struct bpf_tramp_link' declared inside parameter list will not be visible outside of this definition or declaration
    1642 | static void invoke_bpf_prog(struct jit_ctx *ctx, struct bpf_tramp_link *l,
         |                                                         ^~~~~~~~~~~~~~
   arch/arm64/net/bpf_jit_comp.c: In function 'invoke_bpf_prog':
>> arch/arm64/net/bpf_jit_comp.c:1649:31: error: invalid use of undefined type 'struct bpf_tramp_link'
    1649 |         struct bpf_prog *p = l->link.prog;
         |                               ^~
   arch/arm64/net/bpf_jit_comp.c:1655:14: error: invalid use of undefined type 'struct bpf_tramp_link'
    1655 |         if (l->cookie == 0) {
         |              ^~
   arch/arm64/net/bpf_jit_comp.c:1659:46: error: invalid use of undefined type 'struct bpf_tramp_link'
    1659 |                 emit_a64_mov_i64(A64_R(10), l->cookie, ctx);
         |                                              ^~
   arch/arm64/net/bpf_jit_comp.c: At top level:
   arch/arm64/net/bpf_jit_comp.c:1709:60: warning: 'struct bpf_tramp_links' declared inside parameter list will not be visible outside of this definition or declaration
    1709 | static void invoke_bpf_mod_ret(struct jit_ctx *ctx, struct bpf_tramp_links *tl,
         |                                                            ^~~~~~~~~~~~~~~
   arch/arm64/net/bpf_jit_comp.c: In function 'invoke_bpf_mod_ret':
   arch/arm64/net/bpf_jit_comp.c:1719:27: error: invalid use of undefined type 'struct bpf_tramp_links'
    1719 |         for (i = 0; i < tl->nr_links; i++) {
         |                           ^~
   arch/arm64/net/bpf_jit_comp.c:1720:40: error: invalid use of undefined type 'struct bpf_tramp_links'
    1720 |                 invoke_bpf_prog(ctx, tl->links[i], args_off, retval_off,
         |                                        ^~
   arch/arm64/net/bpf_jit_comp.c: At top level:
   arch/arm64/net/bpf_jit_comp.c:1766:38: warning: 'struct bpf_tramp_links' declared inside parameter list will not be visible outside of this definition or declaration
    1766 |                               struct bpf_tramp_links *tlinks, void *orig_call,
         |                                      ^~~~~~~~~~~~~~~
   arch/arm64/net/bpf_jit_comp.c: In function 'prepare_trampoline':
   arch/arm64/net/bpf_jit_comp.c:1778:49: error: invalid use of undefined type 'struct bpf_tramp_links'
    1778 |         struct bpf_tramp_links *fentry = &tlinks[BPF_TRAMP_FENTRY];
         |                                                 ^
   arch/arm64/net/bpf_jit_comp.c:1779:48: error: invalid use of undefined type 'struct bpf_tramp_links'
    1779 |         struct bpf_tramp_links *fexit = &tlinks[BPF_TRAMP_FEXIT];
         |                                                ^
   arch/arm64/net/bpf_jit_comp.c:1780:51: error: invalid use of undefined type 'struct bpf_tramp_links'
    1780 |         struct bpf_tramp_links *fmod_ret = &tlinks[BPF_TRAMP_MODIFY_RETURN];
         |                                                   ^
   arch/arm64/net/bpf_jit_comp.c:1884:31: error: invalid use of undefined type 'struct bpf_tramp_links'
    1884 |         for (i = 0; i < fentry->nr_links; i++)
         |                               ^~
   arch/arm64/net/bpf_jit_comp.c:1885:44: error: invalid use of undefined type 'struct bpf_tramp_links'
    1885 |                 invoke_bpf_prog(ctx, fentry->links[i], args_off,
         |                                            ^~
   arch/arm64/net/bpf_jit_comp.c:1889:21: error: invalid use of undefined type 'struct bpf_tramp_links'
    1889 |         if (fmod_ret->nr_links) {
         |                     ^~
   arch/arm64/net/bpf_jit_comp.c:1890:44: error: invalid use of undefined type 'struct bpf_tramp_links'
    1890 |                 branches = kcalloc(fmod_ret->nr_links, sizeof(__le32 *),
         |                                            ^~
   arch/arm64/net/bpf_jit_comp.c:1895:41: error: passing argument 2 of 'invoke_bpf_mod_ret' from incompatible pointer type [-Werror=incompatible-pointer-types]
    1895 |                 invoke_bpf_mod_ret(ctx, fmod_ret, args_off, retval_off,
         |                                         ^~~~~~~~
         |                                         |
         |                                         struct bpf_tramp_links *
   arch/arm64/net/bpf_jit_comp.c:1709:77: note: expected 'struct bpf_tramp_links *' but argument is of type 'struct bpf_tramp_links *'
    1709 | static void invoke_bpf_mod_ret(struct jit_ctx *ctx, struct bpf_tramp_links *tl,
         |                                                     ~~~~~~~~~~~~~~~~~~~~~~~~^~
   arch/arm64/net/bpf_jit_comp.c:1912:33: error: invalid use of undefined type 'struct bpf_tramp_links'
    1912 |         for (i = 0; i < fmod_ret->nr_links && ctx->image != NULL; i++) {
         |                                 ^~
   arch/arm64/net/bpf_jit_comp.c:1917:30: error: invalid use of undefined type 'struct bpf_tramp_links'
    1917 |         for (i = 0; i < fexit->nr_links; i++)
         |                              ^~
   arch/arm64/net/bpf_jit_comp.c:1918:43: error: invalid use of undefined type 'struct bpf_tramp_links'
    1918 |                 invoke_bpf_prog(ctx, fexit->links[i], args_off, retval_off,
         |                                           ^~
   arch/arm64/net/bpf_jit_comp.c: At top level:
   arch/arm64/net/bpf_jit_comp.c:1965:51: warning: 'struct bpf_tramp_links' declared inside parameter list will not be visible outside of this definition or declaration
    1965 |                                 u32 flags, struct bpf_tramp_links *tlinks,
         |                                                   ^~~~~~~~~~~~~~~
   arch/arm64/net/bpf_jit_comp.c:1963:5: error: conflicting types for 'arch_prepare_bpf_trampoline'; have 'int(struct bpf_tramp_image *, void *, void *, const struct btf_func_model *, u32,  struct bpf_tramp_links *, void *)' {aka 'int(struct bpf_tramp_image *, void *, void *, const struct btf_func_model *, unsigned int,  struct bpf_tramp_links *, void *)'}
    1963 | int arch_prepare_bpf_trampoline(struct bpf_tramp_image *im, void *image,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from arch/arm64/net/bpf_jit_comp.c:11:
   include/linux/bpf.h:977:5: note: previous declaration of 'arch_prepare_bpf_trampoline' with type 'int(struct bpf_tramp_image *, void *, void *, const struct btf_func_model *, u32,  struct bpf_tramp_progs *, void *)' {aka 'int(struct bpf_tramp_image *, void *, void *, const struct btf_func_model *, unsigned int,  struct bpf_tramp_progs *, void *)'}
     977 | int arch_prepare_bpf_trampoline(struct bpf_tramp_image *tr, void *image, void *image_end,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/net/bpf_jit_comp.c: In function 'arch_prepare_bpf_trampoline':
   arch/arm64/net/bpf_jit_comp.c:1986:44: error: passing argument 3 of 'prepare_trampoline' from incompatible pointer type [-Werror=incompatible-pointer-types]
    1986 |         ret = prepare_trampoline(&ctx, im, tlinks, orig_call, nargs, flags);
         |                                            ^~~~~~
         |                                            |
         |                                            struct bpf_tramp_links *
   arch/arm64/net/bpf_jit_comp.c:1766:55: note: expected 'struct bpf_tramp_links *' but argument is of type 'struct bpf_tramp_links *'
    1766 |                               struct bpf_tramp_links *tlinks, void *orig_call,
         |                               ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~
   arch/arm64/net/bpf_jit_comp.c:1997:44: error: passing argument 3 of 'prepare_trampoline' from incompatible pointer type [-Werror=incompatible-pointer-types]
    1997 |         ret = prepare_trampoline(&ctx, im, tlinks, orig_call, nargs, flags);
         |                                            ^~~~~~
         |                                            |
         |                                            struct bpf_tramp_links *
   arch/arm64/net/bpf_jit_comp.c:1766:55: note: expected 'struct bpf_tramp_links *' but argument is of type 'struct bpf_tramp_links *'
    1766 |                               struct bpf_tramp_links *tlinks, void *orig_call,
         |                               ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~
   cc1: some warnings being treated as errors


vim +1649 arch/arm64/net/bpf_jit_comp.c

b2ad54e1533e91 Xu Kuohai        2022-07-11  1641  
efc9909fdce00a Xu Kuohai        2022-07-11  1642  static void invoke_bpf_prog(struct jit_ctx *ctx, struct bpf_tramp_link *l,
efc9909fdce00a Xu Kuohai        2022-07-11  1643  			    int args_off, int retval_off, int run_ctx_off,
efc9909fdce00a Xu Kuohai        2022-07-11  1644  			    bool save_ret)
efc9909fdce00a Xu Kuohai        2022-07-11  1645  {
aada476655461a Xu Kuohai        2022-08-08  1646  	__le32 *branch;
efc9909fdce00a Xu Kuohai        2022-07-11  1647  	u64 enter_prog;
efc9909fdce00a Xu Kuohai        2022-07-11  1648  	u64 exit_prog;
efc9909fdce00a Xu Kuohai        2022-07-11 @1649  	struct bpf_prog *p = l->link.prog;
efc9909fdce00a Xu Kuohai        2022-07-11  1650  	int cookie_off = offsetof(struct bpf_tramp_run_ctx, bpf_cookie);
efc9909fdce00a Xu Kuohai        2022-07-11  1651  
271de525e1d7f5 Martin KaFai Lau 2022-10-25  1652  	enter_prog = (u64)bpf_trampoline_enter(p);
271de525e1d7f5 Martin KaFai Lau 2022-10-25  1653  	exit_prog = (u64)bpf_trampoline_exit(p);
efc9909fdce00a Xu Kuohai        2022-07-11  1654  
efc9909fdce00a Xu Kuohai        2022-07-11  1655  	if (l->cookie == 0) {
efc9909fdce00a Xu Kuohai        2022-07-11  1656  		/* if cookie is zero, one instruction is enough to store it */
efc9909fdce00a Xu Kuohai        2022-07-11  1657  		emit(A64_STR64I(A64_ZR, A64_SP, run_ctx_off + cookie_off), ctx);
efc9909fdce00a Xu Kuohai        2022-07-11  1658  	} else {
efc9909fdce00a Xu Kuohai        2022-07-11  1659  		emit_a64_mov_i64(A64_R(10), l->cookie, ctx);
efc9909fdce00a Xu Kuohai        2022-07-11  1660  		emit(A64_STR64I(A64_R(10), A64_SP, run_ctx_off + cookie_off),
efc9909fdce00a Xu Kuohai        2022-07-11  1661  		     ctx);
efc9909fdce00a Xu Kuohai        2022-07-11  1662  	}
efc9909fdce00a Xu Kuohai        2022-07-11  1663  
efc9909fdce00a Xu Kuohai        2022-07-11  1664  	/* save p to callee saved register x19 to avoid loading p with mov_i64
efc9909fdce00a Xu Kuohai        2022-07-11  1665  	 * each time.
efc9909fdce00a Xu Kuohai        2022-07-11  1666  	 */
efc9909fdce00a Xu Kuohai        2022-07-11  1667  	emit_addr_mov_i64(A64_R(19), (const u64)p, ctx);
efc9909fdce00a Xu Kuohai        2022-07-11  1668  
efc9909fdce00a Xu Kuohai        2022-07-11  1669  	/* arg1: prog */
efc9909fdce00a Xu Kuohai        2022-07-11  1670  	emit(A64_MOV(1, A64_R(0), A64_R(19)), ctx);
efc9909fdce00a Xu Kuohai        2022-07-11  1671  	/* arg2: &run_ctx */
efc9909fdce00a Xu Kuohai        2022-07-11  1672  	emit(A64_ADD_I(1, A64_R(1), A64_SP, run_ctx_off), ctx);
efc9909fdce00a Xu Kuohai        2022-07-11  1673  
efc9909fdce00a Xu Kuohai        2022-07-11  1674  	emit_call(enter_prog, ctx);
efc9909fdce00a Xu Kuohai        2022-07-11  1675  
efc9909fdce00a Xu Kuohai        2022-07-11  1676  	/* if (__bpf_prog_enter(prog) == 0)
efc9909fdce00a Xu Kuohai        2022-07-11  1677  	 *         goto skip_exec_of_prog;
efc9909fdce00a Xu Kuohai        2022-07-11  1678  	 */
efc9909fdce00a Xu Kuohai        2022-07-11  1679  	branch = ctx->image + ctx->idx;
efc9909fdce00a Xu Kuohai        2022-07-11  1680  	emit(A64_NOP, ctx);
efc9909fdce00a Xu Kuohai        2022-07-11  1681  
efc9909fdce00a Xu Kuohai        2022-07-11  1682  	/* save return value to callee saved register x20 */
efc9909fdce00a Xu Kuohai        2022-07-11  1683  	emit(A64_MOV(1, A64_R(20), A64_R(0)), ctx);
efc9909fdce00a Xu Kuohai        2022-07-11  1684  
efc9909fdce00a Xu Kuohai        2022-07-11  1685  	emit(A64_ADD_I(1, A64_R(0), A64_SP, args_off), ctx);
efc9909fdce00a Xu Kuohai        2022-07-11  1686  	if (!p->jited)
efc9909fdce00a Xu Kuohai        2022-07-11  1687  		emit_addr_mov_i64(A64_R(1), (const u64)p->insnsi, ctx);
efc9909fdce00a Xu Kuohai        2022-07-11  1688  
efc9909fdce00a Xu Kuohai        2022-07-11  1689  	emit_call((const u64)p->bpf_func, ctx);
efc9909fdce00a Xu Kuohai        2022-07-11  1690  
efc9909fdce00a Xu Kuohai        2022-07-11  1691  	if (save_ret)
efc9909fdce00a Xu Kuohai        2022-07-11  1692  		emit(A64_STR64I(A64_R(0), A64_SP, retval_off), ctx);
efc9909fdce00a Xu Kuohai        2022-07-11  1693  
efc9909fdce00a Xu Kuohai        2022-07-11  1694  	if (ctx->image) {
efc9909fdce00a Xu Kuohai        2022-07-11  1695  		int offset = &ctx->image[ctx->idx] - branch;
aada476655461a Xu Kuohai        2022-08-08  1696  		*branch = cpu_to_le32(A64_CBZ(1, A64_R(0), offset));
efc9909fdce00a Xu Kuohai        2022-07-11  1697  	}
efc9909fdce00a Xu Kuohai        2022-07-11  1698  
efc9909fdce00a Xu Kuohai        2022-07-11  1699  	/* arg1: prog */
efc9909fdce00a Xu Kuohai        2022-07-11  1700  	emit(A64_MOV(1, A64_R(0), A64_R(19)), ctx);
efc9909fdce00a Xu Kuohai        2022-07-11  1701  	/* arg2: start time */
efc9909fdce00a Xu Kuohai        2022-07-11  1702  	emit(A64_MOV(1, A64_R(1), A64_R(20)), ctx);
efc9909fdce00a Xu Kuohai        2022-07-11  1703  	/* arg3: &run_ctx */
efc9909fdce00a Xu Kuohai        2022-07-11  1704  	emit(A64_ADD_I(1, A64_R(2), A64_SP, run_ctx_off), ctx);
efc9909fdce00a Xu Kuohai        2022-07-11  1705  
efc9909fdce00a Xu Kuohai        2022-07-11  1706  	emit_call(exit_prog, ctx);
efc9909fdce00a Xu Kuohai        2022-07-11  1707  }
efc9909fdce00a Xu Kuohai        2022-07-11  1708  

:::::: The code at line 1649 was first introduced by commit
:::::: efc9909fdce00a827a37609628223cd45bf95d0b bpf, arm64: Add bpf trampoline for arm64

:::::: TO: Xu Kuohai <xukuohai@huawei.com>
:::::: CC: Daniel Borkmann <daniel@iogearbox.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

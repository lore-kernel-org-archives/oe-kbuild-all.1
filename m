Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B25B7E
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Jan 2023 00:53:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674348782; x=1705884782;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=igZ+QnHWuQJ8cFMqxDF9fqiMZlSxq2SjC3rEk6zT0Ik=;
  b=d+GIatldDHPqRpj28epwG4v6M1PY5v3l0L1S02JNbVX+M46LqijhXG0E
   hBBsQEL3hzpRMEVugxngGjb2eSqXOwsqHm7nTVK59dn1ra8xwRxxHKZSi
   N/t6kAJ94MMAqaQLjxMd9Cr9PFs7kHxQlMT7KQ5fhIHaaFgG08vBvtD8z
   lO01+L2fh3L35/cqV5QfY2Qy+ntFhYPU4F2aC3uqY4YaIJNL6vZMkG17V
   72jAQDVF6KAkzH2O94H1W2E+36C3zkmfD/9ZuzX1B3sEANsoS38cQFeQX
   JW5HP+Ovqb8TiLHZYzFcBtM4AxJXqFMvhMklhCC+6MR1JO7q7nX4Mbwvo
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10597"; a="327943738"
X-IronPort-AV: E=Sophos;i="5.97,235,1669104000"; 
   d="scan'208";a="327943738"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2023 16:52:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10597"; a="749767730"
X-IronPort-AV: E=Sophos;i="5.97,235,1669104000"; 
   d="scan'208";a="749767730"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 21 Jan 2023 16:52:58 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pJObR-0004cc-10;
	Sun, 22 Jan 2023 00:52:57 +0000
Date: Sun, 22 Jan 2023 08:52:10 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:bpf/tracing_multi_1 2/27]
 arch/arm64/net/bpf_jit_comp.c:1719:27: error: invalid use of undefined type
 'struct bpf_tramp_links'
Message-ID: <202301220839.lqY85YGp-lkp@intel.com>
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
commit: 59822617b8c28dfa3846dd1e0037feb113784e8a [2/27] bpf: Replace bpf_tramp_links with bpf_tramp_progs
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20230122/202301220839.lqY85YGp-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git/commit/?id=59822617b8c28dfa3846dd1e0037feb113784e8a
        git remote add jolsa-perf https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git
        git fetch --no-tags jolsa-perf bpf/tracing_multi_1
        git checkout 59822617b8c28dfa3846dd1e0037feb113784e8a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   arch/arm64/net/bpf_jit_comp.c:1709:60: warning: 'struct bpf_tramp_links' declared inside parameter list will not be visible outside of this definition or declaration
    1709 | static void invoke_bpf_mod_ret(struct jit_ctx *ctx, struct bpf_tramp_links *tl,
         |                                                            ^~~~~~~~~~~~~~~
   arch/arm64/net/bpf_jit_comp.c: In function 'invoke_bpf_mod_ret':
>> arch/arm64/net/bpf_jit_comp.c:1719:27: error: invalid use of undefined type 'struct bpf_tramp_links'
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
>> arch/arm64/net/bpf_jit_comp.c:1895:41: error: passing argument 2 of 'invoke_bpf_mod_ret' from incompatible pointer type [-Werror=incompatible-pointer-types]
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
>> arch/arm64/net/bpf_jit_comp.c:1963:5: error: conflicting types for 'arch_prepare_bpf_trampoline'; have 'int(struct bpf_tramp_image *, void *, void *, const struct btf_func_model *, u32,  struct bpf_tramp_links *, void *)' {aka 'int(struct bpf_tramp_image *, void *, void *, const struct btf_func_model *, unsigned int,  struct bpf_tramp_links *, void *)'}
    1963 | int arch_prepare_bpf_trampoline(struct bpf_tramp_image *im, void *image,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from arch/arm64/net/bpf_jit_comp.c:11:
   include/linux/bpf.h:977:5: note: previous declaration of 'arch_prepare_bpf_trampoline' with type 'int(struct bpf_tramp_image *, void *, void *, const struct btf_func_model *, u32,  struct bpf_tramp_progs *, void *)' {aka 'int(struct bpf_tramp_image *, void *, void *, const struct btf_func_model *, unsigned int,  struct bpf_tramp_progs *, void *)'}
     977 | int arch_prepare_bpf_trampoline(struct bpf_tramp_image *tr, void *image, void *image_end,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/net/bpf_jit_comp.c: In function 'arch_prepare_bpf_trampoline':
>> arch/arm64/net/bpf_jit_comp.c:1986:44: error: passing argument 3 of 'prepare_trampoline' from incompatible pointer type [-Werror=incompatible-pointer-types]
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


vim +1719 arch/arm64/net/bpf_jit_comp.c

efc9909fdce00a Xu Kuohai 2022-07-11  1708  
efc9909fdce00a Xu Kuohai 2022-07-11  1709  static void invoke_bpf_mod_ret(struct jit_ctx *ctx, struct bpf_tramp_links *tl,
efc9909fdce00a Xu Kuohai 2022-07-11  1710  			       int args_off, int retval_off, int run_ctx_off,
aada476655461a Xu Kuohai 2022-08-08  1711  			       __le32 **branches)
efc9909fdce00a Xu Kuohai 2022-07-11  1712  {
efc9909fdce00a Xu Kuohai 2022-07-11  1713  	int i;
efc9909fdce00a Xu Kuohai 2022-07-11  1714  
efc9909fdce00a Xu Kuohai 2022-07-11  1715  	/* The first fmod_ret program will receive a garbage return value.
efc9909fdce00a Xu Kuohai 2022-07-11  1716  	 * Set this to 0 to avoid confusing the program.
efc9909fdce00a Xu Kuohai 2022-07-11  1717  	 */
efc9909fdce00a Xu Kuohai 2022-07-11  1718  	emit(A64_STR64I(A64_ZR, A64_SP, retval_off), ctx);
efc9909fdce00a Xu Kuohai 2022-07-11 @1719  	for (i = 0; i < tl->nr_links; i++) {
efc9909fdce00a Xu Kuohai 2022-07-11  1720  		invoke_bpf_prog(ctx, tl->links[i], args_off, retval_off,
efc9909fdce00a Xu Kuohai 2022-07-11  1721  				run_ctx_off, true);
efc9909fdce00a Xu Kuohai 2022-07-11  1722  		/* if (*(u64 *)(sp + retval_off) !=  0)
efc9909fdce00a Xu Kuohai 2022-07-11  1723  		 *	goto do_fexit;
efc9909fdce00a Xu Kuohai 2022-07-11  1724  		 */
efc9909fdce00a Xu Kuohai 2022-07-11  1725  		emit(A64_LDR64I(A64_R(10), A64_SP, retval_off), ctx);
efc9909fdce00a Xu Kuohai 2022-07-11  1726  		/* Save the location of branch, and generate a nop.
efc9909fdce00a Xu Kuohai 2022-07-11  1727  		 * This nop will be replaced with a cbnz later.
efc9909fdce00a Xu Kuohai 2022-07-11  1728  		 */
efc9909fdce00a Xu Kuohai 2022-07-11  1729  		branches[i] = ctx->image + ctx->idx;
efc9909fdce00a Xu Kuohai 2022-07-11  1730  		emit(A64_NOP, ctx);
efc9909fdce00a Xu Kuohai 2022-07-11  1731  	}
efc9909fdce00a Xu Kuohai 2022-07-11  1732  }
efc9909fdce00a Xu Kuohai 2022-07-11  1733  
efc9909fdce00a Xu Kuohai 2022-07-11  1734  static void save_args(struct jit_ctx *ctx, int args_off, int nargs)
efc9909fdce00a Xu Kuohai 2022-07-11  1735  {
efc9909fdce00a Xu Kuohai 2022-07-11  1736  	int i;
efc9909fdce00a Xu Kuohai 2022-07-11  1737  
efc9909fdce00a Xu Kuohai 2022-07-11  1738  	for (i = 0; i < nargs; i++) {
efc9909fdce00a Xu Kuohai 2022-07-11  1739  		emit(A64_STR64I(i, A64_SP, args_off), ctx);
efc9909fdce00a Xu Kuohai 2022-07-11  1740  		args_off += 8;
efc9909fdce00a Xu Kuohai 2022-07-11  1741  	}
efc9909fdce00a Xu Kuohai 2022-07-11  1742  }
efc9909fdce00a Xu Kuohai 2022-07-11  1743  
efc9909fdce00a Xu Kuohai 2022-07-11  1744  static void restore_args(struct jit_ctx *ctx, int args_off, int nargs)
efc9909fdce00a Xu Kuohai 2022-07-11  1745  {
efc9909fdce00a Xu Kuohai 2022-07-11  1746  	int i;
efc9909fdce00a Xu Kuohai 2022-07-11  1747  
efc9909fdce00a Xu Kuohai 2022-07-11  1748  	for (i = 0; i < nargs; i++) {
efc9909fdce00a Xu Kuohai 2022-07-11  1749  		emit(A64_LDR64I(i, A64_SP, args_off), ctx);
efc9909fdce00a Xu Kuohai 2022-07-11  1750  		args_off += 8;
efc9909fdce00a Xu Kuohai 2022-07-11  1751  	}
efc9909fdce00a Xu Kuohai 2022-07-11  1752  }
efc9909fdce00a Xu Kuohai 2022-07-11  1753  
efc9909fdce00a Xu Kuohai 2022-07-11  1754  /* Based on the x86's implementation of arch_prepare_bpf_trampoline().
efc9909fdce00a Xu Kuohai 2022-07-11  1755   *
efc9909fdce00a Xu Kuohai 2022-07-11  1756   * bpf prog and function entry before bpf trampoline hooked:
efc9909fdce00a Xu Kuohai 2022-07-11  1757   *   mov x9, lr
efc9909fdce00a Xu Kuohai 2022-07-11  1758   *   nop
efc9909fdce00a Xu Kuohai 2022-07-11  1759   *
efc9909fdce00a Xu Kuohai 2022-07-11  1760   * bpf prog and function entry after bpf trampoline hooked:
efc9909fdce00a Xu Kuohai 2022-07-11  1761   *   mov x9, lr
efc9909fdce00a Xu Kuohai 2022-07-11  1762   *   bl  <bpf_trampoline or plt>
efc9909fdce00a Xu Kuohai 2022-07-11  1763   *
efc9909fdce00a Xu Kuohai 2022-07-11  1764   */
efc9909fdce00a Xu Kuohai 2022-07-11  1765  static int prepare_trampoline(struct jit_ctx *ctx, struct bpf_tramp_image *im,
efc9909fdce00a Xu Kuohai 2022-07-11  1766  			      struct bpf_tramp_links *tlinks, void *orig_call,
efc9909fdce00a Xu Kuohai 2022-07-11  1767  			      int nargs, u32 flags)
efc9909fdce00a Xu Kuohai 2022-07-11  1768  {
efc9909fdce00a Xu Kuohai 2022-07-11  1769  	int i;
efc9909fdce00a Xu Kuohai 2022-07-11  1770  	int stack_size;
efc9909fdce00a Xu Kuohai 2022-07-11  1771  	int retaddr_off;
efc9909fdce00a Xu Kuohai 2022-07-11  1772  	int regs_off;
efc9909fdce00a Xu Kuohai 2022-07-11  1773  	int retval_off;
efc9909fdce00a Xu Kuohai 2022-07-11  1774  	int args_off;
efc9909fdce00a Xu Kuohai 2022-07-11  1775  	int nargs_off;
efc9909fdce00a Xu Kuohai 2022-07-11  1776  	int ip_off;
efc9909fdce00a Xu Kuohai 2022-07-11  1777  	int run_ctx_off;
efc9909fdce00a Xu Kuohai 2022-07-11  1778  	struct bpf_tramp_links *fentry = &tlinks[BPF_TRAMP_FENTRY];
efc9909fdce00a Xu Kuohai 2022-07-11  1779  	struct bpf_tramp_links *fexit = &tlinks[BPF_TRAMP_FEXIT];
efc9909fdce00a Xu Kuohai 2022-07-11  1780  	struct bpf_tramp_links *fmod_ret = &tlinks[BPF_TRAMP_MODIFY_RETURN];
efc9909fdce00a Xu Kuohai 2022-07-11  1781  	bool save_ret;
aada476655461a Xu Kuohai 2022-08-08  1782  	__le32 **branches = NULL;
efc9909fdce00a Xu Kuohai 2022-07-11  1783  
efc9909fdce00a Xu Kuohai 2022-07-11  1784  	/* trampoline stack layout:
efc9909fdce00a Xu Kuohai 2022-07-11  1785  	 *                  [ parent ip         ]
efc9909fdce00a Xu Kuohai 2022-07-11  1786  	 *                  [ FP                ]
efc9909fdce00a Xu Kuohai 2022-07-11  1787  	 * SP + retaddr_off [ self ip           ]
efc9909fdce00a Xu Kuohai 2022-07-11  1788  	 *                  [ FP                ]
efc9909fdce00a Xu Kuohai 2022-07-11  1789  	 *
efc9909fdce00a Xu Kuohai 2022-07-11  1790  	 *                  [ padding           ] align SP to multiples of 16
efc9909fdce00a Xu Kuohai 2022-07-11  1791  	 *
efc9909fdce00a Xu Kuohai 2022-07-11  1792  	 *                  [ x20               ] callee saved reg x20
efc9909fdce00a Xu Kuohai 2022-07-11  1793  	 * SP + regs_off    [ x19               ] callee saved reg x19
efc9909fdce00a Xu Kuohai 2022-07-11  1794  	 *
efc9909fdce00a Xu Kuohai 2022-07-11  1795  	 * SP + retval_off  [ return value      ] BPF_TRAMP_F_CALL_ORIG or
efc9909fdce00a Xu Kuohai 2022-07-11  1796  	 *                                        BPF_TRAMP_F_RET_FENTRY_RET
efc9909fdce00a Xu Kuohai 2022-07-11  1797  	 *
efc9909fdce00a Xu Kuohai 2022-07-11  1798  	 *                  [ argN              ]
efc9909fdce00a Xu Kuohai 2022-07-11  1799  	 *                  [ ...               ]
efc9909fdce00a Xu Kuohai 2022-07-11  1800  	 * SP + args_off    [ arg1              ]
efc9909fdce00a Xu Kuohai 2022-07-11  1801  	 *
efc9909fdce00a Xu Kuohai 2022-07-11  1802  	 * SP + nargs_off   [ args count        ]
efc9909fdce00a Xu Kuohai 2022-07-11  1803  	 *
efc9909fdce00a Xu Kuohai 2022-07-11  1804  	 * SP + ip_off      [ traced function   ] BPF_TRAMP_F_IP_ARG flag
efc9909fdce00a Xu Kuohai 2022-07-11  1805  	 *
efc9909fdce00a Xu Kuohai 2022-07-11  1806  	 * SP + run_ctx_off [ bpf_tramp_run_ctx ]
efc9909fdce00a Xu Kuohai 2022-07-11  1807  	 */
efc9909fdce00a Xu Kuohai 2022-07-11  1808  
efc9909fdce00a Xu Kuohai 2022-07-11  1809  	stack_size = 0;
efc9909fdce00a Xu Kuohai 2022-07-11  1810  	run_ctx_off = stack_size;
efc9909fdce00a Xu Kuohai 2022-07-11  1811  	/* room for bpf_tramp_run_ctx */
efc9909fdce00a Xu Kuohai 2022-07-11  1812  	stack_size += round_up(sizeof(struct bpf_tramp_run_ctx), 8);
efc9909fdce00a Xu Kuohai 2022-07-11  1813  
efc9909fdce00a Xu Kuohai 2022-07-11  1814  	ip_off = stack_size;
efc9909fdce00a Xu Kuohai 2022-07-11  1815  	/* room for IP address argument */
efc9909fdce00a Xu Kuohai 2022-07-11  1816  	if (flags & BPF_TRAMP_F_IP_ARG)
efc9909fdce00a Xu Kuohai 2022-07-11  1817  		stack_size += 8;
efc9909fdce00a Xu Kuohai 2022-07-11  1818  
efc9909fdce00a Xu Kuohai 2022-07-11  1819  	nargs_off = stack_size;
efc9909fdce00a Xu Kuohai 2022-07-11  1820  	/* room for args count */
efc9909fdce00a Xu Kuohai 2022-07-11  1821  	stack_size += 8;
efc9909fdce00a Xu Kuohai 2022-07-11  1822  
efc9909fdce00a Xu Kuohai 2022-07-11  1823  	args_off = stack_size;
efc9909fdce00a Xu Kuohai 2022-07-11  1824  	/* room for args */
efc9909fdce00a Xu Kuohai 2022-07-11  1825  	stack_size += nargs * 8;
efc9909fdce00a Xu Kuohai 2022-07-11  1826  
efc9909fdce00a Xu Kuohai 2022-07-11  1827  	/* room for return value */
efc9909fdce00a Xu Kuohai 2022-07-11  1828  	retval_off = stack_size;
efc9909fdce00a Xu Kuohai 2022-07-11  1829  	save_ret = flags & (BPF_TRAMP_F_CALL_ORIG | BPF_TRAMP_F_RET_FENTRY_RET);
efc9909fdce00a Xu Kuohai 2022-07-11  1830  	if (save_ret)
efc9909fdce00a Xu Kuohai 2022-07-11  1831  		stack_size += 8;
efc9909fdce00a Xu Kuohai 2022-07-11  1832  
efc9909fdce00a Xu Kuohai 2022-07-11  1833  	/* room for callee saved registers, currently x19 and x20 are used */
efc9909fdce00a Xu Kuohai 2022-07-11  1834  	regs_off = stack_size;
efc9909fdce00a Xu Kuohai 2022-07-11  1835  	stack_size += 16;
efc9909fdce00a Xu Kuohai 2022-07-11  1836  
efc9909fdce00a Xu Kuohai 2022-07-11  1837  	/* round up to multiples of 16 to avoid SPAlignmentFault */
efc9909fdce00a Xu Kuohai 2022-07-11  1838  	stack_size = round_up(stack_size, 16);
efc9909fdce00a Xu Kuohai 2022-07-11  1839  
efc9909fdce00a Xu Kuohai 2022-07-11  1840  	/* return address locates above FP */
efc9909fdce00a Xu Kuohai 2022-07-11  1841  	retaddr_off = stack_size + 8;
efc9909fdce00a Xu Kuohai 2022-07-11  1842  
efc9909fdce00a Xu Kuohai 2022-07-11  1843  	/* bpf trampoline may be invoked by 3 instruction types:
efc9909fdce00a Xu Kuohai 2022-07-11  1844  	 * 1. bl, attached to bpf prog or kernel function via short jump
efc9909fdce00a Xu Kuohai 2022-07-11  1845  	 * 2. br, attached to bpf prog or kernel function via long jump
efc9909fdce00a Xu Kuohai 2022-07-11  1846  	 * 3. blr, working as a function pointer, used by struct_ops.
efc9909fdce00a Xu Kuohai 2022-07-11  1847  	 * So BTI_JC should used here to support both br and blr.
efc9909fdce00a Xu Kuohai 2022-07-11  1848  	 */
efc9909fdce00a Xu Kuohai 2022-07-11  1849  	emit_bti(A64_BTI_JC, ctx);
efc9909fdce00a Xu Kuohai 2022-07-11  1850  
efc9909fdce00a Xu Kuohai 2022-07-11  1851  	/* frame for parent function */
efc9909fdce00a Xu Kuohai 2022-07-11  1852  	emit(A64_PUSH(A64_FP, A64_R(9), A64_SP), ctx);
efc9909fdce00a Xu Kuohai 2022-07-11  1853  	emit(A64_MOV(1, A64_FP, A64_SP), ctx);
efc9909fdce00a Xu Kuohai 2022-07-11  1854  
efc9909fdce00a Xu Kuohai 2022-07-11  1855  	/* frame for patched function */
efc9909fdce00a Xu Kuohai 2022-07-11  1856  	emit(A64_PUSH(A64_FP, A64_LR, A64_SP), ctx);
efc9909fdce00a Xu Kuohai 2022-07-11  1857  	emit(A64_MOV(1, A64_FP, A64_SP), ctx);
efc9909fdce00a Xu Kuohai 2022-07-11  1858  
efc9909fdce00a Xu Kuohai 2022-07-11  1859  	/* allocate stack space */
efc9909fdce00a Xu Kuohai 2022-07-11  1860  	emit(A64_SUB_I(1, A64_SP, A64_SP, stack_size), ctx);
efc9909fdce00a Xu Kuohai 2022-07-11  1861  
efc9909fdce00a Xu Kuohai 2022-07-11  1862  	if (flags & BPF_TRAMP_F_IP_ARG) {
efc9909fdce00a Xu Kuohai 2022-07-11  1863  		/* save ip address of the traced function */
efc9909fdce00a Xu Kuohai 2022-07-11  1864  		emit_addr_mov_i64(A64_R(10), (const u64)orig_call, ctx);
efc9909fdce00a Xu Kuohai 2022-07-11  1865  		emit(A64_STR64I(A64_R(10), A64_SP, ip_off), ctx);
efc9909fdce00a Xu Kuohai 2022-07-11  1866  	}
efc9909fdce00a Xu Kuohai 2022-07-11  1867  
efc9909fdce00a Xu Kuohai 2022-07-11  1868  	/* save args count*/
efc9909fdce00a Xu Kuohai 2022-07-11  1869  	emit(A64_MOVZ(1, A64_R(10), nargs, 0), ctx);
efc9909fdce00a Xu Kuohai 2022-07-11  1870  	emit(A64_STR64I(A64_R(10), A64_SP, nargs_off), ctx);
efc9909fdce00a Xu Kuohai 2022-07-11  1871  
efc9909fdce00a Xu Kuohai 2022-07-11  1872  	/* save args */
efc9909fdce00a Xu Kuohai 2022-07-11  1873  	save_args(ctx, args_off, nargs);
efc9909fdce00a Xu Kuohai 2022-07-11  1874  
efc9909fdce00a Xu Kuohai 2022-07-11  1875  	/* save callee saved registers */
efc9909fdce00a Xu Kuohai 2022-07-11  1876  	emit(A64_STR64I(A64_R(19), A64_SP, regs_off), ctx);
efc9909fdce00a Xu Kuohai 2022-07-11  1877  	emit(A64_STR64I(A64_R(20), A64_SP, regs_off + 8), ctx);
efc9909fdce00a Xu Kuohai 2022-07-11  1878  
efc9909fdce00a Xu Kuohai 2022-07-11  1879  	if (flags & BPF_TRAMP_F_CALL_ORIG) {
efc9909fdce00a Xu Kuohai 2022-07-11  1880  		emit_addr_mov_i64(A64_R(0), (const u64)im, ctx);
efc9909fdce00a Xu Kuohai 2022-07-11  1881  		emit_call((const u64)__bpf_tramp_enter, ctx);
efc9909fdce00a Xu Kuohai 2022-07-11  1882  	}
efc9909fdce00a Xu Kuohai 2022-07-11  1883  
efc9909fdce00a Xu Kuohai 2022-07-11  1884  	for (i = 0; i < fentry->nr_links; i++)
efc9909fdce00a Xu Kuohai 2022-07-11  1885  		invoke_bpf_prog(ctx, fentry->links[i], args_off,
efc9909fdce00a Xu Kuohai 2022-07-11  1886  				retval_off, run_ctx_off,
efc9909fdce00a Xu Kuohai 2022-07-11  1887  				flags & BPF_TRAMP_F_RET_FENTRY_RET);
efc9909fdce00a Xu Kuohai 2022-07-11  1888  
efc9909fdce00a Xu Kuohai 2022-07-11  1889  	if (fmod_ret->nr_links) {
aada476655461a Xu Kuohai 2022-08-08  1890  		branches = kcalloc(fmod_ret->nr_links, sizeof(__le32 *),
efc9909fdce00a Xu Kuohai 2022-07-11  1891  				   GFP_KERNEL);
efc9909fdce00a Xu Kuohai 2022-07-11  1892  		if (!branches)
efc9909fdce00a Xu Kuohai 2022-07-11  1893  			return -ENOMEM;
efc9909fdce00a Xu Kuohai 2022-07-11  1894  
efc9909fdce00a Xu Kuohai 2022-07-11 @1895  		invoke_bpf_mod_ret(ctx, fmod_ret, args_off, retval_off,
efc9909fdce00a Xu Kuohai 2022-07-11  1896  				   run_ctx_off, branches);
efc9909fdce00a Xu Kuohai 2022-07-11  1897  	}
efc9909fdce00a Xu Kuohai 2022-07-11  1898  
efc9909fdce00a Xu Kuohai 2022-07-11  1899  	if (flags & BPF_TRAMP_F_CALL_ORIG) {
efc9909fdce00a Xu Kuohai 2022-07-11  1900  		restore_args(ctx, args_off, nargs);
efc9909fdce00a Xu Kuohai 2022-07-11  1901  		/* call original func */
efc9909fdce00a Xu Kuohai 2022-07-11  1902  		emit(A64_LDR64I(A64_R(10), A64_SP, retaddr_off), ctx);
efc9909fdce00a Xu Kuohai 2022-07-11  1903  		emit(A64_BLR(A64_R(10)), ctx);
efc9909fdce00a Xu Kuohai 2022-07-11  1904  		/* store return value */
efc9909fdce00a Xu Kuohai 2022-07-11  1905  		emit(A64_STR64I(A64_R(0), A64_SP, retval_off), ctx);
efc9909fdce00a Xu Kuohai 2022-07-11  1906  		/* reserve a nop for bpf_tramp_image_put */
efc9909fdce00a Xu Kuohai 2022-07-11  1907  		im->ip_after_call = ctx->image + ctx->idx;
efc9909fdce00a Xu Kuohai 2022-07-11  1908  		emit(A64_NOP, ctx);
efc9909fdce00a Xu Kuohai 2022-07-11  1909  	}
efc9909fdce00a Xu Kuohai 2022-07-11  1910  
efc9909fdce00a Xu Kuohai 2022-07-11  1911  	/* update the branches saved in invoke_bpf_mod_ret with cbnz */
efc9909fdce00a Xu Kuohai 2022-07-11  1912  	for (i = 0; i < fmod_ret->nr_links && ctx->image != NULL; i++) {
efc9909fdce00a Xu Kuohai 2022-07-11  1913  		int offset = &ctx->image[ctx->idx] - branches[i];
aada476655461a Xu Kuohai 2022-08-08  1914  		*branches[i] = cpu_to_le32(A64_CBNZ(1, A64_R(10), offset));
efc9909fdce00a Xu Kuohai 2022-07-11  1915  	}
efc9909fdce00a Xu Kuohai 2022-07-11  1916  
efc9909fdce00a Xu Kuohai 2022-07-11  1917  	for (i = 0; i < fexit->nr_links; i++)
efc9909fdce00a Xu Kuohai 2022-07-11  1918  		invoke_bpf_prog(ctx, fexit->links[i], args_off, retval_off,
efc9909fdce00a Xu Kuohai 2022-07-11  1919  				run_ctx_off, false);
efc9909fdce00a Xu Kuohai 2022-07-11  1920  
efc9909fdce00a Xu Kuohai 2022-07-11  1921  	if (flags & BPF_TRAMP_F_CALL_ORIG) {
efc9909fdce00a Xu Kuohai 2022-07-11  1922  		im->ip_epilogue = ctx->image + ctx->idx;
efc9909fdce00a Xu Kuohai 2022-07-11  1923  		emit_addr_mov_i64(A64_R(0), (const u64)im, ctx);
efc9909fdce00a Xu Kuohai 2022-07-11  1924  		emit_call((const u64)__bpf_tramp_exit, ctx);
efc9909fdce00a Xu Kuohai 2022-07-11  1925  	}
efc9909fdce00a Xu Kuohai 2022-07-11  1926  
efc9909fdce00a Xu Kuohai 2022-07-11  1927  	if (flags & BPF_TRAMP_F_RESTORE_REGS)
efc9909fdce00a Xu Kuohai 2022-07-11  1928  		restore_args(ctx, args_off, nargs);
efc9909fdce00a Xu Kuohai 2022-07-11  1929  
efc9909fdce00a Xu Kuohai 2022-07-11  1930  	/* restore callee saved register x19 and x20 */
efc9909fdce00a Xu Kuohai 2022-07-11  1931  	emit(A64_LDR64I(A64_R(19), A64_SP, regs_off), ctx);
efc9909fdce00a Xu Kuohai 2022-07-11  1932  	emit(A64_LDR64I(A64_R(20), A64_SP, regs_off + 8), ctx);
efc9909fdce00a Xu Kuohai 2022-07-11  1933  
efc9909fdce00a Xu Kuohai 2022-07-11  1934  	if (save_ret)
efc9909fdce00a Xu Kuohai 2022-07-11  1935  		emit(A64_LDR64I(A64_R(0), A64_SP, retval_off), ctx);
efc9909fdce00a Xu Kuohai 2022-07-11  1936  
efc9909fdce00a Xu Kuohai 2022-07-11  1937  	/* reset SP  */
efc9909fdce00a Xu Kuohai 2022-07-11  1938  	emit(A64_MOV(1, A64_SP, A64_FP), ctx);
efc9909fdce00a Xu Kuohai 2022-07-11  1939  
efc9909fdce00a Xu Kuohai 2022-07-11  1940  	/* pop frames  */
efc9909fdce00a Xu Kuohai 2022-07-11  1941  	emit(A64_POP(A64_FP, A64_LR, A64_SP), ctx);
efc9909fdce00a Xu Kuohai 2022-07-11  1942  	emit(A64_POP(A64_FP, A64_R(9), A64_SP), ctx);
efc9909fdce00a Xu Kuohai 2022-07-11  1943  
efc9909fdce00a Xu Kuohai 2022-07-11  1944  	if (flags & BPF_TRAMP_F_SKIP_FRAME) {
efc9909fdce00a Xu Kuohai 2022-07-11  1945  		/* skip patched function, return to parent */
efc9909fdce00a Xu Kuohai 2022-07-11  1946  		emit(A64_MOV(1, A64_LR, A64_R(9)), ctx);
efc9909fdce00a Xu Kuohai 2022-07-11  1947  		emit(A64_RET(A64_R(9)), ctx);
efc9909fdce00a Xu Kuohai 2022-07-11  1948  	} else {
efc9909fdce00a Xu Kuohai 2022-07-11  1949  		/* return to patched function */
efc9909fdce00a Xu Kuohai 2022-07-11  1950  		emit(A64_MOV(1, A64_R(10), A64_LR), ctx);
efc9909fdce00a Xu Kuohai 2022-07-11  1951  		emit(A64_MOV(1, A64_LR, A64_R(9)), ctx);
efc9909fdce00a Xu Kuohai 2022-07-11  1952  		emit(A64_RET(A64_R(10)), ctx);
efc9909fdce00a Xu Kuohai 2022-07-11  1953  	}
efc9909fdce00a Xu Kuohai 2022-07-11  1954  
efc9909fdce00a Xu Kuohai 2022-07-11  1955  	if (ctx->image)
efc9909fdce00a Xu Kuohai 2022-07-11  1956  		bpf_flush_icache(ctx->image, ctx->image + ctx->idx);
efc9909fdce00a Xu Kuohai 2022-07-11  1957  
efc9909fdce00a Xu Kuohai 2022-07-11  1958  	kfree(branches);
efc9909fdce00a Xu Kuohai 2022-07-11  1959  
efc9909fdce00a Xu Kuohai 2022-07-11  1960  	return ctx->idx;
efc9909fdce00a Xu Kuohai 2022-07-11  1961  }
efc9909fdce00a Xu Kuohai 2022-07-11  1962  

:::::: The code at line 1719 was first introduced by commit
:::::: efc9909fdce00a827a37609628223cd45bf95d0b bpf, arm64: Add bpf trampoline for arm64

:::::: TO: Xu Kuohai <xukuohai@huawei.com>
:::::: CC: Daniel Borkmann <daniel@iogearbox.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

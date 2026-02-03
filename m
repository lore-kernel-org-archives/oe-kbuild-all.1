Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B85EE2E543B
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Feb 2026 22:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770159361; cv=none; b=FdVEyDd/jdZnFhQra3PjFS0YythdxQ/wGh6hTeGOB17hJje7fO7H3pSnD7Hnp3l3DSNeAtkCb4iW6xLcm56aOvSh/IA69L1f0W+qRz84Zb9DdGPU72g1//ZUhF/BU5vZZ78KzkL+/tbmcZrq1NgEYbM1WuxzASPuJaEI0J+em+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770159361; c=relaxed/simple;
	bh=8JYJNf8FUxr6JC2s4ACvqiCwWPg4h2KqMWyCPOrI0nw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=MFBv3sZOXTL3B+gvzac6x3QA9lblarChEbzncRcW0l17enpuhzjURKyEHJC7nYGd6NHJ3zZWwMCjvCYlUQOB9uBvafpbfnEnqQe6S7WmByzjBvZPPDYazzdR2zepqCGwBcqgxXOR8RAf2jJKjgEmkthc5OzA5BmPYbt9BBFT4MI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VccK0RTk; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VccK0RTk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770159360; x=1801695360;
  h=date:from:to:cc:subject:message-id;
  bh=8JYJNf8FUxr6JC2s4ACvqiCwWPg4h2KqMWyCPOrI0nw=;
  b=VccK0RTkxZCP258/Cw8rmr1hpKv+VSkmtJOkwvZsYI7DPOy+amMkkG2W
   50mkOWiFCLYoWNXQvCHZjXGyt8/zwOFQwDZshCHFayVohOM2ViAODQTul
   JnQPzymLqfKHj831mOJ/6IoKSPd7LQtYKH99SCx79EqaFBuC/JEksaRHJ
   CW//nexhXde9Bc8wBQzdlSPSF43SHsPFNz9jrkN0G5VpczRCu0X0vV1qE
   JrE4IhdDSmwgZxESjK8D79rDRuDI4BD3NSiGrIQUHJDkKpouG1paP7g5o
   WMx3LGHULl9iMra2jsiUNZjTMpLh7nCs5E4dGGfa4dWRJavKRawq8y0Ut
   Q==;
X-CSE-ConnectionGUID: ldCkO7qfTdyMFKMQlzLBIQ==
X-CSE-MsgGUID: qDoqCGxeTWOoa9XK6+NQPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="58919905"
X-IronPort-AV: E=Sophos;i="6.21,271,1763452800"; 
   d="scan'208";a="58919905"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2026 14:55:57 -0800
X-CSE-ConnectionGUID: QhxqILHkQZm8mwuCu+PiHA==
X-CSE-MsgGUID: /va1HdWPSfarglLgT99t7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,271,1763452800"; 
   d="scan'208";a="210064214"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 03 Feb 2026 14:55:55 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vnPJJ-00000000hFk-209f;
	Tue, 03 Feb 2026 22:55:53 +0000
Date: Wed, 04 Feb 2026 06:55:45 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:bpf/tracing_multi 4/12]
 arch/loongarch/net/bpf_jit.c:1464:60: warning: 'struct bpf_tramp_links'
 declared inside parameter list will not be visible outside of this definition
 or declaration
Message-ID: <202602040658.TXCnC0hT-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bpf/tracing_multi
head:   ae091d7daa68f465679351da2b52a948a8beab4b
commit: f784ae726944f8a55e19ec83043b5d951c9f2cba [4/12] bpf: Add struct bpf_tramp_node object
config: loongarch-randconfig-r063-20260204 (https://download.01.org/0day-ci/archive/20260204/202602040658.TXCnC0hT-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260204/202602040658.TXCnC0hT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602040658.TXCnC0hT-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/loongarch/net/bpf_jit.c: In function 'invoke_bpf_prog':
   arch/loongarch/net/bpf_jit.c:1408:14: error: 'struct bpf_tramp_link' has no member named 'cookie'
    1408 |         if (l->cookie) {
         |              ^~
   arch/loongarch/net/bpf_jit.c:1409:50: error: 'struct bpf_tramp_link' has no member named 'cookie'
    1409 |                 move_imm(ctx, LOONGARCH_GPR_T1, l->cookie, false);
         |                                                  ^~
   arch/loongarch/net/bpf_jit.c: At top level:
>> arch/loongarch/net/bpf_jit.c:1464:60: warning: 'struct bpf_tramp_links' declared inside parameter list will not be visible outside of this definition or declaration
    1464 | static void invoke_bpf_mod_ret(struct jit_ctx *ctx, struct bpf_tramp_links *tl,
         |                                                            ^~~~~~~~~~~~~~~
   arch/loongarch/net/bpf_jit.c: In function 'invoke_bpf_mod_ret':
   arch/loongarch/net/bpf_jit.c:1470:27: error: invalid use of undefined type 'struct bpf_tramp_links'
    1470 |         for (i = 0; i < tl->nr_links; i++) {
         |                           ^~
   arch/loongarch/net/bpf_jit.c:1471:40: error: invalid use of undefined type 'struct bpf_tramp_links'
    1471 |                 invoke_bpf_prog(ctx, tl->links[i], args_off, retval_off, run_ctx_off, true);
         |                                        ^~
   arch/loongarch/net/bpf_jit.c: At top level:
   arch/loongarch/net/bpf_jit.c:1520:81: warning: 'struct bpf_tramp_links' declared inside parameter list will not be visible outside of this definition or declaration
    1520 |                                          const struct btf_func_model *m, struct bpf_tramp_links *tlinks,
         |                                                                                 ^~~~~~~~~~~~~~~
   arch/loongarch/net/bpf_jit.c: In function '__arch_prepare_bpf_trampoline':
   arch/loongarch/net/bpf_jit.c:1528:49: error: invalid use of undefined type 'struct bpf_tramp_links'
    1528 |         struct bpf_tramp_links *fentry = &tlinks[BPF_TRAMP_FENTRY];
         |                                                 ^
   arch/loongarch/net/bpf_jit.c:1529:48: error: invalid use of undefined type 'struct bpf_tramp_links'
    1529 |         struct bpf_tramp_links *fexit = &tlinks[BPF_TRAMP_FEXIT];
         |                                                ^
   arch/loongarch/net/bpf_jit.c:1530:51: error: invalid use of undefined type 'struct bpf_tramp_links'
    1530 |         struct bpf_tramp_links *fmod_ret = &tlinks[BPF_TRAMP_MODIFY_RETURN];
         |                                                   ^
   arch/loongarch/net/bpf_jit.c:1673:31: error: invalid use of undefined type 'struct bpf_tramp_links'
    1673 |         for (i = 0; i < fentry->nr_links; i++) {
         |                               ^~
   arch/loongarch/net/bpf_jit.c:1674:50: error: invalid use of undefined type 'struct bpf_tramp_links'
    1674 |                 ret = invoke_bpf_prog(ctx, fentry->links[i], args_off, retval_off,
         |                                                  ^~
   arch/loongarch/net/bpf_jit.c:1679:21: error: invalid use of undefined type 'struct bpf_tramp_links'
    1679 |         if (fmod_ret->nr_links) {
         |                     ^~
   In file included from include/linux/percpu.h:5,
                    from include/linux/radix-tree.h:16,
                    from include/linux/idr.h:15,
                    from include/linux/kernfs.h:12,
                    from include/linux/sysfs.h:16,
                    from include/linux/kobject.h:20,
                    from include/linux/energy_model.h:7,
                    from include/linux/device.h:16,
                    from include/linux/node.h:18,
                    from include/linux/memory.h:19,
                    from arch/loongarch/net/bpf_jit.c:7:
   arch/loongarch/net/bpf_jit.c:1680:45: error: invalid use of undefined type 'struct bpf_tramp_links'
    1680 |                 branches  = kcalloc(fmod_ret->nr_links, sizeof(u32 *), GFP_KERNEL);
         |                                             ^~
   include/linux/alloc_tag.h:251:16: note: in definition of macro 'alloc_hooks_tag'
     251 |         typeof(_do_alloc) _res;                                         \
         |                ^~~~~~~~~
   include/linux/slab.h:1005:49: note: in expansion of macro 'alloc_hooks'
    1005 | #define kmalloc_array(...)                      alloc_hooks(kmalloc_array_noprof(__VA_ARGS__))
         |                                                 ^~~~~~~~~~~
   include/linux/slab.h:1044:41: note: in expansion of macro 'kmalloc_array'
    1044 | #define kcalloc(n, size, flags)         kmalloc_array(n, size, (flags) | __GFP_ZERO)
         |                                         ^~~~~~~~~~~~~
   arch/loongarch/net/bpf_jit.c:1680:29: note: in expansion of macro 'kcalloc'
    1680 |                 branches  = kcalloc(fmod_ret->nr_links, sizeof(u32 *), GFP_KERNEL);
         |                             ^~~~~~~
   arch/loongarch/net/bpf_jit.c:1680:45: error: invalid use of undefined type 'struct bpf_tramp_links'
    1680 |                 branches  = kcalloc(fmod_ret->nr_links, sizeof(u32 *), GFP_KERNEL);
         |                                             ^~
   include/linux/alloc_tag.h:255:24: note: in definition of macro 'alloc_hooks_tag'
     255 |                 _res = _do_alloc;                                       \
         |                        ^~~~~~~~~
   include/linux/slab.h:1005:49: note: in expansion of macro 'alloc_hooks'
    1005 | #define kmalloc_array(...)                      alloc_hooks(kmalloc_array_noprof(__VA_ARGS__))
         |                                                 ^~~~~~~~~~~
   include/linux/slab.h:1044:41: note: in expansion of macro 'kmalloc_array'
    1044 | #define kcalloc(n, size, flags)         kmalloc_array(n, size, (flags) | __GFP_ZERO)
         |                                         ^~~~~~~~~~~~~
   arch/loongarch/net/bpf_jit.c:1680:29: note: in expansion of macro 'kcalloc'
    1680 |                 branches  = kcalloc(fmod_ret->nr_links, sizeof(u32 *), GFP_KERNEL);
         |                             ^~~~~~~
   arch/loongarch/net/bpf_jit.c:1680:45: error: invalid use of undefined type 'struct bpf_tramp_links'
    1680 |                 branches  = kcalloc(fmod_ret->nr_links, sizeof(u32 *), GFP_KERNEL);
         |                                             ^~
   include/linux/alloc_tag.h:258:24: note: in definition of macro 'alloc_hooks_tag'
     258 |                 _res = _do_alloc;                                       \
         |                        ^~~~~~~~~
   include/linux/slab.h:1005:49: note: in expansion of macro 'alloc_hooks'
    1005 | #define kmalloc_array(...)                      alloc_hooks(kmalloc_array_noprof(__VA_ARGS__))
         |                                                 ^~~~~~~~~~~
   include/linux/slab.h:1044:41: note: in expansion of macro 'kmalloc_array'
    1044 | #define kcalloc(n, size, flags)         kmalloc_array(n, size, (flags) | __GFP_ZERO)
         |                                         ^~~~~~~~~~~~~
   arch/loongarch/net/bpf_jit.c:1680:29: note: in expansion of macro 'kcalloc'
    1680 |                 branches  = kcalloc(fmod_ret->nr_links, sizeof(u32 *), GFP_KERNEL);
         |                             ^~~~~~~
   arch/loongarch/net/bpf_jit.c:1680:27: error: assignment to 'u32 **' {aka 'unsigned int **'} from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1680 |                 branches  = kcalloc(fmod_ret->nr_links, sizeof(u32 *), GFP_KERNEL);
         |                           ^
   arch/loongarch/net/bpf_jit.c:1684:41: error: passing argument 2 of 'invoke_bpf_mod_ret' from incompatible pointer type [-Wincompatible-pointer-types]
    1684 |                 invoke_bpf_mod_ret(ctx, fmod_ret, args_off, retval_off, run_ctx_off, branches);
         |                                         ^~~~~~~~
         |                                         |
         |                                         struct bpf_tramp_links *
   arch/loongarch/net/bpf_jit.c:1464:77: note: expected 'struct bpf_tramp_links *' but argument is of type 'struct bpf_tramp_links *'
    1464 | static void invoke_bpf_mod_ret(struct jit_ctx *ctx, struct bpf_tramp_links *tl,
         |                                                     ~~~~~~~~~~~~~~~~~~~~~~~~^~
   arch/loongarch/net/bpf_jit.c:1704:47: error: invalid use of undefined type 'struct bpf_tramp_links'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for NET_SELFTESTS
   Depends on [n]: NET [=y] && PHYLIB [=y] && INET [=n]
   Selected by [y]:
   - AMD_XGBE [=y] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_AMD [=y] && (OF_ADDRESS [=y] || ACPI [=y] || PCI [=y]) && HAS_IOMEM [=y] && (X86 || ARM64 || COMPILE_TEST [=y]) && PTP_1588_CLOCK_OPTIONAL [=y]


vim +1464 arch/loongarch/net/bpf_jit.c

f9b6b41f0cf317 Chenghao Duan 2025-08-05  1463  
f9b6b41f0cf317 Chenghao Duan 2025-08-05 @1464  static void invoke_bpf_mod_ret(struct jit_ctx *ctx, struct bpf_tramp_links *tl,
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1465  			       int args_off, int retval_off, int run_ctx_off, u32 **branches)
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1466  {
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1467  	int i;
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1468  
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1469  	emit_insn(ctx, std, LOONGARCH_GPR_ZERO, LOONGARCH_GPR_FP, -retval_off);
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1470  	for (i = 0; i < tl->nr_links; i++) {
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1471  		invoke_bpf_prog(ctx, tl->links[i], args_off, retval_off, run_ctx_off, true);
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1472  		emit_insn(ctx, ldd, LOONGARCH_GPR_T1, LOONGARCH_GPR_FP, -retval_off);
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1473  		branches[i] = (u32 *)ctx->image + ctx->idx;
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1474  		emit_insn(ctx, nop);
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1475  	}
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1476  }
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1477  

:::::: The code at line 1464 was first introduced by commit
:::::: f9b6b41f0cf31791541cea9644ddbedb46465801 LoongArch: BPF: Add basic bpf trampoline support

:::::: TO: Chenghao Duan <duanchenghao@kylinos.cn>
:::::: CC: Huacai Chen <chenhuacai@loongson.cn>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

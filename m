Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECF1A3BB5A
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Feb 2026 03:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770175208; cv=none; b=RCXNQkM8TfMKToOP+NcBnR8wshcnWjpGYL5S1b0n5xaF0SwNytcdHWHbK1BylTIoTOF7J1TvzcULiTRPPTnb7Hq88JjGD7n7MztPoaKLexScxPC5t5/8E3ruLYg+ftz4VPeQmFFzfid12mrRNYOelBK732TD469eHgTjHodwYpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770175208; c=relaxed/simple;
	bh=Q28tlrt0sVWhRDRN8TvjY506mcL/ycXHJ7qFhZrbEU4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=A3mIvvpia1a7xA+OmJmA5IYf9FfNkKf7cg+mW25yq3nCVLxesp9MYqy6PzlaXVF4j1XsJRBL1Hn8dQDE57FJ+Fi7DiErY2OGCs5IVH21LfwOsTOY6oYAk3gYnMN04oQJYcX7b+zmIDtkjLfUs/7NSY0PtRqxOPWN6toL8iOHj0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xan0kAwN; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xan0kAwN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770175206; x=1801711206;
  h=date:from:to:cc:subject:message-id;
  bh=Q28tlrt0sVWhRDRN8TvjY506mcL/ycXHJ7qFhZrbEU4=;
  b=Xan0kAwNnv213HTleqGVkj8VjZoROvDMJSMqKznK3QaQjGu/xxdOeB/G
   aGRtpJMPaCHZkDTt5JLaDJ2IQnmGSEpxZqSZ9vIeXE05Mg3N9ARkFl8x5
   DJpAVGkYuRp0dKNYvvRzl7xzbhabnGV0Ke+f9e4wTrsin8oJrA/NdLwmA
   LSGF9BFcqQv9qgRmFjz0YseEkIEGqI3zgLJiVZOH/hD/UFvvNP4VEwpnb
   94Y3xFZFfYlK2WKSCgFE2FTVeK7URe+DsopeGQztt5HNamJIDjFqIgeiu
   c2RufGv1ASyskiQDC5zKqUev/AlVZnnrrtWC3j68ydZrHG6FvYf4yefWM
   Q==;
X-CSE-ConnectionGUID: vWeuWtSuSEaVrLYM6skWlQ==
X-CSE-MsgGUID: pj+GvIseQZGBihNLHksSdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="71339166"
X-IronPort-AV: E=Sophos;i="6.21,271,1763452800"; 
   d="scan'208";a="71339166"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2026 19:20:06 -0800
X-CSE-ConnectionGUID: G+ijtb29Qs6JSs6WNnPYKg==
X-CSE-MsgGUID: YHtasCYsT1m/6T9wAsm+7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,271,1763452800"; 
   d="scan'208";a="210067375"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 03 Feb 2026 19:20:04 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vnTQv-00000000hQ4-0GbS;
	Wed, 04 Feb 2026 03:20:01 +0000
Date: Wed, 04 Feb 2026 11:19:37 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:bpf/tracing_multi 4/12]
 arch/loongarch/net/bpf_jit.c:1408:14: error: 'struct bpf_tramp_link' has no
 member named 'cookie'
Message-ID: <202602041141.niW5qng5-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bpf/tracing_multi
head:   ae091d7daa68f465679351da2b52a948a8beab4b
commit: f784ae726944f8a55e19ec83043b5d951c9f2cba [4/12] bpf: Add struct bpf_tramp_node object
config: loongarch-randconfig-r063-20260204 (https://download.01.org/0day-ci/archive/20260204/202602041141.niW5qng5-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260204/202602041141.niW5qng5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602041141.niW5qng5-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/loongarch/net/bpf_jit.c: In function 'invoke_bpf_prog':
>> arch/loongarch/net/bpf_jit.c:1408:14: error: 'struct bpf_tramp_link' has no member named 'cookie'
    1408 |         if (l->cookie) {
         |              ^~
   arch/loongarch/net/bpf_jit.c:1409:50: error: 'struct bpf_tramp_link' has no member named 'cookie'
    1409 |                 move_imm(ctx, LOONGARCH_GPR_T1, l->cookie, false);
         |                                                  ^~
   arch/loongarch/net/bpf_jit.c: At top level:
   arch/loongarch/net/bpf_jit.c:1464:60: warning: 'struct bpf_tramp_links' declared inside parameter list will not be visible outside of this definition or declaration
    1464 | static void invoke_bpf_mod_ret(struct jit_ctx *ctx, struct bpf_tramp_links *tl,
         |                                                            ^~~~~~~~~~~~~~~
   arch/loongarch/net/bpf_jit.c: In function 'invoke_bpf_mod_ret':
>> arch/loongarch/net/bpf_jit.c:1470:27: error: invalid use of undefined type 'struct bpf_tramp_links'
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
>> arch/loongarch/net/bpf_jit.c:1680:27: error: assignment to 'u32 **' {aka 'unsigned int **'} from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1680 |                 branches  = kcalloc(fmod_ret->nr_links, sizeof(u32 *), GFP_KERNEL);
         |                           ^
>> arch/loongarch/net/bpf_jit.c:1684:41: error: passing argument 2 of 'invoke_bpf_mod_ret' from incompatible pointer type [-Wincompatible-pointer-types]
    1684 |                 invoke_bpf_mod_ret(ctx, fmod_ret, args_off, retval_off, run_ctx_off, branches);
         |                                         ^~~~~~~~
         |                                         |
         |                                         struct bpf_tramp_links *
   arch/loongarch/net/bpf_jit.c:1464:77: note: expected 'struct bpf_tramp_links *' but argument is of type 'struct bpf_tramp_links *'
    1464 | static void invoke_bpf_mod_ret(struct jit_ctx *ctx, struct bpf_tramp_links *tl,
         |                                                     ~~~~~~~~~~~~~~~~~~~~~~~~^~
   arch/loongarch/net/bpf_jit.c:1704:47: error: invalid use of undefined type 'struct bpf_tramp_links'
    1704 |         for (i = 0; ctx->image && i < fmod_ret->nr_links; i++) {
         |                                               ^~
   arch/loongarch/net/bpf_jit.c:1709:30: error: invalid use of undefined type 'struct bpf_tramp_links'
    1709 |         for (i = 0; i < fexit->nr_links; i++) {
         |                              ^~
   arch/loongarch/net/bpf_jit.c:1710:49: error: invalid use of undefined type 'struct bpf_tramp_links'
    1710 |                 ret = invoke_bpf_prog(ctx, fexit->links[i], args_off, retval_off, run_ctx_off, false);
         |                                                 ^~
   arch/loongarch/net/bpf_jit.c: At top level:
   arch/loongarch/net/bpf_jit.c:1778:51: warning: 'struct bpf_tramp_links' declared inside parameter list will not be visible outside of this definition or declaration
    1778 |                                 u32 flags, struct bpf_tramp_links *tlinks, void *func_addr)
         |                                                   ^~~~~~~~~~~~~~~
>> arch/loongarch/net/bpf_jit.c:1776:5: error: conflicting types for 'arch_prepare_bpf_trampoline'; have 'int(struct bpf_tramp_image *, void *, void *, const struct btf_func_model *, u32,  struct bpf_tramp_links *, void *)' {aka 'int(struct bpf_tramp_image *, void *, void *, const struct btf_func_model *, unsigned int,  struct bpf_tramp_links *, void *)'}
    1776 | int arch_prepare_bpf_trampoline(struct bpf_tramp_image *im, void *ro_image,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from arch/loongarch/net/bpf_jit.h:8,
                    from arch/loongarch/net/bpf_jit.c:8:
   include/linux/bpf.h:1264:5: note: previous declaration of 'arch_prepare_bpf_trampoline' with type 'int(struct bpf_tramp_image *, void *, void *, const struct btf_func_model *, u32,  struct bpf_tramp_nodes *, void *)' {aka 'int(struct bpf_tramp_image *, void *, void *, const struct btf_func_model *, unsigned int,  struct bpf_tramp_nodes *, void *)'}
    1264 | int arch_prepare_bpf_trampoline(struct bpf_tramp_image *im, void *image, void *image_end,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/loongarch/net/bpf_jit.c: In function 'arch_prepare_bpf_trampoline':
>> arch/loongarch/net/bpf_jit.c:1794:58: error: passing argument 4 of '__arch_prepare_bpf_trampoline' from incompatible pointer type [-Wincompatible-pointer-types]
    1794 |         ret = __arch_prepare_bpf_trampoline(&ctx, im, m, tlinks, func_addr, flags);
         |                                                          ^~~~~~
         |                                                          |
         |                                                          struct bpf_tramp_links *
   arch/loongarch/net/bpf_jit.c:1520:98: note: expected 'struct bpf_tramp_links *' but argument is of type 'struct bpf_tramp_links *'
    1520 |                                          const struct btf_func_model *m, struct bpf_tramp_links *tlinks,
         |                                                                          ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~
   arch/loongarch/net/bpf_jit.c: At top level:
   arch/loongarch/net/bpf_jit.c:1815:37: warning: 'struct bpf_tramp_links' declared inside parameter list will not be visible outside of this definition or declaration
    1815 |                              struct bpf_tramp_links *tlinks, void *func_addr)
         |                                     ^~~~~~~~~~~~~~~
>> arch/loongarch/net/bpf_jit.c:1814:5: error: conflicting types for 'arch_bpf_trampoline_size'; have 'int(const struct btf_func_model *, u32,  struct bpf_tramp_links *, void *)' {aka 'int(const struct btf_func_model *, unsigned int,  struct bpf_tramp_links *, void *)'}
    1814 | int arch_bpf_trampoline_size(const struct btf_func_model *m, u32 flags,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bpf.h:1271:5: note: previous declaration of 'arch_bpf_trampoline_size' with type 'int(const struct btf_func_model *, u32,  struct bpf_tramp_nodes *, void *)' {aka 'int(const struct btf_func_model *, unsigned int,  struct bpf_tramp_nodes *, void *)'}
    1271 | int arch_bpf_trampoline_size(const struct btf_func_model *m, u32 flags,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
   arch/loongarch/net/bpf_jit.c: In function 'arch_bpf_trampoline_size':
   arch/loongarch/net/bpf_jit.c:1824:59: error: passing argument 4 of '__arch_prepare_bpf_trampoline' from incompatible pointer type [-Wincompatible-pointer-types]
    1824 |         ret = __arch_prepare_bpf_trampoline(&ctx, &im, m, tlinks, func_addr, flags);
         |                                                           ^~~~~~
         |                                                           |
         |                                                           struct bpf_tramp_links *
   arch/loongarch/net/bpf_jit.c:1520:98: note: expected 'struct bpf_tramp_links *' but argument is of type 'struct bpf_tramp_links *'
    1520 |                                          const struct btf_func_model *m, struct bpf_tramp_links *tlinks,
         |                                                                          ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for NET_SELFTESTS
   Depends on [n]: NET [=y] && PHYLIB [=y] && INET [=n]
   Selected by [y]:
   - AMD_XGBE [=y] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_AMD [=y] && (OF_ADDRESS [=y] || ACPI [=y] || PCI [=y]) && HAS_IOMEM [=y] && (X86 || ARM64 || COMPILE_TEST [=y]) && PTP_1588_CLOCK_OPTIONAL [=y]


vim +1408 arch/loongarch/net/bpf_jit.c

f9b6b41f0cf317 Chenghao Duan 2025-08-05  1399  
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1400  static int invoke_bpf_prog(struct jit_ctx *ctx, struct bpf_tramp_link *l,
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1401  			   int args_off, int retval_off, int run_ctx_off, bool save_ret)
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1402  {
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1403  	int ret;
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1404  	u32 *branch;
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1405  	struct bpf_prog *p = l->link.prog;
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1406  	int cookie_off = offsetof(struct bpf_tramp_run_ctx, bpf_cookie);
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1407  
f9b6b41f0cf317 Chenghao Duan 2025-08-05 @1408  	if (l->cookie) {
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1409  		move_imm(ctx, LOONGARCH_GPR_T1, l->cookie, false);
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1410  		emit_insn(ctx, std, LOONGARCH_GPR_T1, LOONGARCH_GPR_FP, -run_ctx_off + cookie_off);
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1411  	} else {
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1412  		emit_insn(ctx, std, LOONGARCH_GPR_ZERO, LOONGARCH_GPR_FP, -run_ctx_off + cookie_off);
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1413  	}
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1414  
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1415  	/* arg1: prog */
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1416  	move_imm(ctx, LOONGARCH_GPR_A0, (const s64)p, false);
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1417  	/* arg2: &run_ctx */
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1418  	emit_insn(ctx, addid, LOONGARCH_GPR_A1, LOONGARCH_GPR_FP, -run_ctx_off);
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1419  	ret = emit_call(ctx, (const u64)bpf_trampoline_enter(p));
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1420  	if (ret)
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1421  		return ret;
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1422  
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1423  	/* store prog start time */
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1424  	move_reg(ctx, LOONGARCH_GPR_S1, LOONGARCH_GPR_A0);
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1425  
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1426  	/*
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1427  	 * if (__bpf_prog_enter(prog) == 0)
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1428  	 *      goto skip_exec_of_prog;
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1429  	 */
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1430  	branch = (u32 *)ctx->image + ctx->idx;
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1431  	/* nop reserved for conditional jump */
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1432  	emit_insn(ctx, nop);
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1433  
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1434  	/* arg1: &args_off */
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1435  	emit_insn(ctx, addid, LOONGARCH_GPR_A0, LOONGARCH_GPR_FP, -args_off);
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1436  	if (!p->jited)
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1437  		move_imm(ctx, LOONGARCH_GPR_A1, (const s64)p->insnsi, false);
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1438  	ret = emit_call(ctx, (const u64)p->bpf_func);
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1439  	if (ret)
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1440  		return ret;
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1441  
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1442  	if (save_ret) {
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1443  		emit_insn(ctx, std, LOONGARCH_GPR_A0, LOONGARCH_GPR_FP, -retval_off);
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1444  		emit_insn(ctx, std, regmap[BPF_REG_0], LOONGARCH_GPR_FP, -(retval_off - 8));
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1445  	}
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1446  
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1447  	/* update branch with beqz */
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1448  	if (ctx->image) {
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1449  		int offset = (void *)(&ctx->image[ctx->idx]) - (void *)branch;
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1450  		*branch = larch_insn_gen_beq(LOONGARCH_GPR_A0, LOONGARCH_GPR_ZERO, offset);
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1451  	}
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1452  
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1453  	/* arg1: prog */
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1454  	move_imm(ctx, LOONGARCH_GPR_A0, (const s64)p, false);
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1455  	/* arg2: prog start time */
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1456  	move_reg(ctx, LOONGARCH_GPR_A1, LOONGARCH_GPR_S1);
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1457  	/* arg3: &run_ctx */
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1458  	emit_insn(ctx, addid, LOONGARCH_GPR_A2, LOONGARCH_GPR_FP, -run_ctx_off);
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1459  	ret = emit_call(ctx, (const u64)bpf_trampoline_exit(p));
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1460  
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1461  	return ret;
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1462  }
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1463  
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1464  static void invoke_bpf_mod_ret(struct jit_ctx *ctx, struct bpf_tramp_links *tl,
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1465  			       int args_off, int retval_off, int run_ctx_off, u32 **branches)
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1466  {
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1467  	int i;
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1468  
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1469  	emit_insn(ctx, std, LOONGARCH_GPR_ZERO, LOONGARCH_GPR_FP, -retval_off);
f9b6b41f0cf317 Chenghao Duan 2025-08-05 @1470  	for (i = 0; i < tl->nr_links; i++) {
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1471  		invoke_bpf_prog(ctx, tl->links[i], args_off, retval_off, run_ctx_off, true);
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1472  		emit_insn(ctx, ldd, LOONGARCH_GPR_T1, LOONGARCH_GPR_FP, -retval_off);
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1473  		branches[i] = (u32 *)ctx->image + ctx->idx;
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1474  		emit_insn(ctx, nop);
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1475  	}
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1476  }
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1477  

:::::: The code at line 1408 was first introduced by commit
:::::: f9b6b41f0cf31791541cea9644ddbedb46465801 LoongArch: BPF: Add basic bpf trampoline support

:::::: TO: Chenghao Duan <duanchenghao@kylinos.cn>
:::::: CC: Huacai Chen <chenhuacai@loongson.cn>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

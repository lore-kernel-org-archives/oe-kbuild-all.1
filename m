Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5854D30E841
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Jun 2025 00:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750464038; cv=none; b=e1WaxLuiJSnorutDYRAig1WpDW7Yk2+ZFEkQLLHbGRBMTJlG07AR4B8FrLfOuBFzVB53tTT6htb/u75W5Qku+NA2GpQWh8lQd0/03lHM33KgAL0Esi0sY/K7NAFHehzMG8y0fpsi+7yOo5sWCxpY87ahP2XP028wAPtvyRx4YBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750464038; c=relaxed/simple;
	bh=TGqe61L4ijisN7V6K0W5VQ3Euufo4lZc6c0T66eBvos=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Qqys9dWZCmFNXgdgKajjmpXqBiVEhsv/jSvwBPQawnlagRzWyf+qxVIuJEF/0Y3LhLYSDqIsKjXI1VR18GLNLLN26/qDRpR+fT5GJnXFwby95h1Hj9YipTBRe/ETIumRqE3SBTfbEMbkgoaUL3JVSE1s6GyuChPwgtT9aXuFtQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DDBZ+EYR; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DDBZ+EYR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750464035; x=1782000035;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TGqe61L4ijisN7V6K0W5VQ3Euufo4lZc6c0T66eBvos=;
  b=DDBZ+EYRYlRncnqDn2tSet8PfASfIt72GGPO1+ygQzYuZUirqgMdb8hA
   z5tld//SOCYxoyaqcrUuV9LS2B5QELxApIP9J2WN4bii9HYcpoV0jhZfZ
   N5GXqsZW6RqWleERd0V+IFQhy7jt0tjMWR5tBLJXPGc5bftAyJQprXpXD
   9z9SPOhHEUITC0pBJ8gACfvx3WffW0qV/xQQkjzHvo0ui8G2vMSX8WF9Q
   kFWehi2kUi8ImKjMQS+lE44+U0o7Opf7LV6K8/DQf0t+P30/WWl83q6XG
   6xriBVAxUCVaUOVrdwggslHcY55gVCEZbkahc6i9bVah1k1dUz5HhAodp
   Q==;
X-CSE-ConnectionGUID: pBHnO+QzRm6WokGiUghzOQ==
X-CSE-MsgGUID: mBltbNlpRAGJ/ykdGtrApQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="52814932"
X-IronPort-AV: E=Sophos;i="6.16,252,1744095600"; 
   d="scan'208";a="52814932"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2025 17:00:35 -0700
X-CSE-ConnectionGUID: PHC6pbq7S92uI2u3w2IzJw==
X-CSE-MsgGUID: GI2oXeS4QIuK2Uq1eVpccA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,252,1744095600"; 
   d="scan'208";a="151573605"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 20 Jun 2025 17:00:33 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uSlep-000MEQ-1P;
	Sat, 21 Jun 2025 00:00:31 +0000
Date: Sat, 21 Jun 2025 07:59:50 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:bpf/tracing_multi_1 11/22]
 arch/arm64/net/bpf_jit_comp.c:2119:31: error: invalid use of undefined type
 'struct bpf_tramp_link'
Message-ID: <202506210739.4s67V4ZB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bpf/tracing_multi_1
head:   28441de17b08aa419e3a354e2940268a9078d418
commit: f8e555ac119698c2ea16bc6a8563d43d8ba2a589 [11/22] bpf: Rename bpf_tramp_link struct to bpf_tramp_node
config: arm64-randconfig-r073-20250621 (https://download.01.org/0day-ci/archive/20250621/202506210739.4s67V4ZB-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250621/202506210739.4s67V4ZB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506210739.4s67V4ZB-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> arch/arm64/net/bpf_jit_comp.c:2112:57: warning: 'struct bpf_tramp_link' declared inside parameter list will not be visible outside of this definition or declaration
    2112 | static void invoke_bpf_prog(struct jit_ctx *ctx, struct bpf_tramp_link *l,
         |                                                         ^~~~~~~~~~~~~~
   arch/arm64/net/bpf_jit_comp.c: In function 'invoke_bpf_prog':
>> arch/arm64/net/bpf_jit_comp.c:2119:31: error: invalid use of undefined type 'struct bpf_tramp_link'
    2119 |         struct bpf_prog *p = l->link.prog;
         |                               ^~
   arch/arm64/net/bpf_jit_comp.c:2125:14: error: invalid use of undefined type 'struct bpf_tramp_link'
    2125 |         if (l->cookie == 0) {
         |              ^~
   arch/arm64/net/bpf_jit_comp.c:2129:46: error: invalid use of undefined type 'struct bpf_tramp_link'
    2129 |                 emit_a64_mov_i64(A64_R(10), l->cookie, ctx);
         |                                              ^~
   arch/arm64/net/bpf_jit_comp.c: At top level:
>> arch/arm64/net/bpf_jit_comp.c:2179:60: warning: 'struct bpf_tramp_links' declared inside parameter list will not be visible outside of this definition or declaration
    2179 | static void invoke_bpf_mod_ret(struct jit_ctx *ctx, struct bpf_tramp_links *tl,
         |                                                            ^~~~~~~~~~~~~~~
   arch/arm64/net/bpf_jit_comp.c: In function 'invoke_bpf_mod_ret':
>> arch/arm64/net/bpf_jit_comp.c:2189:27: error: invalid use of undefined type 'struct bpf_tramp_links'
    2189 |         for (i = 0; i < tl->nr_links; i++) {
         |                           ^~
   arch/arm64/net/bpf_jit_comp.c:2190:40: error: invalid use of undefined type 'struct bpf_tramp_links'
    2190 |                 invoke_bpf_prog(ctx, tl->links[i], bargs_off, retval_off,
         |                                        ^~
   arch/arm64/net/bpf_jit_comp.c: At top level:
   arch/arm64/net/bpf_jit_comp.c:2326:46: warning: 'struct bpf_tramp_links' declared inside parameter list will not be visible outside of this definition or declaration
    2326 | static bool is_struct_ops_tramp(const struct bpf_tramp_links *fentry_links)
         |                                              ^~~~~~~~~~~~~~~
   arch/arm64/net/bpf_jit_comp.c: In function 'is_struct_ops_tramp':
>> arch/arm64/net/bpf_jit_comp.c:2328:28: error: invalid use of undefined type 'const struct bpf_tramp_links'
    2328 |         return fentry_links->nr_links == 1 &&
         |                            ^~
   arch/arm64/net/bpf_jit_comp.c:2329:29: error: invalid use of undefined type 'const struct bpf_tramp_links'
    2329 |                 fentry_links->links[0]->link.type == BPF_LINK_TYPE_STRUCT_OPS;
         |                             ^~
   arch/arm64/net/bpf_jit_comp.c: At top level:
   arch/arm64/net/bpf_jit_comp.c:2344:38: warning: 'struct bpf_tramp_links' declared inside parameter list will not be visible outside of this definition or declaration
    2344 |                               struct bpf_tramp_links *tlinks, void *func_addr,
         |                                      ^~~~~~~~~~~~~~~
   arch/arm64/net/bpf_jit_comp.c: In function 'prepare_trampoline':
   arch/arm64/net/bpf_jit_comp.c:2360:49: error: invalid use of undefined type 'struct bpf_tramp_links'
    2360 |         struct bpf_tramp_links *fentry = &tlinks[BPF_TRAMP_FENTRY];
         |                                                 ^
   arch/arm64/net/bpf_jit_comp.c:2361:48: error: invalid use of undefined type 'struct bpf_tramp_links'
    2361 |         struct bpf_tramp_links *fexit = &tlinks[BPF_TRAMP_FEXIT];
         |                                                ^
   arch/arm64/net/bpf_jit_comp.c:2362:51: error: invalid use of undefined type 'struct bpf_tramp_links'
    2362 |         struct bpf_tramp_links *fmod_ret = &tlinks[BPF_TRAMP_MODIFY_RETURN];
         |                                                   ^
>> arch/arm64/net/bpf_jit_comp.c:2365:50: error: passing argument 1 of 'is_struct_ops_tramp' from incompatible pointer type [-Wincompatible-pointer-types]
    2365 |         bool is_struct_ops = is_struct_ops_tramp(fentry);
         |                                                  ^~~~~~
         |                                                  |
         |                                                  struct bpf_tramp_links *
   arch/arm64/net/bpf_jit_comp.c:2326:63: note: expected 'const struct bpf_tramp_links *' but argument is of type 'struct bpf_tramp_links *'
    2326 | static bool is_struct_ops_tramp(const struct bpf_tramp_links *fentry_links)
         |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
   arch/arm64/net/bpf_jit_comp.c:2482:31: error: invalid use of undefined type 'struct bpf_tramp_links'
    2482 |         for (i = 0; i < fentry->nr_links; i++)
         |                               ^~
   arch/arm64/net/bpf_jit_comp.c:2483:44: error: invalid use of undefined type 'struct bpf_tramp_links'
    2483 |                 invoke_bpf_prog(ctx, fentry->links[i], bargs_off,
         |                                            ^~
   arch/arm64/net/bpf_jit_comp.c:2487:21: error: invalid use of undefined type 'struct bpf_tramp_links'
    2487 |         if (fmod_ret->nr_links) {
         |                     ^~
   In file included from include/linux/percpu.h:5,
                    from arch/arm64/include/asm/arch_timer.h:18,
                    from arch/arm64/include/asm/timex.h:8,
                    from include/linux/timex.h:67,
                    from include/linux/time32.h:13,
                    from include/linux/time.h:60,
                    from include/linux/jiffies.h:10,
                    from include/linux/ktime.h:25,
                    from include/linux/timer.h:6,
                    from include/linux/workqueue.h:9,
                    from include/linux/bpf.h:10,
                    from arch/arm64/net/bpf_jit_comp.c:12:
   arch/arm64/net/bpf_jit_comp.c:2488:44: error: invalid use of undefined type 'struct bpf_tramp_links'
    2488 |                 branches = kcalloc(fmod_ret->nr_links, sizeof(__le32 *),
         |                                            ^~
   include/linux/alloc_tag.h:239:16: note: in definition of macro 'alloc_hooks_tag'
     239 |         typeof(_do_alloc) _res;                                         \
         |                ^~~~~~~~~
   include/linux/slab.h:950:49: note: in expansion of macro 'alloc_hooks'
     950 | #define kmalloc_array(...)                      alloc_hooks(kmalloc_array_noprof(__VA_ARGS__))
         |                                                 ^~~~~~~~~~~
   include/linux/slab.h:989:41: note: in expansion of macro 'kmalloc_array'
     989 | #define kcalloc(n, size, flags)         kmalloc_array(n, size, (flags) | __GFP_ZERO)
         |                                         ^~~~~~~~~~~~~
   arch/arm64/net/bpf_jit_comp.c:2488:28: note: in expansion of macro 'kcalloc'
    2488 |                 branches = kcalloc(fmod_ret->nr_links, sizeof(__le32 *),
         |                            ^~~~~~~
   arch/arm64/net/bpf_jit_comp.c:2488:44: error: invalid use of undefined type 'struct bpf_tramp_links'
    2488 |                 branches = kcalloc(fmod_ret->nr_links, sizeof(__le32 *),
         |                                            ^~
   include/linux/alloc_tag.h:243:24: note: in definition of macro 'alloc_hooks_tag'
     243 |                 _res = _do_alloc;                                       \
         |                        ^~~~~~~~~
   include/linux/slab.h:950:49: note: in expansion of macro 'alloc_hooks'
     950 | #define kmalloc_array(...)                      alloc_hooks(kmalloc_array_noprof(__VA_ARGS__))
         |                                                 ^~~~~~~~~~~
   include/linux/slab.h:989:41: note: in expansion of macro 'kmalloc_array'
     989 | #define kcalloc(n, size, flags)         kmalloc_array(n, size, (flags) | __GFP_ZERO)
         |                                         ^~~~~~~~~~~~~
   arch/arm64/net/bpf_jit_comp.c:2488:28: note: in expansion of macro 'kcalloc'
    2488 |                 branches = kcalloc(fmod_ret->nr_links, sizeof(__le32 *),
         |                            ^~~~~~~
   arch/arm64/net/bpf_jit_comp.c:2488:44: error: invalid use of undefined type 'struct bpf_tramp_links'
    2488 |                 branches = kcalloc(fmod_ret->nr_links, sizeof(__le32 *),
         |                                            ^~
   include/linux/alloc_tag.h:246:24: note: in definition of macro 'alloc_hooks_tag'
     246 |                 _res = _do_alloc;                                       \
         |                        ^~~~~~~~~
   include/linux/slab.h:950:49: note: in expansion of macro 'alloc_hooks'
     950 | #define kmalloc_array(...)                      alloc_hooks(kmalloc_array_noprof(__VA_ARGS__))
         |                                                 ^~~~~~~~~~~
   include/linux/slab.h:989:41: note: in expansion of macro 'kmalloc_array'
     989 | #define kcalloc(n, size, flags)         kmalloc_array(n, size, (flags) | __GFP_ZERO)
         |                                         ^~~~~~~~~~~~~
   arch/arm64/net/bpf_jit_comp.c:2488:28: note: in expansion of macro 'kcalloc'
    2488 |                 branches = kcalloc(fmod_ret->nr_links, sizeof(__le32 *),
         |                            ^~~~~~~
>> arch/arm64/net/bpf_jit_comp.c:2488:26: error: assignment to '__le32 **' {aka 'unsigned int **'} from 'int' makes pointer from integer without a cast [-Wint-conversion]
    2488 |                 branches = kcalloc(fmod_ret->nr_links, sizeof(__le32 *),
         |                          ^
>> arch/arm64/net/bpf_jit_comp.c:2493:41: error: passing argument 2 of 'invoke_bpf_mod_ret' from incompatible pointer type [-Wincompatible-pointer-types]
    2493 |                 invoke_bpf_mod_ret(ctx, fmod_ret, bargs_off, retval_off,
         |                                         ^~~~~~~~
         |                                         |
         |                                         struct bpf_tramp_links *
   arch/arm64/net/bpf_jit_comp.c:2179:77: note: expected 'struct bpf_tramp_links *' but argument is of type 'struct bpf_tramp_links *'
    2179 | static void invoke_bpf_mod_ret(struct jit_ctx *ctx, struct bpf_tramp_links *tl,
         |                                                     ~~~~~~~~~~~~~~~~~~~~~~~~^~
   arch/arm64/net/bpf_jit_comp.c:2512:33: error: invalid use of undefined type 'struct bpf_tramp_links'
    2512 |         for (i = 0; i < fmod_ret->nr_links && ctx->image != NULL; i++) {
         |                                 ^~
   arch/arm64/net/bpf_jit_comp.c:2517:30: error: invalid use of undefined type 'struct bpf_tramp_links'
    2517 |         for (i = 0; i < fexit->nr_links; i++)
         |                              ^~
   arch/arm64/net/bpf_jit_comp.c:2518:43: error: invalid use of undefined type 'struct bpf_tramp_links'
    2518 |                 invoke_bpf_prog(ctx, fexit->links[i], bargs_off, retval_off,
         |                                           ^~
   arch/arm64/net/bpf_jit_comp.c: At top level:
   arch/arm64/net/bpf_jit_comp.c:2570:37: warning: 'struct bpf_tramp_links' declared inside parameter list will not be visible outside of this definition or declaration
    2570 |                              struct bpf_tramp_links *tlinks, void *func_addr)
         |                                     ^~~~~~~~~~~~~~~
>> arch/arm64/net/bpf_jit_comp.c:2569:5: error: conflicting types for 'arch_bpf_trampoline_size'; have 'int(const struct btf_func_model *, u32,  struct bpf_tramp_links *, void *)' {aka 'int(const struct btf_func_model *, unsigned int,  struct bpf_tramp_links *, void *)'}
    2569 | int arch_bpf_trampoline_size(const struct btf_func_model *m, u32 flags,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bpf.h:1209:5: note: previous declaration of 'arch_bpf_trampoline_size' with type 'int(const struct btf_func_model *, u32,  struct bpf_tramp_nodes *, void *)' {aka 'int(const struct btf_func_model *, unsigned int,  struct bpf_tramp_nodes *, void *)'}
    1209 | int arch_bpf_trampoline_size(const struct btf_func_model *m, u32 flags,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/net/bpf_jit_comp.c: In function 'arch_bpf_trampoline_size':
>> arch/arm64/net/bpf_jit_comp.c:2584:45: error: passing argument 3 of 'prepare_trampoline' from incompatible pointer type [-Wincompatible-pointer-types]
    2584 |         ret = prepare_trampoline(&ctx, &im, tlinks, func_addr, m, &aaux, flags);
         |                                             ^~~~~~
         |                                             |
         |                                             struct bpf_tramp_links *
   arch/arm64/net/bpf_jit_comp.c:2344:55: note: expected 'struct bpf_tramp_links *' but argument is of type 'struct bpf_tramp_links *'
    2344 |                               struct bpf_tramp_links *tlinks, void *func_addr,
         |                               ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~
   arch/arm64/net/bpf_jit_comp.c: At top level:
   arch/arm64/net/bpf_jit_comp.c:2608:51: warning: 'struct bpf_tramp_links' declared inside parameter list will not be visible outside of this definition or declaration
    2608 |                                 u32 flags, struct bpf_tramp_links *tlinks,
         |                                                   ^~~~~~~~~~~~~~~
>> arch/arm64/net/bpf_jit_comp.c:2606:5: error: conflicting types for 'arch_prepare_bpf_trampoline'; have 'int(struct bpf_tramp_image *, void *, void *, const struct btf_func_model *, u32,  struct bpf_tramp_links *, void *)' {aka 'int(struct bpf_tramp_image *, void *, void *, const struct btf_func_model *, unsigned int,  struct bpf_tramp_links *, void *)'}
    2606 | int arch_prepare_bpf_trampoline(struct bpf_tramp_image *im, void *ro_image,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bpf.h:1202:5: note: previous declaration of 'arch_prepare_bpf_trampoline' with type 'int(struct bpf_tramp_image *, void *, void *, const struct btf_func_model *, u32,  struct bpf_tramp_nodes *, void *)' {aka 'int(struct bpf_tramp_image *, void *, void *, const struct btf_func_model *, unsigned int,  struct bpf_tramp_nodes *, void *)'}
    1202 | int arch_prepare_bpf_trampoline(struct bpf_tramp_image *im, void *image, void *image_end,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/net/bpf_jit_comp.c: In function 'arch_prepare_bpf_trampoline':
   arch/arm64/net/bpf_jit_comp.c:2635:44: error: passing argument 3 of 'prepare_trampoline' from incompatible pointer type [-Wincompatible-pointer-types]
    2635 |         ret = prepare_trampoline(&ctx, im, tlinks, func_addr, m, &aaux, flags);
         |                                            ^~~~~~
         |                                            |
         |                                            struct bpf_tramp_links *
   arch/arm64/net/bpf_jit_comp.c:2344:55: note: expected 'struct bpf_tramp_links *' but argument is of type 'struct bpf_tramp_links *'
    2344 |                               struct bpf_tramp_links *tlinks, void *func_addr,
         |                               ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~


vim +2119 arch/arm64/net/bpf_jit_comp.c

b2ad54e1533e91 Xu Kuohai        2022-07-11  2111  
efc9909fdce00a Xu Kuohai        2022-07-11 @2112  static void invoke_bpf_prog(struct jit_ctx *ctx, struct bpf_tramp_link *l,
9014cf56f13d8c Xu Kuohai        2025-05-27  2113  			    int bargs_off, int retval_off, int run_ctx_off,
efc9909fdce00a Xu Kuohai        2022-07-11  2114  			    bool save_ret)
efc9909fdce00a Xu Kuohai        2022-07-11  2115  {
aada476655461a Xu Kuohai        2022-08-08  2116  	__le32 *branch;
efc9909fdce00a Xu Kuohai        2022-07-11  2117  	u64 enter_prog;
efc9909fdce00a Xu Kuohai        2022-07-11  2118  	u64 exit_prog;
efc9909fdce00a Xu Kuohai        2022-07-11 @2119  	struct bpf_prog *p = l->link.prog;
efc9909fdce00a Xu Kuohai        2022-07-11  2120  	int cookie_off = offsetof(struct bpf_tramp_run_ctx, bpf_cookie);
efc9909fdce00a Xu Kuohai        2022-07-11  2121  
271de525e1d7f5 Martin KaFai Lau 2022-10-25  2122  	enter_prog = (u64)bpf_trampoline_enter(p);
271de525e1d7f5 Martin KaFai Lau 2022-10-25  2123  	exit_prog = (u64)bpf_trampoline_exit(p);
efc9909fdce00a Xu Kuohai        2022-07-11  2124  
efc9909fdce00a Xu Kuohai        2022-07-11  2125  	if (l->cookie == 0) {
efc9909fdce00a Xu Kuohai        2022-07-11  2126  		/* if cookie is zero, one instruction is enough to store it */
efc9909fdce00a Xu Kuohai        2022-07-11  2127  		emit(A64_STR64I(A64_ZR, A64_SP, run_ctx_off + cookie_off), ctx);
efc9909fdce00a Xu Kuohai        2022-07-11  2128  	} else {
efc9909fdce00a Xu Kuohai        2022-07-11  2129  		emit_a64_mov_i64(A64_R(10), l->cookie, ctx);
efc9909fdce00a Xu Kuohai        2022-07-11  2130  		emit(A64_STR64I(A64_R(10), A64_SP, run_ctx_off + cookie_off),
efc9909fdce00a Xu Kuohai        2022-07-11  2131  		     ctx);
efc9909fdce00a Xu Kuohai        2022-07-11  2132  	}
efc9909fdce00a Xu Kuohai        2022-07-11  2133  
efc9909fdce00a Xu Kuohai        2022-07-11  2134  	/* save p to callee saved register x19 to avoid loading p with mov_i64
efc9909fdce00a Xu Kuohai        2022-07-11  2135  	 * each time.
efc9909fdce00a Xu Kuohai        2022-07-11  2136  	 */
efc9909fdce00a Xu Kuohai        2022-07-11  2137  	emit_addr_mov_i64(A64_R(19), (const u64)p, ctx);
efc9909fdce00a Xu Kuohai        2022-07-11  2138  
efc9909fdce00a Xu Kuohai        2022-07-11  2139  	/* arg1: prog */
efc9909fdce00a Xu Kuohai        2022-07-11  2140  	emit(A64_MOV(1, A64_R(0), A64_R(19)), ctx);
efc9909fdce00a Xu Kuohai        2022-07-11  2141  	/* arg2: &run_ctx */
efc9909fdce00a Xu Kuohai        2022-07-11  2142  	emit(A64_ADD_I(1, A64_R(1), A64_SP, run_ctx_off), ctx);
efc9909fdce00a Xu Kuohai        2022-07-11  2143  
efc9909fdce00a Xu Kuohai        2022-07-11  2144  	emit_call(enter_prog, ctx);
efc9909fdce00a Xu Kuohai        2022-07-11  2145  
dc7d7447b56bcc Xu Kuohai        2024-04-16  2146  	/* save return value to callee saved register x20 */
dc7d7447b56bcc Xu Kuohai        2024-04-16  2147  	emit(A64_MOV(1, A64_R(20), A64_R(0)), ctx);
dc7d7447b56bcc Xu Kuohai        2024-04-16  2148  
efc9909fdce00a Xu Kuohai        2022-07-11  2149  	/* if (__bpf_prog_enter(prog) == 0)
efc9909fdce00a Xu Kuohai        2022-07-11  2150  	 *         goto skip_exec_of_prog;
efc9909fdce00a Xu Kuohai        2022-07-11  2151  	 */
efc9909fdce00a Xu Kuohai        2022-07-11  2152  	branch = ctx->image + ctx->idx;
efc9909fdce00a Xu Kuohai        2022-07-11  2153  	emit(A64_NOP, ctx);
efc9909fdce00a Xu Kuohai        2022-07-11  2154  
9014cf56f13d8c Xu Kuohai        2025-05-27  2155  	emit(A64_ADD_I(1, A64_R(0), A64_SP, bargs_off), ctx);
efc9909fdce00a Xu Kuohai        2022-07-11  2156  	if (!p->jited)
efc9909fdce00a Xu Kuohai        2022-07-11  2157  		emit_addr_mov_i64(A64_R(1), (const u64)p->insnsi, ctx);
efc9909fdce00a Xu Kuohai        2022-07-11  2158  
efc9909fdce00a Xu Kuohai        2022-07-11  2159  	emit_call((const u64)p->bpf_func, ctx);
efc9909fdce00a Xu Kuohai        2022-07-11  2160  
efc9909fdce00a Xu Kuohai        2022-07-11  2161  	if (save_ret)
efc9909fdce00a Xu Kuohai        2022-07-11  2162  		emit(A64_STR64I(A64_R(0), A64_SP, retval_off), ctx);
efc9909fdce00a Xu Kuohai        2022-07-11  2163  
efc9909fdce00a Xu Kuohai        2022-07-11  2164  	if (ctx->image) {
efc9909fdce00a Xu Kuohai        2022-07-11  2165  		int offset = &ctx->image[ctx->idx] - branch;
aada476655461a Xu Kuohai        2022-08-08  2166  		*branch = cpu_to_le32(A64_CBZ(1, A64_R(0), offset));
efc9909fdce00a Xu Kuohai        2022-07-11  2167  	}
efc9909fdce00a Xu Kuohai        2022-07-11  2168  
efc9909fdce00a Xu Kuohai        2022-07-11  2169  	/* arg1: prog */
efc9909fdce00a Xu Kuohai        2022-07-11  2170  	emit(A64_MOV(1, A64_R(0), A64_R(19)), ctx);
efc9909fdce00a Xu Kuohai        2022-07-11  2171  	/* arg2: start time */
efc9909fdce00a Xu Kuohai        2022-07-11  2172  	emit(A64_MOV(1, A64_R(1), A64_R(20)), ctx);
efc9909fdce00a Xu Kuohai        2022-07-11  2173  	/* arg3: &run_ctx */
efc9909fdce00a Xu Kuohai        2022-07-11  2174  	emit(A64_ADD_I(1, A64_R(2), A64_SP, run_ctx_off), ctx);
efc9909fdce00a Xu Kuohai        2022-07-11  2175  
efc9909fdce00a Xu Kuohai        2022-07-11  2176  	emit_call(exit_prog, ctx);
efc9909fdce00a Xu Kuohai        2022-07-11  2177  }
efc9909fdce00a Xu Kuohai        2022-07-11  2178  
efc9909fdce00a Xu Kuohai        2022-07-11 @2179  static void invoke_bpf_mod_ret(struct jit_ctx *ctx, struct bpf_tramp_links *tl,
9014cf56f13d8c Xu Kuohai        2025-05-27  2180  			       int bargs_off, int retval_off, int run_ctx_off,
aada476655461a Xu Kuohai        2022-08-08  2181  			       __le32 **branches)
efc9909fdce00a Xu Kuohai        2022-07-11  2182  {
efc9909fdce00a Xu Kuohai        2022-07-11  2183  	int i;
efc9909fdce00a Xu Kuohai        2022-07-11  2184  
efc9909fdce00a Xu Kuohai        2022-07-11  2185  	/* The first fmod_ret program will receive a garbage return value.
efc9909fdce00a Xu Kuohai        2022-07-11  2186  	 * Set this to 0 to avoid confusing the program.
efc9909fdce00a Xu Kuohai        2022-07-11  2187  	 */
efc9909fdce00a Xu Kuohai        2022-07-11  2188  	emit(A64_STR64I(A64_ZR, A64_SP, retval_off), ctx);
efc9909fdce00a Xu Kuohai        2022-07-11 @2189  	for (i = 0; i < tl->nr_links; i++) {
9014cf56f13d8c Xu Kuohai        2025-05-27  2190  		invoke_bpf_prog(ctx, tl->links[i], bargs_off, retval_off,
efc9909fdce00a Xu Kuohai        2022-07-11  2191  				run_ctx_off, true);
efc9909fdce00a Xu Kuohai        2022-07-11  2192  		/* if (*(u64 *)(sp + retval_off) !=  0)
efc9909fdce00a Xu Kuohai        2022-07-11  2193  		 *	goto do_fexit;
efc9909fdce00a Xu Kuohai        2022-07-11  2194  		 */
efc9909fdce00a Xu Kuohai        2022-07-11  2195  		emit(A64_LDR64I(A64_R(10), A64_SP, retval_off), ctx);
efc9909fdce00a Xu Kuohai        2022-07-11  2196  		/* Save the location of branch, and generate a nop.
efc9909fdce00a Xu Kuohai        2022-07-11  2197  		 * This nop will be replaced with a cbnz later.
efc9909fdce00a Xu Kuohai        2022-07-11  2198  		 */
efc9909fdce00a Xu Kuohai        2022-07-11  2199  		branches[i] = ctx->image + ctx->idx;
efc9909fdce00a Xu Kuohai        2022-07-11  2200  		emit(A64_NOP, ctx);
efc9909fdce00a Xu Kuohai        2022-07-11  2201  	}
efc9909fdce00a Xu Kuohai        2022-07-11  2202  }
efc9909fdce00a Xu Kuohai        2022-07-11  2203  

:::::: The code at line 2119 was first introduced by commit
:::::: efc9909fdce00a827a37609628223cd45bf95d0b bpf, arm64: Add bpf trampoline for arm64

:::::: TO: Xu Kuohai <xukuohai@huawei.com>
:::::: CC: Daniel Borkmann <daniel@iogearbox.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

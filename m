Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 475323EBF04
	for <oe-kbuild-all@lists.linux.dev>; Sat, 31 Jan 2026 06:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769841139; cv=none; b=q1+bU65DOmn1q3CMwG6N7FS48fdlhNS2SweEerZF7pEVAnXgRfwOok3S8UwHzVKPeVuXuBPCYRBFQzpp6aPEAb9GrdCxvwnCF/XsYJvPNSUk2dZS8Fen9pZKu0nbJPNQkcgrWOOmdS04mA+UUdulUGvNxO1CnroAhkB2XEp2dHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769841139; c=relaxed/simple;
	bh=cjr9lacH2cNKNTfLUqwMsyd/fVXCcGpPhllDHbve8QM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qpG7Ux/wms45H1Z/dq2MvHfzoGcVOsfeAJ9AQTdqQbSa4Dq6Ub00IVB0rb2EIfAZ62zFRN88N0kM3su1JhfjjmFB7u5RrXioMOoDVuw/oQUS+HAy+vj5TMjgGiTWOHz3X/dPfkzA3p8AzvsrSRzM0l+JzBwUckfPG23vwOlQOyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DojwRFMW; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DojwRFMW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769841136; x=1801377136;
  h=date:from:to:cc:subject:message-id;
  bh=cjr9lacH2cNKNTfLUqwMsyd/fVXCcGpPhllDHbve8QM=;
  b=DojwRFMWt+XgsfbICz5OOIIOgKm1gjred5Fyg64vfxnIOPEw/wmPSjeK
   cEyl7nCida/K3yuHlFkAQj99+J5BDFnboYn9OfNkUS4dTPvRrrAVzP1kS
   7nCR3/+96BTeNdhvshWxVueiYTuVwQBsKD6iRxFG61A/eMmTJq2LMgp26
   l4rFbx/41cmXAQnIi1ylQa4aV+k8ad6lesoL7jOX6Y6kqybhB3CRR7quZ
   53JyvcSEYkBQlDcL2TsUcFtx4qTN4AUZ70m7aMhiti5K5I/8EM06FJx/j
   hlZZXDLhRklRwLwhU71O7wdDy0REqvT/zaEIRZhS1LR/fkwreROVwduss
   w==;
X-CSE-ConnectionGUID: r4yQivhoT5yMGDThzyq6pA==
X-CSE-MsgGUID: 8sAD8pcwTd6QHNOEaS+KuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11687"; a="71170303"
X-IronPort-AV: E=Sophos;i="6.21,264,1763452800"; 
   d="scan'208";a="71170303"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2026 22:32:15 -0800
X-CSE-ConnectionGUID: 7vV54zP5TpyzsJuZibT5Yw==
X-CSE-MsgGUID: p11T+pN9S/2xgmKz8LtgBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,264,1763452800"; 
   d="scan'208";a="208150951"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 30 Jan 2026 22:32:14 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vm4Wh-000000002er-1x0Z;
	Sat, 31 Jan 2026 06:32:11 +0000
Date: Sat, 31 Jan 2026 07:31:15 +0100
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:bpf/tracing_multi_9 3/12]
 arch/arm64/net/bpf_jit_comp.c:2311:9: error: no member named 'cookie' in
 'struct bpf_tramp_link'
Message-ID: <202601310745.maOTHc2a-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bpf/tracing_multi_9
head:   4a1d38e3df06743886a06b547187aec8023ef27d
commit: 79e86aac9eaf3b5bdb4db339fb6082022ef69eb9 [3/12] bpf: Add struct bpf_tramp_node object
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260131/202601310745.maOTHc2a-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260131/202601310745.maOTHc2a-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601310745.maOTHc2a-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> arch/arm64/net/bpf_jit_comp.c:2311:9: error: no member named 'cookie' in 'struct bpf_tramp_link'
    2311 |         if (l->cookie == 0) {
         |             ~  ^
   arch/arm64/net/bpf_jit_comp.c:2315:34: error: no member named 'cookie' in 'struct bpf_tramp_link'
    2315 |                 emit_a64_mov_i64(A64_R(10), l->cookie, ctx);
         |                                             ~  ^
>> arch/arm64/net/bpf_jit_comp.c:2365:60: warning: declaration of 'struct bpf_tramp_links' will not be visible outside of this function [-Wvisibility]
    2365 | static void invoke_bpf_mod_ret(struct jit_ctx *ctx, struct bpf_tramp_links *tl,
         |                                                            ^
>> arch/arm64/net/bpf_jit_comp.c:2375:20: error: incomplete definition of type 'struct bpf_tramp_links'
    2375 |         for (i = 0; i < tl->nr_links; i++) {
         |                         ~~^
   arch/arm64/net/bpf_jit_comp.c:2365:60: note: forward declaration of 'struct bpf_tramp_links'
    2365 | static void invoke_bpf_mod_ret(struct jit_ctx *ctx, struct bpf_tramp_links *tl,
         |                                                            ^
   arch/arm64/net/bpf_jit_comp.c:2376:26: error: incomplete definition of type 'struct bpf_tramp_links'
    2376 |                 invoke_bpf_prog(ctx, tl->links[i], bargs_off, retval_off,
         |                                      ~~^
   arch/arm64/net/bpf_jit_comp.c:2365:60: note: forward declaration of 'struct bpf_tramp_links'
    2365 | static void invoke_bpf_mod_ret(struct jit_ctx *ctx, struct bpf_tramp_links *tl,
         |                                                            ^
   arch/arm64/net/bpf_jit_comp.c:2507:46: warning: declaration of 'struct bpf_tramp_links' will not be visible outside of this function [-Wvisibility]
    2507 | static bool is_struct_ops_tramp(const struct bpf_tramp_links *fentry_links)
         |                                              ^
>> arch/arm64/net/bpf_jit_comp.c:2509:21: error: incomplete definition of type 'const struct bpf_tramp_links'
    2509 |         return fentry_links->nr_links == 1 &&
         |                ~~~~~~~~~~~~^
   arch/arm64/net/bpf_jit_comp.c:2507:46: note: forward declaration of 'struct bpf_tramp_links'
    2507 | static bool is_struct_ops_tramp(const struct bpf_tramp_links *fentry_links)
         |                                              ^
   arch/arm64/net/bpf_jit_comp.c:2510:15: error: incomplete definition of type 'const struct bpf_tramp_links'
    2510 |                 fentry_links->links[0]->link.type == BPF_LINK_TYPE_STRUCT_OPS;
         |                 ~~~~~~~~~~~~^
   arch/arm64/net/bpf_jit_comp.c:2507:46: note: forward declaration of 'struct bpf_tramp_links'
    2507 | static bool is_struct_ops_tramp(const struct bpf_tramp_links *fentry_links)
         |                                              ^
   arch/arm64/net/bpf_jit_comp.c:2525:17: warning: declaration of 'struct bpf_tramp_links' will not be visible outside of this function [-Wvisibility]
    2525 |                               struct bpf_tramp_links *tlinks, void *func_addr,
         |                                      ^
>> arch/arm64/net/bpf_jit_comp.c:2541:42: error: subscript of pointer to incomplete type 'struct bpf_tramp_links'
    2541 |         struct bpf_tramp_links *fentry = &tlinks[BPF_TRAMP_FENTRY];
         |                                           ~~~~~~^
   arch/arm64/net/bpf_jit_comp.c:2525:17: note: forward declaration of 'struct bpf_tramp_links'
    2525 |                               struct bpf_tramp_links *tlinks, void *func_addr,
         |                                      ^
   arch/arm64/net/bpf_jit_comp.c:2542:41: error: subscript of pointer to incomplete type 'struct bpf_tramp_links'
    2542 |         struct bpf_tramp_links *fexit = &tlinks[BPF_TRAMP_FEXIT];
         |                                          ~~~~~~^
   arch/arm64/net/bpf_jit_comp.c:2525:17: note: forward declaration of 'struct bpf_tramp_links'
    2525 |                               struct bpf_tramp_links *tlinks, void *func_addr,
         |                                      ^
   arch/arm64/net/bpf_jit_comp.c:2543:44: error: subscript of pointer to incomplete type 'struct bpf_tramp_links'
    2543 |         struct bpf_tramp_links *fmod_ret = &tlinks[BPF_TRAMP_MODIFY_RETURN];
         |                                             ~~~~~~^
   arch/arm64/net/bpf_jit_comp.c:2525:17: note: forward declaration of 'struct bpf_tramp_links'
    2525 |                               struct bpf_tramp_links *tlinks, void *func_addr,
         |                                      ^
>> arch/arm64/net/bpf_jit_comp.c:2546:43: error: incompatible pointer types passing 'struct bpf_tramp_links *' to parameter of type 'const struct bpf_tramp_links *' [-Wincompatible-pointer-types]
    2546 |         bool is_struct_ops = is_struct_ops_tramp(fentry);
         |                                                  ^~~~~~
   arch/arm64/net/bpf_jit_comp.c:2507:63: note: passing argument to parameter 'fentry_links' here
    2507 | static bool is_struct_ops_tramp(const struct bpf_tramp_links *fentry_links)
         |                                                               ^
   arch/arm64/net/bpf_jit_comp.c:2669:24: error: incomplete definition of type 'struct bpf_tramp_links'
    2669 |         for (i = 0; i < fentry->nr_links; i++)
         |                         ~~~~~~^
   arch/arm64/net/bpf_jit_comp.c:2525:17: note: forward declaration of 'struct bpf_tramp_links'
    2525 |                               struct bpf_tramp_links *tlinks, void *func_addr,
         |                                      ^
   arch/arm64/net/bpf_jit_comp.c:2670:30: error: incomplete definition of type 'struct bpf_tramp_links'
    2670 |                 invoke_bpf_prog(ctx, fentry->links[i], bargs_off,
         |                                      ~~~~~~^
   arch/arm64/net/bpf_jit_comp.c:2525:17: note: forward declaration of 'struct bpf_tramp_links'
    2525 |                               struct bpf_tramp_links *tlinks, void *func_addr,
         |                                      ^
   arch/arm64/net/bpf_jit_comp.c:2674:14: error: incomplete definition of type 'struct bpf_tramp_links'
    2674 |         if (fmod_ret->nr_links) {
         |             ~~~~~~~~^
   arch/arm64/net/bpf_jit_comp.c:2525:17: note: forward declaration of 'struct bpf_tramp_links'
    2525 |                               struct bpf_tramp_links *tlinks, void *func_addr,
         |                                      ^
   arch/arm64/net/bpf_jit_comp.c:2675:30: error: incomplete definition of type 'struct bpf_tramp_links'
    2675 |                 branches = kcalloc(fmod_ret->nr_links, sizeof(__le32 *),
         |                                    ~~~~~~~~^
   arch/arm64/net/bpf_jit_comp.c:2525:17: note: forward declaration of 'struct bpf_tramp_links'
    2525 |                               struct bpf_tramp_links *tlinks, void *func_addr,
         |                                      ^
   arch/arm64/net/bpf_jit_comp.c:2675:30: error: incomplete definition of type 'struct bpf_tramp_links'
    2675 |                 branches = kcalloc(fmod_ret->nr_links, sizeof(__le32 *),
         |                                    ~~~~~~~~^
   arch/arm64/net/bpf_jit_comp.c:2525:17: note: forward declaration of 'struct bpf_tramp_links'
    2525 |                               struct bpf_tramp_links *tlinks, void *func_addr,
         |                                      ^
   arch/arm64/net/bpf_jit_comp.c:2675:30: error: incomplete definition of type 'struct bpf_tramp_links'
    2675 |                 branches = kcalloc(fmod_ret->nr_links, sizeof(__le32 *),
         |                                    ~~~~~~~~^
   arch/arm64/net/bpf_jit_comp.c:2525:17: note: forward declaration of 'struct bpf_tramp_links'
    2525 |                               struct bpf_tramp_links *tlinks, void *func_addr,
         |                                      ^
>> arch/arm64/net/bpf_jit_comp.c:2680:27: error: incompatible pointer types passing 'struct bpf_tramp_links *' to parameter of type 'struct bpf_tramp_links *' [-Wincompatible-pointer-types]
    2680 |                 invoke_bpf_mod_ret(ctx, fmod_ret, bargs_off, retval_off,
         |                                         ^~~~~~~~
   arch/arm64/net/bpf_jit_comp.c:2365:77: note: passing argument to parameter 'tl' here
    2365 | static void invoke_bpf_mod_ret(struct jit_ctx *ctx, struct bpf_tramp_links *tl,
         |                                                                             ^
   arch/arm64/net/bpf_jit_comp.c:2699:26: error: incomplete definition of type 'struct bpf_tramp_links'
    2699 |         for (i = 0; i < fmod_ret->nr_links && ctx->image != NULL; i++) {
         |                         ~~~~~~~~^
   arch/arm64/net/bpf_jit_comp.c:2525:17: note: forward declaration of 'struct bpf_tramp_links'
    2525 |                               struct bpf_tramp_links *tlinks, void *func_addr,
         |                                      ^
   arch/arm64/net/bpf_jit_comp.c:2704:23: error: incomplete definition of type 'struct bpf_tramp_links'
    2704 |         for (i = 0; i < fexit->nr_links; i++)
         |                         ~~~~~^
   arch/arm64/net/bpf_jit_comp.c:2525:17: note: forward declaration of 'struct bpf_tramp_links'
    2525 |                               struct bpf_tramp_links *tlinks, void *func_addr,
         |                                      ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   3 warnings and 20 errors generated.


vim +2311 arch/arm64/net/bpf_jit_comp.c

b2ad54e1533e91 Xu Kuohai        2022-07-11  2297  
efc9909fdce00a Xu Kuohai        2022-07-11  2298  static void invoke_bpf_prog(struct jit_ctx *ctx, struct bpf_tramp_link *l,
9014cf56f13d8c Xu Kuohai        2025-05-27  2299  			    int bargs_off, int retval_off, int run_ctx_off,
efc9909fdce00a Xu Kuohai        2022-07-11  2300  			    bool save_ret)
efc9909fdce00a Xu Kuohai        2022-07-11  2301  {
aada476655461a Xu Kuohai        2022-08-08  2302  	__le32 *branch;
efc9909fdce00a Xu Kuohai        2022-07-11  2303  	u64 enter_prog;
efc9909fdce00a Xu Kuohai        2022-07-11  2304  	u64 exit_prog;
efc9909fdce00a Xu Kuohai        2022-07-11  2305  	struct bpf_prog *p = l->link.prog;
efc9909fdce00a Xu Kuohai        2022-07-11  2306  	int cookie_off = offsetof(struct bpf_tramp_run_ctx, bpf_cookie);
efc9909fdce00a Xu Kuohai        2022-07-11  2307  
271de525e1d7f5 Martin KaFai Lau 2022-10-25  2308  	enter_prog = (u64)bpf_trampoline_enter(p);
271de525e1d7f5 Martin KaFai Lau 2022-10-25  2309  	exit_prog = (u64)bpf_trampoline_exit(p);
efc9909fdce00a Xu Kuohai        2022-07-11  2310  
efc9909fdce00a Xu Kuohai        2022-07-11 @2311  	if (l->cookie == 0) {
efc9909fdce00a Xu Kuohai        2022-07-11  2312  		/* if cookie is zero, one instruction is enough to store it */
efc9909fdce00a Xu Kuohai        2022-07-11  2313  		emit(A64_STR64I(A64_ZR, A64_SP, run_ctx_off + cookie_off), ctx);
efc9909fdce00a Xu Kuohai        2022-07-11  2314  	} else {
efc9909fdce00a Xu Kuohai        2022-07-11  2315  		emit_a64_mov_i64(A64_R(10), l->cookie, ctx);
efc9909fdce00a Xu Kuohai        2022-07-11  2316  		emit(A64_STR64I(A64_R(10), A64_SP, run_ctx_off + cookie_off),
efc9909fdce00a Xu Kuohai        2022-07-11  2317  		     ctx);
efc9909fdce00a Xu Kuohai        2022-07-11  2318  	}
efc9909fdce00a Xu Kuohai        2022-07-11  2319  
efc9909fdce00a Xu Kuohai        2022-07-11  2320  	/* save p to callee saved register x19 to avoid loading p with mov_i64
efc9909fdce00a Xu Kuohai        2022-07-11  2321  	 * each time.
efc9909fdce00a Xu Kuohai        2022-07-11  2322  	 */
efc9909fdce00a Xu Kuohai        2022-07-11  2323  	emit_addr_mov_i64(A64_R(19), (const u64)p, ctx);
efc9909fdce00a Xu Kuohai        2022-07-11  2324  
efc9909fdce00a Xu Kuohai        2022-07-11  2325  	/* arg1: prog */
efc9909fdce00a Xu Kuohai        2022-07-11  2326  	emit(A64_MOV(1, A64_R(0), A64_R(19)), ctx);
efc9909fdce00a Xu Kuohai        2022-07-11  2327  	/* arg2: &run_ctx */
efc9909fdce00a Xu Kuohai        2022-07-11  2328  	emit(A64_ADD_I(1, A64_R(1), A64_SP, run_ctx_off), ctx);
efc9909fdce00a Xu Kuohai        2022-07-11  2329  
efc9909fdce00a Xu Kuohai        2022-07-11  2330  	emit_call(enter_prog, ctx);
efc9909fdce00a Xu Kuohai        2022-07-11  2331  
dc7d7447b56bcc Xu Kuohai        2024-04-16  2332  	/* save return value to callee saved register x20 */
dc7d7447b56bcc Xu Kuohai        2024-04-16  2333  	emit(A64_MOV(1, A64_R(20), A64_R(0)), ctx);
dc7d7447b56bcc Xu Kuohai        2024-04-16  2334  
efc9909fdce00a Xu Kuohai        2022-07-11  2335  	/* if (__bpf_prog_enter(prog) == 0)
efc9909fdce00a Xu Kuohai        2022-07-11  2336  	 *         goto skip_exec_of_prog;
efc9909fdce00a Xu Kuohai        2022-07-11  2337  	 */
efc9909fdce00a Xu Kuohai        2022-07-11  2338  	branch = ctx->image + ctx->idx;
efc9909fdce00a Xu Kuohai        2022-07-11  2339  	emit(A64_NOP, ctx);
efc9909fdce00a Xu Kuohai        2022-07-11  2340  
9014cf56f13d8c Xu Kuohai        2025-05-27  2341  	emit(A64_ADD_I(1, A64_R(0), A64_SP, bargs_off), ctx);
efc9909fdce00a Xu Kuohai        2022-07-11  2342  	if (!p->jited)
efc9909fdce00a Xu Kuohai        2022-07-11  2343  		emit_addr_mov_i64(A64_R(1), (const u64)p->insnsi, ctx);
efc9909fdce00a Xu Kuohai        2022-07-11  2344  
efc9909fdce00a Xu Kuohai        2022-07-11  2345  	emit_call((const u64)p->bpf_func, ctx);
efc9909fdce00a Xu Kuohai        2022-07-11  2346  
efc9909fdce00a Xu Kuohai        2022-07-11  2347  	if (save_ret)
efc9909fdce00a Xu Kuohai        2022-07-11  2348  		emit(A64_STR64I(A64_R(0), A64_SP, retval_off), ctx);
efc9909fdce00a Xu Kuohai        2022-07-11  2349  
efc9909fdce00a Xu Kuohai        2022-07-11  2350  	if (ctx->image) {
efc9909fdce00a Xu Kuohai        2022-07-11  2351  		int offset = &ctx->image[ctx->idx] - branch;
aada476655461a Xu Kuohai        2022-08-08  2352  		*branch = cpu_to_le32(A64_CBZ(1, A64_R(0), offset));
efc9909fdce00a Xu Kuohai        2022-07-11  2353  	}
efc9909fdce00a Xu Kuohai        2022-07-11  2354  
efc9909fdce00a Xu Kuohai        2022-07-11  2355  	/* arg1: prog */
efc9909fdce00a Xu Kuohai        2022-07-11  2356  	emit(A64_MOV(1, A64_R(0), A64_R(19)), ctx);
efc9909fdce00a Xu Kuohai        2022-07-11  2357  	/* arg2: start time */
efc9909fdce00a Xu Kuohai        2022-07-11  2358  	emit(A64_MOV(1, A64_R(1), A64_R(20)), ctx);
efc9909fdce00a Xu Kuohai        2022-07-11  2359  	/* arg3: &run_ctx */
efc9909fdce00a Xu Kuohai        2022-07-11  2360  	emit(A64_ADD_I(1, A64_R(2), A64_SP, run_ctx_off), ctx);
efc9909fdce00a Xu Kuohai        2022-07-11  2361  
efc9909fdce00a Xu Kuohai        2022-07-11  2362  	emit_call(exit_prog, ctx);
efc9909fdce00a Xu Kuohai        2022-07-11  2363  }
efc9909fdce00a Xu Kuohai        2022-07-11  2364  
efc9909fdce00a Xu Kuohai        2022-07-11 @2365  static void invoke_bpf_mod_ret(struct jit_ctx *ctx, struct bpf_tramp_links *tl,
9014cf56f13d8c Xu Kuohai        2025-05-27  2366  			       int bargs_off, int retval_off, int run_ctx_off,
aada476655461a Xu Kuohai        2022-08-08  2367  			       __le32 **branches)
efc9909fdce00a Xu Kuohai        2022-07-11  2368  {
efc9909fdce00a Xu Kuohai        2022-07-11  2369  	int i;
efc9909fdce00a Xu Kuohai        2022-07-11  2370  
efc9909fdce00a Xu Kuohai        2022-07-11  2371  	/* The first fmod_ret program will receive a garbage return value.
efc9909fdce00a Xu Kuohai        2022-07-11  2372  	 * Set this to 0 to avoid confusing the program.
efc9909fdce00a Xu Kuohai        2022-07-11  2373  	 */
efc9909fdce00a Xu Kuohai        2022-07-11  2374  	emit(A64_STR64I(A64_ZR, A64_SP, retval_off), ctx);
efc9909fdce00a Xu Kuohai        2022-07-11 @2375  	for (i = 0; i < tl->nr_links; i++) {
9014cf56f13d8c Xu Kuohai        2025-05-27  2376  		invoke_bpf_prog(ctx, tl->links[i], bargs_off, retval_off,
efc9909fdce00a Xu Kuohai        2022-07-11  2377  				run_ctx_off, true);
efc9909fdce00a Xu Kuohai        2022-07-11  2378  		/* if (*(u64 *)(sp + retval_off) !=  0)
efc9909fdce00a Xu Kuohai        2022-07-11  2379  		 *	goto do_fexit;
efc9909fdce00a Xu Kuohai        2022-07-11  2380  		 */
efc9909fdce00a Xu Kuohai        2022-07-11  2381  		emit(A64_LDR64I(A64_R(10), A64_SP, retval_off), ctx);
efc9909fdce00a Xu Kuohai        2022-07-11  2382  		/* Save the location of branch, and generate a nop.
efc9909fdce00a Xu Kuohai        2022-07-11  2383  		 * This nop will be replaced with a cbnz later.
efc9909fdce00a Xu Kuohai        2022-07-11  2384  		 */
efc9909fdce00a Xu Kuohai        2022-07-11  2385  		branches[i] = ctx->image + ctx->idx;
efc9909fdce00a Xu Kuohai        2022-07-11  2386  		emit(A64_NOP, ctx);
efc9909fdce00a Xu Kuohai        2022-07-11  2387  	}
efc9909fdce00a Xu Kuohai        2022-07-11  2388  }
efc9909fdce00a Xu Kuohai        2022-07-11  2389  
9014cf56f13d8c Xu Kuohai        2025-05-27  2390  struct arg_aux {
9014cf56f13d8c Xu Kuohai        2025-05-27  2391  	/* how many args are passed through registers, the rest of the args are
9014cf56f13d8c Xu Kuohai        2025-05-27  2392  	 * passed through stack
9014cf56f13d8c Xu Kuohai        2025-05-27  2393  	 */
9014cf56f13d8c Xu Kuohai        2025-05-27  2394  	int args_in_regs;
9014cf56f13d8c Xu Kuohai        2025-05-27  2395  	/* how many registers are used to pass arguments */
9014cf56f13d8c Xu Kuohai        2025-05-27  2396  	int regs_for_args;
9014cf56f13d8c Xu Kuohai        2025-05-27  2397  	/* how much stack is used for additional args passed to bpf program
9014cf56f13d8c Xu Kuohai        2025-05-27  2398  	 * that did not fit in original function registers
9014cf56f13d8c Xu Kuohai        2025-05-27  2399  	 */
9014cf56f13d8c Xu Kuohai        2025-05-27  2400  	int bstack_for_args;
9014cf56f13d8c Xu Kuohai        2025-05-27  2401  	/* home much stack is used for additional args passed to the
9014cf56f13d8c Xu Kuohai        2025-05-27  2402  	 * original function when called from trampoline (this one needs
9014cf56f13d8c Xu Kuohai        2025-05-27  2403  	 * arguments to be properly aligned)
9014cf56f13d8c Xu Kuohai        2025-05-27  2404  	 */
9014cf56f13d8c Xu Kuohai        2025-05-27  2405  	int ostack_for_args;
9014cf56f13d8c Xu Kuohai        2025-05-27  2406  };
9014cf56f13d8c Xu Kuohai        2025-05-27  2407  
9014cf56f13d8c Xu Kuohai        2025-05-27  2408  static int calc_arg_aux(const struct btf_func_model *m,
9014cf56f13d8c Xu Kuohai        2025-05-27  2409  			 struct arg_aux *a)
efc9909fdce00a Xu Kuohai        2022-07-11  2410  {
9014cf56f13d8c Xu Kuohai        2025-05-27  2411  	int stack_slots, nregs, slots, i;
efc9909fdce00a Xu Kuohai        2022-07-11  2412  
9014cf56f13d8c Xu Kuohai        2025-05-27  2413  	/* verifier ensures m->nr_args <= MAX_BPF_FUNC_ARGS */
9014cf56f13d8c Xu Kuohai        2025-05-27  2414  	for (i = 0, nregs = 0; i < m->nr_args; i++) {
9014cf56f13d8c Xu Kuohai        2025-05-27  2415  		slots = (m->arg_size[i] + 7) / 8;
9014cf56f13d8c Xu Kuohai        2025-05-27  2416  		if (nregs + slots <= 8) /* passed through register ? */
9014cf56f13d8c Xu Kuohai        2025-05-27  2417  			nregs += slots;
9014cf56f13d8c Xu Kuohai        2025-05-27  2418  		else
9014cf56f13d8c Xu Kuohai        2025-05-27  2419  			break;
efc9909fdce00a Xu Kuohai        2022-07-11  2420  	}
9014cf56f13d8c Xu Kuohai        2025-05-27  2421  
9014cf56f13d8c Xu Kuohai        2025-05-27  2422  	a->args_in_regs = i;
9014cf56f13d8c Xu Kuohai        2025-05-27  2423  	a->regs_for_args = nregs;
9014cf56f13d8c Xu Kuohai        2025-05-27  2424  	a->ostack_for_args = 0;
9014cf56f13d8c Xu Kuohai        2025-05-27  2425  	a->bstack_for_args = 0;
9014cf56f13d8c Xu Kuohai        2025-05-27  2426  
9014cf56f13d8c Xu Kuohai        2025-05-27  2427  	/* the rest arguments are passed through stack */
9014cf56f13d8c Xu Kuohai        2025-05-27  2428  	for (; i < m->nr_args; i++) {
9014cf56f13d8c Xu Kuohai        2025-05-27  2429  		stack_slots = (m->arg_size[i] + 7) / 8;
9014cf56f13d8c Xu Kuohai        2025-05-27  2430  		a->bstack_for_args += stack_slots * 8;
9014cf56f13d8c Xu Kuohai        2025-05-27  2431  		a->ostack_for_args = a->ostack_for_args + stack_slots * 8;
efc9909fdce00a Xu Kuohai        2022-07-11  2432  	}
efc9909fdce00a Xu Kuohai        2022-07-11  2433  
9014cf56f13d8c Xu Kuohai        2025-05-27  2434  	return 0;
9014cf56f13d8c Xu Kuohai        2025-05-27  2435  }
9014cf56f13d8c Xu Kuohai        2025-05-27  2436  
9014cf56f13d8c Xu Kuohai        2025-05-27  2437  static void clear_garbage(struct jit_ctx *ctx, int reg, int effective_bytes)
9014cf56f13d8c Xu Kuohai        2025-05-27  2438  {
9014cf56f13d8c Xu Kuohai        2025-05-27  2439  	if (effective_bytes) {
9014cf56f13d8c Xu Kuohai        2025-05-27  2440  		int garbage_bits = 64 - 8 * effective_bytes;
9014cf56f13d8c Xu Kuohai        2025-05-27  2441  #ifdef CONFIG_CPU_BIG_ENDIAN
9014cf56f13d8c Xu Kuohai        2025-05-27  2442  		/* garbage bits are at the right end */
9014cf56f13d8c Xu Kuohai        2025-05-27  2443  		emit(A64_LSR(1, reg, reg, garbage_bits), ctx);
9014cf56f13d8c Xu Kuohai        2025-05-27  2444  		emit(A64_LSL(1, reg, reg, garbage_bits), ctx);
9014cf56f13d8c Xu Kuohai        2025-05-27  2445  #else
9014cf56f13d8c Xu Kuohai        2025-05-27  2446  		/* garbage bits are at the left end */
9014cf56f13d8c Xu Kuohai        2025-05-27  2447  		emit(A64_LSL(1, reg, reg, garbage_bits), ctx);
9014cf56f13d8c Xu Kuohai        2025-05-27  2448  		emit(A64_LSR(1, reg, reg, garbage_bits), ctx);
9014cf56f13d8c Xu Kuohai        2025-05-27  2449  #endif
efc9909fdce00a Xu Kuohai        2022-07-11  2450  	}
efc9909fdce00a Xu Kuohai        2022-07-11  2451  }
efc9909fdce00a Xu Kuohai        2022-07-11  2452  
9014cf56f13d8c Xu Kuohai        2025-05-27  2453  static void save_args(struct jit_ctx *ctx, int bargs_off, int oargs_off,
9014cf56f13d8c Xu Kuohai        2025-05-27  2454  		      const struct btf_func_model *m,
9014cf56f13d8c Xu Kuohai        2025-05-27  2455  		      const struct arg_aux *a,
9014cf56f13d8c Xu Kuohai        2025-05-27  2456  		      bool for_call_origin)
efc9909fdce00a Xu Kuohai        2022-07-11  2457  {
efc9909fdce00a Xu Kuohai        2022-07-11  2458  	int i;
9014cf56f13d8c Xu Kuohai        2025-05-27  2459  	int reg;
9014cf56f13d8c Xu Kuohai        2025-05-27  2460  	int doff;
9014cf56f13d8c Xu Kuohai        2025-05-27  2461  	int soff;
9014cf56f13d8c Xu Kuohai        2025-05-27  2462  	int slots;
9014cf56f13d8c Xu Kuohai        2025-05-27  2463  	u8 tmp = bpf2a64[TMP_REG_1];
9014cf56f13d8c Xu Kuohai        2025-05-27  2464  
9014cf56f13d8c Xu Kuohai        2025-05-27  2465  	/* store arguments to the stack for the bpf program, or restore
9014cf56f13d8c Xu Kuohai        2025-05-27  2466  	 * arguments from stack for the original function
9014cf56f13d8c Xu Kuohai        2025-05-27  2467  	 */
9014cf56f13d8c Xu Kuohai        2025-05-27  2468  	for (reg = 0; reg < a->regs_for_args; reg++) {
9014cf56f13d8c Xu Kuohai        2025-05-27  2469  		emit(for_call_origin ?
9014cf56f13d8c Xu Kuohai        2025-05-27  2470  		     A64_LDR64I(reg, A64_SP, bargs_off) :
9014cf56f13d8c Xu Kuohai        2025-05-27  2471  		     A64_STR64I(reg, A64_SP, bargs_off),
9014cf56f13d8c Xu Kuohai        2025-05-27  2472  		     ctx);
9014cf56f13d8c Xu Kuohai        2025-05-27  2473  		bargs_off += 8;
9014cf56f13d8c Xu Kuohai        2025-05-27  2474  	}
9014cf56f13d8c Xu Kuohai        2025-05-27  2475  
9014cf56f13d8c Xu Kuohai        2025-05-27  2476  	soff = 32; /* on stack arguments start from FP + 32 */
9014cf56f13d8c Xu Kuohai        2025-05-27  2477  	doff = (for_call_origin ? oargs_off : bargs_off);
9014cf56f13d8c Xu Kuohai        2025-05-27  2478  
9014cf56f13d8c Xu Kuohai        2025-05-27  2479  	/* save on stack arguments */
9014cf56f13d8c Xu Kuohai        2025-05-27  2480  	for (i = a->args_in_regs; i < m->nr_args; i++) {
9014cf56f13d8c Xu Kuohai        2025-05-27  2481  		slots = (m->arg_size[i] + 7) / 8;
9014cf56f13d8c Xu Kuohai        2025-05-27  2482  		/* verifier ensures arg_size <= 16, so slots equals 1 or 2 */
9014cf56f13d8c Xu Kuohai        2025-05-27  2483  		while (slots-- > 0) {
9014cf56f13d8c Xu Kuohai        2025-05-27  2484  			emit(A64_LDR64I(tmp, A64_FP, soff), ctx);
9014cf56f13d8c Xu Kuohai        2025-05-27  2485  			/* if there is unused space in the last slot, clear
9014cf56f13d8c Xu Kuohai        2025-05-27  2486  			 * the garbage contained in the space.
9014cf56f13d8c Xu Kuohai        2025-05-27  2487  			 */
9014cf56f13d8c Xu Kuohai        2025-05-27  2488  			if (slots == 0 && !for_call_origin)
9014cf56f13d8c Xu Kuohai        2025-05-27  2489  				clear_garbage(ctx, tmp, m->arg_size[i] % 8);
9014cf56f13d8c Xu Kuohai        2025-05-27  2490  			emit(A64_STR64I(tmp, A64_SP, doff), ctx);
9014cf56f13d8c Xu Kuohai        2025-05-27  2491  			soff += 8;
9014cf56f13d8c Xu Kuohai        2025-05-27  2492  			doff += 8;
9014cf56f13d8c Xu Kuohai        2025-05-27  2493  		}
9014cf56f13d8c Xu Kuohai        2025-05-27  2494  	}
9014cf56f13d8c Xu Kuohai        2025-05-27  2495  }
efc9909fdce00a Xu Kuohai        2022-07-11  2496  
9014cf56f13d8c Xu Kuohai        2025-05-27  2497  static void restore_args(struct jit_ctx *ctx, int bargs_off, int nregs)
9014cf56f13d8c Xu Kuohai        2025-05-27  2498  {
9014cf56f13d8c Xu Kuohai        2025-05-27  2499  	int reg;
efc9909fdce00a Xu Kuohai        2022-07-11  2500  
9014cf56f13d8c Xu Kuohai        2025-05-27  2501  	for (reg = 0; reg < nregs; reg++) {
9014cf56f13d8c Xu Kuohai        2025-05-27  2502  		emit(A64_LDR64I(reg, A64_SP, bargs_off), ctx);
9014cf56f13d8c Xu Kuohai        2025-05-27  2503  		bargs_off += 8;
efc9909fdce00a Xu Kuohai        2022-07-11  2504  	}
efc9909fdce00a Xu Kuohai        2022-07-11  2505  }
efc9909fdce00a Xu Kuohai        2022-07-11  2506  
87cb58aebdf700 Xu Kuohai        2024-10-25  2507  static bool is_struct_ops_tramp(const struct bpf_tramp_links *fentry_links)
87cb58aebdf700 Xu Kuohai        2024-10-25  2508  {
87cb58aebdf700 Xu Kuohai        2024-10-25 @2509  	return fentry_links->nr_links == 1 &&
87cb58aebdf700 Xu Kuohai        2024-10-25  2510  		fentry_links->links[0]->link.type == BPF_LINK_TYPE_STRUCT_OPS;
87cb58aebdf700 Xu Kuohai        2024-10-25  2511  }
87cb58aebdf700 Xu Kuohai        2024-10-25  2512  

:::::: The code at line 2311 was first introduced by commit
:::::: efc9909fdce00a827a37609628223cd45bf95d0b bpf, arm64: Add bpf trampoline for arm64

:::::: TO: Xu Kuohai <xukuohai@huawei.com>
:::::: CC: Daniel Borkmann <daniel@iogearbox.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

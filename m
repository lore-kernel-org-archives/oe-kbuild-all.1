Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 525722989B5
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 May 2026 03:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777953356; cv=none; b=KVekWbvq4nhgCyanxP2zAjkURivL5EixXhglxyQ4qavao+swABFlKrCOULEj7CmWsotEtEwtN2xoeFOD/nVqCsd/Q70m45raPven62qfP/YwJ/ihrEi1/TceK7mbehOf/C133DFxmLdsE2OWBiWXSgiD4sr9YvPH/V2b0Lk904g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777953356; c=relaxed/simple;
	bh=hj9w2FcBmj17Jh7cQ6k0yJCFhv/UdNwGMkHjZLYgMJk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KyKpBL0s/IXPH7Na5ODeoLnHiQd6sRTD8GN629tK4WZHa0u4QYjF+Zh4DZyJDAru3AeVFyWFHFuptfyd0BNn+WxF7QfcKIds8qozvhQEwclI+ueRKlu4Q93nkl9WrezrYds+187Km39Hhokr1gl3iM2jXYQf81I86t9XShLeqjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ypl33UVa; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ypl33UVa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777953355; x=1809489355;
  h=date:from:to:cc:subject:message-id;
  bh=hj9w2FcBmj17Jh7cQ6k0yJCFhv/UdNwGMkHjZLYgMJk=;
  b=Ypl33UVaUNUwsGRG28MhcVdNCH4Rm6JhbF0HbzmJs/DIbXkuoIyVhN6+
   uV9rHuCPOlfXr0z0pq1K1nNZIgFvZNJZuzUnKTKeO367djJH7H0LMlokk
   DX+gx3uqO0uIAWgVJTOBWhEs8sZ+9s22Uu2Av0/Ztb68l9cSOv0G6SUVW
   h6byvNT3/HJNaIB3I89FYp5U8WbuH3Toc9F/dQir0/0YWIuOZNnPlKd/F
   M54wY2AnbKjsPvWtwH/scUpFoUa7mD+Ti5jd2BJYVMpjrzFBERLrLlojd
   rqg60y6j73RaOIwOIHGQ0b9ZDvL5ckvbnXUcZ4/HD6kJvTLskiMT6CQCM
   Q==;
X-CSE-ConnectionGUID: XVtCVDwuQouaEEFlgV2rSQ==
X-CSE-MsgGUID: 1MLDxx9hTl6lI0QaBiHCsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11776"; a="89121920"
X-IronPort-AV: E=Sophos;i="6.23,216,1770624000"; 
   d="scan'208";a="89121920"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2026 20:55:54 -0700
X-CSE-ConnectionGUID: 2CAdf+TeQJCBzb5HAT7Olw==
X-CSE-MsgGUID: W8XS109hSFOqgQUbnOIfeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,216,1770624000"; 
   d="scan'208";a="266046004"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 04 May 2026 20:55:52 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wK6sw-0000000067B-1H2K;
	Tue, 05 May 2026 03:55:50 +0000
Date: Tue, 05 May 2026 05:55:27 +0200
From: kernel test robot <lkp@intel.com>
To: Amery Hung <ameryhung@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: include/linux/bpf_verifier.h:542:42: warning: variable
 '___stack' set but not used
Message-ID: <202605050547.K7yD6eCm-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Amery-Hung/bpf-Unify-dynptr-handling-in-the-verifier/20260423-084016
head:   2f05b55c2abbebede16518131d4da9dd842759e5
commit: 8d8a026071789397b6558db6fb659dc968dd5042 bpf: Refactor object relationship tracking and fix dynptr UAF bug
date:   12 days ago
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20260505/202605050547.K7yD6eCm-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260505/202605050547.K7yD6eCm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605050547.K7yD6eCm-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/bpf/verifier.c:13:
   kernel/bpf/verifier.c: In function 'clear_all_pkt_pointers':
>> include/linux/bpf_verifier.h:542:42: warning: variable '___stack' set but not used [-Wunused-but-set-variable]
     542 |                 struct bpf_stack_state * ___stack;                              \
         |                                          ^~~~~~~~
   kernel/bpf/verifier.c:9023:9: note: in expansion of macro 'bpf_for_each_reg_in_vstate'
    9023 |         bpf_for_each_reg_in_vstate(env->cur_state, state, reg, ({
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/verifier.c: In function 'invalidate_non_owning_refs':
>> include/linux/bpf_verifier.h:542:42: warning: variable '___stack' set but not used [-Wunused-but-set-variable]
     542 |                 struct bpf_stack_state * ___stack;                              \
         |                                          ^~~~~~~~
   kernel/bpf/verifier.c:9148:9: note: in expansion of macro 'bpf_for_each_reg_in_vstate'
    9148 |         bpf_for_each_reg_in_vstate(env->cur_state, unused, reg, ({
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/verifier.c: In function 'check_helper_call':
>> include/linux/bpf_verifier.h:542:42: warning: variable '___stack' set but not used [-Wunused-but-set-variable]
     542 |                 struct bpf_stack_state * ___stack;                              \
         |                                          ^~~~~~~~
   kernel/bpf/verifier.c:10286:33: note: in expansion of macro 'bpf_for_each_reg_in_vstate'
   10286 |                                 bpf_for_each_reg_in_vstate(env->cur_state, state, reg, ({
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/verifier.c: In function 'ref_convert_owning_non_owning':
>> include/linux/bpf_verifier.h:542:42: warning: variable '___stack' set but not used [-Wunused-but-set-variable]
     542 |                 struct bpf_stack_state * ___stack;                              \
         |                                          ^~~~~~~~
   kernel/bpf/verifier.c:11497:17: note: in expansion of macro 'bpf_for_each_reg_in_vstate'
   11497 |                 bpf_for_each_reg_in_vstate(env->cur_state, unused, reg, ({
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/verifier.c: In function 'check_kfunc_call':
>> kernel/bpf/verifier.c:12946:41: warning: variable 'stack' set but not used [-Wunused-but-set-variable]
   12946 |                 struct bpf_stack_state *stack;
         |                                         ^~~~~
   kernel/bpf/verifier.c: In function 'find_good_pkt_pointers':
>> include/linux/bpf_verifier.h:542:42: warning: variable '___stack' set but not used [-Wunused-but-set-variable]
     542 |                 struct bpf_stack_state * ___stack;                              \
         |                                          ^~~~~~~~
   kernel/bpf/verifier.c:15324:9: note: in expansion of macro 'bpf_for_each_reg_in_vstate'
   15324 |         bpf_for_each_reg_in_vstate(vstate, state, reg, ({
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/verifier.c: In function 'mark_ptr_or_null_regs':
>> include/linux/bpf_verifier.h:542:42: warning: variable '___stack' set but not used [-Wunused-but-set-variable]
     542 |                 struct bpf_stack_state * ___stack;                              \
         |                                          ^~~~~~~~
   kernel/bpf/verifier.c:15902:9: note: in expansion of macro 'bpf_for_each_reg_in_vstate'
   15902 |         bpf_for_each_reg_in_vstate(vstate, state, reg, ({
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/verifier.c: In function 'bpf_clear_singular_ids':
>> include/linux/bpf_verifier.h:542:42: warning: variable '___stack' set but not used [-Wunused-but-set-variable]
     542 |                 struct bpf_stack_state * ___stack;                              \
         |                                          ^~~~~~~~
   kernel/bpf/verifier.c:17135:9: note: in expansion of macro 'bpf_for_each_reg_in_vstate'
   17135 |         bpf_for_each_reg_in_vstate(st, func, reg, ({
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/bpf_verifier.h:542:42: warning: variable '___stack' set but not used [-Wunused-but-set-variable]
     542 |                 struct bpf_stack_state * ___stack;                              \
         |                                          ^~~~~~~~
   kernel/bpf/verifier.c:17143:9: note: in expansion of macro 'bpf_for_each_reg_in_vstate'
   17143 |         bpf_for_each_reg_in_vstate(st, func, reg, ({
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/___stack +542 include/linux/bpf_verifier.h

   505	
   506	#define bpf_get_spilled_reg(slot, frame, mask)				\
   507		(((slot < frame->allocated_stack / BPF_REG_SIZE) &&		\
   508		  ((1 << frame->stack[slot].slot_type[BPF_REG_SIZE - 1]) & (mask))) \
   509		 ? &frame->stack[slot].spilled_ptr : NULL)
   510	
   511	/* Iterate over 'frame', setting 'reg' to either NULL or a spilled register. */
   512	#define bpf_for_each_spilled_reg(iter, frame, reg, mask)			\
   513		for (iter = 0, reg = bpf_get_spilled_reg(iter, frame, mask);		\
   514		     iter < frame->allocated_stack / BPF_REG_SIZE;		\
   515		     iter++, reg = bpf_get_spilled_reg(iter, frame, mask))
   516	
   517	#define bpf_for_each_reg_in_vstate_mask(__vst, __state, __reg, __stack, __mask, __expr)   \
   518		({                                                               \
   519			struct bpf_verifier_state *___vstate = __vst;            \
   520			int ___i, ___j;                                          \
   521			for (___i = 0; ___i <= ___vstate->curframe; ___i++) {    \
   522				struct bpf_reg_state *___regs;                   \
   523				__state = ___vstate->frame[___i];                \
   524				___regs = __state->regs;                         \
   525				__stack = NULL;                                  \
   526				for (___j = 0; ___j < MAX_BPF_REG; ___j++) {     \
   527					__reg = &___regs[___j];                  \
   528					(void)(__expr);                          \
   529				}                                                \
   530				bpf_for_each_spilled_reg(___j, __state, __reg, __mask) { \
   531					if (!__reg)                              \
   532						continue;                        \
   533					__stack = &__state->stack[___j];         \
   534					(void)(__expr);                          \
   535				}                                                \
   536			}                                                        \
   537		})
   538	
   539	/* Invoke __expr over regsiters in __vst, setting __state and __reg */
   540	#define bpf_for_each_reg_in_vstate(__vst, __state, __reg, __expr)		\
   541		({									\
 > 542			struct bpf_stack_state * ___stack;                        	\
   543			bpf_for_each_reg_in_vstate_mask(__vst, __state, __reg, ___stack,\
   544							1 << STACK_SPILL, __expr);	\
   545		})
   546	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795682372;
	b=1RlTwi6zYaXftvDq9tKbBqs91qACiGm4LagLPlti6XqswmIYSX7GjgGsYGX3XGhIIpTB
	 QQMa7U1nhqS2D3Vb5dPT1w8sMeD4a2xCCJX0K83+Vkm6CV6v+lmiByD3XrkH+f7vkkwgY
	 9xdDzf6W9aznujXcPC1YSTaMMG19IxBGx4XuE8XTtlIISVldh21w4fEF9564wE92vdwWL
	 41xMPr29vRg42aqDT73YARSqCH04/Mf7KdMP6gayD70ZAu8JuxmdOj6Rcib4jC3bbgJwd
	 QHF7dDpOWYTsP/Yo9I4FdK55zuyRaWdmTyk7CUZziADlkBSP4nO5b+SwTD3j8VohTbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795682372;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=DTiKVy3Fspg1yKn3Gawyb1gYz0TlSmoGwbdOATJslj8=;
	b=m7+BnE1EO7NtU9Y2Q2mMgigs3JEcjQQgpxDAxDaphGTd8BniYJkUln4CeYRXRDgxA6Hk
	 tgf3zzdkTpJCMhgdT09LuFT6WDvI5Zz9yZr3qZvW2pTNSpNHYVVKsouU+TPVI4YhqJitg
	 7QN4X4xl2XGqCCeVmVvNtZ4/k5QeLzEpGo0wSzhiTkeVQt7yH+q1QAa+tIaU655FTHkuS
	 8p7ejvAVE4xCfr9wZnI60EhFeEwsBNWp1fYAdwbfrofYmFacYwOuSltjAyDy5F+IK8Y47
	 VAPYnsdUfg1XbqUk78iIVW2Zd6pOl/kagJ1umja51J/82l5JKufs1yxw+1zL9DYKRSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gqsv6s+K;
	arc=none smtp.remote-ip=192.198.163.19
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F34A4606A31E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Nov 2026 08:39:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F34A4606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gqsv6s+K
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795682372; x=1827218372;
  h=date:from:to:cc:subject:message-id;
  bh=ecM2WU3V/f49jzAgIhBZke4g/tsuPj7LWJ5qnMYjdW4=;
  b=gqsv6s+KgTUl8v1pNPRwUdlZVudR49uU01JqylXGxp+OCiDjxwzYe9XY
   Cx6AcdIFe6WMYK9CobURf5ByOfxRMVtlXD94o5u2+oYkvT+5OTphBlsMV
   RVjNg/OfvA0n0q/4j1RZXvSGWZ5aGytVDNg/He92p8rQxdBGCp4uCXu5t
   LE0xgVPGsJ+iZAUt/T+xKOFQ4l6dE+xHIir9Fh/9qLGrbYdfo/COK6eMO
   MRYP7kPUZZdN7f1z9DYy24ZIShQua1wTD+gywIhjCjJHLPdtGK9u2c7Tz
   vobKYSMyHLhnmJUP5kl+lYJr6VMbEyt6kxEDPbA18Kq8VfPCaHjIwDH9c
   A==;
X-CSE-ConnectionGUID: Tvm+J+5XTBaxm8XgYwNttw==
X-CSE-MsgGUID: fsLGsykBQQe6JbnNFXA0pQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4598096"
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="4598096"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2026 00:39:31 -0800
X-CSE-ConnectionGUID: uqBg7hftQ3SLe3PSZKLrHw==
X-CSE-MsgGUID: 7yBBm31iQAWARQxRB/wrBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="12438200"
Received: from igk-lkp-server01.igk.intel.com (HELO a03d4d989450) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 26 Nov 2026 00:39:30 -0800
Received: from kbuild by a03d4d989450 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xWV0p-000000000Hr-3yLL;
	Thu, 26 Nov 2026 08:39:27 +0000
Date: Thu, 26 Nov 2026 09:39:09 +0100
From: kernel test robot <lkp@intel.com>
To: daichengrong <daichengrong@iscas.ac.cn>
Cc: oe-kbuild-all@lists.linux.dev, Cong Wang <cwang@multikernel.io>,
 Andy Chiu <tchiu@tenstorrent.com>
Subject: [congwang:riscv-vector-discard 3/5]
 arch/riscv/kernel/signal.c:130:2: error: implicit declaration of function
 '__riscv_v_vstate_clean'; did you mean 'riscv_v_vstate_query'?
Message-ID: <20261126093124.Yfx10yZH-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/congwang/linux.git riscv-vector-discard
head:   82089161ab902778cdd13a9cd126871c69aa4e87
commit: 19973bf52f3795693ec7baaa5812d33009dbcd6e [3/5] riscv: clarify vector state semantics on syscall and context switch
config: riscv-randconfig-2200-20261126 (https://download.01.org/0day-ci/archive/20261126/20261126093124.Yfx10yZH-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 8.5.0
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261126/20261126093124.Yfx10yZH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261126093124.Yfx10yZH-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/riscv/kernel/signal.c: In function '__restore_v_state':
>> arch/riscv/kernel/signal.c:130:2: error: implicit declaration of function '__riscv_v_vstate_clean'; did you mean 'riscv_v_vstate_query'? [-Werror=implicit-function-declaration]
     __riscv_v_vstate_clean(regs);
     ^~~~~~~~~~~~~~~~~~~~~~
     riscv_v_vstate_query
   cc1: some warnings being treated as errors


vim +130 arch/riscv/kernel/signal.c

   107	
   108	/*
   109	 * Restore Vector extension context from the user's signal frame. This function
   110	 * assumes a valid extension header. So magic and size checking must be done by
   111	 * the caller.
   112	 */
   113	static long __restore_v_state(struct pt_regs *regs, void __user *sc_vec)
   114	{
   115		long err;
   116		struct __sc_riscv_v_state __user *state = sc_vec;
   117		void __user *datap;
   118	
   119		/*
   120		 * Mark the vstate as clean prior performing the actual copy,
   121		 * to avoid getting the vstate incorrectly clobbered by the
   122		 * discarded vector state.
   123		 *
   124		 * This also allows user to modify vregs through the signal
   125		 * interface at a syscall stop. e.g. to support user space
   126		 * context switching.
   127		 */
   128		preempt_disable();
   129		riscv_v_vstate_set_restore(current, regs);
 > 130		__riscv_v_vstate_clean(regs);
   131		preempt_enable();
   132	
   133		/* Copy everything of __sc_riscv_v_state except datap. */
   134		err = __copy_from_user(&current->thread.vstate, &state->v_state,
   135				       offsetof(struct __riscv_v_ext_state, datap));
   136		if (unlikely(err))
   137			return err;
   138	
   139		/* Copy the pointer datap itself. */
   140		err = __get_user(datap, &state->v_state.datap);
   141		if (unlikely(err))
   142			return err;
   143		/*
   144		 * Copy the whole vector content from user space datap. Use
   145		 * copy_from_user to prevent information leak.
   146		 */
   147		return copy_from_user(current->thread.vstate.datap, datap, riscv_v_vsize);
   148	}
   149	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

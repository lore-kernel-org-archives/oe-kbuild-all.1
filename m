Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7004C3EF0AA
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 Oct 2026 20:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791318519; cv=none; b=e8hPAqu3XoL7ZOulv8R+RrUuR+ysaiXUpclcsh0MPYczGH0NEYqM8erAX9IDbM1pAa4bJQoPV5qU/mAOgwNIVuHQHFVZmebrnUluL1DUSAjQ/rA2H56KiINa7DFrT+hVXFQRwzR9xeme5G7GUjaQNTPTOBmkb/NPAe0DZzZOOTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791318519; c=relaxed/simple;
	bh=Owc9ato8jhHFXR2hzLJQt+0HJNlUyXqHqZ/gKtbwbWM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=p4H7et0sByKFBJ4kNuQTOpwL2E9XFq66ysIleAf/z99Eg0hFml6iIOTFNCBKbMvgEWXieeFfxG7gLl4mfgxMLPOyPD/emvASZyeY7hM+RjPD4aybucoPGdY2++167Hw5a3GiBrwKEuFmlXxHGCUenyW/ZSPGbGKfh1fBCsjTtdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aQIsXGH0; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aQIsXGH0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791318516; x=1822854516;
  h=date:from:to:cc:subject:message-id;
  bh=Owc9ato8jhHFXR2hzLJQt+0HJNlUyXqHqZ/gKtbwbWM=;
  b=aQIsXGH00bY6KfTUTCW7QH2ZJTQhbzLNY7MWGMtrWbnRIjUihjRgcup/
   HVlMcqutGu1yJdjAbYlVlaTLD0yBfbxdLBgdnKSSSzsUbLe4qM6lDC+Qf
   Zc0AM4/uDCv527rUMStScPcVu4lmCIge1eULhJgSLeFTUDT6R1fnEwFZk
   b0fPZHlwfkJrB6fo/GRxICxGoOxmkP4NUVBlZ+tZ6lnLNKIP5DqihJvWd
   keJ6nF10rbr9tAck/pAOr31K4nhu42i2egZU1IwMKixPCyW0yXRLed6OD
   3lL4R2Lag6Q2p1EsBKWDZT9Wb7Zj9ARsVYwTm9UeHQfYopNTGmc47YL2E
   Q==;
X-CSE-ConnectionGUID: 2ylC3TqNRKCoZbAchNgTPQ==
X-CSE-MsgGUID: +5VlyEfRTdWQyHHUVhezQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11927"; a="103392051"
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="103392051"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2026 13:28:35 -0700
X-CSE-ConnectionGUID: iHClwycKQWmGiq8LAPmzgQ==
X-CSE-MsgGUID: wTqCTzXyS72y6QwU2CoekA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="280485452"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 06 Oct 2026 13:28:34 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xEBm3-000000001lt-2gFe;
	Tue, 06 Oct 2026 20:28:31 +0000
Date: Tue, 06 Oct 2026 22:28:08 +0200
From: kernel test robot <lkp@intel.com>
To: Andy Chiu <tchiu@tenstorrent.com>
Cc: oe-kbuild-all@lists.linux.dev, Paul Walmsley <pjw@kernel.org>
Subject: [pjw-riscv:temp-testing 22/24]
 arch/riscv/kernel/signal.c:129:2: error: call to undeclared function
 '__riscv_v_vstate_clean'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202610062227.m0ayunUx-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pjw/riscv.git temp-testing
head:   1a5c75ee3d09a160e58bb01950cbd4a8cf66a409
commit: 0d4b43a7734d86799835f9ed1f0e21645be043c3 [22/24] riscv: vector: adjust ptrace and signal behavior for INITIAL state
config: riscv-randconfig-r2303-20261006 (https://download.01.org/0day-ci/archive/20261006/202610062227.m0ayunUx-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261006/202610062227.m0ayunUx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610062227.m0ayunUx-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/riscv/kernel/signal.c:129:2: error: call to undeclared function '__riscv_v_vstate_clean'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     129 |         __riscv_v_vstate_clean(regs);
         |         ^
   arch/riscv/kernel/signal.c:129:2: note: did you mean 'riscv_v_vstate_query'?
   arch/riscv/include/asm/vector.h:428:20: note: 'riscv_v_vstate_query' declared here
     428 | static inline bool riscv_v_vstate_query(struct pt_regs *regs) { return false; }
         |                    ^
   1 error generated.


vim +/__riscv_v_vstate_clean +129 arch/riscv/kernel/signal.c

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
   128		riscv_v_vstate_set_restore(current, regs);
 > 129		__riscv_v_vstate_clean(regs);
   130	
   131		/* Copy everything of __sc_riscv_v_state except datap. */
   132		err = __copy_from_user(&current->thread.vstate, &state->v_state,
   133				       offsetof(struct __riscv_v_ext_state, datap));
   134		if (unlikely(err))
   135			return err;
   136	
   137		/* Copy the pointer datap itself. */
   138		err = __get_user(datap, &state->v_state.datap);
   139		if (unlikely(err))
   140			return err;
   141		/*
   142		 * Copy the whole vector content from user space datap. Use
   143		 * copy_from_user to prevent information leak.
   144		 */
   145		return copy_from_user(current->thread.vstate.datap, datap, riscv_v_vsize);
   146	}
   147	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

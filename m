Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DA452253A1
	for <oe-kbuild-all@lists.linux.dev>; Fri,  2 Oct 2026 03:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790912653; cv=none; b=rrmd2eV8cvKWhDVf6sdosDKew445YjVFmwtU7l1kuZqH30IS4Q6I/xrGH814ec/AefcIUPQHgGP132k0KXe+L1lxO2uuVlERFz98fquCFscVhexq1b6GBOdeX0PQfR00U0OmaPXSRXal5FvI+J+XHOp3mKQbFE0sJQ6jyEwACQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790912653; c=relaxed/simple;
	bh=I4b4bYJQsYcK8oUqPcw3ZPY5s51kRWEvDxUEPdXlKQQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=iqCbl4H+oGRx6XbpxSJCUDLjWb0crV66bPgvs+NZ72yG90wudgfYMsXZhQg67cEOsimQ5iv9riUoWPQ6cGx9RDWxIHYq4Xq7eRkgKJTeq/tV0s6Rl7G5Abid4Tjid5SaXydo7cP8ZSuwA6u50Uw4LSmn5h+mAFaB8rtYuEKESUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YzrIN297; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YzrIN297"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790912652; x=1822448652;
  h=date:from:to:cc:subject:message-id;
  bh=I4b4bYJQsYcK8oUqPcw3ZPY5s51kRWEvDxUEPdXlKQQ=;
  b=YzrIN297pizvVTLa9xi6NL26pqtNiBIaD5nxBPLX+W33dfNSDOcjiaLp
   3wXlnWFtqL9NWSbAsstDkZ7o2dfRXmtXGPmuu+zbXM/uB0mScafKJtz+i
   vhk7gW3G/+aMghjhyDL4QdKT+unFAvscdQoFtuAKCeja2n09gxj5dgFTf
   VhH2B8dyxTd2sMVEMigd9EArXdlpYrKDISrej0xqd/bnq4u+5Lim2b/kP
   fHvF/LBOLMCA5inp8LMUybgUBKC61A8fxH3srtOrK0iGC5UdYhyf8fu5g
   qleYpJ2uN+YXd8cTHXKc1H2mhzVzKgEJ+N51UREZMr7sCnIwhxs5IdcDr
   A==;
X-CSE-ConnectionGUID: 4rgKM9XCQE6MN14Kik4Qkw==
X-CSE-MsgGUID: sXcSPAN/QBipfLJyYeIMPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="108061156"
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; 
   d="scan'208";a="108061156"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 20:44:12 -0700
X-CSE-ConnectionGUID: 8NBBUDzQSAmbUQocBS/fgw==
X-CSE-MsgGUID: npdVRZyVREe/ZZZZDlfO0A==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 3fb566d470b1) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 01 Oct 2026 20:44:10 -0700
Received: from kbuild by 3fb566d470b1 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xCUBs-000000000OB-12dK;
	Fri, 02 Oct 2026 03:44:08 +0000
Date: Fri, 02 Oct 2026 05:43:52 +0200
From: kernel test robot <lkp@intel.com>
To: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev, Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_trace_acpi_support_v1 60/87]
 arch/riscv/kernel/process.c:207:9: error: implicit declaration of function
 'flush_ptrace_hw_breakpoint'
Message-ID: <202610020555.e4Cjg9nM-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/avpatel/linux.git riscv_trace_acpi_support_v1
head:   dc5b9586f90cc15314085bdaa74661fc00d1688f
commit: 2aa069bfc965618a567482f16f10c8098c358d01 [60/87] riscv: ptrace support for hardware break/watchpoints
config: riscv-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20261002/202610020555.e4Cjg9nM-lkp@intel.com/config)
compiler: riscv64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261002/202610020555.e4Cjg9nM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610020555.e4Cjg9nM-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/riscv/kernel/process.c: In function 'flush_thread':
>> arch/riscv/kernel/process.c:207:9: error: implicit declaration of function 'flush_ptrace_hw_breakpoint' [-Wimplicit-function-declaration]
     207 |         flush_ptrace_hw_breakpoint(current);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/flush_ptrace_hw_breakpoint +207 arch/riscv/kernel/process.c

   183	
   184	void flush_thread(void)
   185	{
   186	#ifdef CONFIG_FPU
   187		/*
   188		 * Reset FPU state and context
   189		 *	frm: round to nearest, ties to even (IEEE default)
   190		 *	fflags: accrued exceptions cleared
   191		 */
   192		fstate_off(current, task_pt_regs(current));
   193		memset(&current->thread.fstate, 0, sizeof(current->thread.fstate));
   194	#endif
   195	#ifdef CONFIG_RISCV_ISA_V
   196		/* Reset vector state */
   197		riscv_v_vstate_ctrl_init(current);
   198		riscv_v_vstate_off(task_pt_regs(current));
   199		kfree(current->thread.vstate.datap);
   200		memset(&current->thread.vstate, 0, sizeof(struct __riscv_v_ext_state));
   201		clear_tsk_thread_flag(current, TIF_RISCV_V_DEFER_RESTORE);
   202	#endif
   203	#ifdef CONFIG_RISCV_ISA_SUPM
   204		if (riscv_has_extension_unlikely(RISCV_ISA_EXT_SUPM))
   205			envcfg_update_bits(current, ENVCFG_PMM, ENVCFG_PMM_PMLEN_0);
   206	#endif
 > 207		flush_ptrace_hw_breakpoint(current);
   208	}
   209	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

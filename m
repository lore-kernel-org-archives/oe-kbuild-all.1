Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 430F717C203
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Aug 2026 04:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786595637; cv=none; b=P/XpZt2bfh4Au7fKVJ3k5NAQYwpA7wMtqLedErLtTUkeBthWho9WmhOBOCnil1hsriHsFK/zrbcUsjJ1bAjv1nV5/Jo9J4YkpI6zgPnQ/XdBumUAp+EVwOKOktceVaVSWSlhc+jxiMaBQDcMH3iYD5mhpHF69gpswlJ3l6K2CTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786595637; c=relaxed/simple;
	bh=/J56ULD7bVlsDfEldc1k58JdO0v39+F6dGqaE87KY4A=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uqIBVgeDr0pVE6AAyL8VmCBtirXk3vtMfV+N2oaJmcQ/98qBRBK+dNxvM8k5JSauqMT9oWdYCR64qUJXXOEbFNUmGes7eKCjtZdBYe6RnniVmK5SVnit/BE3VV/weRLsU7Bb17zRiyvqP9WQ/UGGoOxr9f5QOdQvoOOqINb+gXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I0nDCB0w; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I0nDCB0w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786595635; x=1818131635;
  h=date:from:to:cc:subject:message-id;
  bh=/J56ULD7bVlsDfEldc1k58JdO0v39+F6dGqaE87KY4A=;
  b=I0nDCB0wQQca2CxDS8rGu9SBU3tYCfZxTtZY5VF/BfiqH1S6PX79DzLe
   rw+TVmlHSGQS5pWYOkB4fSOg/C7fzv3zHHxV+NSiVEtEGERJcrtv6Y3Bk
   NL/WMqUTu+urs0HWSKE5dmIGKIl5jTiVlJtp2KPgJR4Agu6pq17SxXWlM
   jfhw4y/m5Rn0APtt/3lsNqphAZwgbQiOb9Nr43EHJgOeH4oRLNlrXxRgD
   S15U92VLcgFBmhBTt1AgCGvAy8nimVnfPumbYsTqQOpQVt5ccfJxDH5Wf
   TDeB8/p4/6xi5jL5wYFFYwa/+I3gduhqPzMYo/nfU/DDPZDrcqouSxIll
   g==;
X-CSE-ConnectionGUID: wLDqFHAlQiWptPQyErfHsg==
X-CSE-MsgGUID: eucg2tXgQ7KPhbkSTpqYBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="112705668"
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; 
   d="scan'208";a="112705668"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 21:33:54 -0700
X-CSE-ConnectionGUID: tgH6jRpWQg288hSI2qCeLQ==
X-CSE-MsgGUID: Pz4+kFfcRuOgHcneo6hpSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; 
   d="scan'208";a="302094338"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 12 Aug 2026 21:33:54 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wuN8Y-00000000SpK-44nl;
	Thu, 13 Aug 2026 04:33:50 +0000
Date: Thu, 13 Aug 2026 12:33:13 +0800
From: kernel test robot <lkp@intel.com>
To: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev, Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_trace_acpi_support_v1 88/112]
 arch/riscv/kernel/process.c:207:9: error: implicit declaration of function
 'flush_ptrace_hw_breakpoint'
Message-ID: <202608131237.AAeG9ZVp-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/avpatel/linux.git riscv_trace_acpi_support_v1
head:   04c254020ba99b7f6db9ab6c87ed4cb4a688ba9a
commit: e0d276ca77744c881a75bbb741566d58b012bbe0 [88/112] riscv: ptrace support for hardware break/watchpoints
config: riscv-randconfig-002-20260813 (https://download.01.org/0day-ci/archive/20260813/202608131237.AAeG9ZVp-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260813/202608131237.AAeG9ZVp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608131237.AAeG9ZVp-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/riscv/kernel/process.c: In function 'flush_thread':
>> arch/riscv/kernel/process.c:207:9: error: implicit declaration of function 'flush_ptrace_hw_breakpoint' [-Wimplicit-function-declaration]
     207 |         flush_ptrace_hw_breakpoint(current);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for HAVE_MIXED_BREAKPOINTS_REGS
   Depends on [n]: HAVE_HW_BREAKPOINT [=n]
   Selected by [y]:
   - RISCV [=y]


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

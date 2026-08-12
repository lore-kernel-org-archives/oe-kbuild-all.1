Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C23940244F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Aug 2026 09:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786526309; cv=none; b=Gk12U6DoWl+2CHsIRB8ibyGD6SYuZDBxKdMXSxJAFPTAdV+36kKv0LFSjB7dKKYTw/S5heXpT28T7dIqrSG8yPysd4rNFbILu/8jGg0eWXUWqplnhW3NVu2Rzk2DR/58XR2LwSh7hQFECaqfkgXPOUmAcdtSWd04W33YVFwLVfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786526309; c=relaxed/simple;
	bh=yiZUkJMRptIMfna8KG9jTV7qzawsSFT8dXwWGNo+L0k=;
	h=Date:From:To:Cc:Subject:Message-ID; b=IwM7dxpV+ZoII/ESyvlLMijjhf5MgRbS3i9XsJ9RvrJRtCsLyek7ePgSrfJUsjB1vNm9+yBK+QWvoGbOpzyyGWMXy2tQLMVH07xrQMUXQ5awAKzy4xuJChqpmYPmED/1bEDkaH0COgEVgPApQNhHdhQAlmVxeWQ8HOjiUmHtj2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Iv+Xmu3j; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Iv+Xmu3j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786526306; x=1818062306;
  h=date:from:to:cc:subject:message-id;
  bh=yiZUkJMRptIMfna8KG9jTV7qzawsSFT8dXwWGNo+L0k=;
  b=Iv+Xmu3jE66/T9sqpdYQXQPz7ksbkzILVMzikdYJkHB0UQZ2diU0UXsB
   +EguMcMPhyPtlyU+aGL4Pa+duUDvVDnmxQk0N7rNpzfQEScc8L3iUVhuR
   QxZ75Z6+LskgKHyyJhlzabgMfUGApzg1ObLYPUjPUGuocFze+NFn5+9wQ
   Ih36v8GnO/iuDt77hLD5X0I/We5YFDgo3cO4VSspdI1FUsJS4JtAiBpwt
   fDq73u62RnjxTE/wS5x5wY4ZbtgBhkOCUW/dtuk/gom4k2/XV5UPDidq4
   UvWu14ki9Fa5iM2OLDHhjn8kGZe05cNABGf4bsHH5UGdKrl8a4rmLy6Fs
   g==;
X-CSE-ConnectionGUID: fC+yAEhBTruYS4v4aCvQBw==
X-CSE-MsgGUID: Whi5OBBoTNqNjV48rwypRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="97736982"
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; 
   d="scan'208";a="97736982"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 02:18:25 -0700
X-CSE-ConnectionGUID: RNLvfPX+RtaqW14Sfgr4PA==
X-CSE-MsgGUID: xxgFs+63Rdea6hWIgJa7Pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; 
   d="scan'208";a="259340609"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 12 Aug 2026 02:18:25 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wu56N-00000000QDm-0rvQ;
	Wed, 12 Aug 2026 09:18:23 +0000
Date: Wed, 12 Aug 2026 17:17:35 +0800
From: kernel test robot <lkp@intel.com>
To: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev, Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_trace_support_v5 88/104]
 arch/riscv/kernel/process.c:207:2: error: call to undeclared function
 'flush_ptrace_hw_breakpoint'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202608121737.Ik7QKY2w-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/avpatel/linux.git riscv_trace_support_v5
head:   1d99b155d3c1ca9a30209d51590db002a606f30c
commit: e0d276ca77744c881a75bbb741566d58b012bbe0 [88/104] riscv: ptrace support for hardware break/watchpoints
config: riscv-randconfig-r063-20260812 (https://download.01.org/0day-ci/archive/20260812/202608121737.Ik7QKY2w-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260812/202608121737.Ik7QKY2w-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608121737.Ik7QKY2w-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/riscv/kernel/process.c:16:
   In file included from include/linux/tick.h:8:
   In file included from include/linux/clockchips.h:14:
   In file included from include/linux/clocksource.h:22:
   In file included from arch/riscv/include/asm/io.h:148:
   include/asm-generic/io.h:1209:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    1209 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
         |                                                   ~~~~~~~~~~ ^
>> arch/riscv/kernel/process.c:207:2: error: call to undeclared function 'flush_ptrace_hw_breakpoint'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     207 |         flush_ptrace_hw_breakpoint(current);
         |         ^
   1 warning and 1 error generated.

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

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794097017;
	b=TOoOGG+q8hWh61aE2B0oWofmTput8rvmOtM9RmA6MSvDf3v2kWIlzKwV9Q8QKXQ+6Mt8
	 S3lqPBSpbd27bMpzdcIbRHV6DFK72GGdQC+DiKalSl5hLDnyR9m9forRRHC135m0AcV6Q
	 DMw2dX9V3NILgiwzz6zIRYgpIrCid3jhSS2wSlG3OrD2gzKl6alpNAlGXqbqeN0wBPIXU
	 D8sNcTNQCxD6unRVN2Qafptv2umhdiaMw2a1mm3E7nSTeWO3/IXhLg7BH17pTyylVf3fU
	 CzsV26UD/tolKLpzthgOIc5h/f34e6uB5lIydNPR2/27BjxZJidHQtBeaxfXvv1TpVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794097017;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=sxCANDDxqTkDScNpxh5J4aN8WBaEB9QWoQkTMI0PnT0=;
	b=Tpkict2fVoxVhexbgDiHeBR2HJJg6HRTm41wKW7EWAa1NqCzxxKGxsT7IhV5eE3qXdK7
	 epOzzQDYt5XdJATw0ydWrPYNZx8GHT5DDx1TUuvX20dtBxMob0JwpV86zrSgzBz82jHal
	 O5G1PpWsgYL/CEYZcqi/MDeTo1RzTAWKc3acIG0XjNxBlQD13fuPqmHkdptFnHskfyvu+
	 6MFWi5ML5ogRdzGxdKgmpWPvqAEtLM+XjcvsGi2AUTDWmMAACrgMRLD3Qly4tu+MWIbyT
	 BRTp5i2UdXwWw+WCKkbQi8MrHX+0vdTiwTi/AkYKh80szaZLMrDJsE/1OKcgVpk6+NA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SOwPFNOK;
	arc=none smtp.remote-ip=192.198.163.11
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F151606A326
	for <oe-kbuild-all@lists.linux.dev>; Sun,  8 Nov 2026 00:16:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F151606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SOwPFNOK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794097016; x=1825633016;
  h=date:from:to:cc:subject:message-id;
  bh=A8ZXych7zr/QMBCiWL11z8T/5iZ3Iols5MTFu4RuK6I=;
  b=SOwPFNOKO1z1UTKt424EMx82npBn2BbnYFrLPSOzqeIB2ErN7i3aOTAE
   y4BPGjRzn9utv/V1ZUid5kwQa3B8TGkiC0eMzkI7ZPrRsmwvyNk7WBPHr
   K88evvmwDH6e9SJE/S70e1pZoMhTFkzWj1jkW0VV+0Xyv7PIaV5FWs0Ot
   L4Kyzm5kodKiZ8W5pH8N3vfyVqZ663D5Mg6C5c5fuHhZHYOQJDcZlF3fg
   Y/M38J3XlDceU83HSGVLJv/XB/5ZT/TMkNWBDFPtiCGGjsnp/zqNvPnQF
   u336ahYtsyWBQfkpFOGVSeNADCZeb6VRsRfFKIFnlV5BcTxwOvdigs9j6
   Q==;
X-CSE-ConnectionGUID: DzHC60PdTc+VqniYslJdqg==
X-CSE-MsgGUID: dobOuYT/Scms1PW5Kcj+wg==
X-IronPort-AV: E=McAfee;i="6800,10657,11959"; a="2788784"
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="2788784"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2026 16:16:55 -0800
X-CSE-ConnectionGUID: Rgt/dhy5QyO03avUlvIufQ==
X-CSE-MsgGUID: 75Oca5CMSu+Ur5vGZJkS/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="7904024"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 07 Nov 2026 16:16:50 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xPqaW-00000000Atz-0V2T;
	Sun, 08 Nov 2026 00:16:48 +0000
Date: Sun, 08 Nov 2026 01:15:57 +0100
From: kernel test robot <lkp@intel.com>
To: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev, Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_trace_support_v6 61/80]
 kernel/trace/trace.c:8186:23: warning: shift count is negative
Message-ID: <202611080147.jyg69Cch-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/avpatel/linux.git riscv_trace_support_v6
head:   f98be19c4d4f657fa0ed2a17aa8ef5ece29fe8dc
commit: badc75240dd73faad1081d9c12b9cd0f9cc6a145 [61/80] riscv: add ptrace requests for hardware breakpoints
config: riscv-randconfig-r2304-20261107 (https://download.01.org/0day-ci/archive/20261108/202611080147.jyg69Cch-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261108/202611080147.jyg69Cch-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611080147.jyg69Cch-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/trace/trace.c:18:
   In file included from include/linux/writeback.h:13:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/riscv/include/asm/io.h:148:
   include/asm-generic/io.h:1209:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    1209 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
         |                                                   ~~~~~~~~~~ ^
   In file included from kernel/trace/trace.c:58:
   In file included from kernel/trace/trace.h:15:
   include/linux/hw_breakpoint.h:137:20: error: redefinition of 'flush_ptrace_hw_breakpoint'
     137 | static inline void flush_ptrace_hw_breakpoint(struct task_struct *tsk)  { }
         |                    ^
   arch/riscv/include/asm/hw_breakpoint.h:58:20: note: previous definition is here
      58 | static inline void flush_ptrace_hw_breakpoint(struct task_struct *task) { }
         |                    ^
>> kernel/trace/trace.c:8186:23: warning: shift count is negative [-Wshift-count-negative]
    8186 |                     !((1ULL << i) & TOP_LEVEL_TRACE_FLAGS)) {
         |                                     ^~~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace.c:518:9: note: expanded from macro 'TOP_LEVEL_TRACE_FLAGS'
     518 |                TRACE_ITER(PROF_TEXT_OFFSET) | FPROFILE_DEFAULT_FLAGS)
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace.h:1528:42: note: expanded from macro 'TRACE_ITER'
    1528 |         (TRACE_ITER_##flag##_BIT < 0 ? 0 : 1ULL << (TRACE_ITER_##flag##_BIT))
         |                                                 ^  ~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace.c:8720:48: warning: shift count is negative [-Wshift-count-negative]
    8720 |         tr->trace_flags = global_trace.trace_flags & ~ZEROED_TRACE_FLAGS;
         |                                                       ^~~~~~~~~~~~~~~~~~
   kernel/trace/trace.c:522:28: note: expanded from macro 'ZEROED_TRACE_FLAGS'
     522 |         (TRACE_ITER(EVENT_FORK) | TRACE_ITER(FUNC_FORK) | TRACE_ITER(TRACE_PRINTK) | \
         |                                   ^~~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace.h:1528:42: note: expanded from macro 'TRACE_ITER'
    1528 |         (TRACE_ITER_##flag##_BIT < 0 ? 0 : 1ULL << (TRACE_ITER_##flag##_BIT))
         |                                                 ^  ~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace.c:8904:21: warning: shift count is negative [-Wshift-count-negative]
    8904 |                 if ((1ULL << i) & ZEROED_TRACE_FLAGS)
         |                                   ^~~~~~~~~~~~~~~~~~
   kernel/trace/trace.c:522:28: note: expanded from macro 'ZEROED_TRACE_FLAGS'
     522 |         (TRACE_ITER(EVENT_FORK) | TRACE_ITER(FUNC_FORK) | TRACE_ITER(TRACE_PRINTK) | \
         |                                   ^~~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace.h:1528:42: note: expanded from macro 'TRACE_ITER'
    1528 |         (TRACE_ITER_##flag##_BIT < 0 ? 0 : 1ULL << (TRACE_ITER_##flag##_BIT))
         |                                                 ^  ~~~~~~~~~~~~~~~~~~~~~~~~~
   4 warnings and 1 error generated.


vim +8186 kernel/trace/trace.c

a8259075074fb0 Steven Rostedt            2009-02-26  8173  
16270145ce6b90 Steven Rostedt (Red Hat   2015-09-30  8174) static void create_trace_options_dir(struct trace_array *tr)
a8259075074fb0 Steven Rostedt            2009-02-26  8175  {
a8259075074fb0 Steven Rostedt            2009-02-26  8176  	struct dentry *t_options;
16270145ce6b90 Steven Rostedt (Red Hat   2015-09-30  8177) 	bool top_level = tr == &global_trace;
a8259075074fb0 Steven Rostedt            2009-02-26  8178  	int i;
a8259075074fb0 Steven Rostedt            2009-02-26  8179  
2b6080f28c7cc3 Steven Rostedt            2012-05-11  8180  	t_options = trace_options_init_dentry(tr);
a8259075074fb0 Steven Rostedt            2009-02-26  8181  	if (!t_options)
a8259075074fb0 Steven Rostedt            2009-02-26  8182  		return;
a8259075074fb0 Steven Rostedt            2009-02-26  8183  
16270145ce6b90 Steven Rostedt (Red Hat   2015-09-30  8184) 	for (i = 0; trace_options[i]; i++) {
16270145ce6b90 Steven Rostedt (Red Hat   2015-09-30  8185) 		if (top_level ||
bbec8e28cac592 Masami Hiramatsu (Google  2025-10-31 @8186) 		    !((1ULL << i) & TOP_LEVEL_TRACE_FLAGS)) {
2b6080f28c7cc3 Steven Rostedt            2012-05-11  8187  			create_trace_option_core_file(tr, trace_options[i], i);
a8259075074fb0 Steven Rostedt            2009-02-26  8188  		}
16270145ce6b90 Steven Rostedt (Red Hat   2015-09-30  8189) 	}
bbec8e28cac592 Masami Hiramatsu (Google  2025-10-31  8190) }
a8259075074fb0 Steven Rostedt            2009-02-26  8191  

:::::: The code at line 8186 was first introduced by commit
:::::: bbec8e28cac5928c20052c489cb2e345e6bd4271 tracing: Allow tracer to add more than 32 options

:::::: TO: Masami Hiramatsu (Google) <mhiramat@kernel.org>
:::::: CC: Masami Hiramatsu (Google) <mhiramat@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

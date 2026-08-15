Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7711E14883F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Aug 2026 16:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786812802; cv=none; b=ieocO1aufi0x/T+6UTTad8w9wWemUkJsVCGTc3AQ3P7UjTZIio1TKNC7KzGardF4EuhBsI5OtHZLhufSyhw9yIVVnmP1A81LZ0NON01cvriFk/o/yTbMZNNIk/Ax4yDv0ukzrS274/2i21R1c4cBznsotHbCr++WqOLNxK3tdJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786812802; c=relaxed/simple;
	bh=eKpR381CqIhC3ImOVKZThE82rLUlPUDAaTUtJshjwWE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ckYd1aONEGjr0gINiT4anhup1LmDX5kOMGj6gKxMqSiFVhg1Pcl4CiCr7gOq/hdJy+Jj1AH9+dyT85DTT3tASX61C0ncV9jRwB9f6s6K5ca4WYhUYij/d039jeGSGN/Kz7AvD+hvlGMRLyCNw7uQbdF96hfFPTAaJcq1J2WUhw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YXk688ja; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YXk688ja"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786812800; x=1818348800;
  h=date:from:to:cc:subject:message-id;
  bh=eKpR381CqIhC3ImOVKZThE82rLUlPUDAaTUtJshjwWE=;
  b=YXk688ja38OB3BpZIbniu1MaSafj8gh6diM8U9c61W/5uqu2HkxkEcbu
   apzWL5CiVy7uAGS3Kw11su6+mrzV3nHlbHOr/pGNqQFKVAuoHLQaHJFob
   R9QQv9GpZKMvcpWCOCdvGi1TCRLfc0mAsfAZucUwDEbiTjNdv3LDbD/Nw
   sira4KxSV4SwvnKFHEi/2Xh4DFSTsjEIP8rnLrd61mFEAClIs7JiDcJuP
   ZoN+XLMuFSlutZC2RuldFylCFJ/Efp0Ssip5I7AVmX5VlLFGOnXFEDjqx
   A1h39hbL7ikQTSgcn9EGYazAX1hvmi4e9vPrdjyqidKSJAEPX3BjJLEEt
   A==;
X-CSE-ConnectionGUID: CMx9XCXCS7qOJj1uYItqgw==
X-CSE-MsgGUID: fvovPO11T7+lcOJ3FIiv3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11876"; a="87378109"
X-IronPort-AV: E=Sophos;i="6.25,225,1779174000"; 
   d="scan'208";a="87378109"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2026 09:53:19 -0700
X-CSE-ConnectionGUID: 5lI4KTQgT1OJvGLcW/9sVw==
X-CSE-MsgGUID: yzulzoiDQUa5F4UOhEutZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,225,1779174000"; 
   d="scan'208";a="266499605"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 15 Aug 2026 09:53:17 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wvHdC-00000000cN8-2nDc;
	Sat, 15 Aug 2026 16:53:14 +0000
Date: Sun, 16 Aug 2026 00:53:04 +0800
From: kernel test robot <lkp@intel.com>
To: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev, Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_trace_support_v5 90/108]
 arch/riscv/kernel/hw_breakpoint.c:398:42: sparse: sparse: cast to restricted
 __le32
Message-ID: <202608160053.yOczD4n6-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/avpatel/linux.git riscv_trace_support_v5
head:   d5f1be8d8fd44129a93976f98cc0153408015030
commit: 163404a41b42360829d8ed4d2573e14633fa2633 [90/108] riscv: Introduce support for hardware break/watchpoints
config: riscv-randconfig-r132-20260815 (https://download.01.org/0day-ci/archive/20260816/202608160053.yOczD4n6-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 844a18e753e822736c9805ab779144b647a2c186)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260816/202608160053.yOczD4n6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608160053.yOczD4n6-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   WARNING: invalid argument to '-march': '_zacas_zabha'
>> arch/riscv/kernel/hw_breakpoint.c:398:42: sparse: sparse: cast to restricted __le32
>> arch/riscv/kernel/hw_breakpoint.c:457:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long tdata1 @@     got restricted __le32 [usertype] @@
   arch/riscv/kernel/hw_breakpoint.c:457:22: sparse:     expected unsigned long tdata1
   arch/riscv/kernel/hw_breakpoint.c:457:22: sparse:     got restricted __le32 [usertype]
>> arch/riscv/kernel/hw_breakpoint.c:458:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long tdata2 @@     got restricted __le32 [usertype] @@
   arch/riscv/kernel/hw_breakpoint.c:458:22: sparse:     expected unsigned long tdata2
   arch/riscv/kernel/hw_breakpoint.c:458:22: sparse:     got restricted __le32 [usertype]
>> arch/riscv/kernel/hw_breakpoint.c:459:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long tdata3 @@     got restricted __le32 [usertype] @@
   arch/riscv/kernel/hw_breakpoint.c:459:22: sparse:     expected unsigned long tdata3
   arch/riscv/kernel/hw_breakpoint.c:459:22: sparse:     got restricted __le32 [usertype]
   arch/riscv/kernel/hw_breakpoint.c:470:15: sparse: sparse: cast to restricted __le32
   arch/riscv/kernel/hw_breakpoint.c:589:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long tdata1 @@     got restricted __le32 [usertype] @@
   arch/riscv/kernel/hw_breakpoint.c:589:22: sparse:     expected unsigned long tdata1
   arch/riscv/kernel/hw_breakpoint.c:589:22: sparse:     got restricted __le32 [usertype]
   arch/riscv/kernel/hw_breakpoint.c:590:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long tdata2 @@     got restricted __le32 [usertype] @@
   arch/riscv/kernel/hw_breakpoint.c:590:22: sparse:     expected unsigned long tdata2
   arch/riscv/kernel/hw_breakpoint.c:590:22: sparse:     got restricted __le32 [usertype]
   arch/riscv/kernel/hw_breakpoint.c:591:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long tdata3 @@     got restricted __le32 [usertype] @@
   arch/riscv/kernel/hw_breakpoint.c:591:22: sparse:     expected unsigned long tdata3
   arch/riscv/kernel/hw_breakpoint.c:591:22: sparse:     got restricted __le32 [usertype]

vim +398 arch/riscv/kernel/hw_breakpoint.c

   341	
   342	/*
   343	 * HW Breakpoint/watchpoint handler
   344	 */
   345	static int hw_breakpoint_handler(struct die_args *args)
   346	{
   347		int ret = NOTIFY_DONE;
   348		struct arch_hw_breakpoint *bp;
   349		struct perf_event *event;
   350		int i;
   351	
   352		for (i = 0; i < dbtr_total_num; i++) {
   353			event = this_cpu_read(pcpu_hw_bp_events[i]);
   354			if (!event)
   355				continue;
   356	
   357			bp = counter_arch_bp(event);
   358			switch (bp->type) {
   359			/* Breakpoint */
   360			case RISCV_DBTR_EXEC:
   361				if (bp->address == args->regs->epc) {
   362					perf_bp_event(event, args->regs);
   363					ret = NOTIFY_STOP;
   364				}
   365				break;
   366	
   367			/* Watchpoint */
   368			case RISCV_DBTR_LOAD:
   369			case RISCV_DBTR_STORE:
   370			case RISCV_DBTR_LDST:
   371			{
   372				unsigned long stval = args->regs->badaddr;
   373				unsigned long bp_start = bp->address;
   374				unsigned long bp_len = bp->len ?: 1;
   375				unsigned long bp_end = bp_start + bp_len - 1;
   376				unsigned long stval_end = stval + sizeof(long) - 1;
   377				unsigned long tdata1;
   378				bool hit = false;
   379				struct sbiret sret;
   380				union sbi_dbtr_shmem_entry *shmem;
   381	
   382				if (bp_end < bp_start)
   383					bp_end = ~0UL;
   384				if (stval_end < stval)
   385					stval_end = ~0UL;
   386	
   387				/*
   388				 * Prefer tdata1.hit from SBI trigger readout whenever
   389				 * possible. Fall back to address-based matching if HIT
   390				 * isn't observed/supported.
   391				 */
   392				raw_spin_lock_irqsave(this_cpu_ptr(&ecall_lock),
   393						      *this_cpu_ptr(&ecall_lock_flags));
   394				shmem = this_cpu_ptr(sbi_dbtr_shmem);
   395				sret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_TRIG_READ,
   396						 i, 1, 0, 0, 0, 0);
   397				if (!sret.error) {
 > 398					tdata1 = le_to_cpu(shmem->data.tdata1);
   399	
   400					if (dbtr_type == RISCV_DBTR_TRIG_MCONTROL)
   401						hit = !!(tdata1 & RISCV_DBTR_MC_HIT_BIT_MASK);
   402					else if (dbtr_type == RISCV_DBTR_TRIG_MCONTROL6)
   403						hit = !!(tdata1 & RISCV_DBTR_MC6_HIT_BIT_MASK);
   404				}
   405				raw_spin_unlock_irqrestore(this_cpu_ptr(&ecall_lock),
   406							   *this_cpu_ptr(&ecall_lock_flags));
   407	
   408				/*
   409				 * Sdtrig may report STVAL as the lowest accessed
   410				 * address while the watchpoint can match a higher byte
   411				 * in the same access.
   412				 */
   413				if (hit ||
   414				    (stval >= bp_start && stval <= bp_end) ||
   415				    (bp_start >= stval && bp_start <= stval_end)) {
   416					perf_bp_event(event, args->regs);
   417					ret = NOTIFY_STOP;
   418				}
   419				break;
   420			}
   421	
   422			default:
   423				pr_warn("Unknown type: %u\n", bp->type);
   424				break;
   425			}
   426		}
   427	
   428		return ret;
   429	}
   430	
   431	int hw_breakpoint_exceptions_notify(struct notifier_block *unused,
   432					    unsigned long val, void *data)
   433	{
   434		if (val != DIE_DEBUG)
   435			return NOTIFY_DONE;
   436	
   437		return hw_breakpoint_handler(data);
   438	}
   439	
   440	/* atomic: counter->ctx->lock is held */
   441	int arch_install_hw_breakpoint(struct perf_event *event)
   442	{
   443		struct arch_hw_breakpoint *bp = counter_arch_bp(event);
   444		union sbi_dbtr_shmem_entry *shmem = this_cpu_ptr(sbi_dbtr_shmem);
   445		struct sbi_dbtr_data_msg *xmit;
   446		struct sbi_dbtr_id_msg *recv;
   447		struct perf_event **slot;
   448		unsigned long idx;
   449		struct sbiret ret;
   450		int err = 0;
   451	
   452		raw_spin_lock_irqsave(this_cpu_ptr(&ecall_lock),
   453				      *this_cpu_ptr(&ecall_lock_flags));
   454	
   455		xmit = &shmem->data;
   456		recv = &shmem->id;
 > 457		xmit->tdata1 = cpu_to_le(bp->tdata1);
 > 458		xmit->tdata2 = cpu_to_le(bp->tdata2);
 > 459		xmit->tdata3 = cpu_to_le(bp->tdata3);
   460	
   461		ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_TRIG_INSTALL,
   462				1, 0, 0, 0, 0, 0);
   463	
   464		if (ret.error) {
   465			pr_warn("Failed to install trigger\n");
   466			err = sbi_err_map_linux_errno(ret.error);
   467			goto done;
   468		}
   469	
   470		idx = le_to_cpu(recv->idx);
   471		if (idx >= dbtr_total_num) {
   472			pr_warn("Invalid trigger index %lu\n", idx);
   473			err = -EINVAL;
   474			goto done;
   475		}
   476	
   477		slot = this_cpu_ptr(&pcpu_hw_bp_events[idx]);
   478		if (*slot) {
   479			pr_warn("Slot %lu is in use\n", idx);
   480			err = -EBUSY;
   481			goto done;
   482		}
   483	
   484		/* Save the event - to be looked up in handler */
   485		*slot = event;
   486	
   487	done:
   488		raw_spin_unlock_irqrestore(this_cpu_ptr(&ecall_lock),
   489					   *this_cpu_ptr(&ecall_lock_flags));
   490		return err;
   491	}
   492	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

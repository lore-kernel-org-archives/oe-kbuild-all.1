Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B78F933E346
	for <oe-kbuild-all@lists.linux.dev>; Fri,  2 Oct 2026 03:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790910731; cv=none; b=oy4y/a6E+OHrJgTazrC89a+kM51vurTYJBT0ffrK7FtkDHGaLJPFiecOKMIbk9xOdEgN36J4Hy7VvwkdVSM2WArk03KNRAg7qTRMTgRubyKrd6gVAVIwc103lratrwWXxRzSBzN+tByOnWd/BXhfmRvnTDpL1HNdNpbR3jPxVVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790910731; c=relaxed/simple;
	bh=5BcZw0HLtppJU+QSD1UQIgb/vf7YPoJAi197UML0wzY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Ly0AM3gmiBcdE5QQM8coQdK9uMYAl6zRySnx4VI1XmMxUdAZ+W6WqiLFXHG9H4RL1Bkw+X4riv4xyvdfwTamyQu/O79jwWA6F3mT2HAaBNPPqchNPpbBwf0QmcwrIme18imvJL6ipzMkRvs++ihhd0wJ09G/djC8osQ072UuDtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aKq4D9Uz; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aKq4D9Uz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790910728; x=1822446728;
  h=date:from:to:cc:subject:message-id;
  bh=5BcZw0HLtppJU+QSD1UQIgb/vf7YPoJAi197UML0wzY=;
  b=aKq4D9Uz8z+zEgWISU3lQXI/sXLPYBYa6DuQoFQv75ZmINGH/Fe+7xGt
   KxyuEq7173Prf6m+kHahyh5tIezsXtLiDhUqpPFphJdcZq4NBV29VEIf9
   f/3+4WXQ/5Jgwgh4wmyrgl26heOWrKQzhkFbcTRsAtGRCBVludw6LLVvi
   ubNQkvRGg5amHdhyerLu8M8F4iuB1ebFrQHsp/wo2OQNRP9m5/3xigCkZ
   jEEVX1KTVdebn4vAr/LW18SCprbcoHLaIYFvfczgDz/JRUXqYGTWOxyfH
   Ov4532ULpU3jBdu6F2ZUvX3CgDiVLbTvq1oKshiiU6rJHJI7WWKWvm4r2
   Q==;
X-CSE-ConnectionGUID: v0l9/zaKRuKwQbbTuE1xKw==
X-CSE-MsgGUID: 2wxVz3neQGeOv72DhL7a2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="108059536"
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; 
   d="scan'208";a="108059536"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 20:12:06 -0700
X-CSE-ConnectionGUID: nnh55xfOTJaj0vaq2Jz35A==
X-CSE-MsgGUID: XQ1mBW4+T4+5pBOmzDyIGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; 
   d="scan'208";a="302413084"
Received: from igk-lkp-server01.igk.intel.com (HELO 3fb566d470b1) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 01 Oct 2026 20:12:05 -0700
Received: from kbuild by 3fb566d470b1 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xCTgo-000000000N5-0tu5;
	Fri, 02 Oct 2026 03:12:02 +0000
Date: Fri, 02 Oct 2026 05:11:51 +0200
From: kernel test robot <lkp@intel.com>
To: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev, Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_trace_acpi_support_v1 58/87]
 arch/riscv/kernel/hw_breakpoint.c:374:18: sparse: sparse: cast to restricted
 __le64
Message-ID: <202610020522.LbH1nctO-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/avpatel/linux.git riscv_trace_acpi_support_v1
head:   dc5b9586f90cc15314085bdaa74661fc00d1688f
commit: 2036aec3aee69e374d22b8136e8cf887eee2d2fa [58/87] riscv: Introduce support for hardware break/watchpoints
config: riscv-randconfig-r2300-20261002 (https://download.01.org/0day-ci/archive/20261002/202610020522.LbH1nctO-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 14.3.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261002/202610020522.LbH1nctO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610020522.LbH1nctO-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/riscv/kernel/hw_breakpoint.c:374:18: sparse: sparse: cast to restricted __le64
   arch/riscv/kernel/hw_breakpoint.c:379:18: sparse: sparse: cast to restricted __le64
   arch/riscv/kernel/hw_breakpoint.c:380:18: sparse: sparse: cast to restricted __le64
>> arch/riscv/kernel/hw_breakpoint.c:384:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long tdata1 @@     got restricted __le64 [usertype] @@
   arch/riscv/kernel/hw_breakpoint.c:384:22: sparse:     expected unsigned long tdata1
   arch/riscv/kernel/hw_breakpoint.c:384:22: sparse:     got restricted __le64 [usertype]
>> arch/riscv/kernel/hw_breakpoint.c:385:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long tdata2 @@     got restricted __le64 [usertype] @@
   arch/riscv/kernel/hw_breakpoint.c:385:22: sparse:     expected unsigned long tdata2
   arch/riscv/kernel/hw_breakpoint.c:385:22: sparse:     got restricted __le64 [usertype]
>> arch/riscv/kernel/hw_breakpoint.c:386:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long tdata3 @@     got restricted __le64 [usertype] @@
   arch/riscv/kernel/hw_breakpoint.c:386:22: sparse:     expected unsigned long tdata3
   arch/riscv/kernel/hw_breakpoint.c:386:22: sparse:     got restricted __le64 [usertype]
   arch/riscv/kernel/hw_breakpoint.c:464:50: sparse: sparse: cast to restricted __le64
   arch/riscv/kernel/hw_breakpoint.c:522:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long tdata1 @@     got restricted __le64 [usertype] @@
   arch/riscv/kernel/hw_breakpoint.c:522:22: sparse:     expected unsigned long tdata1
   arch/riscv/kernel/hw_breakpoint.c:522:22: sparse:     got restricted __le64 [usertype]
   arch/riscv/kernel/hw_breakpoint.c:523:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long tdata2 @@     got restricted __le64 [usertype] @@
   arch/riscv/kernel/hw_breakpoint.c:523:22: sparse:     expected unsigned long tdata2
   arch/riscv/kernel/hw_breakpoint.c:523:22: sparse:     got restricted __le64 [usertype]
   arch/riscv/kernel/hw_breakpoint.c:524:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long tdata3 @@     got restricted __le64 [usertype] @@
   arch/riscv/kernel/hw_breakpoint.c:524:22: sparse:     expected unsigned long tdata3
   arch/riscv/kernel/hw_breakpoint.c:524:22: sparse:     got restricted __le64 [usertype]
   arch/riscv/kernel/hw_breakpoint.c:535:15: sparse: sparse: cast to restricted __le64
>> arch/riscv/kernel/hw_breakpoint.c:656:17: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long idx @@     got restricted __le64 [usertype] @@
   arch/riscv/kernel/hw_breakpoint.c:656:17: sparse:     expected unsigned long idx
   arch/riscv/kernel/hw_breakpoint.c:656:17: sparse:     got restricted __le64 [usertype]
   arch/riscv/kernel/hw_breakpoint.c:657:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long tdata1 @@     got restricted __le64 [usertype] @@
   arch/riscv/kernel/hw_breakpoint.c:657:22: sparse:     expected unsigned long tdata1
   arch/riscv/kernel/hw_breakpoint.c:657:22: sparse:     got restricted __le64 [usertype]
   arch/riscv/kernel/hw_breakpoint.c:658:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long tdata2 @@     got restricted __le64 [usertype] @@
   arch/riscv/kernel/hw_breakpoint.c:658:22: sparse:     expected unsigned long tdata2
   arch/riscv/kernel/hw_breakpoint.c:658:22: sparse:     got restricted __le64 [usertype]
   arch/riscv/kernel/hw_breakpoint.c:659:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long tdata3 @@     got restricted __le64 [usertype] @@
   arch/riscv/kernel/hw_breakpoint.c:659:22: sparse:     expected unsigned long tdata3
   arch/riscv/kernel/hw_breakpoint.c:659:22: sparse:     got restricted __le64 [usertype]

vim +374 arch/riscv/kernel/hw_breakpoint.c

   349	
   350	/*
   351	 * Read mcontrol6's hit1:hit0 field for trigger @idx. If either bit is set,
   352	 * clear it in hardware (the Debug spec requires the trigger user to do
   353	 * this; hardware only ever sets it). Returns the RISCV_DBTR_MC6_HIT_*
   354	 * value read (RISCV_DBTR_MC6_HIT_FALSE if unimplemented or unfired).
   355	 */
   356	static unsigned int mc6_read_and_clear_hit(int idx)
   357	{
   358		union sbi_dbtr_shmem_entry *shmem = this_cpu_ptr(sbi_dbtr_shmem);
   359		struct sbi_dbtr_data_msg *xmit;
   360		unsigned long tdata1, tdata2, tdata3;
   361		struct sbiret ret;
   362		unsigned int hit;
   363	
   364		raw_spin_lock_irqsave(this_cpu_ptr(&ecall_lock),
   365				      *this_cpu_ptr(&ecall_lock_flags));
   366	
   367		ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_TRIG_READ, idx, 1, 0, 0, 0, 0);
   368		if (ret.error) {
   369			pr_warn("Failed to read trigger %d. error: %ld\n", idx, ret.error);
   370			hit = RISCV_DBTR_MC6_HIT_FALSE;
   371			goto out;
   372		}
   373	
 > 374		tdata1 = le_to_cpu(shmem->data.tdata1);
   375		hit = RISCV_DBTR_MC6_GET_HIT(tdata1);
   376		if (hit == RISCV_DBTR_MC6_HIT_FALSE)
   377			goto out;
   378	
   379		tdata2 = le_to_cpu(shmem->data.tdata2);
   380		tdata3 = le_to_cpu(shmem->data.tdata3);
   381		RISCV_DBTR_MC6_CLEAR_HIT(tdata1);
   382	
   383		xmit = &shmem->data;
 > 384		xmit->tdata1 = cpu_to_le(tdata1);
 > 385		xmit->tdata2 = cpu_to_le(tdata2);
 > 386		xmit->tdata3 = cpu_to_le(tdata3);
   387	
   388		ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_TRIG_UPDATE, idx, 1, 0, 0, 0, 0);
   389		if (ret.error)
   390			pr_warn("Failed to clear hit bits on trigger %d. error: %ld\n",
   391				idx, ret.error);
   392	
   393	out:
   394		raw_spin_unlock_irqrestore(this_cpu_ptr(&ecall_lock),
   395					   *this_cpu_ptr(&ecall_lock_flags));
   396		return hit;
   397	}
   398	
   399	/*
   400	 * HW Breakpoint/watchpoint handler
   401	 */
   402	static int hw_breakpoint_handler(struct die_args *args)
   403	{
   404		int ret = NOTIFY_DONE;
   405		struct arch_hw_breakpoint *bp;
   406		struct perf_event *event;
   407		int i;
   408	
   409		for (i = 0; i < dbtr_total_num; i++) {
   410			event = this_cpu_read(pcpu_hw_bp_events[i]);
   411			if (!event)
   412				continue;
   413	
   414			bp = counter_arch_bp(event);
   415			switch (bp->type) {
   416			/* Breakpoint */
   417			case HW_BREAKPOINT_X:
   418			{
   419				bool hit = bp->address == args->regs->epc;
   420	
   421				if (!hit && dbtr_type == RISCV_DBTR_TRIG_MCONTROL6)
   422					hit = mc6_read_and_clear_hit(i) != RISCV_DBTR_MC6_HIT_FALSE;
   423	
   424				if (hit) {
   425					perf_bp_event(event, args->regs);
   426					ret = NOTIFY_STOP;
   427				}
   428				break;
   429			}
   430	
   431			/* Watchpoint */
   432			case HW_BREAKPOINT_W:
   433			case HW_BREAKPOINT_R:
   434			case HW_BREAKPOINT_RW:
   435			{
   436				unsigned long stval = args->regs->badaddr;
   437				unsigned long bp_start = bp->address;
   438				unsigned long bp_len = bp->len ?: 1;
   439				unsigned long bp_end = bp_start + bp_len - 1;
   440				unsigned long stval_end = stval + sizeof(long) - 1;
   441				bool hit = false;
   442	
   443				if (bp_end < bp_start)
   444					bp_end = ~0UL;
   445				if (stval_end < stval)
   446					stval_end = ~0UL;
   447	
   448				/*
   449				 * Prefer tdata1.hit from SBI trigger readout whenever
   450				 * possible. Fall back to address-based matching if HIT
   451				 * isn't observed/supported.
   452				 */
   453				if (dbtr_type == RISCV_DBTR_TRIG_MCONTROL) {
   454					unsigned long tdata1;
   455					struct sbiret sret;
   456					union sbi_dbtr_shmem_entry *shmem;
   457	
   458					raw_spin_lock_irqsave(this_cpu_ptr(&ecall_lock),
   459							      *this_cpu_ptr(&ecall_lock_flags));
   460					shmem = this_cpu_ptr(sbi_dbtr_shmem);
   461					sret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_TRIG_READ,
   462							 i, 1, 0, 0, 0, 0);
   463					if (!sret.error) {
   464						tdata1 = le_to_cpu(shmem->data.tdata1);
   465						hit = !!(tdata1 & RISCV_DBTR_MC_HIT_BIT_MASK);
   466					}
   467					raw_spin_unlock_irqrestore(this_cpu_ptr(&ecall_lock),
   468								   *this_cpu_ptr(&ecall_lock_flags));
   469				} else if (dbtr_type == RISCV_DBTR_TRIG_MCONTROL6) {
   470					hit = mc6_read_and_clear_hit(i) != RISCV_DBTR_MC6_HIT_FALSE;
   471				}
   472	
   473				/*
   474				 * Sdtrig may report STVAL as the lowest accessed
   475				 * address while the watchpoint can match a higher byte
   476				 * in the same access.
   477				 */
   478				if (hit ||
   479				    (stval >= bp_start && stval <= bp_end) ||
   480				    (bp_start >= stval && bp_start <= stval_end)) {
   481					perf_bp_event(event, args->regs);
   482					ret = NOTIFY_STOP;
   483				}
   484				break;
   485			}
   486	
   487			default:
   488				pr_warn("Unknown type: %u\n", bp->type);
   489				break;
   490			}
   491		}
   492	
   493		return ret;
   494	}
   495	
   496	int hw_breakpoint_exceptions_notify(struct notifier_block *unused,
   497					    unsigned long val, void *data)
   498	{
   499		if (val != DIE_DEBUG)
   500			return NOTIFY_DONE;
   501	
   502		return hw_breakpoint_handler(data);
   503	}
   504	
   505	/* atomic: counter->ctx->lock is held */
   506	int arch_install_hw_breakpoint(struct perf_event *event)
   507	{
   508		struct arch_hw_breakpoint *bp = counter_arch_bp(event);
   509		union sbi_dbtr_shmem_entry *shmem = this_cpu_ptr(sbi_dbtr_shmem);
   510		struct sbi_dbtr_data_msg *xmit;
   511		struct sbi_dbtr_id_msg *recv;
   512		struct perf_event **slot;
   513		unsigned long idx;
   514		struct sbiret ret;
   515		int err = 0;
   516	
   517		raw_spin_lock_irqsave(this_cpu_ptr(&ecall_lock),
   518				      *this_cpu_ptr(&ecall_lock_flags));
   519	
   520		xmit = &shmem->data;
   521		recv = &shmem->id;
 > 522		xmit->tdata1 = cpu_to_le(bp->tdata1);
   523		xmit->tdata2 = cpu_to_le(bp->tdata2);
   524		xmit->tdata3 = cpu_to_le(bp->tdata3);
   525	
   526		ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_TRIG_INSTALL,
   527				1, 0, 0, 0, 0, 0);
   528	
   529		if (ret.error) {
   530			pr_warn("Failed to install trigger\n");
   531			err = sbi_err_map_linux_errno(ret.error);
   532			goto done;
   533		}
   534	
   535		idx = le_to_cpu(recv->idx);
   536		if (idx >= dbtr_total_num) {
   537			pr_warn("Invalid trigger index %lu\n", idx);
   538			err = -EINVAL;
   539			goto done;
   540		}
   541	
   542		slot = this_cpu_ptr(&pcpu_hw_bp_events[idx]);
   543		if (*slot) {
   544			pr_warn("Slot %lu is in use\n", idx);
   545			err = -EBUSY;
   546			goto done;
   547		}
   548	
   549		/* Save the event - to be looked up in handler */
   550		*slot = event;
   551	
   552	done:
   553		raw_spin_unlock_irqrestore(this_cpu_ptr(&ecall_lock),
   554					   *this_cpu_ptr(&ecall_lock_flags));
   555		return err;
   556	}
   557	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

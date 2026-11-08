Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794107716;
	b=IFOmV2hXlJmfZXUWQkSnurDHD1+JDSDlQVngc/+DaEOdelYJgo91bdnewNB8nzh2cSY/
	 dUfW+9XbLUMphRkl0QgptM412k2ALow48CEZ5hdvjnMFrDWPdlCgY4X+zMIdg77l/FpAy
	 LzuLEB6E1rlldeNGUlFUXBoN5iO/GQlDVbv2We8WkjwWbBB3GFnrE5RTmVXAqe2N4mBBy
	 aJ1xoYmjUndQxqLF0X3wn0ifg6oFlZFjavDT8bh8XSrupswWgqjur56ep1AzjHLNBxcY+
	 5yo/BsVB6yK5igZCZCDcNdvEFhO/MBZkIgzKyrFkw6mf2oF+9kzoFxyCreVOM8OUWkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794107716;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=s8KMfoDBNEZKu5pPRKbxhCWeVwkJ/ngNWoU5BpfsZN0=;
	b=0ta9kRJs/7nxfydUEStUoOzVbN9Ug+lhO99BhOAdxJYWqOOebFoxTHUVfjMoNWg4wqTO
	 FoVJFS4brYewB99hkrlAXI9cG3+BJ8zFPr9lAjng4KPxcMfrpTxGRgotIqawntj2yBiYN
	 B7wFlKJkO2aVbv6W0YayxdaMxoHrot6AaeJb8/HaDDo5sxdw6FMEH3JGnBWHLalyRJoxD
	 uxy1TZsN4Ct/L/gurbg7D+VRB096hGFtcdUwjpbjxHl6ao67LpbcXPjbx74Ipp/fzqSnC
	 a/2taqbTlwcTMG16q+vBvUgaebthhP2nsA8PFL+zyboZHozZDXPhXGhUo/yVMJle4Zg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="A0bH79T/";
	arc=none smtp.remote-ip=198.175.65.17
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15198606A31A
	for <oe-kbuild-all@lists.linux.dev>; Sun,  8 Nov 2026 03:15:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15198606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=A0bH79T/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794107714; x=1825643714;
  h=date:from:to:cc:subject:message-id;
  bh=13he0irzkpVX693sDdjoXGDkBAboVy4BMKlAGPImAEs=;
  b=A0bH79T/8n8IvptYftWnwsVZC1+i8ltSxiWZXwZ9ei5CJgbSmSRksNHQ
   yLZr3jQty7CbTF7dw6yWlqla8JEPmladVOl4jxprcX2p8AMWNIYYwJeRt
   NHUzC3vs0ifh5Pl8ECN/O3ouSFOwJ03Vf2rXbtAB9CEiviwYMlNXTkMt8
   iBbMVitULHAdBxbszc+vy8D1tUr/GT99gbtwUzJT6pM6vNnF52Mua+5qk
   95DRUzm9nyKf7kHWgpC/YYcYW3gq5DomgwcKeJqCfidBeGt+1qQ/sHFm4
   P9h0TDieGgBL/B3/J2cI/y6svC6QkVLvTwL2CWrypGf3zrRSlcOwK/FiH
   Q==;
X-CSE-ConnectionGUID: f/hy0Ft0TKKt9J3eI8V3lg==
X-CSE-MsgGUID: YYGfEeP4ShOpwEmnkgBHyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11959"; a="2902576"
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="2902576"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2026 19:15:14 -0800
X-CSE-ConnectionGUID: Uzu5wFLoRsuE2Enp6+aocQ==
X-CSE-MsgGUID: pIzV/fpYTRSd7wEf3UdQJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="7922011"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 07 Nov 2026 19:15:12 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xPtN8-00000000Ayq-00fl;
	Sun, 08 Nov 2026 03:15:10 +0000
Date: Sun, 08 Nov 2026 04:14:30 +0100
From: kernel test robot <lkp@intel.com>
To: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev, Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_trace_support_v6 59/80]
 arch/riscv/kernel/hw_breakpoint.c:430:17: sparse: sparse: incorrect type in
 assignment (different base types)
Message-ID: <202611080439.6uZPgS9n-lkp@intel.com>
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
commit: 2475c5f14bb478c8b3898201424a46d23fdae8a2 [59/80] riscv: Introduce support for hardware break/watchpoints
config: riscv-randconfig-r2311-20261108 (https://download.01.org/0day-ci/archive/20261108/202611080439.6uZPgS9n-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 10.5.0
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261108/202611080439.6uZPgS9n-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611080439.6uZPgS9n-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/riscv/kernel/hw_breakpoint.c:430:17: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long idx @@     got restricted __le32 [usertype] @@
   arch/riscv/kernel/hw_breakpoint.c:430:17: sparse:     expected unsigned long idx
   arch/riscv/kernel/hw_breakpoint.c:430:17: sparse:     got restricted __le32 [usertype]
>> arch/riscv/kernel/hw_breakpoint.c:431:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long tdata1 @@     got restricted __le32 [usertype] @@
   arch/riscv/kernel/hw_breakpoint.c:431:22: sparse:     expected unsigned long tdata1
   arch/riscv/kernel/hw_breakpoint.c:431:22: sparse:     got restricted __le32 [usertype]
>> arch/riscv/kernel/hw_breakpoint.c:432:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long tdata2 @@     got restricted __le32 [usertype] @@
   arch/riscv/kernel/hw_breakpoint.c:432:22: sparse:     expected unsigned long tdata2
   arch/riscv/kernel/hw_breakpoint.c:432:22: sparse:     got restricted __le32 [usertype]
>> arch/riscv/kernel/hw_breakpoint.c:433:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long tdata3 @@     got restricted __le32 [usertype] @@
   arch/riscv/kernel/hw_breakpoint.c:433:22: sparse:     expected unsigned long tdata3
   arch/riscv/kernel/hw_breakpoint.c:433:22: sparse:     got restricted __le32 [usertype]
>> arch/riscv/kernel/hw_breakpoint.c:515:18: sparse: sparse: cast to restricted __le32
   arch/riscv/kernel/hw_breakpoint.c:520:18: sparse: sparse: cast to restricted __le32
   arch/riscv/kernel/hw_breakpoint.c:521:18: sparse: sparse: cast to restricted __le32
   arch/riscv/kernel/hw_breakpoint.c:558:18: sparse: sparse: cast to restricted __le32
   arch/riscv/kernel/hw_breakpoint.c:563:18: sparse: sparse: cast to restricted __le32
   arch/riscv/kernel/hw_breakpoint.c:564:18: sparse: sparse: cast to restricted __le32
>> arch/riscv/kernel/hw_breakpoint.c:687:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long tstate @@     got restricted __le32 [usertype] @@
   arch/riscv/kernel/hw_breakpoint.c:687:22: sparse:     expected unsigned long tstate
   arch/riscv/kernel/hw_breakpoint.c:687:22: sparse:     got restricted __le32 [usertype]
   arch/riscv/kernel/hw_breakpoint.c:688:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long tdata1 @@     got restricted __le32 [usertype] @@
   arch/riscv/kernel/hw_breakpoint.c:688:22: sparse:     expected unsigned long tdata1
   arch/riscv/kernel/hw_breakpoint.c:688:22: sparse:     got restricted __le32 [usertype]
   arch/riscv/kernel/hw_breakpoint.c:689:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long tdata2 @@     got restricted __le32 [usertype] @@
   arch/riscv/kernel/hw_breakpoint.c:689:22: sparse:     expected unsigned long tdata2
   arch/riscv/kernel/hw_breakpoint.c:689:22: sparse:     got restricted __le32 [usertype]
   arch/riscv/kernel/hw_breakpoint.c:690:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long tdata3 @@     got restricted __le32 [usertype] @@
   arch/riscv/kernel/hw_breakpoint.c:690:22: sparse:     expected unsigned long tdata3
   arch/riscv/kernel/hw_breakpoint.c:690:22: sparse:     got restricted __le32 [usertype]
   arch/riscv/kernel/hw_breakpoint.c:701:15: sparse: sparse: cast to restricted __le32

vim +430 arch/riscv/kernel/hw_breakpoint.c

   416	
   417	static void dbtr_encode_update(union sbi_dbtr_shmem_entry *shmem,
   418				       unsigned long idx, unsigned long tdata1,
   419				       unsigned long tdata2, unsigned long tdata3)
   420	{
   421		struct sbi_dbtr_id_msg *id = &shmem->id;
   422		struct sbi_dbtr_data_msg *data = &shmem->data;
   423	
   424		/*
   425		 * SBI_EXT_DBTR_TRIG_UPDATE takes the number of entries in a0.  The
   426		 * trigger index for each entry lives in the first shared-memory word;
   427		 * that word is named tstate only when the same union is used for
   428		 * TRIG_READ replies.
   429		 */
 > 430		id->idx = cpu_to_le(idx);
 > 431		data->tdata1 = cpu_to_le(tdata1);
 > 432		data->tdata2 = cpu_to_le(tdata2);
 > 433		data->tdata3 = cpu_to_le(tdata3);
   434	}
   435	
   436	static struct sbiret dbtr_update_trigger_locked(unsigned long idx,
   437							unsigned long tdata1,
   438							unsigned long tdata2,
   439							unsigned long tdata3)
   440	{
   441		union sbi_dbtr_shmem_entry *shmem = this_cpu_ptr(sbi_dbtr_shmem);
   442	
   443		dbtr_encode_update(shmem, idx, tdata1, tdata2, tdata3);
   444	
   445		return sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_TRIG_UPDATE,
   446				 1, 0, 0, 0, 0, 0);
   447	}
   448	
   449	static int dbtr_update_event_tdata(struct perf_event *event,
   450					   unsigned long tdata1,
   451					   unsigned long tdata2,
   452					   unsigned long tdata3, bool wait)
   453	{
   454		struct perf_event **slot;
   455		unsigned long flags;
   456		struct sbiret ret;
   457		int i;
   458	
   459		if (wait)
   460			raw_spin_lock_irqsave(this_cpu_ptr(&ecall_lock), flags);
   461		else if (!raw_spin_trylock_irqsave(this_cpu_ptr(&ecall_lock), flags))
   462			return -EBUSY;
   463	
   464		for (i = 0; i < dbtr_total_num; i++) {
   465			slot = this_cpu_ptr(&pcpu_hw_bp_events[i]);
   466	
   467			if (*slot == event)
   468				break;
   469		}
   470	
   471		if (i == dbtr_total_num) {
   472			raw_spin_unlock_irqrestore(this_cpu_ptr(&ecall_lock), flags);
   473			return -ENOENT;
   474		}
   475	
   476		ret = dbtr_update_trigger_locked(i, tdata1, tdata2, tdata3);
   477		raw_spin_unlock_irqrestore(this_cpu_ptr(&ecall_lock), flags);
   478	
   479		if (ret.error)
   480			return sbi_err_map_linux_errno(ret.error);
   481	
   482		return 0;
   483	}
   484	
   485	static struct sbiret dbtr_uninstall_trigger_locked(unsigned long idx)
   486	{
   487		return sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_TRIG_UNINSTALL,
   488				 idx, 1, 0, 0, 0, 0);
   489	}
   490	
   491	static bool mc_read_and_clear_hit(int idx)
   492	{
   493		union sbi_dbtr_shmem_entry *shmem = this_cpu_ptr(sbi_dbtr_shmem);
   494		unsigned long flags, tdata1, tdata2, tdata3;
   495		struct sbiret ret;
   496		bool hit;
   497	
   498		/*
   499		 * This runs from DIE_DEBUG.  If the exception interrupted another DBTR
   500		 * SBI call on this CPU, blocking on the same raw spinlock would deadlock;
   501		 * the handler can still fall back to address-based matching.
   502		 */
   503		if (!raw_spin_trylock_irqsave(this_cpu_ptr(&ecall_lock), flags))
   504			return false;
   505	
   506		ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_TRIG_READ,
   507				idx, 1, 0, 0, 0, 0);
   508		if (ret.error) {
   509			pr_warn("Failed to read trigger %d. error: %ld\n",
   510				idx, ret.error);
   511			hit = false;
   512			goto out;
   513		}
   514	
 > 515		tdata1 = le_to_cpu(shmem->data.tdata1);
   516		hit = !!(tdata1 & RISCV_DBTR_MC_HIT);
   517		if (!hit)
   518			goto out;
   519	
   520		tdata2 = le_to_cpu(shmem->data.tdata2);
   521		tdata3 = le_to_cpu(shmem->data.tdata3);
   522		tdata1 &= ~RISCV_DBTR_MC_HIT;
   523	
   524		ret = dbtr_update_trigger_locked(idx, tdata1, tdata2, tdata3);
   525		if (ret.error)
   526			pr_warn("Failed to clear hit bit on trigger %d. error: %ld\n",
   527				idx, ret.error);
   528	
   529	out:
   530		raw_spin_unlock_irqrestore(this_cpu_ptr(&ecall_lock), flags);
   531		return hit;
   532	}
   533	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

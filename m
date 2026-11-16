Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794843114;
	b=iUMBNnsX5oA2DLFc2Ry/N3ENuCl3p8hN/P4S7nRCn5zDQST34Csa/Wn/VgFJTJ/slRj2
	 XoYFak2Zi3als7+FoR2hRLcxJ1QbuzR2j1/t6RWnNjqbRy00jyYTnifE4KrIiI3QfCVCD
	 khryODWLeLwyVwLs0nx2w+lG4mgExrVVUcOI4WQVZNzSj/ayZ2fxdAHnNd2LgApvscqZB
	 v1AJG3hX5AliJGm483sOtSLI8AOvxJ+d2JHQb7Etezlyp52tBFwahiNljxnZKBFc//A94
	 gdmtH6NB89IDCp6l6r7/1rZKh2RdsPerpPnrgLF9/HdNidSLneACjIe+H++RhKrVN5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794843114;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=Y212+08pgu5XuXUfaiZHZ4d10gC01wJWgZFmhRM289Y=;
	b=2BuULPQBuCvUGokCle0LWOrNc+Q6WUv/s4RsYI2iOPCOUX9gL5usiYJxMFuT6dsXV7qR
	 xHXh1lPOq8/Afc1hJ+DP82NGw47kjVd68UoqQr0Klr1fTJqv9pvqOa1cE3W5l0JHaJHDR
	 Lk3k2hmcL4THNapi84GwJz+8p5ShB7xKtHPFBG8NWgYE0u/9frcBu/K2cWUUYzSIoQEQs
	 jO1ZZDp0zf8OkunY8IIBc4dOkgyFKvIUi9KD/kNgrGiLSsovmx0KeG+Hgn5PbkigaXp/G
	 nyMIW8hl7c+wQnsZ3BqsMB+PRZm5wGL0v6j57VnE8C7mCoXqOCWKzAN3ZnJmmxSHLSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="PddI/4A2";
	arc=none smtp.remote-ip=192.198.163.16
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2039606A883
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Nov 2026 15:31:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2039606A883
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PddI/4A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794843113; x=1826379113;
  h=date:from:to:cc:subject:message-id;
  bh=z1P1/7hl8VH4K4KTBMKVoqCtxcgngCfSWCvdp7HBDLQ=;
  b=PddI/4A2mw42KgNNPCs9wLuNvoEZRNEYJHI+SiQXWne+/oy5A/7JClWS
   vp+rC15PjNeWXZuo8k9Wz/EbMagcITs3ckCz1pZulx9LbkeCKlNyCwOrq
   1RcOn/aXAg9vL20jlk1pXQewH1h2i4PPdtcoQzPf5q90DQ/AGJDDgpdqr
   RhQcqlx+GHJcOc83+PiV7l4poxgvHmCYNpVzsDuQqAKlk49QIuDDYD3EQ
   ySSMnQ+Z5GbDQVfcgqfM4MjPjN5LefGgr58DhQReFcCzD/wFNy5xHo9SW
   PWG5rJHHHgLQH9BEr+zyy5+scMJPIca9isXInsAHmI2I+ZRuJPJcjxbDe
   w==;
X-CSE-ConnectionGUID: 231e/LCnQmi4r5lCH+D5VA==
X-CSE-MsgGUID: Xofs3CUdTnG+Qn/PQgb3cw==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3618076"
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="3618076"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 07:31:42 -0800
X-CSE-ConnectionGUID: jDzzpOY3TrqJIaZwiOUO8g==
X-CSE-MsgGUID: qbeM7dqORRKrY/oh4drlYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="9497390"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 16 Nov 2026 07:31:40 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xSygD-000000002jK-47ne;
	Mon, 16 Nov 2026 15:31:37 +0000
Date: Mon, 16 Nov 2026 16:30:40 +0100
From: kernel test robot <lkp@intel.com>
To: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev, Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_sspesa_v2 68/98]
 arch/riscv/kernel/hw_breakpoint.c:430:17: sparse: sparse: incorrect type in
 assignment (different base types)
Message-ID: <202611161603.THiUdqUJ-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/avpatel/linux.git riscv_sspesa_v2
head:   6deccfa10a938ba2257b489c067a1928022d510d
commit: c166e536d2526e6bab2d5649da51d5f871c73d77 [68/98] riscv: Introduce support for hardware break/watchpoints
config: riscv-randconfig-r2304-20261116 (https://download.01.org/0day-ci/archive/20261116/202611161603.THiUdqUJ-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261116/202611161603.THiUdqUJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611161603.THiUdqUJ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/riscv/kernel/hw_breakpoint.c:430:17: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long idx @@     got restricted __le64 [usertype] @@
   arch/riscv/kernel/hw_breakpoint.c:430:17: sparse:     expected unsigned long idx
   arch/riscv/kernel/hw_breakpoint.c:430:17: sparse:     got restricted __le64 [usertype]
>> arch/riscv/kernel/hw_breakpoint.c:431:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long tdata1 @@     got restricted __le64 [usertype] @@
   arch/riscv/kernel/hw_breakpoint.c:431:22: sparse:     expected unsigned long tdata1
   arch/riscv/kernel/hw_breakpoint.c:431:22: sparse:     got restricted __le64 [usertype]
>> arch/riscv/kernel/hw_breakpoint.c:432:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long tdata2 @@     got restricted __le64 [usertype] @@
   arch/riscv/kernel/hw_breakpoint.c:432:22: sparse:     expected unsigned long tdata2
   arch/riscv/kernel/hw_breakpoint.c:432:22: sparse:     got restricted __le64 [usertype]
>> arch/riscv/kernel/hw_breakpoint.c:433:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long tdata3 @@     got restricted __le64 [usertype] @@
   arch/riscv/kernel/hw_breakpoint.c:433:22: sparse:     expected unsigned long tdata3
   arch/riscv/kernel/hw_breakpoint.c:433:22: sparse:     got restricted __le64 [usertype]
>> arch/riscv/kernel/hw_breakpoint.c:515:18: sparse: sparse: cast to restricted __le64
   arch/riscv/kernel/hw_breakpoint.c:520:18: sparse: sparse: cast to restricted __le64
   arch/riscv/kernel/hw_breakpoint.c:521:18: sparse: sparse: cast to restricted __le64
   arch/riscv/kernel/hw_breakpoint.c:558:18: sparse: sparse: cast to restricted __le64
   arch/riscv/kernel/hw_breakpoint.c:563:18: sparse: sparse: cast to restricted __le64
   arch/riscv/kernel/hw_breakpoint.c:564:18: sparse: sparse: cast to restricted __le64
   arch/riscv/kernel/hw_breakpoint.c:687:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long tstate @@     got restricted __le64 [usertype] @@
   arch/riscv/kernel/hw_breakpoint.c:687:22: sparse:     expected unsigned long tstate
   arch/riscv/kernel/hw_breakpoint.c:687:22: sparse:     got restricted __le64 [usertype]
   arch/riscv/kernel/hw_breakpoint.c:688:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long tdata1 @@     got restricted __le64 [usertype] @@
   arch/riscv/kernel/hw_breakpoint.c:688:22: sparse:     expected unsigned long tdata1
   arch/riscv/kernel/hw_breakpoint.c:688:22: sparse:     got restricted __le64 [usertype]
   arch/riscv/kernel/hw_breakpoint.c:689:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long tdata2 @@     got restricted __le64 [usertype] @@
   arch/riscv/kernel/hw_breakpoint.c:689:22: sparse:     expected unsigned long tdata2
   arch/riscv/kernel/hw_breakpoint.c:689:22: sparse:     got restricted __le64 [usertype]
   arch/riscv/kernel/hw_breakpoint.c:690:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long tdata3 @@     got restricted __le64 [usertype] @@
   arch/riscv/kernel/hw_breakpoint.c:690:22: sparse:     expected unsigned long tdata3
   arch/riscv/kernel/hw_breakpoint.c:690:22: sparse:     got restricted __le64 [usertype]
   arch/riscv/kernel/hw_breakpoint.c:701:15: sparse: sparse: cast to restricted __le64

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

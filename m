Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 736622C0274
	for <oe-kbuild-all@lists.linux.dev>; Thu, 25 Dec 2025 23:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766704438; cv=none; b=dsywoGT2RRVZKSB8E3tTU851wwdaVOz0QBQWq3aCR7ua1idJ/z0M6wJdgOGu+11Jy3HRqKgbESpd5kJJpW/a6Aye8OZZ2wiiNY+YX4P1i7jSr4AlAoQPQuEMHdnKYQkVpFSmHVZ4TuxCSrSZfkXtakdx2a13VwHEMDNVJqRIB8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766704438; c=relaxed/simple;
	bh=8cu0hK7xhabQwEQEFo/0n68GV0LkzpUgMh/MKVfRnFQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=W6VH/6vDLoE0mHu8FSylPrK+Slq47PipHCXOxApMOUgRBAVhDJAS2VLpIrQnGeHAWtyQMKoVK+sw3huxVM7iE7DyNuJTNogadBSqBBK41mRdabOOSHIPMKsqiHvU5ZWg14pv6o1Lew+428aE3o4nuQjj9nlx2CnDDWZ82fMtQs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ACDibQ1/; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ACDibQ1/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766704436; x=1798240436;
  h=date:from:to:cc:subject:message-id;
  bh=8cu0hK7xhabQwEQEFo/0n68GV0LkzpUgMh/MKVfRnFQ=;
  b=ACDibQ1/t1H5L6zVgcGYQasULry9m66YI5hinNEFCNkzi/jVV8lcAEBT
   XSGBwdfFRsNxsFNhYADNk1ZkzLlUGw1BtIdEd8KG/QctWFSQgKQatY4WV
   7sNREJzqP7U062J6Vizr6X9DOOi8oCj+BISVP1aZRsydnhOP3J+ZBo/EO
   EFFmp4RgupUi7C6LyvZ0t+DxQmVSGq70DTfvYQWhOxhj/CFvx5MadbaU9
   9MNHQ2cH7ukti5dqgUZj6kkT/rdQu0I0umS0ldgPo6y3D+5IS6Dh9s5UC
   Nop5QznjNZ8kqrgwjhDrY7P1zCYQGU2leygb+WZXoI+tH6bhk3vrXvH/D
   Q==;
X-CSE-ConnectionGUID: 07dd6tDtQwqQhcWSR67Oww==
X-CSE-MsgGUID: LFTCS9EnSRG2DZx0fO+XUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11652"; a="85902898"
X-IronPort-AV: E=Sophos;i="6.21,177,1763452800"; 
   d="scan'208";a="85902898"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Dec 2025 15:13:54 -0800
X-CSE-ConnectionGUID: Y6J5wJ9+Qn2/+dJiHE41oA==
X-CSE-MsgGUID: JYEfnY78SN2uTS0/ISNrXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,177,1763452800"; 
   d="scan'208";a="237682057"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 25 Dec 2025 15:13:53 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vYuWk-000000004Wd-1rTQ;
	Thu, 25 Dec 2025 23:13:50 +0000
Date: Fri, 26 Dec 2025 07:13:43 +0800
From: kernel test robot <lkp@intel.com>
To: Himanshu Chauhan <hchauhan@ventanamicro.com>
Cc: oe-kbuild-all@lists.linux.dev, Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_sbi_dbtr_v2 54/55]
 arch/riscv/kernel/hw_breakpoint.c:441:22: sparse: sparse: incorrect type in
 assignment (different base types)
Message-ID: <202512260711.WkksTCpx-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/avpatel/linux.git riscv_sbi_dbtr_v2
head:   99cb6c466559dba2b0011d84701a156c252e7c59
commit: 17f5b9035af5d40081b359d9b04cf86ed15583ae [54/55] riscv: Introduce support for hardware break/watchpoints
config: riscv-randconfig-r122-20251225 (https://download.01.org/0day-ci/archive/20251226/202512260711.WkksTCpx-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251226/202512260711.WkksTCpx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512260711.WkksTCpx-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/riscv/kernel/hw_breakpoint.c:441:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long tdata1 @@     got restricted __le32 [usertype] @@
   arch/riscv/kernel/hw_breakpoint.c:441:22: sparse:     expected unsigned long tdata1
   arch/riscv/kernel/hw_breakpoint.c:441:22: sparse:     got restricted __le32 [usertype]
>> arch/riscv/kernel/hw_breakpoint.c:442:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long tdata2 @@     got restricted __le32 [usertype] @@
   arch/riscv/kernel/hw_breakpoint.c:442:22: sparse:     expected unsigned long tdata2
   arch/riscv/kernel/hw_breakpoint.c:442:22: sparse:     got restricted __le32 [usertype]
>> arch/riscv/kernel/hw_breakpoint.c:443:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long tdata3 @@     got restricted __le32 [usertype] @@
   arch/riscv/kernel/hw_breakpoint.c:443:22: sparse:     expected unsigned long tdata3
   arch/riscv/kernel/hw_breakpoint.c:443:22: sparse:     got restricted __le32 [usertype]
>> arch/riscv/kernel/hw_breakpoint.c:454:15: sparse: sparse: cast to restricted __le32
   arch/riscv/kernel/hw_breakpoint.c:558:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long tdata1 @@     got restricted __le32 [usertype] @@
   arch/riscv/kernel/hw_breakpoint.c:558:22: sparse:     expected unsigned long tdata1
   arch/riscv/kernel/hw_breakpoint.c:558:22: sparse:     got restricted __le32 [usertype]
   arch/riscv/kernel/hw_breakpoint.c:559:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long tdata2 @@     got restricted __le32 [usertype] @@
   arch/riscv/kernel/hw_breakpoint.c:559:22: sparse:     expected unsigned long tdata2
   arch/riscv/kernel/hw_breakpoint.c:559:22: sparse:     got restricted __le32 [usertype]
   arch/riscv/kernel/hw_breakpoint.c:560:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long tdata3 @@     got restricted __le32 [usertype] @@
   arch/riscv/kernel/hw_breakpoint.c:560:22: sparse:     expected unsigned long tdata3
   arch/riscv/kernel/hw_breakpoint.c:560:22: sparse:     got restricted __le32 [usertype]

vim +441 arch/riscv/kernel/hw_breakpoint.c

   423	
   424	/* atomic: counter->ctx->lock is held */
   425	int arch_install_hw_breakpoint(struct perf_event *event)
   426	{
   427		struct arch_hw_breakpoint *bp = counter_arch_bp(event);
   428		union sbi_dbtr_shmem_entry *shmem = this_cpu_ptr(sbi_dbtr_shmem);
   429		struct sbi_dbtr_data_msg *xmit;
   430		struct sbi_dbtr_id_msg *recv;
   431		struct perf_event **slot;
   432		unsigned long idx;
   433		struct sbiret ret;
   434		int err = 0;
   435	
   436		raw_spin_lock_irqsave(this_cpu_ptr(&ecall_lock),
   437				      *this_cpu_ptr(&ecall_lock_flags));
   438	
   439		xmit = &shmem->data;
   440		recv = &shmem->id;
 > 441		xmit->tdata1 = cpu_to_le(bp->tdata1);
 > 442		xmit->tdata2 = cpu_to_le(bp->tdata2);
 > 443		xmit->tdata3 = cpu_to_le(bp->tdata3);
   444	
   445		ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_TRIG_INSTALL,
   446				1, 0, 0, 0, 0, 0);
   447	
   448		if (ret.error) {
   449			pr_warn("%s: failed to install trigger\n", __func__);
   450			err = -EIO;
   451			goto done;
   452		}
   453	
 > 454		idx = le_to_cpu(recv->idx);
   455		if (idx >= dbtr_total_num) {
   456			pr_warn("%s: invalid trigger index %lu\n", __func__, idx);
   457			err = -EINVAL;
   458			goto done;
   459		}
   460	
   461		slot = this_cpu_ptr(&pcpu_hw_bp_events[idx]);
   462		if (*slot) {
   463			pr_warn("%s: slot %lu is in use\n", __func__, idx);
   464			err = -EBUSY;
   465			goto done;
   466		}
   467	
   468		pr_debug("Trigger %lu installed at index 0x%lx\n", bp->tdata2, idx);
   469	
   470		/* Save the event - to be looked up in handler */
   471		*slot = event;
   472	
   473	done:
   474		raw_spin_unlock_irqrestore(this_cpu_ptr(&ecall_lock),
   475					   *this_cpu_ptr(&ecall_lock_flags));
   476		return err;
   477	}
   478	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

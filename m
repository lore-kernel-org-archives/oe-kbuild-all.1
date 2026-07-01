Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F85834F24A
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Jul 2026 19:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782932455; cv=none; b=uPI/6trODP1GTK7sVwcsVYvdepVWXa0lwslzFk7WxLzsl1A4U3xM2+woJstMuk4NAQhUGIvu2OijNMjcDhkL9Yi3a/AMOKXXSxFWX9egs3tMBiEs2LOJD7xQCEl6qSPrOp9gXdySeie+bZsA+UGi2CE05b++JL+Pr0FLwWkvc1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782932455; c=relaxed/simple;
	bh=Te+9ls+khfl7yEUEGrX7QcgrK1k3VM+MIq1k8gVc3TY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FPUi0bEyfFDSgAuk3aSsGFfvmZ08GulVzFOIPNBuTu4IykXdEG4kT0p3J9vQB3dEIfFG4eG+1/vUQCTieeD2xptDyY1hqlts5L2CXjiCAxRl7DElBzv66LaHyylQFq+YMhmEgu3XqhId9uGvgT7m6NRxENBgMJ5CYKpVEeQJBbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HNsAHW4U; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HNsAHW4U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782932454; x=1814468454;
  h=date:from:to:cc:subject:message-id;
  bh=Te+9ls+khfl7yEUEGrX7QcgrK1k3VM+MIq1k8gVc3TY=;
  b=HNsAHW4Ur4/hyt6vi0Sii98qoplFo0a6nI9MGQCJUK0C+yy0hLxTjxuP
   3DcaFni3pPPloSHUzVstV2FIK+1isMOyqTw025VBeS7JHV739YklSOiQp
   MQvWRye2ISzd2ubcAgVW/7XS7teEDaxSn0ZHCgqjWkWPE3Y9tyU7AQwFI
   Pf/22ujgsJslpv/xG/Tptt2QziRuU/njJ+BPWOXxpNil02Jt/6Fk2Tn0v
   +YWhCeT3NjhcY7X8m9IaWi+LILDYkN/JRGQaBNm4WPnrSTa/2pqNUSovR
   4iZ3idxBc8v9mXT+bbmOMYZ9JfHEZgC90YH5HsSD5VlOCPDl+zGjYE+2M
   Q==;
X-CSE-ConnectionGUID: 9ZdfOPmqSqWlE214SQLhOg==
X-CSE-MsgGUID: nLui1pJhSQuuiCpQHCWzSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="94032971"
X-IronPort-AV: E=Sophos;i="6.25,142,1779174000"; 
   d="scan'208";a="94032971"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 12:00:53 -0700
X-CSE-ConnectionGUID: 7SqqWEZDQX6XHkeZ+7pjgw==
X-CSE-MsgGUID: 8UZpNQ56RmCSGzmr7MRJLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,142,1779174000"; 
   d="scan'208";a="256567020"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 01 Jul 2026 12:00:51 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wf0Ay-000000009Yh-1t8J;
	Wed, 01 Jul 2026 19:00:48 +0000
Date: Thu, 02 Jul 2026 03:00:25 +0800
From: kernel test robot <lkp@intel.com>
To: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev, Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_sbi_dbtr_v3 63/64]
 arch/riscv/kernel/hw_breakpoint.c:441:22: sparse: sparse: incorrect type in
 assignment (different base types)
Message-ID: <202607020239.MsmfbLpY-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/avpatel/linux.git riscv_sbi_dbtr_v3
head:   dc427f45c78ef4a4158898a13df1e1119af95be3
commit: b85d9f545481fd4c956f5bc45ec5c6e2cb3d72ab [63/64] riscv: Introduce support for hardware break/watchpoints
config: riscv-randconfig-r134-20260701 (https://download.01.org/0day-ci/archive/20260702/202607020239.MsmfbLpY-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 6cc609bb250b21b47fc7d394b4019101e9983597)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260702/202607020239.MsmfbLpY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607020239.MsmfbLpY-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   WARNING: invalid argument to '-march': '_zacas_zabha'
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

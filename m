Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 272D72556E
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Feb 2025 07:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739000905; cv=none; b=DWBsotl/iEtr+nvt0oyplY81D3SZoxZ+vsPtGGEmg3o60hVh/tV7mCZxsOfpczO36YP17IC+Tau9b9CxSxegjlQmKkCsUeMxqOClupOz+YRfOpjCiRIDfPGHoVH3AYHH5VsHh57ax7Lhrdx62gm35TESduBEV73Ro7XGunkxDc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739000905; c=relaxed/simple;
	bh=8nrrxds1NLUVD7kcoXGw94uBr7NxEuCLmlQWM8Hy92Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BtT8yYm2/NNYH0s8ewW8T4ZaX7varIkbYumvXVEXS3Pp0Qv4ez83aYOpbvHFd+uDyxSuvnWr8HQ9BrgP+RGvodtcRmh8GAWkxq3b1BqAJzkd9BKyHp7xD0p17NyPuvvyvKbTpfVITa2WtJgZ8SM8pMX+eOemkpYTP+XG554nmVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HrZCNrMn; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HrZCNrMn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739000903; x=1770536903;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8nrrxds1NLUVD7kcoXGw94uBr7NxEuCLmlQWM8Hy92Q=;
  b=HrZCNrMnWTd364ZWKLCXYesL8eIskZhvMxzmF3K8EhrTB6u9QUoWhmUI
   CzZWVAzzcro4z9eUM5+T10+bpS0uye1m1P2nbFazfZfaUWIvLgXLsE6YS
   w0MLzqWo+ugi9Vi3jOZT1kubertRBEbFx++ZKekEWgLjtvVcWUlYC+3d1
   uPGLvSaDpTAq8oyqD5gdBDOgqA6PW3E8LxOSwoJSjhTr4yBYQ13Hi9vZW
   6Dp13LXEEHc53xqMWkj6y6K1OILHp4TpBsoL4nZ2xy9Yt7xIqI8AiQvUl
   kDiSd0gGjxV2Wzu35CpgBK+0kPGPEWu5gU8L/+Cxirrg7ldB+zMZmmIIF
   A==;
X-CSE-ConnectionGUID: KvVb40TfQF6H5Zuj5tUI3w==
X-CSE-MsgGUID: WeD6iJg6Qw+9Ankhgsz7lg==
X-IronPort-AV: E=McAfee;i="6700,10204,11338"; a="62120114"
X-IronPort-AV: E=Sophos;i="6.13,269,1732608000"; 
   d="scan'208";a="62120114"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2025 23:48:23 -0800
X-CSE-ConnectionGUID: Y9T7O+xcSsKVqVxk2Fp9ag==
X-CSE-MsgGUID: r3cAH43RQhCTfZOTngV+xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="112163169"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 07 Feb 2025 23:48:21 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tgfZa-000zid-3A;
	Sat, 08 Feb 2025 07:48:18 +0000
Date: Sat, 8 Feb 2025 15:48:17 +0800
From: kernel test robot <lkp@intel.com>
To: Himanshu Chauhan <hchauhan@ventanamicro.com>
Cc: oe-kbuild-all@lists.linux.dev, Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_misc_fixes_v1 52/68]
 arch/riscv/kernel/hw_breakpoint.c:441:22: sparse: sparse: incorrect type in
 assignment (different base types)
Message-ID: <202502081559.eVXTEY7M-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/avpatel/linux.git riscv_misc_fixes_v1
head:   f0b453b30038af57df379934d55e6b73af29f50f
commit: 0e1dea4868dd2cef4513e65cb9f6bf4314c4f8d9 [52/68] riscv: Introduce support for hardware break/watchpoints
config: riscv-randconfig-r131-20250207 (https://download.01.org/0day-ci/archive/20250208/202502081559.eVXTEY7M-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 6807164500e9920638e2ab0cdb4bf8321d24f8eb)
reproduce: (https://download.01.org/0day-ci/archive/20250208/202502081559.eVXTEY7M-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502081559.eVXTEY7M-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   WARNING: invalid argument to '-march': '_zacas_zabha'
>> arch/riscv/kernel/hw_breakpoint.c:441:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long tdata1 @@     got restricted __le64 [usertype] @@
   arch/riscv/kernel/hw_breakpoint.c:441:22: sparse:     expected unsigned long tdata1
   arch/riscv/kernel/hw_breakpoint.c:441:22: sparse:     got restricted __le64 [usertype]
>> arch/riscv/kernel/hw_breakpoint.c:442:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long tdata2 @@     got restricted __le64 [usertype] @@
   arch/riscv/kernel/hw_breakpoint.c:442:22: sparse:     expected unsigned long tdata2
   arch/riscv/kernel/hw_breakpoint.c:442:22: sparse:     got restricted __le64 [usertype]
>> arch/riscv/kernel/hw_breakpoint.c:443:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long tdata3 @@     got restricted __le64 [usertype] @@
   arch/riscv/kernel/hw_breakpoint.c:443:22: sparse:     expected unsigned long tdata3
   arch/riscv/kernel/hw_breakpoint.c:443:22: sparse:     got restricted __le64 [usertype]
>> arch/riscv/kernel/hw_breakpoint.c:454:15: sparse: sparse: cast to restricted __le64
   arch/riscv/kernel/hw_breakpoint.c:558:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long tdata1 @@     got restricted __le64 [usertype] @@
   arch/riscv/kernel/hw_breakpoint.c:558:22: sparse:     expected unsigned long tdata1
   arch/riscv/kernel/hw_breakpoint.c:558:22: sparse:     got restricted __le64 [usertype]
   arch/riscv/kernel/hw_breakpoint.c:559:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long tdata2 @@     got restricted __le64 [usertype] @@
   arch/riscv/kernel/hw_breakpoint.c:559:22: sparse:     expected unsigned long tdata2
   arch/riscv/kernel/hw_breakpoint.c:559:22: sparse:     got restricted __le64 [usertype]
   arch/riscv/kernel/hw_breakpoint.c:560:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long tdata3 @@     got restricted __le64 [usertype] @@
   arch/riscv/kernel/hw_breakpoint.c:560:22: sparse:     expected unsigned long tdata3
   arch/riscv/kernel/hw_breakpoint.c:560:22: sparse:     got restricted __le64 [usertype]

vim +441 arch/riscv/kernel/hw_breakpoint.c

   423	
   424	/* atomic: counter->ctx->lock is held */
   425	int arch_install_hw_breakpoint(struct perf_event *event)
   426	{
   427		struct arch_hw_breakpoint *bp = counter_arch_bp(event);
   428		struct sbi_dbtr_shmem_entry *shmem = this_cpu_ptr(sbi_dbtr_shmem);
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
   468		pr_debug("Trigger 0x%lu installed at index 0x%lx\n", bp->tdata2, idx);
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

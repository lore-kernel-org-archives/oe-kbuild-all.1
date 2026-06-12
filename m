Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 029992010EE
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Jun 2026 07:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781248904; cv=none; b=Y1UlPrETeId85w3/JoxoV2QpOs3f8Y8Z5RhS90qzCg5lwY20F6jjVKBYDe4orr/IVpzh1JUorx3h1tWmUSi4DeOq6HWMeDwu9BS/RIEeGHKjGg0LXSFleImO8uddUejEfA6K6KNPzRDDDZAUvkXbQVtKadKy1FT4EuBLYHAiEVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781248904; c=relaxed/simple;
	bh=YiwNwTwj/xtW1FpvHRUfkdVXe7xDxylRBWgUA7aEs7k=;
	h=Date:From:To:Cc:Subject:Message-ID; b=AbM8Trc4tLmodkCWLkSHIG1gITXb06gYTz6AnukFebsnWPqcKMKDbDLMaUCUUJs6maGuCsv1DitxGHxI1eSrt+qQpEn+gzRq8L/Pg0y5CF/GrNxjC1AXFRwqGtBGeyBYf3xxKLNN0Wb9pIjvk0e8XuZ0CeQIHeAzw19ldVXiebs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Oc78hVx9; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Oc78hVx9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781248902; x=1812784902;
  h=date:from:to:cc:subject:message-id;
  bh=YiwNwTwj/xtW1FpvHRUfkdVXe7xDxylRBWgUA7aEs7k=;
  b=Oc78hVx9wbJu0IQxmlI6LZFMruGUttNJ3D5PHJpEw9VEAJteVqns9pki
   eN3S3uJzj48+ooXpI80s7OPV7xqlsCyvAGU6UFLt4QTDRX8khN/e18xzG
   BLckrNCW9UP87E7Q0c6aUte8aMjAZBQVpd/Ht91QVTQ2FrAJ3UosX2cI0
   Udi+avUm38a1IzBCtb/bEVQSYs2QCxQfPEV8u2cKnSH1mx2maWYia7PwZ
   3xN8uHIWVwEj7z6B7tii6CDAi+El35YvDtUmYdZ+c110EBHRnaA1SeHqv
   A04GdkD8IhwCPObFh0rxCBSnJLuD1ajKMhD6Z+WNSpZPDsrYGz1Xe13EH
   Q==;
X-CSE-ConnectionGUID: NPP9Kij2T86TfE0FuH0l5g==
X-CSE-MsgGUID: JlR4PvY7QtGQFohcWcq9hg==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="81817793"
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; 
   d="scan'208";a="81817793"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2026 00:21:42 -0700
X-CSE-ConnectionGUID: exP1n3lmTCKwL9L2vFOa4Q==
X-CSE-MsgGUID: YzH/Bgt9Q9SSuLMpOUQHcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; 
   d="scan'208";a="246819206"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 12 Jun 2026 00:21:41 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wXwCv-00000000ORV-24ZY;
	Fri, 12 Jun 2026 07:21:37 +0000
Date: Fri, 12 Jun 2026 15:21:25 +0800
From: kernel test robot <lkp@intel.com>
To: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev, Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_sbi_dbtr_v3 86/87]
 arch/riscv/kernel/hw_breakpoint.c:441:22: sparse: sparse: incorrect type in
 assignment (different base types)
Message-ID: <202606121531.drBnKN5j-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/avpatel/linux.git riscv_sbi_dbtr_v3
head:   c8836b892a523eaf0e86371de9bd4a934afafabc
commit: 118495fa9c176b496e83e8d5ee67c9d8524bc4dd [86/87] riscv: Introduce support for hardware break/watchpoints
config: riscv-randconfig-r132-20260611 (https://download.01.org/0day-ci/archive/20260612/202606121531.drBnKN5j-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 15.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260612/202606121531.drBnKN5j-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606121531.drBnKN5j-lkp@intel.com/

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

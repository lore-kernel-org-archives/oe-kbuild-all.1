Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794116433;
	b=qEwwcM7MoHwEL2XRamXqkhRj9tP+8Xs0cGHla659MVKlqR2i9UhOZLCNOKFgMVg/69ze
	 wtN0UC/7BRkQ5GkADFqqz3RQeswKuEvHRJUMZuyHCcWb1KttukGYbY7tFRB+jFbi6x10m
	 v92yRuHbxUEAHzVz/d/4AJFxEDPkm/2eql3RdnLqarDwHFRcax0S80YWk8D29CXg88feD
	 JAKirWsOzRb/6e5t5IapjuGiNhqqNaOVEg+F1unYrfKXd1ZBtd2ZvyI8DwYTPC3oTyMPV
	 k1IxwbH290APLDD5T7FrQASU0nvq+uh1iDzY1IMsgQx8e1T5Iq8fqE0Dj6+XPD6cmrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794116433;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=/g8sL/53zClzVPDZaKFHC+ZiVbSUn4xy9Slrvd49/Wg=;
	b=mBJEXwtxZwsHOq9e7NMfEglf/RL23ZGjsA7xJZ/rb3YSy7lAzqHA8E8NUr2QlPjrLsYb
	 HVjyjHsK61Y9t4bSDIm1Jn355I0Gk4gm/0f+ovhYC6Gay5uC1sH1RndBlFXfJwRkUF+jd
	 bgfpRlsDTeeK4Mscfrfw5yHhVrZw1ZUXOn/P0RgorMcpEOS4DCR7rtjkuM7QbpWmXg1d/
	 LcoLMiWsMmcruTTUHko2Hzo141rIp+tF+kqisEVLkma5pBnpyC+KqnKBzU5HTbOblLge0
	 KLSlG5VpWe0pS8psB8+JA5s1IZo7kppZkdhiICIM7knZOSh/lukqpftqh4bBD/Q4btw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dEjNRHDo;
	arc=none smtp.remote-ip=192.198.163.8
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DBE3606A31A
	for <oe-kbuild-all@lists.linux.dev>; Sun,  8 Nov 2026 05:40:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6DBE3606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dEjNRHDo
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794116432; x=1825652432;
  h=date:from:to:cc:subject:message-id;
  bh=H6mKsEvYDkdrZJ7EKrpmBgfLq2HJCTq/joSi8ms29uk=;
  b=dEjNRHDoe1sMPyqGijCs3pi4y9+B9/ISH1oTFvt4Qlul7COrA245rKXt
   LwGWF818UjE4KAzOKnueuKt+2dMCGkEimAD0n2UcDUcyMnT14MZICEsot
   yRF+y30lQSa0c8gneqUxj98ucPdbDQF/jT+w2u4xw8rlo0cPdb8jGI8vy
   eEIYFB3b3xUsTA8VFjsjMp+XOPv/Rub5rMS93DtHLuuBZn7o6ySu51TRc
   Wsp8lQKGgo4ut+lrNW5xcwNOfYrnYm0XIPy0upesF12pa3lFWsxi5oWBA
   L5TL8ppUlE4bhmZq/XyhiHVIpsdVOABQTqltPSRyBRNJgPqwHlB0+t/F9
   Q==;
X-CSE-ConnectionGUID: pSWNOW2fSPCTblVN9Z/cAQ==
X-CSE-MsgGUID: aGe9v4DKRoCyw02nGv8gVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11959"; a="2761502"
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="2761502"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2026 21:40:31 -0800
X-CSE-ConnectionGUID: ECrmiLA9Tw2Lf8jEIUloyQ==
X-CSE-MsgGUID: bOR9l214QMS7b1Hlpfc6jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="9352724"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa012.fm.intel.com with ESMTP; 07 Nov 2026 21:40:29 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xPvdj-00000000B1w-03KJ;
	Sun, 08 Nov 2026 05:40:27 +0000
Date: Sun, 08 Nov 2026 06:39:48 +0100
From: kernel test robot <lkp@intel.com>
To: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev, Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_trace_support_v6 59/80]
 arch/riscv/kernel/hw_breakpoint.c:687:22: sparse: sparse: incorrect type in
 assignment (different base types)
Message-ID: <202611080610.k2rbvQK9-lkp@intel.com>
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
config: riscv-randconfig-r2308-20261108 (https://download.01.org/0day-ci/archive/20261108/202611080610.k2rbvQK9-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261108/202611080610.k2rbvQK9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611080610.k2rbvQK9-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/riscv/kernel/hw_breakpoint.c:430:17: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long idx @@     got restricted __le64 [usertype] @@
   arch/riscv/kernel/hw_breakpoint.c:430:17: sparse:     expected unsigned long idx
   arch/riscv/kernel/hw_breakpoint.c:430:17: sparse:     got restricted __le64 [usertype]
   arch/riscv/kernel/hw_breakpoint.c:431:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long tdata1 @@     got restricted __le64 [usertype] @@
   arch/riscv/kernel/hw_breakpoint.c:431:22: sparse:     expected unsigned long tdata1
   arch/riscv/kernel/hw_breakpoint.c:431:22: sparse:     got restricted __le64 [usertype]
   arch/riscv/kernel/hw_breakpoint.c:432:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long tdata2 @@     got restricted __le64 [usertype] @@
   arch/riscv/kernel/hw_breakpoint.c:432:22: sparse:     expected unsigned long tdata2
   arch/riscv/kernel/hw_breakpoint.c:432:22: sparse:     got restricted __le64 [usertype]
   arch/riscv/kernel/hw_breakpoint.c:433:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long tdata3 @@     got restricted __le64 [usertype] @@
   arch/riscv/kernel/hw_breakpoint.c:433:22: sparse:     expected unsigned long tdata3
   arch/riscv/kernel/hw_breakpoint.c:433:22: sparse:     got restricted __le64 [usertype]
   arch/riscv/kernel/hw_breakpoint.c:515:18: sparse: sparse: cast to restricted __le64
   arch/riscv/kernel/hw_breakpoint.c:520:18: sparse: sparse: cast to restricted __le64
   arch/riscv/kernel/hw_breakpoint.c:521:18: sparse: sparse: cast to restricted __le64
   arch/riscv/kernel/hw_breakpoint.c:558:18: sparse: sparse: cast to restricted __le64
   arch/riscv/kernel/hw_breakpoint.c:563:18: sparse: sparse: cast to restricted __le64
   arch/riscv/kernel/hw_breakpoint.c:564:18: sparse: sparse: cast to restricted __le64
>> arch/riscv/kernel/hw_breakpoint.c:687:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long tstate @@     got restricted __le64 [usertype] @@
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

vim +687 arch/riscv/kernel/hw_breakpoint.c

   668	
   669	/* atomic: counter->ctx->lock is held */
   670	int arch_install_hw_breakpoint(struct perf_event *event)
   671	{
   672		struct arch_hw_breakpoint *bp = counter_arch_bp(event);
   673		union sbi_dbtr_shmem_entry *shmem = this_cpu_ptr(sbi_dbtr_shmem);
   674		struct sbi_dbtr_data_msg *xmit;
   675		struct sbi_dbtr_id_msg *recv;
   676		struct perf_event **slot;
   677		unsigned long idx;
   678		unsigned long flags;
   679		struct sbiret ret;
   680		int err = 0;
   681	
   682		raw_spin_lock_irqsave(this_cpu_ptr(&ecall_lock), flags);
   683	
   684		xmit = &shmem->data;
   685		recv = &shmem->id;
   686		/* Avoid sending stale union contents from a previous id reply. */
 > 687		xmit->tstate = cpu_to_le(0UL);
   688		xmit->tdata1 = cpu_to_le(bp->tdata1);
   689		xmit->tdata2 = cpu_to_le(bp->tdata2);
   690		xmit->tdata3 = cpu_to_le(bp->tdata3);
   691	
   692		ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_TRIG_INSTALL,
   693				1, 0, 0, 0, 0, 0);
   694	
   695		if (ret.error) {
   696			pr_warn("Failed to install trigger\n");
   697			err = sbi_err_map_linux_errno(ret.error);
   698			goto done;
   699		}
   700	
   701		idx = le_to_cpu(recv->idx);
   702		if (idx >= dbtr_total_num) {
   703			pr_warn("Invalid trigger index %lu\n", idx);
   704			ret = dbtr_uninstall_trigger_locked(idx);
   705			if (ret.error)
   706				pr_warn("Failed to unwind trigger %lu. error: %ld\n",
   707					idx, ret.error);
   708			err = -EINVAL;
   709			goto done;
   710		}
   711	
   712		slot = this_cpu_ptr(&pcpu_hw_bp_events[idx]);
   713		if (*slot) {
   714			pr_warn("Slot %lu is in use\n", idx);
   715			ret = dbtr_uninstall_trigger_locked(idx);
   716			if (ret.error)
   717				pr_warn("Failed to unwind trigger %lu. error: %ld\n",
   718					idx, ret.error);
   719			err = -EBUSY;
   720			goto done;
   721		}
   722	
   723		/* Save the event - to be looked up in handler */
   724		*slot = event;
   725	
   726	done:
   727		raw_spin_unlock_irqrestore(this_cpu_ptr(&ecall_lock), flags);
   728		return err;
   729	}
   730	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

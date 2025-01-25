Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30F1038FAD
	for <oe-kbuild-all@lists.linux.dev>; Sat, 25 Jan 2025 11:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737803872; cv=none; b=qSrox7XFJKsD1biVOXk/sLOpgi5fzfxPVaHsNA20XId5JRZRNjvMoRxopa4G0kZpucQa3bUI2Ph6JIEjrTQKrAG8aoWxiiuiBVLeqBErm5KFsE29wJnkxOiWdO4iuBu9gSyB0YpDTaYbNsj0dTtphX4m1Uq6V0xAdCN4hhj+4rA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737803872; c=relaxed/simple;
	bh=EtVKuh6uo96a59EOh1rJcojrPGeXKUCBo550W6kFypc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bOmJzDsMwkk/mMhNnl9izSlcHTaIKcqd/tE/EdkW+FFtpIYmF1uuTe9fdoq8wgkFtXtOSFa0UFT7KyKpKUI0Fxbg8+rBcqy+9jUnFxnE1aNohcveV9MCpE+d7+jNXw+N1srG15RtoElULLL9XmIuOOgVxl7ug5pC+VFML/g0aj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O4mhsMnP; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O4mhsMnP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737803870; x=1769339870;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EtVKuh6uo96a59EOh1rJcojrPGeXKUCBo550W6kFypc=;
  b=O4mhsMnPpIx5gflw0i03Giu2Yt0sCILG9i+NIRHTk3P2ndih9+Asx5Ld
   W9xYAbK9jcLG1ztzlXYkkgyTgIuar/y77mEPfMjBq+61zD/eWXoq2ebT4
   SQqzvb41DV91Khrpt+bdiAhKrQ1N5/f9uJEDHhCNqDd5ecADI7gnCWNnY
   MrwZQ7QlQ6VbLmicJgPPJmf6RDsaQJgW5t8nN1AZOSyjF/1LykV81x96N
   RDJBwOyiugWZ03B4zxRFCSkJAW7SCcLfTLMEYk1Q1EqbiDt2Su59DfFCG
   VwwK95kZkngTSedZlIsHI7uAuyqT5bA/Ornp+srNRtzGDCRydAO67QceX
   A==;
X-CSE-ConnectionGUID: l918U41VRNCfTCxTxPCyVQ==
X-CSE-MsgGUID: Obt6lQh0TSaEQ2Db8XYGEg==
X-IronPort-AV: E=McAfee;i="6700,10204,11325"; a="48920101"
X-IronPort-AV: E=Sophos;i="6.13,234,1732608000"; 
   d="scan'208";a="48920101"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2025 03:17:49 -0800
X-CSE-ConnectionGUID: U7Gwy7SHRsS4Wq6gOdM+dQ==
X-CSE-MsgGUID: SQe69K4ZRcau2bYjinRH1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,234,1732608000"; 
   d="scan'208";a="108586851"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 25 Jan 2025 03:17:48 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tbeAc-000dk3-0p;
	Sat, 25 Jan 2025 11:17:46 +0000
Date: Sat, 25 Jan 2025 19:17:13 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.13/invlpgb-v7 5/12] arch/x86/include/asm/invlpgb.h:30:49:
 error: invalid input size for constraint 'a'
Message-ID: <202501251923.iZYtHHfo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/zen-kernel/zen-kernel 6.13/invlpgb-v7
head:   c170738e75615267ae384235ddf05c74ba2e1f9c
commit: bd615ed3d93b46de51886f6c345c47a4e925ea7b [5/12] x86/mm: add INVLPGB support code
config: i386-buildonly-randconfig-002-20250125 (https://download.01.org/0day-ci/archive/20250125/202501251923.iZYtHHfo-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250125/202501251923.iZYtHHfo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501251923.iZYtHHfo-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:9:
   In file included from include/linux/sched/task.h:13:
   In file included from include/linux/uaccess.h:12:
   In file included from arch/x86/include/asm/uaccess.h:17:
   In file included from arch/x86/include/asm/tlbflush.h:13:
>> arch/x86/include/asm/invlpgb.h:30:49: error: invalid input size for constraint 'a'
      30 |         asm volatile(".byte 0x0f, 0x01, 0xfe" : : "a" (rax), "c" (ecx), "d" (edx));
         |                                                        ^
   1 error generated.
   make[3]: *** [scripts/Makefile.build:102: arch/x86/kernel/asm-offsets.s] Error 1 shuffle=2247401298
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1263: prepare0] Error 2 shuffle=2247401298
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:251: __sub-make] Error 2 shuffle=2247401298
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:251: __sub-make] Error 2 shuffle=2247401298
   make: Target 'prepare' not remade because of errors.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for X86_BROADCAST_TLB_FLUSH
   Depends on [n]: CPU_SUP_AMD [=y] && 64BIT [=n]
   Selected by [y]:
   - CPU_SUP_AMD [=y]


vim +/a +30 arch/x86/include/asm/invlpgb.h

     8	
     9	/*
    10	 * INVLPGB does broadcast TLB invalidation across all the CPUs in the system.
    11	 *
    12	 * The INVLPGB instruction is weakly ordered, and a batch of invalidations can
    13	 * be done in a parallel fashion.
    14	 *
    15	 * TLBSYNC is used to ensure that pending INVLPGB invalidations initiated from
    16	 * this CPU have completed.
    17	 */
    18	static inline void __invlpgb(unsigned long asid, unsigned long pcid,
    19				     unsigned long addr, u16 extra_count,
    20				     bool pmd_stride, u8 flags)
    21	{
    22		u32 edx = (pcid << 16) | asid;
    23		u32 ecx = (pmd_stride << 31) | extra_count;
    24		u64 rax = addr | flags;
    25	
    26		/* The low bits in rax are for flags. Verify addr is clean. */
    27		VM_WARN_ON_ONCE(addr & ~PAGE_MASK);
    28	
    29		/* INVLPGB; supported in binutils >= 2.36. */
  > 30		asm volatile(".byte 0x0f, 0x01, 0xfe" : : "a" (rax), "c" (ecx), "d" (edx));
    31	}
    32	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

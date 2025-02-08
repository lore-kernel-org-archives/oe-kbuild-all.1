Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ADE2187FE0
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Feb 2025 16:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739031331; cv=none; b=sJI6NWRLG9UC1f7MB9q2G1Ud2SRYfSGgfLwljHkmwaTfdAnqmRfDDZGZu457UtvVYM+hEBXsndQKLAXIs6xIKS3bF96mvyuXUpEvxwdca2qFoXnPQ0DMP2UR40s2Ujw4XPb3Yo3i7wwJdsXfZu+Bfy82njm2D/APSA2DidR2sf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739031331; c=relaxed/simple;
	bh=i5hs21tUOpRUapQOVaAWKpF9xpLof/snOGcAHuSLZVo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=s8MZwH5PTXPTNUSiq5JleU2XgV5TxM5vF+hvAqc3CSP3FqiD6P0EJzYK50vUMVXdGl56fkmDg3cf8A1g8yhrmN0/PGduP9lCAaKWuDrWfBOwet4g50XdoH5A5bA6cQh6c/+1kK/VObJLla0c8lAw8LTQ0Efz/clJyeLrrc9zL+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MCmHYR8R; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MCmHYR8R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739031326; x=1770567326;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=i5hs21tUOpRUapQOVaAWKpF9xpLof/snOGcAHuSLZVo=;
  b=MCmHYR8Ram/KuVwQSivZzutK2n44/852e8Bv4l4JU4lTHgRrochX8dg3
   K5mnv6jRKpgUhl/3osKboLEtFOUSHpAkLi0RZGgC3RZXaYvsKenwh28hA
   NF9ESuqNCwFmEqyq8dQuBb+3XrOqwkNHTyBrll0LPJHHwYDjx3P7RsCHb
   afGIPNS2rm2tmgCU8T/308UnKhAfqjfxzi/VZQoUQkkzBFh9Fmg6DzYQk
   91cqGjRDXrzs1kbxohXzta8y7/IuaKpcuJ3J7JibcNXn0LiOpXuCIZ1DI
   T1QmAkrr4jf6kWhQ8stGfVy7d4XC5YlVWKRxrstOaNRNu+gpRZKaX9wGL
   A==;
X-CSE-ConnectionGUID: /6Je59NqTFi5a7+SIAQcTw==
X-CSE-MsgGUID: dxJ9uudLRp+3r7v1Ua6qIg==
X-IronPort-AV: E=McAfee;i="6700,10204,11339"; a="27266048"
X-IronPort-AV: E=Sophos;i="6.13,270,1732608000"; 
   d="scan'208";a="27266048"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2025 08:15:23 -0800
X-CSE-ConnectionGUID: 0XNkiq8lQn284YrVK3xZSQ==
X-CSE-MsgGUID: C2JeRL71QemfrO5ZV03EZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,270,1732608000"; 
   d="scan'208";a="116805238"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 08 Feb 2025 08:15:22 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tgnUF-0010J7-26;
	Sat, 08 Feb 2025 16:15:19 +0000
Date: Sun, 9 Feb 2025 00:15:17 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.13/invlpgb-v9 6/13] arch/x86/include/asm/invlpgb.h:30:9:
 error: inconsistent operand constraints in an 'asm'
Message-ID: <202502090041.5ogh6vb1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/zen-kernel/zen-kernel 6.13/invlpgb-v9
head:   df542b65e9753dea56b584fdca48cb8f8e3f74cd
commit: b2ac10f4b65686ca371571bd150c18ea71c7277c [6/13] x86/mm: use INVLPGB for kernel TLB flushes
config: i386-buildonly-randconfig-001-20250208 (https://download.01.org/0day-ci/archive/20250209/202502090041.5ogh6vb1-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250209/202502090041.5ogh6vb1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502090041.5ogh6vb1-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/include/asm/tlbflush.h:13,
                    from arch/x86/include/asm/uaccess.h:17,
                    from include/linux/uaccess.h:12,
                    from include/linux/sched/task.h:13,
                    from include/linux/sched/signal.h:9,
                    from include/linux/rcuwait.h:6,
                    from include/linux/percpu-rwsem.h:7,
                    from include/linux/fs.h:33,
                    from include/linux/huge_mm.h:7,
                    from include/linux/mm.h:1133,
                    from arch/x86/mm/tlb.c:4:
   arch/x86/mm/tlb.c: In function 'flush_tlb_kernel_range':
>> arch/x86/include/asm/invlpgb.h:30:9: error: inconsistent operand constraints in an 'asm'
      30 |         asm volatile(".byte 0x0f, 0x01, 0xfe" : : "a" (rax), "c" (ecx), "d" (edx));
         |         ^~~
>> arch/x86/include/asm/invlpgb.h:30:9: error: inconsistent operand constraints in an 'asm'
      30 |         asm volatile(".byte 0x0f, 0x01, 0xfe" : : "a" (rax), "c" (ecx), "d" (edx));
         |         ^~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for X86_BROADCAST_TLB_FLUSH
   Depends on [n]: CPU_SUP_AMD [=y] && 64BIT [=n]
   Selected by [y]:
   - CPU_SUP_AMD [=y]


vim +/asm +30 arch/x86/include/asm/invlpgb.h

83464118a5db5f Rik van Riel 2025-02-05   8  
83464118a5db5f Rik van Riel 2025-02-05   9  /*
83464118a5db5f Rik van Riel 2025-02-05  10   * INVLPGB does broadcast TLB invalidation across all the CPUs in the system.
83464118a5db5f Rik van Riel 2025-02-05  11   *
83464118a5db5f Rik van Riel 2025-02-05  12   * The INVLPGB instruction is weakly ordered, and a batch of invalidations can
83464118a5db5f Rik van Riel 2025-02-05  13   * be done in a parallel fashion.
83464118a5db5f Rik van Riel 2025-02-05  14   *
83464118a5db5f Rik van Riel 2025-02-05  15   * TLBSYNC is used to ensure that pending INVLPGB invalidations initiated from
83464118a5db5f Rik van Riel 2025-02-05  16   * this CPU have completed.
83464118a5db5f Rik van Riel 2025-02-05  17   */
83464118a5db5f Rik van Riel 2025-02-05  18  static inline void __invlpgb(unsigned long asid, unsigned long pcid,
83464118a5db5f Rik van Riel 2025-02-05  19  			     unsigned long addr, u16 extra_count,
83464118a5db5f Rik van Riel 2025-02-05  20  			     bool pmd_stride, u8 flags)
83464118a5db5f Rik van Riel 2025-02-05  21  {
83464118a5db5f Rik van Riel 2025-02-05  22  	u32 edx = (pcid << 16) | asid;
83464118a5db5f Rik van Riel 2025-02-05  23  	u32 ecx = (pmd_stride << 31) | extra_count;
83464118a5db5f Rik van Riel 2025-02-05  24  	u64 rax = addr | flags;
83464118a5db5f Rik van Riel 2025-02-05  25  
83464118a5db5f Rik van Riel 2025-02-05  26  	/* The low bits in rax are for flags. Verify addr is clean. */
83464118a5db5f Rik van Riel 2025-02-05  27  	VM_WARN_ON_ONCE(addr & ~PAGE_MASK);
83464118a5db5f Rik van Riel 2025-02-05  28  
83464118a5db5f Rik van Riel 2025-02-05  29  	/* INVLPGB; supported in binutils >= 2.36. */
83464118a5db5f Rik van Riel 2025-02-05 @30  	asm volatile(".byte 0x0f, 0x01, 0xfe" : : "a" (rax), "c" (ecx), "d" (edx));
83464118a5db5f Rik van Riel 2025-02-05  31  }
83464118a5db5f Rik van Riel 2025-02-05  32  

:::::: The code at line 30 was first introduced by commit
:::::: 83464118a5db5f7faeadcfac9a09205147c0c604 x86/mm: add INVLPGB support code

:::::: TO: Rik van Riel <riel@surriel.com>
:::::: CC: Steven Barrett <steven@liquorix.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

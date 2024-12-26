Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C6CD1474A0
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Dec 2024 23:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735256057; cv=none; b=g4ySMnnJWBr2PATb57/r6McDaZf4ELCH/xNgrz1WuQ8wiQUfzTTCpIne+gt64v6weMfWlY9cbgYJWefB+eroq/L7Rjf+yWXfR3XnqA0PndZxnzIhRl8/GdGNKPzFvf6Ic7lOs62skPNcLzgQOHT7ZR1VnqcUBR6UIHPCetzvHRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735256057; c=relaxed/simple;
	bh=5dzwpNCENWxe1Ts615zwqwoeYi9VqvNOg9IovZbL0NA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=P8e2GwcUKBEO3uZVkZ7ednpPvTvU+4Ipl6md9bLA/nlqwlGSvX8khOn+5BkZqcPE+eXfBkICzUVwnek6ptk8Vld6ukjFH22QDfK8F27OHj1Zi2/APGb2FE1HvKzYu1prmtl9kUyRdd8yUkJCqGiJ0x4fE/34HZ2VARsuo0V0am0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YGlsgv+V; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YGlsgv+V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735256055; x=1766792055;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5dzwpNCENWxe1Ts615zwqwoeYi9VqvNOg9IovZbL0NA=;
  b=YGlsgv+V+tdsDz9KlpPhYzVX5jrqODmghQQM3teUMLQNr9rRMJa+FVd7
   xSH92mTMi6F7RQTzMb7RfGSnr1jbK/qTPGPL5QqdVgTgRxR2JDMxFrbPt
   V7npRev0HUnxjuv/jpKF/JdRw5fwAfu+emD3zVNQU2DwlvAMCagr+G67y
   Z5D0Qa2jAumfeVNbsoY2Lx+S4liLHu0a2rE1sBCTqvRwXcegSj67XtpyG
   L4K3PDdMbtQBMQiLxYmE8YYgNBPCzItYS5OEho0bb5Vyh+kr8q5qEKTOB
   smpuuxy42o/H72Ci8VYzjNGRE/HgAUmqdu3Q/OcmExfK827Qi1mIRYIIb
   A==;
X-CSE-ConnectionGUID: JgLUUJ6lQK+jOa9ke7s+HA==
X-CSE-MsgGUID: Zg1MpKTHQIGKKObEFj6AaQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11297"; a="58132139"
X-IronPort-AV: E=Sophos;i="6.12,267,1728975600"; 
   d="scan'208";a="58132139"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Dec 2024 15:34:14 -0800
X-CSE-ConnectionGUID: TMgk4ZgdRfahbaw3YO4pDA==
X-CSE-MsgGUID: 4jIfcch/QbaxP/24csWCjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="100862904"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 26 Dec 2024 15:33:31 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tQxM7-0002qu-2W;
	Thu, 26 Dec 2024 23:33:27 +0000
Date: Fri, 27 Dec 2024 07:32:58 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Zengkai <zhengzengkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2600/2600]
 arch/arm64/include/asm/cmpxchg.h:88:1: sparse: sparse: cast truncates bits
 from constant value (3fff becomes ff)
Message-ID: <202412270714.njP0n3lT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   951151c7a27bc2a9436c2c49ae12510c82137ec1
commit: 2cef14dac00fca28ba2c0492e70bb537cba83f4d [2600/2600] mm/pin_mem: add PG_hotreplace to mark pages need hotreplaced
config: arm64-randconfig-r133-20241227 (https://download.01.org/0day-ci/archive/20241227/202412270714.njP0n3lT-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20241227/202412270714.njP0n3lT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412270714.njP0n3lT-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   mm/memory.c:5306:22: sparse: sparse: cast removes address space '__user' of expression
   mm/memory.c:273:46: sparse: sparse: self-comparison always evaluates to false
   mm/memory.c:307:46: sparse: sparse: self-comparison always evaluates to false
   mm/memory.c:943:17: sparse: sparse: context imbalance in 'copy_pte_range' - different lock contexts for basic block
   mm/memory.c:1099:61: sparse: sparse: self-comparison always evaluates to false
   mm/memory.c:1123:61: sparse: sparse: self-comparison always evaluates to false
   mm/memory.c:1635:16: sparse: sparse: context imbalance in '__get_locked_pte' - different lock contexts for basic block
   mm/memory.c:1684:9: sparse: sparse: context imbalance in 'insert_page' - different lock contexts for basic block
   mm/memory.c:2186:17: sparse: sparse: context imbalance in 'remap_pte_range' - different lock contexts for basic block
   mm/memory.c:2243:46: sparse: sparse: self-comparison always evaluates to false
   mm/memory.c:2265:46: sparse: sparse: self-comparison always evaluates to false
   mm/memory.c:2431:17: sparse: sparse: context imbalance in 'apply_to_pte_range' - unexpected unlock
   mm/memory.c:2504:46: sparse: sparse: self-comparison always evaluates to false
   mm/memory.c:2540:46: sparse: sparse: self-comparison always evaluates to false
   mm/memory.c:2719:17: sparse: sparse: context imbalance in 'wp_page_copy' - unexpected unlock
   mm/memory.c: note: in included file (through arch/arm64/include/asm/atomic.h, include/linux/atomic.h, include/asm-generic/bitops/atomic.h, ...):
>> arch/arm64/include/asm/cmpxchg.h:88:1: sparse: sparse: cast truncates bits from constant value (3fff becomes ff)
>> arch/arm64/include/asm/cmpxchg.h:88:1: sparse: sparse: cast truncates bits from constant value (3fff becomes ff)
   mm/memory.c:3064:17: sparse: sparse: context imbalance in 'wp_pfn_shared' - unexpected unlock
>> arch/arm64/include/asm/cmpxchg.h:88:1: sparse: sparse: cast truncates bits from constant value (3fff becomes ff)
>> arch/arm64/include/asm/cmpxchg.h:88:1: sparse: sparse: cast truncates bits from constant value (3fff becomes ff)
   mm/memory.c:3127:19: sparse: sparse: context imbalance in 'do_wp_page' - different lock contexts for basic block
   mm/memory.c:3755:19: sparse: sparse: context imbalance in 'pte_alloc_one_map' - different lock contexts for basic block
   mm/memory.c:3982:17: sparse: sparse: context imbalance in 'finish_fault' - unexpected unlock
   mm/memory.c:4091:9: sparse: sparse: context imbalance in 'do_fault_around' - unexpected unlock
   mm/memory.c:4814:5: sparse: sparse: context imbalance in 'follow_invalidate_pte' - different lock contexts for basic block
   mm/memory.c:4935:9: sparse: sparse: context imbalance in 'follow_pfn' - unexpected unlock
--
   mm/migrate.c: note: in included file (through arch/arm64/include/asm/atomic.h, include/linux/atomic.h, include/asm-generic/bitops/atomic.h, ...):
>> arch/arm64/include/asm/cmpxchg.h:88:1: sparse: sparse: cast truncates bits from constant value (3fff becomes ff)

vim +88 arch/arm64/include/asm/cmpxchg.h

10b663aef1c2479 Catalin Marinas 2012-03-05  84  
305d454aaa292be Will Deacon     2015-10-08  85  __XCHG_GEN()
305d454aaa292be Will Deacon     2015-10-08  86  __XCHG_GEN(_acq)
305d454aaa292be Will Deacon     2015-10-08  87  __XCHG_GEN(_rel)
305d454aaa292be Will Deacon     2015-10-08 @88  __XCHG_GEN(_mb)
305d454aaa292be Will Deacon     2015-10-08  89  

:::::: The code at line 88 was first introduced by commit
:::::: 305d454aaa292be3a09a9d674e6c35f5b4249a13 arm64: atomics: implement native {relaxed, acquire, release} atomics

:::::: TO: Will Deacon <will.deacon@arm.com>
:::::: CC: Catalin Marinas <catalin.marinas@arm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

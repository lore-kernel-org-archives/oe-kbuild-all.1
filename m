Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7153A244EA2
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Feb 2025 22:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739053214; cv=none; b=Yh3GA/zOm0yg8NvFSzYggQPl0Sjn6ruG8FJoW7KActbfQGkaWfKnWy5/5HSp1vUPENjHDQXIycLnPMGrDCmhyMMapImmZszHDWl83qJSU25WKU+blyDhsF44izPGUso1xhwtQziCNOThvu2jt0w7fFn6TMt56zX0n/7d3om5c+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739053214; c=relaxed/simple;
	bh=DwSwBXncQMcvxwWr7RbeoNgFDzwZJiHM88wDdmBOa1w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QFu1vOfXoBxLO3dHR4zet7LXZtjC7Aj+WSn14tDLrwXpFirmKJYqvqLndzJUdH2e9nmabd6VzpyRD+zLTDjOef7syaw7N4E+dVYagh+K+E8PG7izMzNOX7rG5AaKWsgiV0oogh1qJQdSqD4HvvyHTaDGb5d63Cpb9RBaj3EibU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m0IyUFBX; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m0IyUFBX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739053212; x=1770589212;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DwSwBXncQMcvxwWr7RbeoNgFDzwZJiHM88wDdmBOa1w=;
  b=m0IyUFBXRsdRoF3eVbTlu/JQ3OV0MUC0SLCYxv3h4idrim07cd6rBbu8
   dxMOuxoF+tqCnny4chEgYJPzuQN/T66+YWWbCgCvkV61OllFK6NeW0Xoq
   w3T9aLqoOlMEMLWh92ldOvxHxrRnTCYKtzWsQ/pFVDglFaaKaMV6gdCwN
   RcjoNjmJlTs5fiBO+ROIA/qkUfuqHlrOJmYib62znOOFZgXhwtDKJso07
   15YPHw3xHXZ57aFDz4/o+AVL8PaX6U+H8h2aycAoJmlODU5BFmqSCHEDs
   UMaIyR/SsB5k5PO5WaOsRtlr3L0MOiQJOByysBz1rMr6XG1jDTxNnQ9I0
   A==;
X-CSE-ConnectionGUID: H0eU8ToXSZaCb3T9pAIAlg==
X-CSE-MsgGUID: C6BjdLX+SuuIl6BEmwGKEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11339"; a="65025337"
X-IronPort-AV: E=Sophos;i="6.13,271,1732608000"; 
   d="scan'208";a="65025337"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2025 14:20:11 -0800
X-CSE-ConnectionGUID: pm+wr3A5QH6WERaL0RZ7Lw==
X-CSE-MsgGUID: i41c+p1RTdyknnXZXQgUsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,271,1732608000"; 
   d="scan'208";a="112468312"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 08 Feb 2025 14:20:09 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tgtBH-0010hj-2Q;
	Sat, 08 Feb 2025 22:20:07 +0000
Date: Sun, 9 Feb 2025 06:19:32 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.13/invlpgb-v9 2/5] arch/x86/mm/tlb.c:1448:3: error: call to
 undeclared function 'invlpgb_flush_addr_nosync'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202502090616.oGx7Cuc8-lkp@intel.com>
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
commit: 562d058d0cd7501740dca61a16d2f9e55c1f1981 [2/5] x86/mm: do targeted broadcast flushing from tlbbatch code
config: x86_64-buildonly-randconfig-006-20250209 (https://download.01.org/0day-ci/archive/20250209/202502090616.oGx7Cuc8-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250209/202502090616.oGx7Cuc8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502090616.oGx7Cuc8-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/mm/tlb.c:1448:3: error: call to undeclared function 'invlpgb_flush_addr_nosync'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1448 |                 invlpgb_flush_addr_nosync(addr, nr);
         |                 ^
   arch/x86/mm/tlb.c:1448:3: note: did you mean '__invlpgb_flush_addr_nosync'?
   arch/x86/include/asm/invlpgb.h:88:20: note: '__invlpgb_flush_addr_nosync' declared here
      88 | static inline void __invlpgb_flush_addr_nosync(unsigned long addr, u16 nr)
         |                    ^
>> arch/x86/mm/tlb.c:1689:3: error: call to undeclared function 'invlpgb_flush_user_nr_nosync'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1689 |                 invlpgb_flush_user_nr_nosync(kern_pcid(asid), uaddr, 1, false);
         |                 ^
   arch/x86/mm/tlb.c:1689:3: note: did you mean '__invlpgb_flush_user_nr_nosync'?
   arch/x86/include/asm/invlpgb.h:66:20: note: '__invlpgb_flush_user_nr_nosync' declared here
      66 | static inline void __invlpgb_flush_user_nr_nosync(unsigned long pcid,
         |                    ^
   2 errors generated.


vim +/invlpgb_flush_addr_nosync +1448 arch/x86/mm/tlb.c

3df3212f9722c7 Alex Shi     2012-06-28  1429  
b2ac10f4b65686 Rik van Riel 2025-02-05  1430  static bool broadcast_kernel_range_flush(struct flush_tlb_info *info)
b2ac10f4b65686 Rik van Riel 2025-02-05  1431  {
b2ac10f4b65686 Rik van Riel 2025-02-05  1432  	unsigned long addr;
b2ac10f4b65686 Rik van Riel 2025-02-05  1433  	unsigned long nr;
b2ac10f4b65686 Rik van Riel 2025-02-05  1434  
b2ac10f4b65686 Rik van Riel 2025-02-05  1435  	if (!IS_ENABLED(CONFIG_X86_BROADCAST_TLB_FLUSH))
b2ac10f4b65686 Rik van Riel 2025-02-05  1436  		return false;
b2ac10f4b65686 Rik van Riel 2025-02-05  1437  
b2ac10f4b65686 Rik van Riel 2025-02-05  1438  	if (!cpu_feature_enabled(X86_FEATURE_INVLPGB))
b2ac10f4b65686 Rik van Riel 2025-02-05  1439  		return false;
b2ac10f4b65686 Rik van Riel 2025-02-05  1440  
b2ac10f4b65686 Rik van Riel 2025-02-05  1441  	if (info->end == TLB_FLUSH_ALL) {
b2ac10f4b65686 Rik van Riel 2025-02-05  1442  		invlpgb_flush_all();
b2ac10f4b65686 Rik van Riel 2025-02-05  1443  		return true;
b2ac10f4b65686 Rik van Riel 2025-02-05  1444  	}
b2ac10f4b65686 Rik van Riel 2025-02-05  1445  
b2ac10f4b65686 Rik van Riel 2025-02-05  1446  	for (addr = info->start; addr < info->end; addr += nr << PAGE_SHIFT) {
b2ac10f4b65686 Rik van Riel 2025-02-05  1447  		nr = min((info->end - addr) >> PAGE_SHIFT, invlpgb_count_max);
b2ac10f4b65686 Rik van Riel 2025-02-05 @1448  		invlpgb_flush_addr_nosync(addr, nr);
b2ac10f4b65686 Rik van Riel 2025-02-05  1449  	}
b2ac10f4b65686 Rik van Riel 2025-02-05  1450  	tlbsync();
b2ac10f4b65686 Rik van Riel 2025-02-05  1451  	return true;
b2ac10f4b65686 Rik van Riel 2025-02-05  1452  }
b2ac10f4b65686 Rik van Riel 2025-02-05  1453  

:::::: The code at line 1448 was first introduced by commit
:::::: b2ac10f4b65686ca371571bd150c18ea71c7277c x86/mm: use INVLPGB for kernel TLB flushes

:::::: TO: Rik van Riel <riel@surriel.com>
:::::: CC: Steven Barrett <steven@liquorix.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

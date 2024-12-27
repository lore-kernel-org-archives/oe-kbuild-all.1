Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FB011F8698
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Dec 2024 18:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735322540; cv=none; b=qw2phkKnbGCs1j07x5XHxMiH7OVcov3arSy98jBldEgfM4S6kezCyOa3hbwnyGh7zk9chYIDgpqoH6OtpdbOcXIeXmhBIzhogYzoquFZ2m6uNafYL+VxrJZqnebaJSMBVCDbAMmYSiXllDqXXoBMweeGrd/zW25ZThiQb1LAhkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735322540; c=relaxed/simple;
	bh=l0WbfM/voxKJPvyhIx20mOLEqpbKXsNfKH8NfQto9g0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NTyNntkSHDQ0+EIf78FQptasbMAxXaBmf6h22gI1enKXsxkjgBWCWAbdQOoDNI8YNAfODf9VB0+5n0jrDaHbuBdsdWd3OfF85e0wbUi+k6OKtcjDJmXW6lIlXtYji+WlCABJRCH5P9fYA/Oj5HOInle3dSwWZdWo1K2x9NWf5Xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H1P3fZB8; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H1P3fZB8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735322539; x=1766858539;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=l0WbfM/voxKJPvyhIx20mOLEqpbKXsNfKH8NfQto9g0=;
  b=H1P3fZB8M5IcfE4VVBt4qVk+7TqbRC6UFBmFk5ZrsZz+pQuw724xAw8Q
   S5bO0L7V7RV8i/mrVM4RXSs6hy//Q0PPRQP+jMI7tfj9aBAOY7WGrhLe1
   knVCIgCsEOyZj5hNczQRBMfrM6xg1urHgh6ebOwx4V5YxqGfdQZ4FU7r2
   Ir6CPDeJgReEFJLKvXxYGomIwS8joBMjgjwo8PjRhfRAectfxHg4RvqKz
   wb8j7o4z5bswBcLBPDY5EveHVWXog3VZLoQWf5SQnt+4oIFZ1tHerr+Mr
   71GtxbRu65UxZb4uQzdoQBD5CD2WxJBodLk/NdVjzyMd6EtVhk3NZ9VN4
   g==;
X-CSE-ConnectionGUID: uUDnWcy8Qg+KAAK2HM2WOg==
X-CSE-MsgGUID: PldxpTzOSMOV362P+eWqEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11298"; a="35883249"
X-IronPort-AV: E=Sophos;i="6.12,269,1728975600"; 
   d="scan'208";a="35883249"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2024 10:02:14 -0800
X-CSE-ConnectionGUID: tZlW61kBTxquf3/g2ZwxqQ==
X-CSE-MsgGUID: ZraDixMVSLKI8biPwgzg2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="131182043"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 27 Dec 2024 10:02:13 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tREf5-0003Q9-12;
	Fri, 27 Dec 2024 18:02:11 +0000
Date: Sat, 28 Dec 2024 02:01:43 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Zengkai <zhengzengkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2600/2600]
 arch/arm64/include/asm/cmpxchg.h:88:1: sparse: sparse: cast truncates bits
 from constant value (3fff becomes ff)
Message-ID: <202412280149.2dV0pFCu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   053a6b6f8e4c86200cdb20bc80c063c3bb119859
commit: 2cef14dac00fca28ba2c0492e70bb537cba83f4d [2600/2600] mm/pin_mem: add PG_hotreplace to mark pages need hotreplaced
config: arm64-randconfig-r133-20241227 (https://download.01.org/0day-ci/archive/20241228/202412280149.2dV0pFCu-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20241228/202412280149.2dV0pFCu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412280149.2dV0pFCu-lkp@intel.com/

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

Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD3711DDC20
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Feb 2025 23:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739921186; cv=none; b=r3ZmvSJWchMe/nJ5q8OKd9pSHdja/iKIuD137fALjyzRLqeYt8RmeLBCj7G3ByCgSqA3ewr8sNt9sOJnaD2w55NySi+2zepbo3cuHLC6jswl5ZfSk7VXZX6Dr3mQ8x13L3ohMsR7pnLE/zfTuMW5GfELz5vLCGUDRTmoGzUEoGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739921186; c=relaxed/simple;
	bh=9Mj06Zx/w6MiKhzw/XidU4f1lQYpBQOAiKxVQ//vgKA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BD3VNH4NplJrJjaUO8OJ4BnfRChMg4iEgl1hBu7NzAaTeq+wV18ieJDPFhJehLACuylN6eNOawbTm4SCkMc9qyOrHzNB066sE6xEwXfnMNNCzs2QjwRd0m2hwLnCZ0D44GBDozPhOlI0dw15VUjOgR9pUT0yDyOLI2vUjZ7Pin0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fHWrF0Yc; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fHWrF0Yc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739921184; x=1771457184;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9Mj06Zx/w6MiKhzw/XidU4f1lQYpBQOAiKxVQ//vgKA=;
  b=fHWrF0Yc+l3GAPSlu8NwW0yRTKZp1uTJud/P1kFLrHPIpbSeBFUsbC9y
   S6yrE6LbjqjTz1abzavBgAo6f9X7m0JFzuN6IJzzeTqVGP4DhgtmydCKf
   M7dB0V904BhPuKTGfZ3oxxR1LqwWIeEfcYUpGGGD56TCD8O5y/EIx9rqa
   DsFAcyNe+07yrDyExyxZlvgolh7CCXiXgdgWQtVp+oWpPi+FkCXzhq3ve
   g7MZxB8rzsejJmN6xgpCJ7Bru0tzU1FlAzEgqDzix71L8Rhsqe19AR2bc
   sHiFzfVX4ndiVMcCtrXwJo/mw3gqYkS7zqACpdQ3GFabZRflPBBuVLEwy
   A==;
X-CSE-ConnectionGUID: pDE27xPPRRWS6EklE52b3g==
X-CSE-MsgGUID: Xs58XkIARjWgp6FqVWsneQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="40498571"
X-IronPort-AV: E=Sophos;i="6.13,296,1732608000"; 
   d="scan'208";a="40498571"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2025 15:26:22 -0800
X-CSE-ConnectionGUID: zI6tmjZ6SryWC5woXyoRBw==
X-CSE-MsgGUID: GY9Fb+BsQn2wmU5esl0rGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,296,1732608000"; 
   d="scan'208";a="145391732"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 18 Feb 2025 15:26:21 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tkWyp-0000xp-0W;
	Tue, 18 Feb 2025 23:26:19 +0000
Date: Wed, 19 Feb 2025 07:26:04 +0800
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kkdwivedi:cna 6/6] kernel/locking/qspinlock_cna.h:102:6: error:
 call to undeclared function 'next_pseudo_random32'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202502190755.HSNSt2IQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/kkdwivedi/linux cna
head:   7b55d75d53fa4712c9c480318d248c4bf3dbe1e4
commit: 7b55d75d53fa4712c9c480318d248c4bf3dbe1e4 [6/6] locking/qspinlock: Introduce the shuffle reduction optimization into CNA
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20250219/202502190755.HSNSt2IQ-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250219/202502190755.HSNSt2IQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502190755.HSNSt2IQ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/locking/qspinlock.c:621:
>> kernel/locking/qspinlock_cna.h:102:6: error: call to undeclared function 'next_pseudo_random32'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     102 |         s = next_pseudo_random32(s);
         |             ^
   In file included from kernel/locking/qspinlock.c:624:
   In file included from kernel/locking/qspinlock.c:651:
   In file included from kernel/locking/qspinlock_paravirt.h:7:
   In file included from include/linux/memblock.h:12:
   In file included from include/linux/mm.h:2224:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   3 warnings and 1 error generated.


vim +/next_pseudo_random32 +102 kernel/locking/qspinlock_cna.h

    91	
    92	/*
    93	 * Return false with probability 1 / 2^@num_bits.
    94	 * Intuitively, the larger @num_bits the less likely false is to be returned.
    95	 * @num_bits must be a number between 0 and 31.
    96	 */
    97	static bool probably(unsigned int num_bits)
    98	{
    99		u32 s;
   100	
   101		s = this_cpu_read(seed);
 > 102		s = next_pseudo_random32(s);
   103		this_cpu_write(seed, s);
   104	
   105		return s & ((1 << num_bits) - 1);
   106	}
   107	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

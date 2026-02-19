Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 167FC1487F6
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Feb 2026 12:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771505795; cv=none; b=RLE9q+AAbCbjiQsardWRV3K9RW1illc6Ek9zbod4u5hmDJGQRveLGYQPWsJMioFZcq+NtVZg4Vv3EEdrMpj6F++TIjCUaeZSBADGpFbUmlanHzUgyiLOKaai6Ft5MHKwx1e9s4JchTYTvyO6Q/zIuW59EYUmK+QEbNTE8NnWYjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771505795; c=relaxed/simple;
	bh=nyA1vZ5I7WZtP+JnZk01/iBuBDVAG8tjFcsWUlt1alg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=j576fUdQbvbgAlTwSWliX3p3oNA7fEExAQOocisFDhMF25C91gHLbfinE/Ay/X/XiPDQRGep2lOXaLZjfZ3EbTCwabOedRgqIYoK2rZEyVZPAXvE9NcSxfduwK55Ei1c2HTo1Wzqosd7qegIp+ih/IPD7QkQAtCYGQVZfd9ArW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XS1GHCM3; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XS1GHCM3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771505793; x=1803041793;
  h=date:from:to:cc:subject:message-id;
  bh=nyA1vZ5I7WZtP+JnZk01/iBuBDVAG8tjFcsWUlt1alg=;
  b=XS1GHCM3IPNHwWqAFd5mosAIqvIHk/XXSjalBkeSR6qDWTzdO8l8bSCm
   b+HGpiihYrYZEGJx7x6CxZRSLPpFXaEf1dhIu+gfZt3VnE1qHqK5O+8zZ
   g7b+ZmpMN25kWeWnhT6QuR89SQ0Gm89777BiXABx8zo5rBKT9pyIhM87Y
   q9GBuNEJROCLOKC534UXGvzOrbEE9Pwpvz2nRGXnU8bgWlDYY4OQQRQbu
   JaTzJRzabT7d4+O4Lz/vwVHP6FTcBjrF3+t+plUtP6vFJ2Lhs714mtacQ
   sLnHG8Z2HRhh3wKsepxyqwTLQ10mRp/37BP5+PAsGaIlav7vxW8raGYss
   g==;
X-CSE-ConnectionGUID: Q13wlEtnTsqYBHXAjlygZw==
X-CSE-MsgGUID: 9AGs0mspT4asEWVBC9UTig==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="72489629"
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; 
   d="scan'208";a="72489629"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2026 04:56:33 -0800
X-CSE-ConnectionGUID: RHayEyrYT/i1snQW+nV35Q==
X-CSE-MsgGUID: 5J4AB3IQSduXyuLbsM+qHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; 
   d="scan'208";a="213631759"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 19 Feb 2026 04:56:31 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vt3a1-000000013CG-1G8E;
	Thu, 19 Feb 2026 12:56:29 +0000
Date: Thu, 19 Feb 2026 20:56:10 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-misc:xor-improvements 10/26] xor-core.c:undefined
 reference to `xor_block_8regs_p'
Message-ID: <202602192024.oQ4aj9xY-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   git://git.infradead.org/users/hch/misc.git xor-improvements
head:   2f049c62469371a286e933b1a316b38d3fdac4da
commit: 35ac177a76b4cc8fb9169d53c93910c9a9315d28 [10/26] xor: only build the generic prefetching code if prefetching is supported
config: um-randconfig-001-20260219 (https://download.01.org/0day-ci/archive/20260219/202602192024.oQ4aj9xY-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260219/202602192024.oQ4aj9xY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602192024.oQ4aj9xY-lkp@intel.com/

All errors (new ones prefixed by >>):

   /usr/bin/ld: warning: .tmp_vmlinux1 has a LOAD segment with RWX permissions
   /usr/bin/ld: lib/raid/xor/xor-core.o: in function `xor_init':
>> xor-core.c:(.init.text+0x238): undefined reference to `xor_block_8regs_p'
>> /usr/bin/ld: xor-core.c:(.init.text+0x246): undefined reference to `xor_block_8regs_p'
>> /usr/bin/ld: xor-core.c:(.init.text+0x24c): undefined reference to `xor_block_32regs_p'
   /usr/bin/ld: xor-core.c:(.init.text+0x255): undefined reference to `xor_block_32regs_p'
   clang: error: linker command failed with exit code 1 (use -v to see invocation)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

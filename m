Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CD0D2F616B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Mar 2026 06:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773987931; cv=none; b=dRA1Gx1nyuJ89s2YzYq+U6xPHED5gMZFOjKUvGvrKt9P9oXM+KPps5UO/0TjhM7w6JeK2MyYf6Fk6D2z1LRbKODWKIMZmWzCr4mdMSsQbKW+I99D1vtLwldHcH7Zi6Xb9VlfeSkvXKZjRDkvRGNkP7E1ydKKhDPCkS14Zo0xn8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773987931; c=relaxed/simple;
	bh=2xAP62yBR5t/NjQ5G6pO7xCXk+X+901sZRBd34+yLAA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=PdOqQzoVVBot3bTxpJJqmQ8LV57lsdsH63NMuntcO7n/5eyC2RQRhyBusU2yjdXiaGELOm8tzh3uMWBuQpODflJJGkfVIpI5gtuXydwQTy6fACYzs3uLSkH9D4D08qsH9nRkbRxsOWIv12NKW8Hj1jJrTOoIxq2X6J6D/ol+Aq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H1dAR5yH; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H1dAR5yH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773987930; x=1805523930;
  h=date:from:to:cc:subject:message-id;
  bh=2xAP62yBR5t/NjQ5G6pO7xCXk+X+901sZRBd34+yLAA=;
  b=H1dAR5yH0BUJjUGCdzzhuzAkQI37vzkFd7psOHMG8E8zUpAlQArPB3Yy
   YOxlQVV8y4+DxN2V9bVlnZp6Ka24ebt81ZCb3L7Z1b5gEjSrqUA2ZhHpR
   92tAzscg+UfSQVRYA9s4KJ1U6nSIc/TLKKiRTAOC4MPxHyicPfHm3qjZy
   ACCJNNtFfawPeH6kRv6IQedKMV7wJKYt6gvI/fM/ezrHv4T765ThVi9Pc
   n+YoC6YQk+55KqQuAj9QKLj8x9wB7TaPEWqeluU/7W6y5qNw0gx0HJBsa
   vNliN1FJ68pUOTtURLNcGbA+V6bJw2awh9r/EMAXby9Aszxaashynmdfb
   g==;
X-CSE-ConnectionGUID: 0+fYMePLQWu51LtKMwURqQ==
X-CSE-MsgGUID: EN+08nb2QDKMdZhrSKhGxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="78675540"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="78675540"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 23:25:30 -0700
X-CSE-ConnectionGUID: r8f4nWwQQiWk+iGNDxZIRA==
X-CSE-MsgGUID: Jb8cxpOBSbiE4W+QJerpEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="220116715"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 19 Mar 2026 23:25:28 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w3TIU-000000004zB-2AbH;
	Fri, 20 Mar 2026 06:25:26 +0000
Date: Fri, 20 Mar 2026 07:25:25 +0100
From: kernel test robot <lkp@intel.com>
To: Kai Huang <kai.huang@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-tdx:upstreamtest 2/2]
 ./include/asm-generic/bitops/instrumented-atomic.h:112:16: error: implicit
 declaration of function 'arch_test_bit'; did you mean 'arch_set_bit'?
Message-ID: <202603200746.ETGzw9Mr-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel/tdx.git upstreamtest
head:   5c38ae7e5c475be0eb737e7e77f6982529e0ef4f
commit: 5c38ae7e5c475be0eb737e7e77f6982529e0ef4f [2/2] asm-generic/bitops: Move test_bit{_acquire}() to instrumented-atomic.h
config: riscv-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260320/202603200746.ETGzw9Mr-lkp@intel.com/config)
compiler: riscv64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260320/202603200746.ETGzw9Mr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603200746.ETGzw9Mr-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from ./arch/riscv/include/asm/bitops.h:355,
                    from ./include/linux/bitops.h:67,
                    from ./include/linux/log2.h:12,
                    from kernel/bounds.c:14:
   ./include/asm-generic/bitops/instrumented-atomic.h: In function '_test_bit':
>> ./include/asm-generic/bitops/instrumented-atomic.h:112:16: error: implicit declaration of function 'arch_test_bit'; did you mean 'arch_set_bit'? [-Wimplicit-function-declaration]
     112 |         return arch_test_bit(nr, addr);
         |                ^~~~~~~~~~~~~
         |                arch_set_bit
   ./include/asm-generic/bitops/instrumented-atomic.h: In function '_test_bit_acquire':
>> ./include/asm-generic/bitops/instrumented-atomic.h:124:16: error: implicit declaration of function 'arch_test_bit_acquire'; did you mean '_test_bit_acquire'? [-Wimplicit-function-declaration]
     124 |         return arch_test_bit_acquire(nr, addr);
         |                ^~~~~~~~~~~~~~~~~~~~~
         |                _test_bit_acquire


vim +112 ./include/asm-generic/bitops/instrumented-atomic.h

   102	
   103	/**
   104	 * _test_bit - Determine whether a bit is set
   105	 * @nr: bit number to test
   106	 * @addr: Address to start counting from
   107	 */
   108	static __always_inline bool
   109	_test_bit(unsigned long nr, const volatile unsigned long *addr)
   110	{
   111		instrument_atomic_read(addr + BIT_WORD(nr), sizeof(long));
 > 112		return arch_test_bit(nr, addr);
   113	}
   114	
   115	/**
   116	 * _test_bit_acquire - Determine, with acquire semantics, whether a bit is set
   117	 * @nr: bit number to test
   118	 * @addr: Address to start counting from
   119	 */
   120	static __always_inline bool
   121	_test_bit_acquire(unsigned long nr, const volatile unsigned long *addr)
   122	{
   123		instrument_atomic_read(addr + BIT_WORD(nr), sizeof(long));
 > 124		return arch_test_bit_acquire(nr, addr);
   125	}
   126	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

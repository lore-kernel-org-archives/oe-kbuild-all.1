Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E354568A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Apr 2024 18:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713983490; cv=none; b=sGBGbnoUIjRQsxMF8Gj341dah7tJ+2g2lNqxB+P3rSAZJAN2XtL4d9/FJ2NLkrBxGsj0cJrWbsCOWWRr9qZYQE9TkpvFDC6GP3LwtnFyfGTB7shLgH8R80R6eK2AvxZiSXVdemaAGXRZ7gJykr6x3Jy6CLe22rOrwbAe6TILLSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713983490; c=relaxed/simple;
	bh=Y7Pz4QQnOTbpudX/zE6HzzjE7Wljf1jFw+qSidwLqh8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=H0eirHleuyjo59N0BzzDqlQk198HYtNEa+MosiWz7N40oi0I42DgNdjdA6KCIybgaZrsozZgJphZeMmS73FI0qCmvjG8MrLeK21cXddrS1q6qhdeMEddOdJdtrIkNwLBlOw08ncWNhuR2TCLCR1/bVIeB3jTUyxQlPtvDkD2jHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hJZeEU8v; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hJZeEU8v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713983489; x=1745519489;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Y7Pz4QQnOTbpudX/zE6HzzjE7Wljf1jFw+qSidwLqh8=;
  b=hJZeEU8v1ijCxY/sfQfmxz1WN8D0vbdLTtc7LYHkfT1y/sx0sFfAUkjv
   LoKtASYr7kSpVFMBqCSzllFBau9Oaht2s40Q3y0Xa3IKXKYX5jw4Mmeio
   BV4vNttrE/4D86HbD0fVLfn9qqDBbyRQppDR0+WsyUpK0rTOyEjKkdjjW
   jakCULMqQXmnzlqsyoA0f6MDr6ifbvks0+T1EZRtgfiltcnuz+KXpvlsc
   BHrpk8LizifYdfAZmcTFk+GnlzKWTEeT6sQTH7g7aDuejaLZh1oplGP41
   E1BXTJoHNyG6izVSP8LDY66PYIIvNjqnWgaDtUBoBHE8mqu95QrsurOB/
   Q==;
X-CSE-ConnectionGUID: XkZ47VQpS9+f9vAAkGVbrw==
X-CSE-MsgGUID: GNm8EH4OS2edb5TEQM4m/A==
X-IronPort-AV: E=McAfee;i="6600,9927,11054"; a="13421697"
X-IronPort-AV: E=Sophos;i="6.07,226,1708416000"; 
   d="scan'208";a="13421697"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2024 11:31:28 -0700
X-CSE-ConnectionGUID: /x7oUHqCRMC1uvrBE6hXjQ==
X-CSE-MsgGUID: vNKxOUQKQ/SDkDIHywcPGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,226,1708416000"; 
   d="scan'208";a="29591276"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 24 Apr 2024 11:31:27 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rzhOu-0001Y0-1X;
	Wed, 24 Apr 2024 18:31:24 +0000
Date: Thu, 25 Apr 2024 02:30:38 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Zengkai <zhengzengkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 8980/30000] arch/arm64/mm/pmem_reserve.c:13:13:
 warning: no previous prototype for 'setup_reserve_pmem'
Message-ID: <202404250258.hOXrHVAI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   fca9656c7bff35049038766e63e93888847b5bff
commit: db4cd75bc674e6f473c0a7303b1744155352882c [8980/30000] arm64: register persistent memory via protected memory
config: arm64-randconfig-001-20240425 (https://download.01.org/0day-ci/archive/20240425/202404250258.hOXrHVAI-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240425/202404250258.hOXrHVAI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404250258.hOXrHVAI-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/mm/pmem_reserve.c:13:13: warning: no previous prototype for 'setup_reserve_pmem' [-Wmissing-prototypes]
      13 | void __init setup_reserve_pmem(u64 start, u64 size)
         |             ^~~~~~~~~~~~~~~~~~
>> arch/arm64/mm/pmem_reserve.c:25:13: warning: no previous prototype for 'request_pmem_res_resource' [-Wmissing-prototypes]
      25 | void __init request_pmem_res_resource(void)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/arm64/mm/pmem_reserve.c:40:13: warning: no previous prototype for 'reserve_pmem' [-Wmissing-prototypes]
      40 | void __init reserve_pmem(void)
         |             ^~~~~~~~~~~~


vim +/setup_reserve_pmem +13 arch/arm64/mm/pmem_reserve.c

    12	
  > 13	void __init setup_reserve_pmem(u64 start, u64 size)
    14	{
    15		if (pmem_res_cnt >= MAX_REGIONS) {
    16			pr_err("protected memory regions above upper limit %d\n", MAX_REGIONS);
    17			return;
    18		}
    19	
    20		pmem_res[pmem_res_cnt].start = start;
    21		pmem_res[pmem_res_cnt].end = start + size - 1;
    22		pmem_res_cnt++;
    23	}
    24	
  > 25	void __init request_pmem_res_resource(void)
    26	{
    27		struct resource *res;
    28		int i;
    29	
    30		for (i = 0; i < pmem_res_cnt; i++) {
    31			res = &pmem_res[i];
    32			res->name = "Persistent Memory (legacy)";
    33			res->flags = IORESOURCE_MEM;
    34			res->desc = IORES_DESC_PERSISTENT_MEMORY_LEGACY;
    35			if (res->start && res->end)
    36				request_resource(&iomem_resource, res);
    37		}
    38	}
    39	
  > 40	void __init reserve_pmem(void)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

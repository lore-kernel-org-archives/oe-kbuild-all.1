Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 266FF12B61
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Nov 2023 11:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K+R4gb/y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699703319; x=1731239319;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hIJnlK4JAvNCfnLbt3p0h4YaHAr+t3agdjk+zrMNBus=;
  b=K+R4gb/yOzGpSkT86V01gFeGtYxf82sAqSVH+6sYRFCni/z8ELIJW7CL
   6I/GAzqo7vD8WBoRX/dAU6KSWOUF1YAyNqLC+nQsI2Eq3lU5pPIf+R0lu
   8aIF3cJEZa5P9pVcBLA/fI9c2sAZ5SLXH2gab7Ll4XnI14OSi1mjr2CRR
   6Nd8ae8ge93u5C7RFDICNYr3IinOEbFYs+CwYMZ95gCEa7yNV+UicCxXE
   7X3B9k8PgrghVopmOhpsR+g27U4o0HwDK6R4NYD0Oq5SHt4Tb4SL05/Sh
   342PPaFHA5SGQSAGz5FiZpq9TAJSNGEnAy3hCe1NfaCTjUPYhvhJlZr1m
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="3328726"
X-IronPort-AV: E=Sophos;i="6.03,294,1694761200"; 
   d="scan'208";a="3328726"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2023 03:48:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,294,1694761200"; 
   d="scan'208";a="11663483"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 11 Nov 2023 03:48:38 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r1mTa-000AQ4-1p;
	Sat, 11 Nov 2023 11:48:34 +0000
Date: Sat, 11 Nov 2023 19:47:59 +0800
From: kernel test robot <lkp@intel.com>
To: Dan Williams <dan.j.williams@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Ross Zwisler <ross.zwisler@linux.intel.com>
Subject: arch/x86/lib/usercopy_64.c:89: warning: Function parameter or member
 'addr' not described in 'clean_cache_range'
Message-ID: <202311111941.DgayocRE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   3ca112b71f35dd5d99fc4571a56b5fc6f0c15814
commit: 0aed55af88345b5d673240f90e671d79662fb01e x86, uaccess: introduce copy_from_iter_flushcache for pmem / cache-bypass operations
date:   6 years ago
config: x86_64-alldefconfig (https://download.01.org/0day-ci/archive/20231111/202311111941.DgayocRE-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231111/202311111941.DgayocRE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311111941.DgayocRE-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/lib/usercopy_64.c:89: warning: Function parameter or member 'addr' not described in 'clean_cache_range'
>> arch/x86/lib/usercopy_64.c:89: warning: Excess function parameter 'vaddr' description in 'clean_cache_range'


vim +89 arch/x86/lib/usercopy_64.c

    77	
    78	#ifdef CONFIG_ARCH_HAS_UACCESS_FLUSHCACHE
    79	/**
    80	 * clean_cache_range - write back a cache range with CLWB
    81	 * @vaddr:	virtual start address
    82	 * @size:	number of bytes to write back
    83	 *
    84	 * Write back a cache range using the CLWB (cache line write back)
    85	 * instruction. Note that @size is internally rounded up to be cache
    86	 * line size aligned.
    87	 */
    88	static void clean_cache_range(void *addr, size_t size)
  > 89	{
    90		u16 x86_clflush_size = boot_cpu_data.x86_clflush_size;
    91		unsigned long clflush_mask = x86_clflush_size - 1;
    92		void *vend = addr + size;
    93		void *p;
    94	
    95		for (p = (void *)((unsigned long)addr & ~clflush_mask);
    96		     p < vend; p += x86_clflush_size)
    97			clwb(p);
    98	}
    99	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

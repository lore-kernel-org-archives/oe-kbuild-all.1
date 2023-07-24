Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56A0BA35
	for <oe-kbuild-all@lists.linux.dev>; Mon, 24 Jul 2023 02:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690164378; x=1721700378;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nmXmXmds6M4njo3mIPNI9SpTyG+kCm7+Ibq/W0VFmbY=;
  b=SASgicKEw/rApzUjROOKaWbZS7noDivT0NxOEzifAJo1NYqyarTBEjsJ
   UVBrBdSwUUwYg3cZqC4S9rwYpkxivp742a0ZUjZQKgPRPzceQW87rf/4J
   dOnFD8jq54VxXkYZOkljKfy/18zV8IH/2Pcq4pl4465hs56OVUbKsANOv
   v1e6/6z+r2TkZckRtvx9mLmidbjMzhZuGB34QP6oVhDRwhWJ1taRybaEs
   cVaDJU9OrHBON5v1EQTJB1izmh0MzFg9nBdkuXCo9OO6ccR4QOQJOTn8q
   rZu96adjyD/YZekCYIY6XE2x+giBMTvv7NDf6tgS65oKUUhe3phpBcUty
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10780"; a="352223941"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; 
   d="scan'208";a="352223941"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2023 19:05:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10780"; a="790792375"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; 
   d="scan'208";a="790792375"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 23 Jul 2023 19:05:56 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qNkxP-0009Of-1r;
	Mon, 24 Jul 2023 02:05:55 +0000
Date: Mon, 24 Jul 2023 10:05:28 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [esmil:visionfive 23/75] arch/parisc/kernel/pci-dma.c:459:9: error:
 implicit declaration of function 'purge_kernel_dcache_range'; did you mean
 'purge_kernel_dcache_range_asm'?
Message-ID: <202307241032.qrySKvvZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/esmil/linux visionfive
head:   67e2a22c34a5e14f77710f1276401e483e14bfaa
commit: e3fb900597f042cab055ccc5a7364542a1809468 [23/75] dma-mapping: replace custom code with generic implementation
config: parisc-defconfig (https://download.01.org/0day-ci/archive/20230724/202307241032.qrySKvvZ-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230724/202307241032.qrySKvvZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307241032.qrySKvvZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/parisc/kernel/pci-dma.c: In function 'arch_dma_cache_inv':
>> arch/parisc/kernel/pci-dma.c:459:9: error: implicit declaration of function 'purge_kernel_dcache_range'; did you mean 'purge_kernel_dcache_range_asm'? [-Werror=implicit-function-declaration]
     459 |         purge_kernel_dcache_range(virt, size);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
         |         purge_kernel_dcache_range_asm
   cc1: some warnings being treated as errors


vim +459 arch/parisc/kernel/pci-dma.c

   454	
   455	static inline void arch_dma_cache_inv(phys_addr_t paddr, size_t size)
   456	{
   457	 	unsigned long virt = (unsigned long)phys_to_virt(paddr);
   458	 
 > 459		purge_kernel_dcache_range(virt, size);
   460	}
   461	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

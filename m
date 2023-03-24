Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB61C6FA1
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Mar 2023 15:12:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679670747; x=1711206747;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wa3Cl6lp63uL9OEMeoEQaLKY/BQtnhgMgCl/VAsRz78=;
  b=E75+ZEsb5IrY2+FION8cvHHTRR6ikttjYMUJfBOJRahTrhCXlteu4+uQ
   MFZMHePZ/r8AUjH+cPpadUGoWf4HX5kk3wIlcCyvW859v7P8TkbPS34+X
   Djmunw2KdiSj2zzC8bAxt0FyVIAg04re0ayECsY5fjUmstXbwLxXIxhkH
   IUHLzXuAOvfNgXYdKDRD+0KX2PJv1CZlQnqYouSsi0ghxb8+l/eN4x7GA
   etXYNqRVeYDscCk/5Sm+dQsS1tDDOwqpIN+DZU1VY8EvuoLlf1VI4Q71l
   xV7mX5gwkxIGzyWU/AlgrpeB1TMEYhSUjGE+fTGVqLFVLaTxvpJEIiQA7
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="319448023"
X-IronPort-AV: E=Sophos;i="5.98,288,1673942400"; 
   d="scan'208";a="319448023"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2023 08:12:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="928685123"
X-IronPort-AV: E=Sophos;i="5.98,288,1673942400"; 
   d="scan'208";a="928685123"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 24 Mar 2023 08:12:20 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pfj5X-000FPW-11;
	Fri, 24 Mar 2023 15:12:19 +0000
Date: Fri, 24 Mar 2023 23:12:12 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-arch@vger.kernel.org
Subject: [arnd-asm-generic:dma-sync-rework 12/20]
 arch/mips/mm/dma-noncoherent.c:63:17: error: expected declaration specifiers
 or '...' before '(' token
Message-ID: <202303242356.VaoqPWHL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/asm-generic.git dma-sync-rework
head:   9a711fbea373208c1eeb2fafb0c744bc23a79a43
commit: 4a04caf3aca03b0132be4519f2064ce6fc6a0f24 [12/20] mips: dma-mapping: split out cache operation logic
config: mips-allmodconfig (https://download.01.org/0day-ci/archive/20230324/202303242356.VaoqPWHL-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/arnd/asm-generic.git/commit/?id=4a04caf3aca03b0132be4519f2064ce6fc6a0f24
        git remote add arnd-asm-generic https://git.kernel.org/pub/scm/linux/kernel/git/arnd/asm-generic.git
        git fetch --no-tags arnd-asm-generic dma-sync-rework
        git checkout 4a04caf3aca03b0132be4519f2064ce6fc6a0f24
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303242356.VaoqPWHL-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/mips/mm/dma-noncoherent.c:63:17: error: expected declaration specifiers or '...' before '(' token
      63 |                 (void)(*cache_op)(unsigned long start, unsigned long size));
         |                 ^
>> arch/mips/mm/dma-noncoherent.c:64:1: error: expected identifier or '(' before '{' token
      64 | {
         | ^
   arch/mips/mm/dma-noncoherent.c: In function 'arch_sync_dma_for_device':
>> arch/mips/mm/dma-noncoherent.c:93:17: error: implicit declaration of function 'dma_sync_phys'; did you mean 'dma_to_phys'? [-Werror=implicit-function-declaration]
      93 |                 dma_sync_phys(paddr, size, _dma_cache_wback);
         |                 ^~~~~~~~~~~~~
         |                 dma_to_phys
   cc1: some warnings being treated as errors


vim +63 arch/mips/mm/dma-noncoherent.c

    56	
    57	/*
    58	 * A single sg entry may refer to multiple physically contiguous pages.  But
    59	 * we still need to process highmem pages individually.  If highmem is not
    60	 * configured then the bulk of this loop gets optimized out.
    61	 */
    62	static inline void dma_sync_phys(phys_addr_t paddr, size_t size,
  > 63			(void)(*cache_op)(unsigned long start, unsigned long size));
  > 64	{
    65		struct page *page = pfn_to_page(paddr >> PAGE_SHIFT);
    66		unsigned long offset = paddr & ~PAGE_MASK;
    67		size_t left = size;
    68	
    69		do {
    70			size_t len = left;
    71			void *addr;
    72	
    73			if (PageHighMem(page)) {
    74				if (offset + len > PAGE_SIZE)
    75					len = PAGE_SIZE - offset;
    76			}
    77	
    78			addr = kmap_atomic(page);
    79			cache_op(addr + offset, len);
    80			kunmap_atomic(addr);
    81	
    82			offset = 0;
    83			page++;
    84			left -= len;
    85		} while (left);
    86	}
    87	
    88	void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
    89			enum dma_data_direction dir)
    90	{
    91		switch (dir) {
    92		case DMA_TO_DEVICE:
  > 93			dma_sync_phys(paddr, size, _dma_cache_wback);
    94			break;
    95		case DMA_FROM_DEVICE:
    96			dma_sync_phys(paddr, size, _dma_cache_inv);
    97			break;
    98		case DMA_BIDIRECTIONAL:
    99			if (IS_ENABLED(CONFIG_ARCH_HAS_SYNC_DMA_FOR_CPU) &&
   100			    cpu_needs_post_dma_flush())
   101				dma_sync_phys(paddr, size, _dma_cache_wback);
   102			else
   103				dma_sync_phys(paddr, size, _dma_cache_wback_inv);
   104			break;
   105		default:
   106			break;
   107		}
   108	}
   109	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

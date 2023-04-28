Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 658FF3D8E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Apr 2023 18:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682708083; x=1714244083;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lHiYiV88a9FQJ82bhx96mezpW3ojutlOkd0spomRIHo=;
  b=a5WKapVAS5G9wRqIvZc8JOQklvNgDU7Jl3dfd9ETL2y4s75w7HevhC/D
   68cRcPz2vK4Ek11idfXfnvVxl3in/feTM7KE4B2UbNNR+j1RaKw7NY2uS
   qPs/cZe8M8bZPTvbpUDSs4a9zfadRAAaW9x4yd0+3fNp98nI3SuVU8K9d
   2FS2l7W9WltTro0h2a3ymanDvRKaEHgubfMxR4Gil7qgkU67k11ySpsvk
   a6wvv1v+v/y8jSj4M2P45TqKgsguf4GbpkBUAYw+zduNhLZ+e/KgxSOEK
   N/5f2/ObyRmgNnpm3w63KES0T/SCTbNG4deCNQM6XGqamwq4oIjthYDNs
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10694"; a="328166643"
X-IronPort-AV: E=Sophos;i="5.99,235,1677571200"; 
   d="scan'208";a="328166643"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2023 11:54:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10694"; a="784340113"
X-IronPort-AV: E=Sophos;i="5.99,235,1677571200"; 
   d="scan'208";a="784340113"
Received: from lkp-server01.sh.intel.com (HELO 5bad9d2b7fcb) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 28 Apr 2023 11:54:41 -0700
Received: from kbuild by 5bad9d2b7fcb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1psTEu-0000ch-1u;
	Fri, 28 Apr 2023 18:54:40 +0000
Date: Sat, 29 Apr 2023 02:54:11 +0800
From: kernel test robot <lkp@intel.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Palmer Dabbelt <palmer@rivosinc.com>
Subject: [linux-stable-rc:linux-5.15.y 9996/9999] arch/riscv/mm/init.c:755:9:
 warning: ISO C90 forbids mixed declarations and code
Message-ID: <202304290222.Z7AvYUsf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-5.15.y
head:   64fb7ad7e758c85ebeb0c8c500e4175c65bf5778
commit: 067df57aea8ea9d1d84c53d9925d58759ac90824 [9996/9999] riscv: Move early dtb mapping into the fixmap region
config: riscv-randconfig-r014-20230428 (https://download.01.org/0day-ci/archive/20230429/202304290222.Z7AvYUsf-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/commit/?id=067df57aea8ea9d1d84c53d9925d58759ac90824
        git remote add linux-stable-rc https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
        git fetch --no-tags linux-stable-rc linux-5.15.y
        git checkout 067df57aea8ea9d1d84c53d9925d58759ac90824
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash arch/riscv/mm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304290222.Z7AvYUsf-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/riscv/mm/init.c: In function 'setup_vm_final':
>> arch/riscv/mm/init.c:755:9: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
     755 |         unsigned long idx = pgd_index(__fix_to_virt(FIX_FDT));
         |         ^~~~~~~~


vim +755 arch/riscv/mm/init.c

   731	
   732	static void __init setup_vm_final(void)
   733	{
   734		uintptr_t va, map_size;
   735		phys_addr_t pa, start, end;
   736		u64 i;
   737	
   738		/**
   739		 * MMU is enabled at this point. But page table setup is not complete yet.
   740		 * fixmap page table alloc functions should be used at this point
   741		 */
   742		pt_ops.alloc_pte = alloc_pte_fixmap;
   743		pt_ops.get_pte_virt = get_pte_virt_fixmap;
   744	#ifndef __PAGETABLE_PMD_FOLDED
   745		pt_ops.alloc_pmd = alloc_pmd_fixmap;
   746		pt_ops.get_pmd_virt = get_pmd_virt_fixmap;
   747	#endif
   748		/* Setup swapper PGD for fixmap */
   749	#if !defined(CONFIG_64BIT)
   750		/*
   751		 * In 32-bit, the device tree lies in a pgd entry, so it must be copied
   752		 * directly in swapper_pg_dir in addition to the pgd entry that points
   753		 * to fixmap_pte.
   754		 */
 > 755		unsigned long idx = pgd_index(__fix_to_virt(FIX_FDT));
   756	
   757		set_pgd(&swapper_pg_dir[idx], early_pg_dir[idx]);
   758	#endif
   759		create_pgd_mapping(swapper_pg_dir, FIXADDR_START,
   760				   __pa_symbol(fixmap_pgd_next),
   761				   PGDIR_SIZE, PAGE_TABLE);
   762	
   763		/* Map all memory banks in the linear mapping */
   764		for_each_mem_range(i, &start, &end) {
   765			if (start >= end)
   766				break;
   767			if (start <= __pa(PAGE_OFFSET) &&
   768			    __pa(PAGE_OFFSET) < end)
   769				start = __pa(PAGE_OFFSET);
   770			if (end >= __pa(PAGE_OFFSET) + memory_limit)
   771				end = __pa(PAGE_OFFSET) + memory_limit;
   772	
   773			map_size = best_map_size(start, end - start);
   774			for (pa = start; pa < end; pa += map_size) {
   775				va = (uintptr_t)__va(pa);
   776	
   777				create_pgd_mapping(swapper_pg_dir, va, pa, map_size,
   778						   pgprot_from_va(va));
   779			}
   780		}
   781	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

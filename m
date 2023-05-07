Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1A5B33D4
	for <oe-kbuild-all@lists.linux.dev>; Sun,  7 May 2023 23:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683501413; x=1715037413;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2o8c27u2HSETPRa+2FuIPJUzhLzUniPzya4sucnKqJw=;
  b=XDlVRfAOTnt4jsNy0ahDDr6gL7WKslbnN3r+3R5n8W2MCwK81gYvVnxZ
   HWB8B0O1mTmUGJiXqPsyy2MfnnXUYJBMabhZbbbBaJt+vuJ0S3LksBHuN
   1zXxvZwnd/U8SOr8pKZEXJSx6CtoaAWZ0KZ+m/DBuNMqhl2OTtVcD6GfN
   ia7Y/jEde/1C7/cCSRb35frp+oISRPW9E5C/BCnLyhrBRjLt4tIkb+dt7
   R8EYkn4JaM3er8Mdmu3fSf/Bb1iQfprWXMxExT9WyUuXc9A3vV3DLHDzO
   rkdy99quKM5paRZlO78T5ZPnJrqOkTCiVdgP6fyErbQT3G9Wj02OOb30Q
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10703"; a="377608216"
X-IronPort-AV: E=Sophos;i="5.99,257,1677571200"; 
   d="scan'208";a="377608216"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2023 16:16:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10703"; a="767854553"
X-IronPort-AV: E=Sophos;i="5.99,257,1677571200"; 
   d="scan'208";a="767854553"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 07 May 2023 16:16:51 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pvncY-0000u5-2x;
	Sun, 07 May 2023 23:16:50 +0000
Date: Mon, 8 May 2023 07:16:03 +0800
From: kernel test robot <lkp@intel.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Palmer Dabbelt <palmer@rivosinc.com>
Subject: [stable:linux-5.15.y 9996/9999] arch/riscv/mm/init.c:755:9: warning:
 ISO C90 forbids mixed declarations and code
Message-ID: <202305080722.ud2UQsls-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-5.15.y
head:   8a7f2a5c5aa1648edb4f2029c6ec33870afb7a95
commit: bbf94b04215517c681b3df7c7a8ab48cbb2540a1 [9996/9999] riscv: Move early dtb mapping into the fixmap region
config: riscv-randconfig-r016-20230508 (https://download.01.org/0day-ci/archive/20230508/202305080722.ud2UQsls-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?id=bbf94b04215517c681b3df7c7a8ab48cbb2540a1
        git remote add stable https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
        git fetch --no-tags stable linux-5.15.y
        git checkout bbf94b04215517c681b3df7c7a8ab48cbb2540a1
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash arch/riscv/mm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305080722.ud2UQsls-lkp@intel.com/

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

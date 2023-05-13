Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE5C9A2C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 May 2023 01:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683942184; x=1715478184;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=34Cknb1J2KZ8RxSkj2V64ntZDo0ctCsQx+gT6go73Es=;
  b=KTGbcgbiJQ2reRzaSLmiUX2Gx6Pq9RUIadCBd3QKzcEtAtNNLr81Zf5a
   WNHFO4Bqb9nJWDFd40+PFY56S6Y8inF9QeMJhj0GeRVdlDDORhH8f3A0m
   b0/SUij/8250ty+D4iB4g94kAL7QyN1H0zZnqnKmK84pUj5QuyxniZsRZ
   RVKEaSt2fCYyLIi1XUBRdh9VpIRZGzmKLrjjJgODn+cf2GecghaJpY5xi
   8GEnf02PY07lHo+7meWrTb6JhHtYJtToA6RFktklr9+2WXe2vjELHqnTB
   AaA2bra3d/8vQWvxCXMNHs5V9b4zGZKgmaYHQzIF1Uj+yUWFRvfSRDv3+
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="335440633"
X-IronPort-AV: E=Sophos;i="5.99,271,1677571200"; 
   d="scan'208";a="335440633"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2023 18:43:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="812278050"
X-IronPort-AV: E=Sophos;i="5.99,271,1677571200"; 
   d="scan'208";a="812278050"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 12 May 2023 18:43:01 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pxeHk-0005Eb-1L;
	Sat, 13 May 2023 01:43:00 +0000
Date: Sat, 13 May 2023 09:42:39 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ardb:efi-remove-mixed-mode 29/30]
 arch/x86/platform/efi/efi_32.c:116:32: error: passing argument 1 of
 'efi_call_svam' from incompatible pointer type
Message-ID: <202305130908.66gVNggY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git efi-remove-mixed-mode
head:   cd57f70012e67876ab331fb83fd05670727e44d1
commit: b47a6b27ba7bb4f08536f68ed29b2db3146d3d0e [29/30] efi: Get rid of efi_fn_call()
config: i386-defconfig (https://download.01.org/0day-ci/archive/20230513/202305130908.66gVNggY-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git/commit/?id=b47a6b27ba7bb4f08536f68ed29b2db3146d3d0e
        git remote add ardb git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git
        git fetch --no-tags ardb efi-remove-mixed-mode
        git checkout b47a6b27ba7bb4f08536f68ed29b2db3146d3d0e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305130908.66gVNggY-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/platform/efi/efi_32.c: In function 'efi_set_virtual_address_map':
>> arch/x86/platform/efi/efi_32.c:116:32: error: passing argument 1 of 'efi_call_svam' from incompatible pointer type [-Werror=incompatible-pointer-types]
     116 |         status = efi_call_svam(&systab->runtime,
         |                                ^~~~~~~~~~~~~~~~
         |                                |
         |                                const efi_runtime_services_t * const*
   arch/x86/platform/efi/efi_32.c:90:28: note: expected 'efi_runtime_services_t * const*' but argument is of type 'const efi_runtime_services_t * const*'
      90 | efi_status_t efi_call_svam(efi_runtime_services_t * const *,
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/efi_call_svam +116 arch/x86/platform/efi/efi_32.c

3b2664964bc886 arch/x86/platform/efi/efi_32.c Dave Young                2013-12-20   89  
59f2a619a2db86 arch/x86/platform/efi/efi_32.c Ard Biesheuvel            2020-01-21   90  efi_status_t efi_call_svam(efi_runtime_services_t * const *,
59f2a619a2db86 arch/x86/platform/efi/efi_32.c Ard Biesheuvel            2020-01-21   91  			   u32, u32, u32, void *, u32);
69829470457344 arch/x86/platform/efi/efi_32.c Ard Biesheuvel            2020-01-03   92  
69829470457344 arch/x86/platform/efi/efi_32.c Ard Biesheuvel            2020-01-03   93  efi_status_t __init efi_set_virtual_address_map(unsigned long memory_map_size,
69829470457344 arch/x86/platform/efi/efi_32.c Ard Biesheuvel            2020-01-03   94  						unsigned long descriptor_size,
69829470457344 arch/x86/platform/efi/efi_32.c Ard Biesheuvel            2020-01-03   95  						u32 descriptor_version,
59f2a619a2db86 arch/x86/platform/efi/efi_32.c Ard Biesheuvel            2020-01-21   96  						efi_memory_desc_t *virtual_map,
59f2a619a2db86 arch/x86/platform/efi/efi_32.c Ard Biesheuvel            2020-01-21   97  						unsigned long systab_phys)
^1da177e4c3f41 arch/i386/kernel/efi.c         Linus Torvalds            2005-04-16   98  {
59f2a619a2db86 arch/x86/platform/efi/efi_32.c Ard Biesheuvel            2020-01-21   99  	const efi_system_table_t *systab = (efi_system_table_t *)systab_phys;
6b68f01baa810e arch/x86/kernel/efi_32.c       Glauber de Oliveira Costa 2008-01-30  100  	struct desc_ptr gdt_descr;
69829470457344 arch/x86/platform/efi/efi_32.c Ard Biesheuvel            2020-01-03  101  	efi_status_t status;
69829470457344 arch/x86/platform/efi/efi_32.c Ard Biesheuvel            2020-01-03  102  	unsigned long flags;
744937b0b12a66 arch/x86/platform/efi/efi_32.c Ingo Molnar               2015-03-03  103  	pgd_t *save_pgd;
^1da177e4c3f41 arch/i386/kernel/efi.c         Linus Torvalds            2005-04-16  104  
744937b0b12a66 arch/x86/platform/efi/efi_32.c Ingo Molnar               2015-03-03  105  	/* Current pgd is swapper_pg_dir, we'll restore it later: */
744937b0b12a66 arch/x86/platform/efi/efi_32.c Ingo Molnar               2015-03-03  106  	save_pgd = swapper_pg_dir;
6d3e32e63f1fb4 arch/x86/platform/efi/efi_32.c Matt Fleming              2011-12-08  107  	load_cr3(initial_page_table);
8b2cb7a8f531d6 arch/x86/kernel/efi_32.c       Huang, Ying               2008-01-30  108  	__flush_tlb_all();
^1da177e4c3f41 arch/i386/kernel/efi.c         Linus Torvalds            2005-04-16  109  
3fa1cabbc3b612 arch/x86/platform/efi/efi_32.c Andy Lutomirski           2017-03-22  110  	gdt_descr.address = get_cpu_gdt_paddr(0);
4fbb5968810b23 arch/i386/kernel/efi.c         Rusty Russell             2007-05-02  111  	gdt_descr.size = GDT_SIZE - 1;
4fbb5968810b23 arch/i386/kernel/efi.c         Rusty Russell             2007-05-02  112  	load_gdt(&gdt_descr);
744937b0b12a66 arch/x86/platform/efi/efi_32.c Ingo Molnar               2015-03-03  113  
69829470457344 arch/x86/platform/efi/efi_32.c Ard Biesheuvel            2020-01-03  114  	/* Disable interrupts around EFI calls: */
69829470457344 arch/x86/platform/efi/efi_32.c Ard Biesheuvel            2020-01-03  115  	local_irq_save(flags);
59f2a619a2db86 arch/x86/platform/efi/efi_32.c Ard Biesheuvel            2020-01-21 @116  	status = efi_call_svam(&systab->runtime,
69829470457344 arch/x86/platform/efi/efi_32.c Ard Biesheuvel            2020-01-03  117  			       memory_map_size, descriptor_size,
59f2a619a2db86 arch/x86/platform/efi/efi_32.c Ard Biesheuvel            2020-01-21  118  			       descriptor_version, virtual_map,
59f2a619a2db86 arch/x86/platform/efi/efi_32.c Ard Biesheuvel            2020-01-21  119  			       __pa(&efi.runtime));
69829470457344 arch/x86/platform/efi/efi_32.c Ard Biesheuvel            2020-01-03  120  	local_irq_restore(flags);
^1da177e4c3f41 arch/i386/kernel/efi.c         Linus Torvalds            2005-04-16  121  
cf40361ede6cf9 arch/x86/platform/efi/efi_32.c Guenter Roeck             2018-09-11  122  	load_fixmap_gdt(0);
744937b0b12a66 arch/x86/platform/efi/efi_32.c Ingo Molnar               2015-03-03  123  	load_cr3(save_pgd);
8b2cb7a8f531d6 arch/x86/kernel/efi_32.c       Huang, Ying               2008-01-30  124  	__flush_tlb_all();
69829470457344 arch/x86/platform/efi/efi_32.c Ard Biesheuvel            2020-01-03  125  
69829470457344 arch/x86/platform/efi/efi_32.c Ard Biesheuvel            2020-01-03  126  	return status;
^1da177e4c3f41 arch/i386/kernel/efi.c         Linus Torvalds            2005-04-16  127  }
c55d016f7a930d arch/x86/platform/efi/efi_32.c Borislav Petkov           2014-02-14  128  

:::::: The code at line 116 was first introduced by commit
:::::: 59f2a619a2db86111e8bb30f349aebff6eb75baa efi: Add 'runtime' pointer to struct efi

:::::: TO: Ard Biesheuvel <ardb@kernel.org>
:::::: CC: Ard Biesheuvel <ardb@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

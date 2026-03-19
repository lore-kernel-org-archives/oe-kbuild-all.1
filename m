Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2F89351C1C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Mar 2026 04:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773896228; cv=none; b=qMp4U0Ee/3gOdEDP7NtpQcXEUQCgir3lkIktlJD9rtdLtNhUyArQGqs96tckgLMQdk0Xy8TzLYjx5Kcc4wbffvM7k1q1VGPe0bLtoc62eQaGNNlYJOPXp3yx67tq1m42RY8udEj0BLmN5J5NrNTMxg1RhE2TA9OrzPvSLhtj+UA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773896228; c=relaxed/simple;
	bh=3LUrJp6S0j8nkA8F/AJCOIXIb9pHTpFNQ4Pa3B9YCiM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BPHuC4hkH+qgAKuABR6cMcqeppZBCVv1GPkGhWcwcwpeOB/kRzLY/F0QHEH+zrfeG+1umt4gJj7J/Ju+f1mUsmwabh4pI+PgjMTHPCSKA5rXyp9Fzl2Kxu3dwIR934VMiQvbWcbsAjaGCUON9baZstb6Ck5XMC2r7VXi9ySRJLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I9lVbwxU; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I9lVbwxU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773896227; x=1805432227;
  h=date:from:to:cc:subject:message-id;
  bh=3LUrJp6S0j8nkA8F/AJCOIXIb9pHTpFNQ4Pa3B9YCiM=;
  b=I9lVbwxU4aTHXQVDFKeNb6R/5HhaQ5jAz8O6+s3nLHsMz5D+9wvVwjNa
   8wdv4k+/FvsC5oeRlbKc0czGtltRS/noF9k68iZFHBFTwONFLi5IFnUgg
   n7jnRTC53+S3j1PnWQFQalyWszTZ9nKrsOao6GZjBKWGGHoHEPnx2FDWS
   exrpPJGd7mXTBsxsGzvDwc0TR00jx2ahCqM3mAw7yvdRGHr3gIznZ2laS
   u8yGk4CtZbBYTeD3flKQGbgXzuylhORKK+iVfagzP6ngeytnFqjBy+ztY
   IxPVX5onQyBpx5qWPZF0lwvPc9v7ydb1v8293skaj+Mt02rvx+pfYHRFn
   Q==;
X-CSE-ConnectionGUID: u4DofdNASjekM9F96xzzkA==
X-CSE-MsgGUID: sEGzLyoeTyeaAnNVTC0WXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="92535225"
X-IronPort-AV: E=Sophos;i="6.23,128,1770624000"; 
   d="scan'208";a="92535225"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2026 21:57:06 -0700
X-CSE-ConnectionGUID: eM941FPzSwaCRXCRAWBz3g==
X-CSE-MsgGUID: evfISJKORf20o+yDu/du6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,128,1770624000"; 
   d="scan'208";a="223066864"
Received: from lkp-server02.sh.intel.com (HELO a51c2a36b9df) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 18 Mar 2026 21:57:04 -0700
Received: from kbuild by a51c2a36b9df with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w35RN-000000000Kn-3uSF;
	Thu, 19 Mar 2026 04:57:01 +0000
Date: Thu, 19 Mar 2026 12:56:41 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ardb:x86-efi-memmap-cleanup-v2 11/15]
 arch/x86/platform/efi/efi.c:745:46: warning: cast to pointer from integer of
 different size
Message-ID: <202603191232.uPKO9PDP-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-efi-memmap-cleanup-v2
head:   3b7057340d014e7e085826abbe5190abbeeaf64d
commit: 1cc1abd68f4c4ad5119c11f50e640b6e775480d6 [11/15] x86/efi: Update the runtime map in place
config: i386-buildonly-randconfig-003-20260319 (https://download.01.org/0day-ci/archive/20260319/202603191232.uPKO9PDP-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260319/202603191232.uPKO9PDP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603191232.uPKO9PDP-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/x86/platform/efi/efi.c: In function '__efi_enter_virtual_mode':
>> arch/x86/platform/efi/efi.c:745:46: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     745 |                                              (efi_memory_desc_t *)efi.memmap.phys_map,
         |                                              ^
   arch/x86/platform/efi/efi.c: In function 'efi_map_regions':
   arch/x86/platform/efi/efi.c:629:22: warning: 'md' is used uninitialized [-Wuninitialized]
     629 |         while ((md = efi_map_next_entry(md)))
         |                      ^~~~~~~~~~~~~~~~~~~~~~
   arch/x86/platform/efi/efi.c:625:28: note: 'md' was declared here
     625 |         efi_memory_desc_t *md;
         |                            ^~


vim +745 arch/x86/platform/efi/efi.c

   688	
   689	/*
   690	 * This function will switch the EFI runtime services to virtual mode.
   691	 * Essentially, we look through the EFI memmap and map every region that
   692	 * has the runtime attribute bit set in its memory descriptor into the
   693	 * efi_pgd page table.
   694	 *
   695	 * The new method does a pagetable switch in a preemption-safe manner
   696	 * so that we're in a different address space when calling a runtime
   697	 * function. For function arguments passing we do copy the PUDs of the
   698	 * kernel page table into efi_pgd prior to each call.
   699	 *
   700	 * Specially for kexec boot, efi runtime maps in previous kernel should
   701	 * be passed in via setup_data. In that case runtime ranges will be mapped
   702	 * to the same virtual addresses as the first kernel, see
   703	 * kexec_enter_virtual_mode().
   704	 */
   705	static void __init __efi_enter_virtual_mode(void)
   706	{
   707		efi_status_t status;
   708		unsigned long size;
   709	
   710		/*
   711		 * Unregister the early EFI memmap from efi_init() and install
   712		 * the new EFI memory map that we are about to pass to the
   713		 * firmware via SetVirtualAddressMap().
   714		 */
   715		efi_memmap_unmap();
   716	
   717		if (efi_alloc_page_tables()) {
   718			pr_err("Failed to allocate EFI page tables\n");
   719			goto err;
   720		}
   721	
   722		size = efi.memmap.desc_size * efi.memmap.num_valid_entries;
   723		if (efi_memmap_init_late(efi.memmap.phys_map, size)) {
   724			pr_err("Failed to remap late EFI memory map\n");
   725			goto err;
   726		}
   727	
   728		efi_merge_regions();
   729		efi_map_regions();
   730	
   731		if (efi_enabled(EFI_DBG)) {
   732			pr_info("EFI runtime memory map:\n");
   733			efi_print_memmap();
   734		}
   735	
   736		if (efi_setup_page_tables(efi.memmap.phys_map,
   737					  DIV_ROUND_UP(size, PAGE_SIZE)))
   738			goto err;
   739	
   740		efi_sync_low_kernel_mappings();
   741	
   742		status = efi_set_virtual_address_map(size,
   743						     efi.memmap.desc_size,
   744						     efi.memmap.desc_version,
 > 745						     (efi_memory_desc_t *)efi.memmap.phys_map,
   746						     efi_systab_phys);
   747		if (status != EFI_SUCCESS) {
   748			pr_err("Unable to switch EFI into virtual mode (status=%lx)!\n",
   749			       status);
   750			goto err;
   751		}
   752	
   753		efi_check_for_embedded_firmwares();
   754		efi_unmap_boot_services();
   755	
   756		if (!efi_is_mixed())
   757			efi_native_runtime_setup();
   758		else
   759			efi_thunk_runtime_setup();
   760	
   761		/*
   762		 * Apply more restrictive page table mapping attributes now that
   763		 * SVAM() has been called and the firmware has performed all
   764		 * necessary relocation fixups for the new virtual addresses.
   765		 */
   766		efi_runtime_update_mappings();
   767	
   768		/* clean DUMMY object */
   769		efi_delete_dummy_variable();
   770		return;
   771	
   772	err:
   773		clear_bit(EFI_RUNTIME_SERVICES, &efi.flags);
   774	}
   775	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

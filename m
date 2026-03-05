Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E9E11DE4EF
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Mar 2026 05:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772690106; cv=none; b=Jy8zTDL8hV8ixizrZme6QZyUJo8bFDyrU7civb4DsZtECCJ67YJJ0TmKvp08/Uizd49ffvn9ZvYSkpX34p/Fr+/2u2NpOVOt6kKJNrhcEdMP9bKJcUjbRCYKHUPXiU/s5CW9xwq8b9hQRw8k5dJzw4fc9zDM5e6IRmH4PJQniqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772690106; c=relaxed/simple;
	bh=95p2n3O5kSb2aMAswbFGdaKdEMDNQm2vXIjp6OuT2tg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NuS/d3DX+VO8Zg8R72Dd6kAyjdEdDeJj94aH816Sc8IaoE8Sw2p0Mneui8aMi0NGneqMHlTCQ87Cgdzfc6rJfvBhDRbnXXXzF3GgjKsFGMrXaMH3Khq7mxn9tVm38yXtanuQU1iuN/JHSVB7ta7k+UBgQ83r07BD0DwXmnc9yCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XstaRAQi; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XstaRAQi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772690104; x=1804226104;
  h=date:from:to:cc:subject:message-id;
  bh=95p2n3O5kSb2aMAswbFGdaKdEMDNQm2vXIjp6OuT2tg=;
  b=XstaRAQijgcQ7peksGrR0BmUqOWy0n4CgbWWquxPcY9tzimSjP1Ejkaj
   JZY4yxZTvPyplyiMue3UqhHI4F1WuwF4zBR6bjrt/+7SkFQ6CNJsV2j56
   AAngKzgky6yG+mSjrTGAC19Yiq5W64sZnydQ35IcGC/tkXs7sayIk+hSo
   8uV2ODZk7KpbF7PHHULPHv6BjF5BZJc70lOAM0sm7ZCZWUm2lx12f82qW
   l5H2FEVy6DNlgJGZaj0uevPZ62RG94PY8qDzw34171u+l2yfopjpAZbXE
   rhVhmeGMFDyI1yt1Awiu8R0ES1JYnrDRvOVdwtjkhVl9aHVDM1+ciV4pb
   g==;
X-CSE-ConnectionGUID: PqmoGkArQC6F0TgQ2+ClSw==
X-CSE-MsgGUID: wzZrCFAsSNaSFvB5uyDnHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="85115181"
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; 
   d="scan'208";a="85115181"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 21:55:03 -0800
X-CSE-ConnectionGUID: SZWGlLa4TpKy/9NNOxnv0g==
X-CSE-MsgGUID: SbrDBOBvQnubaUsAqrf/Jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; 
   d="scan'208";a="218574992"
Received: from lkp-server01.sh.intel.com (HELO cadc4577a874) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 04 Mar 2026 21:55:02 -0800
Received: from kbuild by cadc4577a874 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vy1fn-00000000017-0dys;
	Thu, 05 Mar 2026 05:54:59 +0000
Date: Thu, 05 Mar 2026 13:51:18 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:upstream-linux-5.10.y 0/334]
 drivers/firmware/efi/mokvar-table.c:107:23: warning: unused variable 'size'
Message-ID: <202603051304.d2z4Y4M7-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common upstream-linux-5.10.y
head:   aed5c3b77cd53ba74f66767b03bfb9177662af4b
commit: 46c0454ffb78ce9d3355a3cccac86383ea8ddd55 [0/334] efi: Don't map the entire mokvar table to determine its size
config: i386-randconfig-017-20260305 (https://download.01.org/0day-ci/archive/20260305/202603051304.d2z4Y4M7-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260305/202603051304.d2z4Y4M7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603051304.d2z4Y4M7-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/firmware/efi/mokvar-table.c: In function 'efi_mokvar_table_init':
>> drivers/firmware/efi/mokvar-table.c:107:23: warning: unused variable 'size' [-Wunused-variable]
     107 |         unsigned long size;
         |                       ^~~~


vim +/size +107 drivers/firmware/efi/mokvar-table.c

58c909022a5a56 Lenny Szubowicz 2020-09-04   79  
58c909022a5a56 Lenny Szubowicz 2020-09-04   80  /*
58c909022a5a56 Lenny Szubowicz 2020-09-04   81   * efi_mokvar_table_init() - Early boot validation of EFI MOK config table
58c909022a5a56 Lenny Szubowicz 2020-09-04   82   *
58c909022a5a56 Lenny Szubowicz 2020-09-04   83   * If present, validate and compute the size of the EFI MOK variable
58c909022a5a56 Lenny Szubowicz 2020-09-04   84   * configuration table. This table may be provided by an EFI boot loader
58c909022a5a56 Lenny Szubowicz 2020-09-04   85   * as an alternative to ordinary EFI variables, due to platform-dependent
58c909022a5a56 Lenny Szubowicz 2020-09-04   86   * limitations. The memory occupied by this table is marked as reserved.
58c909022a5a56 Lenny Szubowicz 2020-09-04   87   *
58c909022a5a56 Lenny Szubowicz 2020-09-04   88   * This routine must be called before efi_free_boot_services() in order
58c909022a5a56 Lenny Szubowicz 2020-09-04   89   * to guarantee that it can mark the table as reserved.
58c909022a5a56 Lenny Szubowicz 2020-09-04   90   *
58c909022a5a56 Lenny Szubowicz 2020-09-04   91   * Implicit inputs:
58c909022a5a56 Lenny Szubowicz 2020-09-04   92   * efi.mokvar_table:	Physical address of EFI MOK variable config table
58c909022a5a56 Lenny Szubowicz 2020-09-04   93   *			or special value that indicates no such table.
58c909022a5a56 Lenny Szubowicz 2020-09-04   94   *
58c909022a5a56 Lenny Szubowicz 2020-09-04   95   * Implicit outputs:
58c909022a5a56 Lenny Szubowicz 2020-09-04   96   * efi_mokvar_table_size: Computed size of EFI MOK variable config table.
58c909022a5a56 Lenny Szubowicz 2020-09-04   97   *			The table is considered present and valid if this
58c909022a5a56 Lenny Szubowicz 2020-09-04   98   *			is non-zero.
58c909022a5a56 Lenny Szubowicz 2020-09-04   99   */
58c909022a5a56 Lenny Szubowicz 2020-09-04  100  void __init efi_mokvar_table_init(void)
58c909022a5a56 Lenny Szubowicz 2020-09-04  101  {
58c909022a5a56 Lenny Szubowicz 2020-09-04  102  	efi_memory_desc_t md;
58c909022a5a56 Lenny Szubowicz 2020-09-04  103  	void *va = NULL;
b89114cd018cff Ard Biesheuvel  2020-09-24  104  	unsigned long cur_offset = 0;
b89114cd018cff Ard Biesheuvel  2020-09-24  105  	unsigned long offset_limit;
b89114cd018cff Ard Biesheuvel  2020-09-24  106  	unsigned long map_size_needed = 0;
b89114cd018cff Ard Biesheuvel  2020-09-24 @107  	unsigned long size;
58c909022a5a56 Lenny Szubowicz 2020-09-04  108  	struct efi_mokvar_table_entry *mokvar_entry;
b89114cd018cff Ard Biesheuvel  2020-09-24  109  	int err;
58c909022a5a56 Lenny Szubowicz 2020-09-04  110  
58c909022a5a56 Lenny Szubowicz 2020-09-04  111  	if (!efi_enabled(EFI_MEMMAP))
58c909022a5a56 Lenny Szubowicz 2020-09-04  112  		return;
58c909022a5a56 Lenny Szubowicz 2020-09-04  113  
58c909022a5a56 Lenny Szubowicz 2020-09-04  114  	if (efi.mokvar_table == EFI_INVALID_TABLE_ADDR)
58c909022a5a56 Lenny Szubowicz 2020-09-04  115  		return;
58c909022a5a56 Lenny Szubowicz 2020-09-04  116  	/*
58c909022a5a56 Lenny Szubowicz 2020-09-04  117  	 * The EFI MOK config table must fit within a single EFI memory
58c909022a5a56 Lenny Szubowicz 2020-09-04  118  	 * descriptor range.
58c909022a5a56 Lenny Szubowicz 2020-09-04  119  	 */
58c909022a5a56 Lenny Szubowicz 2020-09-04  120  	err = efi_mem_desc_lookup(efi.mokvar_table, &md);
58c909022a5a56 Lenny Szubowicz 2020-09-04  121  	if (err) {
58c909022a5a56 Lenny Szubowicz 2020-09-04  122  		pr_warn("EFI MOKvar config table is not within the EFI memory map\n");
58c909022a5a56 Lenny Szubowicz 2020-09-04  123  		return;
58c909022a5a56 Lenny Szubowicz 2020-09-04  124  	}
b89114cd018cff Ard Biesheuvel  2020-09-24  125  
b89114cd018cff Ard Biesheuvel  2020-09-24  126  	offset_limit = efi_mem_desc_end(&md) - efi.mokvar_table;
b89114cd018cff Ard Biesheuvel  2020-09-24  127  
58c909022a5a56 Lenny Szubowicz 2020-09-04  128  	/*
58c909022a5a56 Lenny Szubowicz 2020-09-04  129  	 * Validate the MOK config table. Since there is no table header
58c909022a5a56 Lenny Szubowicz 2020-09-04  130  	 * from which we could get the total size of the MOK config table,
58c909022a5a56 Lenny Szubowicz 2020-09-04  131  	 * we compute the total size as we validate each variably sized
58c909022a5a56 Lenny Szubowicz 2020-09-04  132  	 * entry, remapping as necessary.
58c909022a5a56 Lenny Szubowicz 2020-09-04  133  	 */
b89114cd018cff Ard Biesheuvel  2020-09-24  134  	err = -EINVAL;
58c909022a5a56 Lenny Szubowicz 2020-09-04  135  	while (cur_offset + sizeof(*mokvar_entry) <= offset_limit) {
58c909022a5a56 Lenny Szubowicz 2020-09-04  136  		if (va)
46c0454ffb78ce Peter Jones     2025-02-26  137  			early_memunmap(va, sizeof(*mokvar_entry));
46c0454ffb78ce Peter Jones     2025-02-26  138  		va = early_memremap(efi.mokvar_table + cur_offset, sizeof(*mokvar_entry));
58c909022a5a56 Lenny Szubowicz 2020-09-04  139  		if (!va) {
46c0454ffb78ce Peter Jones     2025-02-26  140  			pr_err("Failed to map EFI MOKvar config table pa=0x%lx, size=%zu.\n",
46c0454ffb78ce Peter Jones     2025-02-26  141  			       efi.mokvar_table + cur_offset, sizeof(*mokvar_entry));
58c909022a5a56 Lenny Szubowicz 2020-09-04  142  			return;
58c909022a5a56 Lenny Szubowicz 2020-09-04  143  		}
46c0454ffb78ce Peter Jones     2025-02-26  144  		mokvar_entry = va;
58c909022a5a56 Lenny Szubowicz 2020-09-04  145  
58c909022a5a56 Lenny Szubowicz 2020-09-04  146  		/* Check for last sentinel entry */
58c909022a5a56 Lenny Szubowicz 2020-09-04  147  		if (mokvar_entry->name[0] == '\0') {
58c909022a5a56 Lenny Szubowicz 2020-09-04  148  			if (mokvar_entry->data_size != 0)
58c909022a5a56 Lenny Szubowicz 2020-09-04  149  				break;
58c909022a5a56 Lenny Szubowicz 2020-09-04  150  			err = 0;
46c0454ffb78ce Peter Jones     2025-02-26  151  			map_size_needed = cur_offset + sizeof(*mokvar_entry);
58c909022a5a56 Lenny Szubowicz 2020-09-04  152  			break;
58c909022a5a56 Lenny Szubowicz 2020-09-04  153  		}
58c909022a5a56 Lenny Szubowicz 2020-09-04  154  
46c0454ffb78ce Peter Jones     2025-02-26  155  		/* Enforce that the name is NUL terminated */
46c0454ffb78ce Peter Jones     2025-02-26  156  		mokvar_entry->name[sizeof(mokvar_entry->name) - 1] = '\0';
58c909022a5a56 Lenny Szubowicz 2020-09-04  157  
58c909022a5a56 Lenny Szubowicz 2020-09-04  158  		/* Advance to the next entry */
46c0454ffb78ce Peter Jones     2025-02-26  159  		cur_offset += sizeof(*mokvar_entry) + mokvar_entry->data_size;
58c909022a5a56 Lenny Szubowicz 2020-09-04  160  	}
58c909022a5a56 Lenny Szubowicz 2020-09-04  161  
58c909022a5a56 Lenny Szubowicz 2020-09-04  162  	if (va)
46c0454ffb78ce Peter Jones     2025-02-26  163  		early_memunmap(va, sizeof(*mokvar_entry));
58c909022a5a56 Lenny Szubowicz 2020-09-04  164  	if (err) {
58c909022a5a56 Lenny Szubowicz 2020-09-04  165  		pr_err("EFI MOKvar config table is not valid\n");
58c909022a5a56 Lenny Szubowicz 2020-09-04  166  		return;
58c909022a5a56 Lenny Szubowicz 2020-09-04  167  	}
06a9092f6647e1 Borislav Petkov 2021-07-20  168  
06a9092f6647e1 Borislav Petkov 2021-07-20  169  	if (md.type == EFI_BOOT_SERVICES_DATA)
58c909022a5a56 Lenny Szubowicz 2020-09-04  170  		efi_mem_reserve(efi.mokvar_table, map_size_needed);
06a9092f6647e1 Borislav Petkov 2021-07-20  171  
58c909022a5a56 Lenny Szubowicz 2020-09-04  172  	efi_mokvar_table_size = map_size_needed;
58c909022a5a56 Lenny Szubowicz 2020-09-04  173  }
58c909022a5a56 Lenny Szubowicz 2020-09-04  174  

:::::: The code at line 107 was first introduced by commit
:::::: b89114cd018cffa5deb7def1844ce1891efd4f96 efi: mokvar-table: fix some issues in new code

:::::: TO: Ard Biesheuvel <ardb@kernel.org>
:::::: CC: Ard Biesheuvel <ardb@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

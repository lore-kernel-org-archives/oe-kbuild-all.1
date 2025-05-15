Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F6ED258CF0
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 May 2025 17:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747331109; cv=none; b=P88BYYm7fj7fugEafcczU8nbjQjS+d58IZRXdfho18UKI+JWxsvXOkjJY1PjL6wgcyIRE38ODYFQnQ6AEPDfInHo+EG8N3QhqHI6TIM6eliznq4lN9JuocV6dSfRQ1dQTcYS5Wo2mPr5iDtq5ThTLDAQTnAVqaKqRD4NPrRfHG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747331109; c=relaxed/simple;
	bh=87/V3FwJ+djUhO/Slwepfw6jLXY5w4FR6NL/kFWvKx8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aR0fLa0OEwQxSTB1+UWXFo+BYxLQ/yHOYXpI38MNyOlZfZ4IbFURkU5eWozMGZ5Mg+7mRdJOwNTUHUFvRcUIJ4Kc+0uf4iVOJzVNN8hz+GybyYtDTSLo8i465IpNByvhf2ISJbwTnZNBqHmHoKofe8pWwg3CKSJpDC0Q1BkR/oI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jZko1GAw; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jZko1GAw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747331107; x=1778867107;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=87/V3FwJ+djUhO/Slwepfw6jLXY5w4FR6NL/kFWvKx8=;
  b=jZko1GAwWLKOwttRFQ+XC9pLhMs/2Fl1S1G3ADocsdQCj5Z9zTYXmzHZ
   JtUd1oVlBvd2tjP3Iws2KLss5sMcGFUz+oxZIOSYJzJxT0coK39ZNXrPE
   +MSLR5sFD05NRg+ZWuYAp3ammeB250/T14o0LPwX4fvaoL8EstMrUx+18
   I1cWp2ChIIWQUdUT2Wz1VHd1p4av5OLplgyLPgQXXcAkW6CiwbKlS2iZg
   Bw4pXqJkjEkKCcZM/tDTlsrFhyb+Ghqb02zC6ar5MWF1Gs7nwsP1pXEsI
   5DqthGkyydo607QUpFoWPdh3YNj9klAgdcQ5n0jK23uKNs87KlxborN72
   A==;
X-CSE-ConnectionGUID: 4Bo7ifAzSR+scIy14Zjs5g==
X-CSE-MsgGUID: tbET7XvBS4iZ0YmA4MNqvw==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="51921050"
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; 
   d="scan'208";a="51921050"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 10:45:06 -0700
X-CSE-ConnectionGUID: 4/4EmEIESSiKfoFi/cgrkA==
X-CSE-MsgGUID: N385b2/8S3icBH9L3PZHuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; 
   d="scan'208";a="138178080"
Received: from igk-lkp-server01.igk.intel.com (HELO a1decbf9c5f9) ([10.211.3.150])
  by orviesa009.jf.intel.com with ESMTP; 15 May 2025 10:45:05 -0700
Received: from kbuild by a1decbf9c5f9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uFcdi-0000Hv-0a;
	Thu, 15 May 2025 17:45:02 +0000
Date: Fri, 16 May 2025 01:44:12 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2229/2229] arch/x86/kernel/csv-shared.c:130:13:
 warning: no previous prototype for function 'csv3_scan_secure_call_pages'
Message-ID: <202505160152.NN3T3Zfg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   baf4f02470215e4f896899f495ff7ac7fbfda979
commit: ce19f23605e1ab1ab99b4caefdcd1d07dd3dc329 [2229/2229] x86/kernel: Add CSV3 early update(enc/dec)/reset memory helpers
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250516/202505160152.NN3T3Zfg-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.73.0 (cc66ad468 2023-10-03)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250516/202505160152.NN3T3Zfg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505160152.NN3T3Zfg-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/x86/kernel/csv.c:15:
>> arch/x86/kernel/csv-shared.c:130:13: warning: no previous prototype for function 'csv3_scan_secure_call_pages' [-Wmissing-prototypes]
     130 | void __init csv3_scan_secure_call_pages(struct boot_params *boot_params)
         |             ^
   arch/x86/kernel/csv-shared.c:130:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     130 | void __init csv3_scan_secure_call_pages(struct boot_params *boot_params)
         | ^
         | static 
>> arch/x86/kernel/csv-shared.c:177:13: warning: no previous prototype for function 'csv3_early_secure_call_ident_map' [-Wmissing-prototypes]
     177 | void __init csv3_early_secure_call_ident_map(u64 base_address, u64 num_pages,
         |             ^
   arch/x86/kernel/csv-shared.c:177:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     177 | void __init csv3_early_secure_call_ident_map(u64 base_address, u64 num_pages,
         | ^
         | static 
   2 warnings generated.


vim +/csv3_scan_secure_call_pages +130 arch/x86/kernel/csv-shared.c

d2600299dc44d3 Xin Jiang 2024-03-11  122  
d2600299dc44d3 Xin Jiang 2024-03-11  123  /**
d2600299dc44d3 Xin Jiang 2024-03-11  124   * csv3_scan_secure_call_pages - try to find the secure call pages.
d2600299dc44d3 Xin Jiang 2024-03-11  125   * @boot_params:	boot parameters where e820_table resides.
d2600299dc44d3 Xin Jiang 2024-03-11  126   *
d2600299dc44d3 Xin Jiang 2024-03-11  127   * The secure call pages are reserved by BIOS. We scan all the reserved pages
d2600299dc44d3 Xin Jiang 2024-03-11  128   * to check the CSV3 secure call guid bytes.
d2600299dc44d3 Xin Jiang 2024-03-11  129   */
d2600299dc44d3 Xin Jiang 2024-03-11 @130  void __init csv3_scan_secure_call_pages(struct boot_params *boot_params)
d2600299dc44d3 Xin Jiang 2024-03-11  131  {
d2600299dc44d3 Xin Jiang 2024-03-11  132  	struct boot_e820_entry *entry;
d2600299dc44d3 Xin Jiang 2024-03-11  133  	struct csv3_secure_call_cmd *sc_page;
d2600299dc44d3 Xin Jiang 2024-03-11  134  	u64 offset;
d2600299dc44d3 Xin Jiang 2024-03-11  135  	u64 addr;
d2600299dc44d3 Xin Jiang 2024-03-11  136  	u8 i;
d2600299dc44d3 Xin Jiang 2024-03-11  137  	u8 table_num;
d2600299dc44d3 Xin Jiang 2024-03-11  138  	int count = 0;
d2600299dc44d3 Xin Jiang 2024-03-11  139  
d2600299dc44d3 Xin Jiang 2024-03-11  140  	if (!boot_params)
d2600299dc44d3 Xin Jiang 2024-03-11  141  		return;
d2600299dc44d3 Xin Jiang 2024-03-11  142  
d2600299dc44d3 Xin Jiang 2024-03-11  143  	if (csv3_boot_sc_page_a != -1ul && csv3_boot_sc_page_b != -1ul)
d2600299dc44d3 Xin Jiang 2024-03-11  144  		return;
d2600299dc44d3 Xin Jiang 2024-03-11  145  
d2600299dc44d3 Xin Jiang 2024-03-11  146  	table_num = min_t(u8, boot_params->e820_entries,
d2600299dc44d3 Xin Jiang 2024-03-11  147  			  E820_MAX_ENTRIES_ZEROPAGE);
d2600299dc44d3 Xin Jiang 2024-03-11  148  	entry = &boot_params->e820_table[0];
d2600299dc44d3 Xin Jiang 2024-03-11  149  	for (i = 0; i < table_num; i++) {
d2600299dc44d3 Xin Jiang 2024-03-11  150  		if (entry[i].type != E820_TYPE_RESERVED)
d2600299dc44d3 Xin Jiang 2024-03-11  151  			continue;
d2600299dc44d3 Xin Jiang 2024-03-11  152  
d2600299dc44d3 Xin Jiang 2024-03-11  153  		addr = entry[i].addr & PAGE_MASK;
d2600299dc44d3 Xin Jiang 2024-03-11  154  		for (offset = 0; offset < entry[i].size; offset += PAGE_SIZE) {
d2600299dc44d3 Xin Jiang 2024-03-11  155  			sc_page = (void *)(addr + offset);
d2600299dc44d3 Xin Jiang 2024-03-11  156  			if (sc_page->guid_64[0] == CSV3_SECURE_CALL_GUID_LOW &&
d2600299dc44d3 Xin Jiang 2024-03-11  157  			    sc_page->guid_64[1] == CSV3_SECURE_CALL_GUID_HIGH) {
d2600299dc44d3 Xin Jiang 2024-03-11  158  				if (count == 0)
d2600299dc44d3 Xin Jiang 2024-03-11  159  					csv3_boot_sc_page_a = addr + offset;
d2600299dc44d3 Xin Jiang 2024-03-11  160  				else if (count == 1)
d2600299dc44d3 Xin Jiang 2024-03-11  161  					csv3_boot_sc_page_b = addr + offset;
d2600299dc44d3 Xin Jiang 2024-03-11  162  				count++;
d2600299dc44d3 Xin Jiang 2024-03-11  163  			}
d2600299dc44d3 Xin Jiang 2024-03-11  164  			if (count >= 2)
d2600299dc44d3 Xin Jiang 2024-03-11  165  				return;
d2600299dc44d3 Xin Jiang 2024-03-11  166  		}
d2600299dc44d3 Xin Jiang 2024-03-11  167  	}
d2600299dc44d3 Xin Jiang 2024-03-11  168  }
d2600299dc44d3 Xin Jiang 2024-03-11  169  
d2600299dc44d3 Xin Jiang 2024-03-11  170  /**
d2600299dc44d3 Xin Jiang 2024-03-11  171   * csv3_early_secure_call_ident_map - issue early secure call command at the
d2600299dc44d3 Xin Jiang 2024-03-11  172   *			stage where identity page table is created.
d2600299dc44d3 Xin Jiang 2024-03-11  173   * @base_address:	Start address of the specified memory range.
d2600299dc44d3 Xin Jiang 2024-03-11  174   * @num_pages:		number of the specific pages.
d2600299dc44d3 Xin Jiang 2024-03-11  175   * @cmd_type:		Secure call cmd type.
d2600299dc44d3 Xin Jiang 2024-03-11  176   */
d2600299dc44d3 Xin Jiang 2024-03-11 @177  void __init csv3_early_secure_call_ident_map(u64 base_address, u64 num_pages,

:::::: The code at line 130 was first introduced by commit
:::::: d2600299dc44d38ae1c69b2c0d5a0259c577290f x86/boot/compressed/64: Init CSV3 secure call pages

:::::: TO: Xin Jiang <jiangxin@hygon.cn>
:::::: CC: hanliyang <hanliyang@hygon.cn>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

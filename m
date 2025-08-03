Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CE9EFC0A
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 Aug 2025 07:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754207611; cv=none; b=cF6n/o7HVsOwtHEczB+8S4K6+0qEFRZP74fgG/hVyFB5Ss/W1Ga96RD4ensUgIRmHq5QGvBmjxsaBBu6wF8/QiNlf83JVMbWIH72I1h2AkTzEF3ycOtCKWux2G0kgPoP83iRyV4wvaZYewyDp0jTbiBfGsWYYWbiMbDBiRqAsQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754207611; c=relaxed/simple;
	bh=xybeaZhm6m8w1Ox70MaZ/ndaJ3uigd/XvimYgHC6jyU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NKsqLNQFUTF1E8xR+HtLw1aIeIsYK5jpP4vQ/Gjhh+cMH6z5/238my04yYT89hLuChTqBCd0rkQ7URQoI1G7K+YK8fqNjEIeg1Aboon9EaiW3SxIcGwDW+xcDUZ4tGEPWDsASJv0whEsz5+dwnzHvtANEMvwld2rfF0JTVo8bRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I7wSyV66; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I7wSyV66"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754207609; x=1785743609;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xybeaZhm6m8w1Ox70MaZ/ndaJ3uigd/XvimYgHC6jyU=;
  b=I7wSyV66wTdi4wRDMmfAHPg+q3y12pVrUQ5jB4MLA9ymk/kVSrV40x9K
   k5dh8GVM70SNBWVZ8vWmneYTa2WkUWZNAR9aFNGQrMdD8BcKsl7S8dp4E
   ZtQhE94q9OjDYRFKXZw6oxpdBAlpICwAtmeHWNcSyDonCQbHS/1YhM0lX
   YMk26960rETwesXo41mRGCB0waszgw0TGcPxGNMhRsVxL8+R3wkMRYTQM
   5TAvDgyJyaAFie4lBHmZQwrWranxRozNyRw6FhYWYoFDhKoo0InD8VQZ/
   fiXA5E0gKSh+ToTlPzB533i28cDuHX6BWgBWFOQQvrK+w7m3jFZXLgVM+
   A==;
X-CSE-ConnectionGUID: gOFR9CeqTsiHt8uGygtiiQ==
X-CSE-MsgGUID: 869MmjvGTZuH77KFEvV0EA==
X-IronPort-AV: E=McAfee;i="6800,10657,11510"; a="66770427"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="66770427"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2025 00:53:29 -0700
X-CSE-ConnectionGUID: b4HZTO9aTyeVmNXucon0AQ==
X-CSE-MsgGUID: A4meudp3QiS6c+7hwyNHdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="201079845"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by orviesa001.jf.intel.com with ESMTP; 03 Aug 2025 00:53:27 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uiTX3-0001aB-0d;
	Sun, 03 Aug 2025 07:53:25 +0000
Date: Sun, 3 Aug 2025 09:52:35 +0200
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2632/2632] arch/x86/kernel/csv-shared.c:130:13:
 warning: no previous prototype for 'csv3_scan_secure_call_pages'
Message-ID: <202508030921.Ls10WsBh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   e5f0407c7ee0aba1c7b2ab0f516e9dfb707a0ee2
commit: ce19f23605e1ab1ab99b4caefdcd1d07dd3dc329 [2632/2632] x86/kernel: Add CSV3 early update(enc/dec)/reset memory helpers
config: x86_64-buildonly-randconfig-2001-20250803 (https://download.01.org/0day-ci/archive/20250803/202508030921.Ls10WsBh-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250803/202508030921.Ls10WsBh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508030921.Ls10WsBh-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/x86/kernel/csv.c:15:
>> arch/x86/kernel/csv-shared.c:130:13: warning: no previous prototype for 'csv3_scan_secure_call_pages' [-Wmissing-prototypes]
     130 | void __init csv3_scan_secure_call_pages(struct boot_params *boot_params)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/x86/kernel/csv-shared.c:177:13: warning: no previous prototype for 'csv3_early_secure_call_ident_map' [-Wmissing-prototypes]
     177 | void __init csv3_early_secure_call_ident_map(u64 base_address, u64 num_pages,
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


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

Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C472A85C59
	for <oe-kbuild-all@lists.linux.dev>; Wed, 15 May 2024 13:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715780270; cv=none; b=ToD7+lvp29w3SF4AdYI1MmYUh8By+15WDOivvsyhMNJFAmZscn5ZEwWvB3BAkwowNPRJx1NaxVHlLwkGuPFhyOGVsHqRmOZ5VqX0XN8Co5lq4LjEoaI5HevUUTPOye9m9/b6eeq9ols86rny6LKOncTcic4Qc3RXCtS+FhIQ2PU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715780270; c=relaxed/simple;
	bh=OIFo13MqwBA7vYfsW5tSFCG394HQVOds0dSznRBBTFY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=azePiBJ2RZCnwd0GF9DzO3T5tlcY5qvhWq4KLWdzHyrJtwNv7eCpudIB3BTBIMGtirF8IaBwmOQ0pKvC9BMmFAglnsUUxbGSsonbX4cBKpi10O1MipMUbkByySptAYGTwR/wVMjn9gQy6atqJHCGV0jVqH22eUcqDKAg7kk+AQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dB2D8zjA; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dB2D8zjA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715780268; x=1747316268;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OIFo13MqwBA7vYfsW5tSFCG394HQVOds0dSznRBBTFY=;
  b=dB2D8zjAfXf0mBQ6OqQVDaLqerGy5wgXl6G/TxGy3BLsFi3umujTaGO7
   EIjosrsnypmFMy39Y/mIfRnArEyLg0EQHlFMNjbr3563Jq0G8MVxd5leD
   4vSDTD0na94xxMLSYXhRsPNdR5jJGZP2UVt7TEeqAkyBnrHo/Xrlr6A3h
   qxMp4qbx89IQhcCaBgrx4tVGRPhtu7Y+TpGOgB+y2iprTD+ZFMqt+BAHG
   pHRvkUeNabbyHZS1Yh6008VBP1iTHkxuO7NSlE9zkN64/sblvqMbBbc5L
   0Wh5M2ruuFncfIu5GajsY8IIhiuq0y3o929PAZFf6FrNaVqbwfQADtZc7
   g==;
X-CSE-ConnectionGUID: qxMe8zN9QbqUlr1RApf4mg==
X-CSE-MsgGUID: y/L7qUN2SPmWhroySMdwtA==
X-IronPort-AV: E=McAfee;i="6600,9927,11073"; a="14776473"
X-IronPort-AV: E=Sophos;i="6.08,161,1712646000"; 
   d="scan'208";a="14776473"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2024 06:37:47 -0700
X-CSE-ConnectionGUID: hsDvcqgeTSquV/MWMhniRg==
X-CSE-MsgGUID: 9OhuCB/XRuKBuIwEiWbvSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,161,1712646000"; 
   d="scan'208";a="35941554"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 15 May 2024 06:37:43 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s7EpB-000Crt-1B;
	Wed, 15 May 2024 13:37:41 +0000
Date: Wed, 15 May 2024 21:37:12 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 6613/6620] arch/x86/kernel/csv-shared.c:130:13:
 warning: no previous prototype for 'csv3_scan_secure_call_pages'
Message-ID: <202405152116.GXE4qF7Y-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   24bcde27d3b11d99cdceaa28d2ba6213e1678e90
commit: edd662ef105a5ac2660cf545e73cf202894beb0c [6613/6620] x86/kernel: Add CSV3 early update(enc/dec)/reset memory helpers
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240515/202405152116.GXE4qF7Y-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240515/202405152116.GXE4qF7Y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405152116.GXE4qF7Y-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/x86/kernel/csv.c:15:
>> arch/x86/kernel/csv-shared.c:130:13: warning: no previous prototype for 'csv3_scan_secure_call_pages' [-Wmissing-prototypes]
     130 | void __init csv3_scan_secure_call_pages(struct boot_params *boot_params)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/x86/kernel/csv-shared.c:177:13: warning: no previous prototype for 'csv3_early_secure_call_ident_map' [-Wmissing-prototypes]
     177 | void __init csv3_early_secure_call_ident_map(u64 base_address, u64 num_pages,
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/csv3_scan_secure_call_pages +130 arch/x86/kernel/csv-shared.c

9b3c8f4f8afc9e Xin Jiang 2024-03-11  122  
9b3c8f4f8afc9e Xin Jiang 2024-03-11  123  /**
9b3c8f4f8afc9e Xin Jiang 2024-03-11  124   * csv3_scan_secure_call_pages - try to find the secure call pages.
9b3c8f4f8afc9e Xin Jiang 2024-03-11  125   * @boot_params:	boot parameters where e820_table resides.
9b3c8f4f8afc9e Xin Jiang 2024-03-11  126   *
9b3c8f4f8afc9e Xin Jiang 2024-03-11  127   * The secure call pages are reserved by BIOS. We scan all the reserved pages
9b3c8f4f8afc9e Xin Jiang 2024-03-11  128   * to check the CSV3 secure call guid bytes.
9b3c8f4f8afc9e Xin Jiang 2024-03-11  129   */
9b3c8f4f8afc9e Xin Jiang 2024-03-11 @130  void __init csv3_scan_secure_call_pages(struct boot_params *boot_params)
9b3c8f4f8afc9e Xin Jiang 2024-03-11  131  {
9b3c8f4f8afc9e Xin Jiang 2024-03-11  132  	struct boot_e820_entry *entry;
9b3c8f4f8afc9e Xin Jiang 2024-03-11  133  	struct csv3_secure_call_cmd *sc_page;
9b3c8f4f8afc9e Xin Jiang 2024-03-11  134  	u64 offset;
9b3c8f4f8afc9e Xin Jiang 2024-03-11  135  	u64 addr;
9b3c8f4f8afc9e Xin Jiang 2024-03-11  136  	u8 i;
9b3c8f4f8afc9e Xin Jiang 2024-03-11  137  	u8 table_num;
9b3c8f4f8afc9e Xin Jiang 2024-03-11  138  	int count = 0;
9b3c8f4f8afc9e Xin Jiang 2024-03-11  139  
9b3c8f4f8afc9e Xin Jiang 2024-03-11  140  	if (!boot_params)
9b3c8f4f8afc9e Xin Jiang 2024-03-11  141  		return;
9b3c8f4f8afc9e Xin Jiang 2024-03-11  142  
9b3c8f4f8afc9e Xin Jiang 2024-03-11  143  	if (csv3_boot_sc_page_a != -1ul && csv3_boot_sc_page_b != -1ul)
9b3c8f4f8afc9e Xin Jiang 2024-03-11  144  		return;
9b3c8f4f8afc9e Xin Jiang 2024-03-11  145  
9b3c8f4f8afc9e Xin Jiang 2024-03-11  146  	table_num = min_t(u8, boot_params->e820_entries,
9b3c8f4f8afc9e Xin Jiang 2024-03-11  147  			  E820_MAX_ENTRIES_ZEROPAGE);
9b3c8f4f8afc9e Xin Jiang 2024-03-11  148  	entry = &boot_params->e820_table[0];
9b3c8f4f8afc9e Xin Jiang 2024-03-11  149  	for (i = 0; i < table_num; i++) {
9b3c8f4f8afc9e Xin Jiang 2024-03-11  150  		if (entry[i].type != E820_TYPE_RESERVED)
9b3c8f4f8afc9e Xin Jiang 2024-03-11  151  			continue;
9b3c8f4f8afc9e Xin Jiang 2024-03-11  152  
9b3c8f4f8afc9e Xin Jiang 2024-03-11  153  		addr = entry[i].addr & PAGE_MASK;
9b3c8f4f8afc9e Xin Jiang 2024-03-11  154  		for (offset = 0; offset < entry[i].size; offset += PAGE_SIZE) {
9b3c8f4f8afc9e Xin Jiang 2024-03-11  155  			sc_page = (void *)(addr + offset);
9b3c8f4f8afc9e Xin Jiang 2024-03-11  156  			if (sc_page->guid_64[0] == CSV3_SECURE_CALL_GUID_LOW &&
9b3c8f4f8afc9e Xin Jiang 2024-03-11  157  			    sc_page->guid_64[1] == CSV3_SECURE_CALL_GUID_HIGH) {
9b3c8f4f8afc9e Xin Jiang 2024-03-11  158  				if (count == 0)
9b3c8f4f8afc9e Xin Jiang 2024-03-11  159  					csv3_boot_sc_page_a = addr + offset;
9b3c8f4f8afc9e Xin Jiang 2024-03-11  160  				else if (count == 1)
9b3c8f4f8afc9e Xin Jiang 2024-03-11  161  					csv3_boot_sc_page_b = addr + offset;
9b3c8f4f8afc9e Xin Jiang 2024-03-11  162  				count++;
9b3c8f4f8afc9e Xin Jiang 2024-03-11  163  			}
9b3c8f4f8afc9e Xin Jiang 2024-03-11  164  			if (count >= 2)
9b3c8f4f8afc9e Xin Jiang 2024-03-11  165  				return;
9b3c8f4f8afc9e Xin Jiang 2024-03-11  166  		}
9b3c8f4f8afc9e Xin Jiang 2024-03-11  167  	}
9b3c8f4f8afc9e Xin Jiang 2024-03-11  168  }
9b3c8f4f8afc9e Xin Jiang 2024-03-11  169  
9b3c8f4f8afc9e Xin Jiang 2024-03-11  170  /**
9b3c8f4f8afc9e Xin Jiang 2024-03-11  171   * csv3_early_secure_call_ident_map - issue early secure call command at the
9b3c8f4f8afc9e Xin Jiang 2024-03-11  172   *			stage where identity page table is created.
9b3c8f4f8afc9e Xin Jiang 2024-03-11  173   * @base_address:	Start address of the specified memory range.
9b3c8f4f8afc9e Xin Jiang 2024-03-11  174   * @num_pages:		number of the specific pages.
9b3c8f4f8afc9e Xin Jiang 2024-03-11  175   * @cmd_type:		Secure call cmd type.
9b3c8f4f8afc9e Xin Jiang 2024-03-11  176   */
9b3c8f4f8afc9e Xin Jiang 2024-03-11 @177  void __init csv3_early_secure_call_ident_map(u64 base_address, u64 num_pages,

:::::: The code at line 130 was first introduced by commit
:::::: 9b3c8f4f8afc9e9143dcedcf81b1af63a0b4b381 x86/boot/compressed/64: Init CSV3 secure call pages

:::::: TO: Xin Jiang <jiangxin@hygon.cn>
:::::: CC: hanliyang <hanliyang@hygon.cn>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

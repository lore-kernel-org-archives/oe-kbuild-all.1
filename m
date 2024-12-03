Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 716011885B3
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Dec 2024 06:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733207271; cv=none; b=WZr3ZtCYvXf2LNUmJdYQwkCn27bylHvK2P4GIG9ebPuzK7nU+w4aSG/SIF2egQZFn6cjVR0wPfyKC1GJA24nvY3UrPuOb6umVQmn52IAVc4zb5s9PIX0an6FWuEwE1LYk5oTcg7W0Cz3ZSYpUHj6xFYV+R8S6xNLi8SyUTfp2YM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733207271; c=relaxed/simple;
	bh=/pKHJ/bsBb7+8OJjh8D9xd9NyvH0JmDpTyPesZIe8yk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bwP+EQMrpk9KgCG9960MaxE34H2BYMUBS1OK5pHOFHNKgnUwHp+KmgNzbEZvxWvS3sY5NPYEtGooaKp/NOmvOmkSIbVfMfqMm2jVGfz4crvROnlggtgrEOXeQZE5enGQyVAMt2D+bRieTnhIzpnB+BgXIG0TTW2/wJhiyJTU/eQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bhVkD6cg; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bhVkD6cg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733207270; x=1764743270;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/pKHJ/bsBb7+8OJjh8D9xd9NyvH0JmDpTyPesZIe8yk=;
  b=bhVkD6cgqOFRdFaxqhjECFyL6Qj6hFvA98WWJHTQ/nnqd+o4HmRyugPs
   E7w8Iyto9Yfr2n3iz6jEmliWiWDjkO3CA3TwnFbG/Av3sfEGA+1MA2PY7
   jRRQPCHiAoS4T/OneK2jfStXir6YXSnrpR5gY6494HlQdRT3DEPmVLvtK
   3w7AH73siSvWOieVL+CNp+pmumaiGw94urf979+ylU555WCBnj8xsfm8S
   K7jpfHN0Z2OTj1E6ApJyjHUj21od2DUO9dZE3Hy/I6fqLeN+FJOPMm5Nx
   Kq2kplV8+WK1luvf/Jr6r0lfK8VauqzcrqVAb36wAQZfgDOmHInRZmd+V
   w==;
X-CSE-ConnectionGUID: lMlYeAhtTxO1+r6fewkC9A==
X-CSE-MsgGUID: FTlKsRoPQG+SbGCJZl9L8w==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="44787990"
X-IronPort-AV: E=Sophos;i="6.12,204,1728975600"; 
   d="scan'208";a="44787990"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2024 22:27:49 -0800
X-CSE-ConnectionGUID: QCCdYokyRK2SzIieH99l4A==
X-CSE-MsgGUID: dF4IqcWYTl+EaJSXA5VLAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,204,1728975600"; 
   d="scan'208";a="94165659"
Received: from lkp-server01.sh.intel.com (HELO 388c121a226b) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 02 Dec 2024 22:27:48 -0800
Received: from kbuild by 388c121a226b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tIMNt-0000Dd-1a;
	Tue, 03 Dec 2024 06:27:45 +0000
Date: Tue, 3 Dec 2024 14:26:51 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, hanliyang <hanliyang@hygon.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1572/1572] arch/x86/kernel/csv-shared.c:130:13:
 warning: no previous prototype for function 'csv3_scan_secure_call_pages'
Message-ID: <202412031441.jesCKpSg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   4672b15ea0310686f657dc38c95b8c90663590c0
commit: ce19f23605e1ab1ab99b4caefdcd1d07dd3dc329 [1572/1572] x86/kernel: Add CSV3 early update(enc/dec)/reset memory helpers
config: x86_64-buildonly-randconfig-006-20241203 (https://download.01.org/0day-ci/archive/20241203/202412031441.jesCKpSg-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241203/202412031441.jesCKpSg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412031441.jesCKpSg-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/x86/kernel/csv.c:10:
   In file included from include/linux/memblock.h:12:
   In file included from include/linux/mm.h:2243:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
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
   3 warnings generated.


vim +/csv3_scan_secure_call_pages +130 arch/x86/kernel/csv-shared.c

d2600299dc44d38 Xin Jiang 2024-03-11  122  
d2600299dc44d38 Xin Jiang 2024-03-11  123  /**
d2600299dc44d38 Xin Jiang 2024-03-11  124   * csv3_scan_secure_call_pages - try to find the secure call pages.
d2600299dc44d38 Xin Jiang 2024-03-11  125   * @boot_params:	boot parameters where e820_table resides.
d2600299dc44d38 Xin Jiang 2024-03-11  126   *
d2600299dc44d38 Xin Jiang 2024-03-11  127   * The secure call pages are reserved by BIOS. We scan all the reserved pages
d2600299dc44d38 Xin Jiang 2024-03-11  128   * to check the CSV3 secure call guid bytes.
d2600299dc44d38 Xin Jiang 2024-03-11  129   */
d2600299dc44d38 Xin Jiang 2024-03-11 @130  void __init csv3_scan_secure_call_pages(struct boot_params *boot_params)
d2600299dc44d38 Xin Jiang 2024-03-11  131  {
d2600299dc44d38 Xin Jiang 2024-03-11  132  	struct boot_e820_entry *entry;
d2600299dc44d38 Xin Jiang 2024-03-11  133  	struct csv3_secure_call_cmd *sc_page;
d2600299dc44d38 Xin Jiang 2024-03-11  134  	u64 offset;
d2600299dc44d38 Xin Jiang 2024-03-11  135  	u64 addr;
d2600299dc44d38 Xin Jiang 2024-03-11  136  	u8 i;
d2600299dc44d38 Xin Jiang 2024-03-11  137  	u8 table_num;
d2600299dc44d38 Xin Jiang 2024-03-11  138  	int count = 0;
d2600299dc44d38 Xin Jiang 2024-03-11  139  
d2600299dc44d38 Xin Jiang 2024-03-11  140  	if (!boot_params)
d2600299dc44d38 Xin Jiang 2024-03-11  141  		return;
d2600299dc44d38 Xin Jiang 2024-03-11  142  
d2600299dc44d38 Xin Jiang 2024-03-11  143  	if (csv3_boot_sc_page_a != -1ul && csv3_boot_sc_page_b != -1ul)
d2600299dc44d38 Xin Jiang 2024-03-11  144  		return;
d2600299dc44d38 Xin Jiang 2024-03-11  145  
d2600299dc44d38 Xin Jiang 2024-03-11  146  	table_num = min_t(u8, boot_params->e820_entries,
d2600299dc44d38 Xin Jiang 2024-03-11  147  			  E820_MAX_ENTRIES_ZEROPAGE);
d2600299dc44d38 Xin Jiang 2024-03-11  148  	entry = &boot_params->e820_table[0];
d2600299dc44d38 Xin Jiang 2024-03-11  149  	for (i = 0; i < table_num; i++) {
d2600299dc44d38 Xin Jiang 2024-03-11  150  		if (entry[i].type != E820_TYPE_RESERVED)
d2600299dc44d38 Xin Jiang 2024-03-11  151  			continue;
d2600299dc44d38 Xin Jiang 2024-03-11  152  
d2600299dc44d38 Xin Jiang 2024-03-11  153  		addr = entry[i].addr & PAGE_MASK;
d2600299dc44d38 Xin Jiang 2024-03-11  154  		for (offset = 0; offset < entry[i].size; offset += PAGE_SIZE) {
d2600299dc44d38 Xin Jiang 2024-03-11  155  			sc_page = (void *)(addr + offset);
d2600299dc44d38 Xin Jiang 2024-03-11  156  			if (sc_page->guid_64[0] == CSV3_SECURE_CALL_GUID_LOW &&
d2600299dc44d38 Xin Jiang 2024-03-11  157  			    sc_page->guid_64[1] == CSV3_SECURE_CALL_GUID_HIGH) {
d2600299dc44d38 Xin Jiang 2024-03-11  158  				if (count == 0)
d2600299dc44d38 Xin Jiang 2024-03-11  159  					csv3_boot_sc_page_a = addr + offset;
d2600299dc44d38 Xin Jiang 2024-03-11  160  				else if (count == 1)
d2600299dc44d38 Xin Jiang 2024-03-11  161  					csv3_boot_sc_page_b = addr + offset;
d2600299dc44d38 Xin Jiang 2024-03-11  162  				count++;
d2600299dc44d38 Xin Jiang 2024-03-11  163  			}
d2600299dc44d38 Xin Jiang 2024-03-11  164  			if (count >= 2)
d2600299dc44d38 Xin Jiang 2024-03-11  165  				return;
d2600299dc44d38 Xin Jiang 2024-03-11  166  		}
d2600299dc44d38 Xin Jiang 2024-03-11  167  	}
d2600299dc44d38 Xin Jiang 2024-03-11  168  }
d2600299dc44d38 Xin Jiang 2024-03-11  169  
d2600299dc44d38 Xin Jiang 2024-03-11  170  /**
d2600299dc44d38 Xin Jiang 2024-03-11  171   * csv3_early_secure_call_ident_map - issue early secure call command at the
d2600299dc44d38 Xin Jiang 2024-03-11  172   *			stage where identity page table is created.
d2600299dc44d38 Xin Jiang 2024-03-11  173   * @base_address:	Start address of the specified memory range.
d2600299dc44d38 Xin Jiang 2024-03-11  174   * @num_pages:		number of the specific pages.
d2600299dc44d38 Xin Jiang 2024-03-11  175   * @cmd_type:		Secure call cmd type.
d2600299dc44d38 Xin Jiang 2024-03-11  176   */
d2600299dc44d38 Xin Jiang 2024-03-11 @177  void __init csv3_early_secure_call_ident_map(u64 base_address, u64 num_pages,

:::::: The code at line 130 was first introduced by commit
:::::: d2600299dc44d38ae1c69b2c0d5a0259c577290f x86/boot/compressed/64: Init CSV3 secure call pages

:::::: TO: Xin Jiang <jiangxin@hygon.cn>
:::::: CC: hanliyang <hanliyang@hygon.cn>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

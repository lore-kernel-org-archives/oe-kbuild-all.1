Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71C6226BDA6
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Feb 2025 09:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739264866; cv=none; b=oM2P+OTkI8PH++4HfE5gF1XhEX8R0H5SVKaQabfTViNSKm+88AxaTqu9NV4iq265FRLeCmZG2cS4KB6tHFaOrQ3LoiHcB5x8rDi7YwYnFwnvoDrpBkwAbtzihKOQiLum9xJ6OXFhS/wfwLi/lIg1fp0rIMtkxFpx8kLekbweqSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739264866; c=relaxed/simple;
	bh=88f6GmoBZMkow5lYBisijwt9Wq/Vy4uXcePlHTnPGGA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WcILcZR3qF6ijukXKvbYqHVKOurHXRzPAkovSSNqt7jqs+GIPgVbsvwZgEzqZZvQED45okM8CW2jX31R7g88tJemrgbUz6mCbSOA1U4gaCB3PJj0WZ5bivve9iLXGgl0lBsWoFdRMK+FdWkzfT6GNiV+ZuFLBl47uVrYtDYzqcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I2pY5XWC; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I2pY5XWC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739264865; x=1770800865;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=88f6GmoBZMkow5lYBisijwt9Wq/Vy4uXcePlHTnPGGA=;
  b=I2pY5XWCnY9IUzWzVjrKnD4d903Y9pNSdtiaPOoZwCHqzBEt52t5pcxA
   fDLeBlSqyoUusXI48EVe8sHdHJ1anbDeXpx2H+ry0G9H9aImUrUygNUW2
   dKNawy+IAdPj4g1FiFrl7Av31rBkjJlga6gTeS4kbv+Hy755FwIsoUytX
   ZMUOH46PwsFzKQGkZNUJrpIDi48p0ZY7QS5zWtbGXhJrI89ODCcvw3Yfw
   rxZqqZ5gA7TTxr61KY2Qv7alz5BiXHJVwumGLkuqfgkamil4XiKiRONu5
   4dMPEFNMGPZVUBx7PHZTaZrluBCsfdNKPxpbW9B+ElM+5JcTHdmOW39/2
   g==;
X-CSE-ConnectionGUID: ea66mwtVSS6khDO9JW80sg==
X-CSE-MsgGUID: GEBik8DpR06vw1OUAdfMLQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="39894203"
X-IronPort-AV: E=Sophos;i="6.13,277,1732608000"; 
   d="scan'208";a="39894203"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 01:07:44 -0800
X-CSE-ConnectionGUID: f/GxGsMMTvKRXKA4fkE8kQ==
X-CSE-MsgGUID: d6RgE883SBO3rNItmLXSLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,277,1732608000"; 
   d="scan'208";a="112218193"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 11 Feb 2025 01:07:43 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1thmF2-0013wm-0e;
	Tue, 11 Feb 2025 09:07:40 +0000
Date: Tue, 11 Feb 2025 17:07:14 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1919/1919] include/linux/psp-hygon.h:219:5:
 warning: no previous prototype for function 'psp_register_cmd_notifier'
Message-ID: <202502111647.IzBuHE1M-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi niuyongwen,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   002103c03aba84e0990a605bc463dcd80bff4235
commit: 518c81d56c055affc71650b1ad1ba7f86e5ee867 [1919/1919] arch/x86/kvm: Support tkm virtualization
config: x86_64-buildonly-randconfig-003-20250211 (https://download.01.org/0day-ci/archive/20250211/202502111647.IzBuHE1M-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250211/202502111647.IzBuHE1M-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502111647.IzBuHE1M-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/x86/kvm/psp.c:12:
   In file included from include/linux/kvm_host.h:16:
   In file included from include/linux/mm.h:2242:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   In file included from arch/x86/kvm/psp.c:15:
>> include/linux/psp-hygon.h:219:5: warning: no previous prototype for function 'psp_register_cmd_notifier' [-Wmissing-prototypes]
     219 | int psp_register_cmd_notifier(uint32_t cmd_id, p2c_notifier_t notifier) { return -ENODEV; }
         |     ^
   include/linux/psp-hygon.h:219:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     219 | int psp_register_cmd_notifier(uint32_t cmd_id, p2c_notifier_t notifier) { return -ENODEV; }
         | ^
         | static 
>> include/linux/psp-hygon.h:220:5: warning: no previous prototype for function 'psp_unregister_cmd_notifier' [-Wmissing-prototypes]
     220 | int psp_unregister_cmd_notifier(uint32_t cmd_id, p2c_notifier_t notifier) { return -ENODEV; }
         |     ^
   include/linux/psp-hygon.h:220:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     220 | int psp_unregister_cmd_notifier(uint32_t cmd_id, p2c_notifier_t notifier) { return -ENODEV; }
         | ^
         | static 
   arch/x86/kvm/psp.c:105:21: warning: no previous prototype for function 'map_tbl_dump' [-Wmissing-prototypes]
     105 | void __maybe_unused map_tbl_dump(const char *title, struct addr_map_tbls *tbls)
         |                     ^
   arch/x86/kvm/psp.c:105:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     105 | void __maybe_unused map_tbl_dump(const char *title, struct addr_map_tbls *tbls)
         | ^
         | static 
   arch/x86/kvm/psp.c:118:21: warning: no previous prototype for function 'g2h_tbl_dump' [-Wmissing-prototypes]
     118 | void __maybe_unused g2h_tbl_dump(const char *title, struct gpa2hva_tbls *tbls)
         |                     ^
   arch/x86/kvm/psp.c:118:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     118 | void __maybe_unused g2h_tbl_dump(const char *title, struct gpa2hva_tbls *tbls)
         | ^
         | static 
   9 warnings generated.


vim +/psp_register_cmd_notifier +219 include/linux/psp-hygon.h

d0b3a770d8e20d chench00 2024-08-01  218  
d0b3a770d8e20d chench00 2024-08-01 @219  int psp_register_cmd_notifier(uint32_t cmd_id, p2c_notifier_t notifier) { return -ENODEV; }
d0b3a770d8e20d chench00 2024-08-01 @220  int psp_unregister_cmd_notifier(uint32_t cmd_id, p2c_notifier_t notifier) { return -ENODEV; }
d0b3a770d8e20d chench00 2024-08-01  221  

:::::: The code at line 219 was first introduced by commit
:::::: d0b3a770d8e20d953fe2a74ea8c4b5f4767c4add crypto: command co-processor: Add another mailbox interrupt support for PSP sending command to X86

:::::: TO: chench00 <chench@hygon.cn>
:::::: CC: chench00 <chench@hygon.cn>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F54C288DA
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Mar 2025 08:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741941361; cv=none; b=iWBs+WV8Ft1CmKW5oO+GEWNfk4E1he6XG+MWUFezs2uN1HM38icdhqcBYnAf/HAPKF8+q+o07VW9Tua7x48/KG4gaRP9rVe7PwPxxdPJgaD/54ucMffOgQ1r455hMcs7KdZes6WTTySEVk7KoiDBZNIdG7R89EHKzf2p7GrhsOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741941361; c=relaxed/simple;
	bh=YzrX1qtvsBWsWSdpW5Y0Td3GkkJLw7M2KlVzEhIKBZc=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TJ9cIRAO6oKqWPFrf+j0L9h0MVuPLlf4fs1zWzduFBfq8ECvjE4ZMLFqVr2XLSWV/wnIeMsfpWPOyIT2C5tk5X9dSFCQ5kjOka2pdxxfVvA2RM/E8JIU7/uYlhUqMICwykxj74hXltqBj7OUzO202gj4UFDx5Ed1/PbEl85cF5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OU+F6dZS; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OU+F6dZS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741941359; x=1773477359;
  h=date:from:cc:subject:message-id:mime-version;
  bh=YzrX1qtvsBWsWSdpW5Y0Td3GkkJLw7M2KlVzEhIKBZc=;
  b=OU+F6dZSbhhPfc9HCpDGqZZu6B4dwbJd3K/O+NP6WRELNJXY0yWmRj7Q
   TXoa5rYv0PSr3FoVNJ9zjD+7KX55q/vYDPK/d6qE0f9b9HoH8A5cBUIdS
   UHTmRGYSzth3PnfZG/Pgo/4zbSus6boeKI7WrOhXXXcGrTVdhXR1ieJl0
   U+WZYVq4nQIxhn5IDnmrfO6USsdm4WIAxUhgVgoSJNUP9sWgwLlS8EnnI
   N82TNR2PzK1NqWUmD8tr53zitqfzd5Uwta372bmnVtMvqbiXLh0RFEtII
   Xsimxz8z20ywGiLUhpV11hpeNVpSMsxugvjbCw4Jw/Nex6ID0DHNeDxIX
   A==;
X-CSE-ConnectionGUID: RwCMho1ITtm2fUu1ObKIxQ==
X-CSE-MsgGUID: 97rOlbZpQuWrpLQk0ep+3A==
X-IronPort-AV: E=McAfee;i="6700,10204,11372"; a="60624897"
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; 
   d="scan'208";a="60624897"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2025 01:35:58 -0700
X-CSE-ConnectionGUID: dCnMjlKNQWm4qdc9KdlFuA==
X-CSE-MsgGUID: A0kVoizATyuy2cC2CVlyIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; 
   d="scan'208";a="152142101"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 14 Mar 2025 01:35:58 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tt0WJ-000AEW-2o
	for oe-kbuild-all@lists.linux.dev;
	Fri, 14 Mar 2025 08:35:55 +0000
Date: Fri, 14 Mar 2025 16:35:26 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:6.6/preempt-rt 7/7] arch/riscv/mm/ptdump.c:387:21: error:
 use of undeclared identifier 'pgtable_l5_enabled'; did you mean
 'pgtable_l4_enabled'?
Message-ID: <202503141607.fAwRPSVT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Song,

FYI, the error/warning still remains.

tree:   https://github.com/intel/linux-intel-lts.git 6.6/preempt-rt
head:   685a54e0f0ccdc484187e319722de7fc7709e8fb
commit: 2c8b096a575000605da454d498369f5e15e9739b [7/7] riscv: correct pt_level name via pgtable_l5/4_enabled
config: riscv-randconfig-001-20250314 (https://download.01.org/0day-ci/archive/20250314/202503141607.fAwRPSVT-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250314/202503141607.fAwRPSVT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503141607.fAwRPSVT-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/riscv/mm/ptdump.c:6:
   In file included from include/linux/efi.h:20:
   In file included from include/linux/rtc.h:17:
   In file included from include/linux/interrupt.h:21:
   In file included from arch/riscv/include/asm/sections.h:9:
   In file included from include/linux/mm.h:2168:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> arch/riscv/mm/ptdump.c:387:21: error: use of undeclared identifier 'pgtable_l5_enabled'; did you mean 'pgtable_l4_enabled'?
     387 |         pg_level[1].name = pgtable_l5_enabled ? "P4D" : "PGD";
         |                            ^~~~~~~~~~~~~~~~~~
         |                            pgtable_l4_enabled
   arch/riscv/include/asm/pgtable.h:917:13: note: 'pgtable_l4_enabled' declared here
     917 | extern bool pgtable_l4_enabled;
         |             ^
   1 warning and 1 error generated.


vim +387 arch/riscv/mm/ptdump.c

   384	
   385		kernel_ptd_info.base_addr = KERN_VIRT_START;
   386	
 > 387		pg_level[1].name = pgtable_l5_enabled ? "P4D" : "PGD";
   388		pg_level[2].name = pgtable_l4_enabled ? "PUD" : "PGD";
   389	
   390		for (i = 0; i < ARRAY_SIZE(pg_level); i++)
   391			for (j = 0; j < ARRAY_SIZE(pte_bits); j++)
   392				pg_level[i].mask |= pte_bits[j].mask;
   393	
   394		debugfs_create_file("kernel_page_tables", 0400, NULL, &kernel_ptd_info,
   395				    &ptdump_fops);
   396	#ifdef CONFIG_EFI
   397		if (efi_enabled(EFI_RUNTIME_SERVICES))
   398			debugfs_create_file("efi_page_tables", 0400, NULL, &efi_ptd_info,
   399					    &ptdump_fops);
   400	#endif
   401	
   402		return 0;
   403	}
   404	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

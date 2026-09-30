Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C1C7364934
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Sep 2026 02:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790734937; cv=none; b=r4wX8vCMSiljtmxTIntlAHFmHcCP97aBOCW7ZS0ncGHqkd04+PEVB7OhyxjPxpU3FwYm5cVv4Q4rpJWyslgw775qa+hV4bt2Yos1w41iu1UZTsTyNcI9gTZ/6WdTia191thcd4nkwdZYgcxht90C79BKObj0WEpdKX2qO3wKLCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790734937; c=relaxed/simple;
	bh=/e4zWCBb4GcOCU4Q1TvOx7fu0pF7FiGiutW1NfB2doI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GL5mKwIWxKSfpHYxh9dKUEApKf5XS0e3mzSWsXGDRS6olTjV+8sl33nFfEhRQHLOd97WokN6nJTe1LIIuAPhMHEHOlaX2CE0memIrhOmc7OxDOIemXUsn0uxOpFYFeBqD0r8HmKuIcFHgaTkqnhKQFrnBCiPLzPc4j8y6k0mct4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AUm0UI9c; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AUm0UI9c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790734935; x=1822270935;
  h=date:from:to:cc:subject:message-id;
  bh=/e4zWCBb4GcOCU4Q1TvOx7fu0pF7FiGiutW1NfB2doI=;
  b=AUm0UI9ckOMXkLet9rS7TUFxqrLJWx2ivPdBtbEI9Oi24+uQB6th/1Hz
   tWGZNHSooUXKXZ4gjqEiLWQam3RK8Fl84D26Bg9buXEtsETp6GicYu9GU
   XdZ87Yll9eRFMvfoZtvXpFX8TQ7XK4iCVtg/Q5tVLNsLp+j+0YnqIQcAF
   UodvFLRtR9W+amS7w0IG9gTEXXHjwJksLPrKDYvz3P2bcPBifJJDyWz3g
   LsBuMDjFik/Sh6lvzmHulhQTD2YRXsuDLToAEQ8EyvJzJfzr/2/3E0AFK
   Q5qKre6h3Sg3oVQJM/nMo9n04v2s5JnM+ZaUfRDQ183+SIs+KjqbNMN4C
   w==;
X-CSE-ConnectionGUID: bXr5PtdFTraOHIGioJ013g==
X-CSE-MsgGUID: X8Zujx0WRuyOUdRNhkKp8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="91563913"
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; 
   d="scan'208";a="91563913"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2026 19:22:15 -0700
X-CSE-ConnectionGUID: /mz3LaQKQRi0PZ+DHkDC8Q==
X-CSE-MsgGUID: lTjfDnrcQbafFrcHZmsiTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; 
   d="scan'208";a="279350270"
Received: from igk-lkp-server01.igk.intel.com (HELO 04362d00df5a) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 29 Sep 2026 19:22:13 -0700
Received: from kbuild by 04362d00df5a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xBjxS-000000001ff-3VvI;
	Wed, 30 Sep 2026 02:22:10 +0000
Date: Wed, 30 Sep 2026 04:21:31 +0200
From: kernel test robot <lkp@intel.com>
To: Anup Patel <anup.patel@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Subject: [avpatel:riscv_mpxy_imp_v1 2/5]
 include/asm-generic/memory_model.h:56:21: error: implicit declaration of
 function 'memdesc_section'
Message-ID: <202609300412.K0Nx5T4e-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/avpatel/linux.git riscv_mpxy_imp_v1
head:   ca441e957bb4806b528959ae80efb7e7a9f5447a
commit: 36c74ca9f1dd2278453c544310c73d45beb9c993 [2/5] RISC-V: Move common MPXY helper routines to arch/riscv
config: riscv-randconfig-2000-20260930 (https://download.01.org/0day-ci/archive/20260930/202609300412.K0Nx5T4e-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260930/202609300412.K0Nx5T4e-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609300412.K0Nx5T4e-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/riscv/kernel/sbi_mpxy.c:16:
   arch/riscv/kernel/sbi_mpxy.c: In function 'mpxy_setup_shmem':
>> include/asm-generic/memory_model.h:56:21: error: implicit declaration of function 'memdesc_section' [-Wimplicit-function-declaration]
      56 |         int __sec = memdesc_section(&__pg->flags);              \
         |                     ^~~~~~~~~~~~~~~
   arch/riscv/include/asm/sbi.h:573:29: note: in definition of macro 'sbi_ecall'
     573 |                 __sbi_ecall(a0, a1, a2, a3, a4, a5, f, e)
         |                             ^~
   include/asm-generic/memory_model.h:85:33: note: in expansion of macro 'PFN_PHYS'
      85 | #define page_to_phys(page)      PFN_PHYS(page_to_pfn(page))
         |                                 ^~~~~~~~
   include/asm-generic/memory_model.h:73:21: note: in expansion of macro '__page_to_pfn'
      73 | #define page_to_pfn __page_to_pfn
         |                     ^~~~~~~~~~~~~
   include/asm-generic/memory_model.h:85:42: note: in expansion of macro 'page_to_pfn'
      85 | #define page_to_phys(page)      PFN_PHYS(page_to_pfn(page))
         |                                          ^~~~~~~~~~~
   arch/riscv/kernel/sbi_mpxy.c:292:26: note: in expansion of macro 'page_to_phys'
     292 |                          page_to_phys(shmem_page), 0, 0, 0, 0, 0);
         |                          ^~~~~~~~~~~~


vim +/memdesc_section +56 include/asm-generic/memory_model.h

8f6aac419bd590 Christoph Lameter 2007-10-16  48  
a117e66ed45ac0 KAMEZAWA Hiroyuki 2006-03-27  49  #elif defined(CONFIG_SPARSEMEM)
a117e66ed45ac0 KAMEZAWA Hiroyuki 2006-03-27  50  /*
1a49123b343461 Zhang Yanfei      2013-10-03  51   * Note: section's mem_map is encoded to reflect its start_pfn.
a117e66ed45ac0 KAMEZAWA Hiroyuki 2006-03-27  52   * section[i].section_mem_map == mem_map's address - start_pfn;
a117e66ed45ac0 KAMEZAWA Hiroyuki 2006-03-27  53   */
67de648211fa04 Andy Whitcroft    2006-06-23  54  #define __page_to_pfn(pg)					\
aa462abe8aaf21 Ian Campbell      2011-08-17  55  ({	const struct page *__pg = (pg);				\
67a06fdfbf6f59 Hui Zhu           2026-06-30 @56  	int __sec = memdesc_section(&__pg->flags);		\
f05b6284ee5d3b Randy Dunlap      2007-02-10  57  	(unsigned long)(__pg - __section_mem_map_addr(__nr_to_section(__sec)));	\
a117e66ed45ac0 KAMEZAWA Hiroyuki 2006-03-27  58  })
a117e66ed45ac0 KAMEZAWA Hiroyuki 2006-03-27  59  

:::::: The code at line 56 was first introduced by commit
:::::: 67a06fdfbf6f590d3e47b0592559e8fdc2a6998a mm: fix ASSERT_EXCLUSIVE_BITS by passing memdesc_flags_t by pointer

:::::: TO: Hui Zhu <zhuhui@kylinos.cn>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

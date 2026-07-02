Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F85536C9D5
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Jul 2026 06:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782972353; cv=none; b=WtQbO7vhw9bAtHe30ufalwP5zmkjA2eMPja1G642x85v5Yn8X5uzFVp0KvgJW8onxGH8hthKqgBQ0XELE7hyTjpdX0kFTdHjr0FryoACg6x3G7sop1/U4gISQNgo40LmqHEgFjPTGwFDe0i4bB5ktsPLBuVUoK+EzbyTPhOY9Ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782972353; c=relaxed/simple;
	bh=nbkDo8tqGx6uakJAR9LbFju0oijzkJ8+e5UDd1hww/4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qVLa2vy/5FEuxiZ4s+6VWCIiRzS97Nr78G/NX4iS9p0Aq9+sOf9n59xvTjDJgoX203NrLCUj5Y5wOcTrRRg0OXwD512XS++f71bGqNU+I+Ha/WOegB58dZFrYvC24iG93hn/BoF4Nabxs32kpvilhFYpruvXFgCU1X0u7DEF7Mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UG1X0Tc5; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UG1X0Tc5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782972352; x=1814508352;
  h=date:from:to:cc:subject:message-id;
  bh=nbkDo8tqGx6uakJAR9LbFju0oijzkJ8+e5UDd1hww/4=;
  b=UG1X0Tc5fJMvY9/vVPxiI51ZlINUZrDayywxDleEfQSZ4Ioxom61fWq/
   C/CU9NUIKOFTi3xsT26o+0aosfWPeK58frHg93IEzq9BU/pBrk63dwT/x
   76kyQ8NrIvHAZt1WvwGUqtOg1OQePXoW9kuNxqeTaupcf7W6E4vxo+gdC
   xM04fuXKQ6sutTqQa1tLVf4UbU0YU+SpEGET0HH6jwR4MsY6IzjM9bA8h
   cG0baLVt+5MUiE8tj12yLo+UtYxhJdWZKojM7iDJa5QUkLaOX6LUu/D+s
   uub2N8tEGgAYL6Q+2GhnTqNIrbN5McueiwqNfX/L5HS1LwqJkiEFEwPE9
   g==;
X-CSE-ConnectionGUID: DaEEtUVySfy5Bk677WGBMg==
X-CSE-MsgGUID: 9222rpNGSm2cIFue3WuruA==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="94312315"
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="94312315"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 23:05:51 -0700
X-CSE-ConnectionGUID: q+qQZ+yST8O0HZ5inkQyLA==
X-CSE-MsgGUID: 9pFeL0yURWiP0rKQCtQAqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="275972201"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 01 Jul 2026 23:05:49 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wfAYN-00000000A4z-2VCS;
	Thu, 02 Jul 2026 06:05:42 +0000
Date: Thu, 02 Jul 2026 14:04:36 +0800
From: kernel test robot <lkp@intel.com>
To: Miaohe Lin <linmiaohe@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>
Subject: include/asm-generic/tlb.h:609:42: sparse: sparse: cast
 truncates bits from constant value (1000000000 becomes 0)
Message-ID: <202607021324.e6xUCAYj-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4a50a141f05a8d1737661b19ee22ff8455b94409
commit: c090868f59ce888db838cf543d18f731d13ed498 Revert "hugetlb: make hugetlb depends on SYSFS or SYSCTL"
date:   10 months ago
config: arm64-randconfig-r112-20260702 (https://download.01.org/0day-ci/archive/20260702/202607021324.e6xUCAYj-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260702/202607021324.e6xUCAYj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: c090868f59ce ("Revert "hugetlb: make hugetlb depends on SYSFS or SYSCTL"")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607021324.e6xUCAYj-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   mm/hugetlb.c:665:12: sparse: sparse: context imbalance in 'allocate_file_region_entries' - wrong count at exit
   mm/hugetlb.c:736:13: sparse: sparse: context imbalance in 'region_add' - wrong count at exit
   mm/hugetlb.c:803:13: sparse: sparse: context imbalance in 'region_chg' - wrong count at exit
   mm/hugetlb.c:5778:20: sparse: sparse: context imbalance in 'move_huge_pte' - different lock contexts for basic block
   mm/hugetlb.c: note: in included file (through arch/arm64/include/asm/tlb.h):
>> include/asm-generic/tlb.h:609:42: sparse: sparse: cast truncates bits from constant value (1000000000 becomes 0)
   mm/hugetlb.c: note: in included file (through arch/arm64/include/asm/barrier.h, include/linux/list.h):
   arch/arm64/include/asm/alternative-macros.h:232:9: sparse: sparse: context imbalance in 'hugetlb_wp' - unexpected unlock

vim +609 include/asm-generic/tlb.h

2631ed00b04988 Peter Zijlstra (Intel  2020-06-25  605) 
2631ed00b04988 Peter Zijlstra (Intel  2020-06-25  606) static inline void tlb_flush_pmd_range(struct mmu_gather *tlb,
2631ed00b04988 Peter Zijlstra (Intel  2020-06-25  607) 				     unsigned long address, unsigned long size)
2631ed00b04988 Peter Zijlstra (Intel  2020-06-25  608) {
2631ed00b04988 Peter Zijlstra (Intel  2020-06-25 @609) 	__tlb_adjust_range(tlb, address, size);
2631ed00b04988 Peter Zijlstra (Intel  2020-06-25  610) 	tlb->cleared_pmds = 1;
2631ed00b04988 Peter Zijlstra (Intel  2020-06-25  611) }
2631ed00b04988 Peter Zijlstra (Intel  2020-06-25  612) 

:::::: The code at line 609 was first introduced by commit
:::::: 2631ed00b0498810f8d5c2163c6b5270d893687b tlb: mmu_gather: add tlb_flush_*_range APIs

:::::: TO: Peter Zijlstra (Intel) <peterz@infradead.org>
:::::: CC: Catalin Marinas <catalin.marinas@arm.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

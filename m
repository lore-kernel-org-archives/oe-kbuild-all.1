Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78387258A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 27 Aug 2025 15:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756309610; cv=none; b=neKJWyz5pkDdOSZMi0NWniblXvhRWBGk9W935+P7eCV9pnmVL9WJywjXbV/ELvftP00gGNcKAzAbBs0vnyf367SpGzKquID89o51vjKDY67keo8GLmlfzV9uLoN/g/96Cnfiz3gr3pSSPBU2tMPBGnb9lL7K785XF3eiFBw8G7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756309610; c=relaxed/simple;
	bh=+s/oLejyBLJcIxuIibQnApNqicoGpevwkTpMJc8g0e4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NvA+zxtvdkuY4MvMnVQQ6MeH59WII91HYvH8E50H2IMQV0MzhGNpcK5awqPx8Vbf44SZ+nazBRP4In6YpAs6+AV8dFk1cmtuOY+K4QSYB82bM+jrzCBmWsArli+oUB4t/R759oCDIjK/3vJKjEAPEtWOsLvqYigtciQe5/Zd1eQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ToHIyTY8; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ToHIyTY8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756309609; x=1787845609;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+s/oLejyBLJcIxuIibQnApNqicoGpevwkTpMJc8g0e4=;
  b=ToHIyTY8vAQFywoARW0wfEeZgHf7TEegC7gFcIsBH492N26snP3rQ3f4
   z03bZ+fmTq1+dNfQBzIPpX1uq5aVOBgVjdSdVylCepUHyGoawiSTIk5ZN
   4YjU6ThbgGFvw13E8c215lGh5PBrAwNBbiDeMpZQNTB73igipUmVxJKaV
   gkoy5bmB84IzSsaoLwp3s0n+socBzpxnLPmqORugU3VheIvD3QBTdEltI
   dViCpwHLGuHTK4YfBGxPxkAI39+CUsGsaO2dkiIQyQ6YlMQP3pyJxbesm
   Wor1gmZZHbQeYs5f9gJGV3Fd/GZ4+uLkVJADFUsP7hyOkS38gnmqdWb7X
   Q==;
X-CSE-ConnectionGUID: 3JNJHrU1TzCEoq7Tjn+NWA==
X-CSE-MsgGUID: WTL9fvUlTj+NoYtOWK66Dg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="81158978"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="81158978"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2025 08:46:48 -0700
X-CSE-ConnectionGUID: bZwcRx3QTXGJXa8lfo9x9g==
X-CSE-MsgGUID: m5hieocAQ2m6X0ytai//Vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; 
   d="scan'208";a="207035151"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 27 Aug 2025 08:46:47 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1urILG-000T23-1P;
	Wed, 27 Aug 2025 15:46:16 +0000
Date: Wed, 27 Aug 2025 23:45:22 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jgunthorpe:iommu_pt_vtd 18/34] include/linux/bitops.h:273:19:
 sparse: sparse: cast truncates bits from constant value (fffffffffff000
 becomes fffff000)
Message-ID: <202508272323.CO6n96ws-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jgunthorpe/linux iommu_pt_vtd
head:   fbb816ad5a7780a27bde18e3090b30552b6068f9
commit: 1432479c5e0d38d6dbac7c73d420b2e47a01f1a3 [18/34] iommupt: Add the RISC-V page table format
config: i386-randconfig-063-20250827 (https://download.01.org/0day-ci/archive/20250827/202508272323.CO6n96ws-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250827/202508272323.CO6n96ws-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508272323.CO6n96ws-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/iommu/generic_pt/fmt/iommu_riscv64.c: note: in included file (through drivers/iommu/generic_pt/fmt/../pt_log2.h, drivers/iommu/generic_pt/fmt/../pt_defs.h, ...):
>> include/linux/bitops.h:273:19: sparse: sparse: cast truncates bits from constant value (fffffffffff000 becomes fffff000)
   include/linux/bitops.h:278:16: sparse: sparse: cast truncates bits from constant value (fffffffffff000 becomes fffff000)
>> include/linux/bitops.h:273:19: sparse: sparse: cast truncates bits from constant value (fffffffffff000 becomes fffff000)
   include/linux/bitops.h:278:16: sparse: sparse: cast truncates bits from constant value (fffffffffff000 becomes fffff000)

vim +273 include/linux/bitops.h

c320592f3f2a1e Wolfram Sang       2025-01-07  261  
952043ac12a117 Steven Whitehouse  2009-04-23  262  /**
952043ac12a117 Steven Whitehouse  2009-04-23  263   * __ffs64 - find first set bit in a 64 bit word
952043ac12a117 Steven Whitehouse  2009-04-23  264   * @word: The 64 bit word
952043ac12a117 Steven Whitehouse  2009-04-23  265   *
4945cca232ce8b Geert Uytterhoeven 2021-02-25  266   * On 64 bit arches this is a synonym for __ffs
952043ac12a117 Steven Whitehouse  2009-04-23  267   * The result is not defined if no bits are set, so check that @word
952043ac12a117 Steven Whitehouse  2009-04-23  268   * is non-zero before calling this.
952043ac12a117 Steven Whitehouse  2009-04-23  269   */
9c313ccdfc079f Thorsten Blum      2024-04-21  270  static inline unsigned int __ffs64(u64 word)
952043ac12a117 Steven Whitehouse  2009-04-23  271  {
952043ac12a117 Steven Whitehouse  2009-04-23  272  #if BITS_PER_LONG == 32
952043ac12a117 Steven Whitehouse  2009-04-23 @273  	if (((u32)word) == 0UL)
952043ac12a117 Steven Whitehouse  2009-04-23  274  		return __ffs((u32)(word >> 32)) + 32;
952043ac12a117 Steven Whitehouse  2009-04-23  275  #elif BITS_PER_LONG != 64
952043ac12a117 Steven Whitehouse  2009-04-23  276  #error BITS_PER_LONG not 32 or 64
952043ac12a117 Steven Whitehouse  2009-04-23  277  #endif
952043ac12a117 Steven Whitehouse  2009-04-23  278  	return __ffs((unsigned long)word);
952043ac12a117 Steven Whitehouse  2009-04-23  279  }
952043ac12a117 Steven Whitehouse  2009-04-23  280  

:::::: The code at line 273 was first introduced by commit
:::::: 952043ac12a117d8e94bddd9088338d7ad20ca7d bitops: Add __ffs64 bitop

:::::: TO: Steven Whitehouse <swhiteho@redhat.com>
:::::: CC: Steven Whitehouse <swhiteho@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

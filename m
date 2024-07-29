Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73ABA12E1CA
	for <oe-kbuild-all@lists.linux.dev>; Mon, 29 Jul 2024 20:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722285245; cv=none; b=Htq9Nu9qavsvU2VBYUom+J9jRS3v4clM2cgi/Q5y2Qpro+0XSqFfs0aRtFk9gToadjCfRMS2r1PbgVS03tmmwFauDXQxceHFQt7e4c+pJl8nufxiWwIF5q12YIOQhmqXHW8nKrJzgOAVOa7bT/byuTylGppfaZAeIXqc99pxwK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722285245; c=relaxed/simple;
	bh=db2tGBXXINin/8PFxoVNSFHD1wzMl3nMN71Bb5sfLoo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iPOB4PtNPzuSmb8C7NI5DL2udqqpV2SAQLYjWqfO7QkbDTiPPTIOMqAqfYWdFlbNhkAiNLxAzAyj+iwh6DlMD9knsuoBF5348i+tMwERIrop7NMAVWLIrB+CVYi+w+5g6MjrsQCaQVMZM7QxfJdi4x/xoUfr+756500NKcTZBO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZKZ/d7fZ; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZKZ/d7fZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722285243; x=1753821243;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=db2tGBXXINin/8PFxoVNSFHD1wzMl3nMN71Bb5sfLoo=;
  b=ZKZ/d7fZ6liPQ1XocSCXBoLasOAN5eD8ECY7lRgiGSGzLrA5C/4tnMd9
   puvzPPgxRkD7UPQFK1WzFmfFxlYiv5+6S/d+T7S4Cy45hLNKQlBd2ys7q
   vSe2LZdmaGaqsBX0lNLt+e+LFjbNvuJJPUJoL0wA91cwKvNu0TjWDkyah
   5ManC0RaqIyhvfMXZsUOyjv61sC8K9Tdhw/YpxHTg14xo4u7xmtDYphP3
   ZYmqyba2eH6/ea5DB7/cRWmRt4i34C2SQnMMXlnPSiDd9JmC5fn8IA7J8
   wbKJUt2RqlC0tCEY1re1aAlPwz7xy5z7MTGfDyQTHpai0POtv829IyJ7Z
   A==;
X-CSE-ConnectionGUID: WBoXZTjNQl6jtzdvLOYAaQ==
X-CSE-MsgGUID: Z3N++6LCTAWxC9ThALY4wQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="45486559"
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; 
   d="scan'208";a="45486559"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2024 13:34:03 -0700
X-CSE-ConnectionGUID: qXDDoOX3SwGMFsIybx9wbA==
X-CSE-MsgGUID: VJGEKlxVT7mraHu7LCmwXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; 
   d="scan'208";a="54018546"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 29 Jul 2024 13:34:01 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sYX4B-000s32-0u;
	Mon, 29 Jul 2024 20:33:59 +0000
Date: Tue, 30 Jul 2024 04:33:00 +0800
From: kernel test robot <lkp@intel.com>
To: alexs@kernel.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [alexshi:ptdesc 11/17] arch/riscv/include/asm/pgalloc.h:189:28:
 error: 'ptdesc' undeclared
Message-ID: <202407300449.gZTNWIT0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alexshi/linux.git ptdesc
head:   f15e36d2055d050fc545a456368a6426fee74544
commit: 45d2cd05baf4a67434dcb10ebb8d246997a46dfa [11/17] mm/pgtable: introduce ptdesc_pfn and use ptdesc in free_pte_range()
config: riscv-allnoconfig (https://download.01.org/0day-ci/archive/20240730/202407300449.gZTNWIT0-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240730/202407300449.gZTNWIT0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407300449.gZTNWIT0-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/filemap.c:49:
   arch/riscv/include/asm/pgalloc.h: In function '__pte_free_tlb':
>> arch/riscv/include/asm/pgalloc.h:189:28: error: 'ptdesc' undeclared (first use in this function)
     189 |         pagetable_pte_dtor(ptdesc);
         |                            ^~~~~~
   arch/riscv/include/asm/pgalloc.h:189:28: note: each undeclared identifier is reported only once for each function it appears in


vim +/ptdesc +189 arch/riscv/include/asm/pgalloc.h

07037db5d479f9 Palmer Dabbelt    2017-07-10  185  
45d2cd05baf4a6 Alex Shi          2024-07-22  186  static inline void __pte_free_tlb(struct mmu_gather *tlb, struct ptdesc *pte,
40d1bb92a49313 Jisheng Zhang     2023-12-20  187  				  unsigned long addr)
40d1bb92a49313 Jisheng Zhang     2023-12-20  188  {
40d1bb92a49313 Jisheng Zhang     2023-12-20 @189  	pagetable_pte_dtor(ptdesc);
aaa56c8f378dd7 Samuel Holland    2024-03-26  190  	riscv_tlb_remove_ptdesc(tlb, ptdesc);
40d1bb92a49313 Jisheng Zhang     2023-12-20  191  }
6bd33e1ece528f Christoph Hellwig 2019-10-28  192  #endif /* CONFIG_MMU */
07037db5d479f9 Palmer Dabbelt    2017-07-10  193  

:::::: The code at line 189 was first introduced by commit
:::::: 40d1bb92a49313b3e0dc5513fdd2578362c40312 riscv: tlb: convert __p*d_free_tlb() to inline functions

:::::: TO: Jisheng Zhang <jszhang@kernel.org>
:::::: CC: Palmer Dabbelt <palmer@rivosinc.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

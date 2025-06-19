Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACEB12472A4
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Jun 2025 08:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750320231; cv=none; b=sTHipYOJt9Ffqg+tAqmf4mIVypAZThAY17Hwx50ogaYy2hoxQuIGhkna8rRo8QSxwICysIC5OOeueTFCRZkN7JEGcsamLnxBW4NLkXUtS/WEv3WNItYJxMY6ySEjzs07ViYjXqpe6BFOUrm1fcbBMB+dXScN/BuHOkTFRRFMbE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750320231; c=relaxed/simple;
	bh=XgL1Zg1n9YmtzmUVbJdw4xHwQyAlDF54z92Xhh2Zl9o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ouDFqB6MiDyRiKzRoP48CdMNLtq/SLNoE0DnjBUoJ0iz8SuYGiCB91sAOe/G7PHZC0C0fpvSMJlPmmE18ka9wJ7yktcPC6MHMxuEJ8xQ2y2oEqUaWxwfXXVxaRl6CQTy/s23QboJ6fgClN01amvR7FwxEFhGMjHmkvj+ugcoLl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OHFWLvw/; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OHFWLvw/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750320229; x=1781856229;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XgL1Zg1n9YmtzmUVbJdw4xHwQyAlDF54z92Xhh2Zl9o=;
  b=OHFWLvw/ITk45qd2R5IHW2HCVQPWlEmRbGqiyGhH4rjjN9+oEhfJR/IU
   H/eNg4IKeC9kCZQz/3ZyTxDiFHNARmfSlN+UriXaFlOqGTf3unRfSOEti
   Egm+q32sZK8ykC676Zog7ZGz0c8nEHHvnPISCcmm+0IKVMpbOUaR8piuW
   Xfd625sTodFfGA/V254iWDelWrROW3dRnq8q/HUXhksMHPSdV4SUDm9m/
   D17kxwT1w/W/hk5MIMFqkbP9tFS44EetkTaQC4DyNy8KQoaFwnHPl92XD
   7s4yx3ogxKH+Qp3XMbSm+ww+hVD/qlEzTUY2MTgb9/teAbFfyIdXBNUCQ
   A==;
X-CSE-ConnectionGUID: GWS5ZIsaRS6vyiXMak5lqQ==
X-CSE-MsgGUID: ZU/IJJvZQHO5vBw89bGqwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="52444739"
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="52444739"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 01:03:32 -0700
X-CSE-ConnectionGUID: mlIMrFtTSU+8Ya+f/7ldkQ==
X-CSE-MsgGUID: GcqOnlkbRoGcPGroDcJ05A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="187741072"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 19 Jun 2025 01:03:30 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uSAF5-000KYA-1q;
	Thu, 19 Jun 2025 08:03:27 +0000
Date: Thu, 19 Jun 2025 16:03:23 +0800
From: kernel test robot <lkp@intel.com>
To: Alistair Popple <apopple@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	Jason Gunthorpe <jgg@nvidia.com>
Subject: [akpm-mm:mm-new 158/177] arch/riscv/include/asm/pgtable.h:934:24:
 error: implicit declaration of function 'pte_mkdevmap'; did you mean
 'pud_mkdevmap'?
Message-ID: <202506191536.2hMhapuP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-new
head:   98743cca1551b038cdec987961c609f2fb0beb83
commit: 8aed601c58980f1f7cd45d5373e739f87d22d028 [158/177] mm: remove devmap related functions and page table bits
config: riscv-randconfig-r132-20250619 (https://download.01.org/0day-ci/archive/20250619/202506191536.2hMhapuP-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 15.1.0
reproduce: (https://download.01.org/0day-ci/archive/20250619/202506191536.2hMhapuP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506191536.2hMhapuP-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/pgtable.h:6,
                    from include/linux/mm.h:31,
                    from arch/riscv/kernel/asm-offsets.c:8:
   arch/riscv/include/asm/pgtable.h: In function 'pud_mkdevmap':
>> arch/riscv/include/asm/pgtable.h:934:24: error: implicit declaration of function 'pte_mkdevmap'; did you mean 'pud_mkdevmap'? [-Wimplicit-function-declaration]
     934 |         return pte_pud(pte_mkdevmap(pud_pte(pud)));
         |                        ^~~~~~~~~~~~
         |                        pud_mkdevmap
>> arch/riscv/include/asm/pgtable.h:934:24: error: incompatible type for argument 1 of 'pte_pud'
     934 |         return pte_pud(pte_mkdevmap(pud_pte(pud)));
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |                        |
         |                        int
   arch/riscv/include/asm/pgtable.h:675:35: note: expected 'pte_t' but argument is of type 'int'
     675 | static inline pud_t pte_pud(pte_t pte)
         |                             ~~~~~~^~~
   make[3]: *** [scripts/Makefile.build:182: arch/riscv/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1274: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +934 arch/riscv/include/asm/pgtable.h

c3cc2a4a3a23fa Alexandre Ghiti 2025-03-21  931  
c3cc2a4a3a23fa Alexandre Ghiti 2025-03-21  932  static inline pud_t pud_mkdevmap(pud_t pud)
c3cc2a4a3a23fa Alexandre Ghiti 2025-03-21  933  {
c3cc2a4a3a23fa Alexandre Ghiti 2025-03-21 @934  	return pte_pud(pte_mkdevmap(pud_pte(pud)));
c3cc2a4a3a23fa Alexandre Ghiti 2025-03-21  935  }
c3cc2a4a3a23fa Alexandre Ghiti 2025-03-21  936  

:::::: The code at line 934 was first introduced by commit
:::::: c3cc2a4a3a23faf6b88459471c1c16ab3837cc2f riscv: Add support for PUD THP

:::::: TO: Alexandre Ghiti <alexghiti@rivosinc.com>
:::::: CC: Palmer Dabbelt <palmer@dabbelt.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C8ED1549F
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Jul 2023 12:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690289290; x=1721825290;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CtaLAo17SyqSmF25npVDsvpSdoJ2LEGMP9QqEPffeXI=;
  b=Msi/cFbIqdyABmgrxbOIezS5Q/t8gONSrO7iikTSQZ/L/RCRtMzOA4nR
   2YRG4W9DPzGvmkC+FmNsHCcjq6egtZnBE8F/QYxDnWgRjF42ooE1iSQMx
   qgw8LTEimGKhYOtoe7kmUFrlNiJ0LqYCGF55Sr5U4/6mf3LfYOfgaaREf
   /1TtJwR40srAqOdKnDG2sTTrTUxou9CZl6F4n0+dNHJcnDUHYS0S5rmbk
   4dknT6e2np+ZkXZTYVxmYf9oWFVGzFZRf+8auEAy1TAu7Zn69wzdAji6d
   UEH7NYmec2TOLDWnf/0woVvccCrKCsqtxuMH/IEIf18rq+Stb/cCSohfg
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="366590770"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; 
   d="scan'208";a="366590770"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2023 05:48:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="703264756"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; 
   d="scan'208";a="703264756"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 25 Jul 2023 05:48:07 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qOHSQ-000AcG-2m;
	Tue, 25 Jul 2023 12:48:06 +0000
Date: Tue, 25 Jul 2023 20:47:38 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Christian Brauner <brauner@kernel.org>,
	Alexander Gordeev <agordeev@linux.ibm.com>
Subject: arch/powerpc/mm/book3s64/pgtable.c:422:6: error: no previous
 prototype for 'arch_report_meminfo'
Message-ID: <202307252035.aAJZfroP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0b5547c51827e053cc754db47d3ec3e6c2c451d2
commit: ef104443bffa004f631729dfc924f0b84abbd602 procfs: consolidate arch_report_meminfo declaration
date:   10 weeks ago
config: powerpc-maple_defconfig (https://download.01.org/0day-ci/archive/20230725/202307252035.aAJZfroP-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230725/202307252035.aAJZfroP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307252035.aAJZfroP-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/powerpc/mm/book3s64/pgtable.c:422:6: error: no previous prototype for 'arch_report_meminfo' [-Werror=missing-prototypes]
     422 | void arch_report_meminfo(struct seq_file *m)
         |      ^~~~~~~~~~~~~~~~~~~
   arch/powerpc/mm/book3s64/pgtable.c:478:5: error: no previous prototype for 'pmd_move_must_withdraw' [-Werror=missing-prototypes]
     478 | int pmd_move_must_withdraw(struct spinlock *new_pmd_ptl,
         |     ^~~~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors


vim +/arch_report_meminfo +422 arch/powerpc/mm/book3s64/pgtable.c

a2dc009afa9ae8 arch/powerpc/mm/pgtable-book3s64.c Aneesh Kumar K.V 2018-08-13  421  
a2dc009afa9ae8 arch/powerpc/mm/pgtable-book3s64.c Aneesh Kumar K.V 2018-08-13 @422  void arch_report_meminfo(struct seq_file *m)
a2dc009afa9ae8 arch/powerpc/mm/pgtable-book3s64.c Aneesh Kumar K.V 2018-08-13  423  {
a2dc009afa9ae8 arch/powerpc/mm/pgtable-book3s64.c Aneesh Kumar K.V 2018-08-13  424  	/*
a2dc009afa9ae8 arch/powerpc/mm/pgtable-book3s64.c Aneesh Kumar K.V 2018-08-13  425  	 * Hash maps the memory with one size mmu_linear_psize.
a2dc009afa9ae8 arch/powerpc/mm/pgtable-book3s64.c Aneesh Kumar K.V 2018-08-13  426  	 * So don't bother to print these on hash
a2dc009afa9ae8 arch/powerpc/mm/pgtable-book3s64.c Aneesh Kumar K.V 2018-08-13  427  	 */
a2dc009afa9ae8 arch/powerpc/mm/pgtable-book3s64.c Aneesh Kumar K.V 2018-08-13  428  	if (!radix_enabled())
a2dc009afa9ae8 arch/powerpc/mm/pgtable-book3s64.c Aneesh Kumar K.V 2018-08-13  429  		return;
a2dc009afa9ae8 arch/powerpc/mm/pgtable-book3s64.c Aneesh Kumar K.V 2018-08-13  430  	seq_printf(m, "DirectMap4k:    %8lu kB\n",
a2dc009afa9ae8 arch/powerpc/mm/pgtable-book3s64.c Aneesh Kumar K.V 2018-08-13  431  		   atomic_long_read(&direct_pages_count[MMU_PAGE_4K]) << 2);
a2dc009afa9ae8 arch/powerpc/mm/pgtable-book3s64.c Aneesh Kumar K.V 2018-08-13  432  	seq_printf(m, "DirectMap64k:    %8lu kB\n",
a2dc009afa9ae8 arch/powerpc/mm/pgtable-book3s64.c Aneesh Kumar K.V 2018-08-13  433  		   atomic_long_read(&direct_pages_count[MMU_PAGE_64K]) << 6);
a2dc009afa9ae8 arch/powerpc/mm/pgtable-book3s64.c Aneesh Kumar K.V 2018-08-13  434  	seq_printf(m, "DirectMap2M:    %8lu kB\n",
a2dc009afa9ae8 arch/powerpc/mm/pgtable-book3s64.c Aneesh Kumar K.V 2018-08-13  435  		   atomic_long_read(&direct_pages_count[MMU_PAGE_2M]) << 11);
a2dc009afa9ae8 arch/powerpc/mm/pgtable-book3s64.c Aneesh Kumar K.V 2018-08-13  436  	seq_printf(m, "DirectMap1G:    %8lu kB\n",
a2dc009afa9ae8 arch/powerpc/mm/pgtable-book3s64.c Aneesh Kumar K.V 2018-08-13  437  		   atomic_long_read(&direct_pages_count[MMU_PAGE_1G]) << 20);
a2dc009afa9ae8 arch/powerpc/mm/pgtable-book3s64.c Aneesh Kumar K.V 2018-08-13  438  }
a2dc009afa9ae8 arch/powerpc/mm/pgtable-book3s64.c Aneesh Kumar K.V 2018-08-13  439  #endif /* CONFIG_PROC_FS */
579b9239c1f386 arch/powerpc/mm/pgtable-book3s64.c Aneesh Kumar K.V 2019-01-23  440  

:::::: The code at line 422 was first introduced by commit
:::::: a2dc009afa9ae8b92305be7728676562a104cb40 powerpc/mm/book3s/radix: Add mapping statistics

:::::: TO: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
:::::: CC: Michael Ellerman <mpe@ellerman.id.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E77D10F7
	for <oe-kbuild-all@lists.linux.dev>; Sun, 21 Jul 2024 03:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721532787; cv=none; b=TFzX73ABQqDPeXgGttWq4l5rKubWkU0LyZV2suv36X5QWHCHoNYCHutMWA1IIjcYlzRE7TxWgMjudtC+sosgWa6EWmt6xMAs9bwsWZEKaAeh8/qFl+y8eoL7Y1+ATf0W9HijcZ61/huM8dLSFTitKgIs6gnR8M9DLJ7JfpvrQEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721532787; c=relaxed/simple;
	bh=eFNA0NXjlaERikLvtoHG8l1q+TBcRKDnDTUMqA1C0OI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lyoSxgvQlfwhjKS3UsJB5IXMbU0CtmPFwZuig5RuEv9wxcdN9m/ZJxgdDXbWHOnwn8TupU+hRJolsl0mhLNo7jyvI15UVmUEXYowUOKgkcGG91B/SVU5orJV0Xm+wJtrCMJWPMxRCgYo4hGk9rRj191Ie8vjhPWM01+XGP9rd6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FwaaD3s9; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FwaaD3s9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721532786; x=1753068786;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eFNA0NXjlaERikLvtoHG8l1q+TBcRKDnDTUMqA1C0OI=;
  b=FwaaD3s9+en+boH1nzHxcYQ1GGHeLI3lQO5qAtMHKJVU9XtbXwDzpfHV
   wihSxvoc//B5xglIPVnHwqRbUfyKRx3AyqJK5ozPVeFd81+eU6WNCwUh3
   4UVQw6hQzaXfB7/bGieB7lyMvc+wU7YQEdA70/PkDxv6YqXAI+dFxTQ4j
   2V8bvtIPbqICeBp2DKrffdlffZR4rSwUMbGUwDdlZtG1zJkZMPbkjVajP
   p4nnZB2VbmO+HnGdKaLplHXL8fFOmJs+1XPJplYqFktCI6pY9LyuBT8ZT
   8qod/IogyF0HCeX4jcfZnqJSsevpqIAaFDOoiNMVFWdAzaxFPXiiNyVSy
   w==;
X-CSE-ConnectionGUID: Ny2FNklRRsOZHv+ZIcJ8Hg==
X-CSE-MsgGUID: wRD9bW2yQa6cGfw1REcQHg==
X-IronPort-AV: E=McAfee;i="6700,10204,11139"; a="36557944"
X-IronPort-AV: E=Sophos;i="6.09,225,1716274800"; 
   d="scan'208";a="36557944"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2024 20:33:05 -0700
X-CSE-ConnectionGUID: q5spp3q/R0WUZ1U9n76Qqg==
X-CSE-MsgGUID: aTqilFR4Ta6fIlk+LNFaEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,225,1716274800"; 
   d="scan'208";a="74732759"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 20 Jul 2024 20:33:03 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sVNJl-000jte-0J;
	Sun, 21 Jul 2024 03:33:01 +0000
Date: Sun, 21 Jul 2024 11:32:07 +0800
From: kernel test robot <lkp@intel.com>
To: "Alex Shi (Tencent)" <alexs@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [alexshi:mmunstable 36/43] include/linux/mm.h:3005:32: error:
 'PTRS_PER_PMD' undeclared; did you mean 'PTRS_PER_PUD'?
Message-ID: <202407211145.4ublXk1y-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alexshi/linux.git mmunstable
head:   6c298a18633e397b8be4d6f48fc8cd1f860dd896
commit: e85f4771561b1e804a7ae4d386e81bc9545bd47d [36/43] mm/pgtable: define pmd_ptdesc() helper out of USE_SPLIT_PMD_PTLOCKS
config: m68k-allnoconfig (https://download.01.org/0day-ci/archive/20240721/202407211145.4ublXk1y-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240721/202407211145.4ublXk1y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407211145.4ublXk1y-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/pagemap.h:8,
                    from lib/buildid.c:7:
   include/linux/mm.h: In function 'pmd_pgtable_page':
>> include/linux/mm.h:3005:32: error: 'PTRS_PER_PMD' undeclared (first use in this function); did you mean 'PTRS_PER_PUD'?
    3005 |         unsigned long mask = ~(PTRS_PER_PMD * sizeof(pmd_t) - 1);
         |                                ^~~~~~~~~~~~
         |                                PTRS_PER_PUD
   include/linux/mm.h:3005:32: note: each undeclared identifier is reported only once for each function it appears in


vim +3005 include/linux/mm.h

3ed3a4f0ddffec Kirill A. Shutemov      2016-03-17  2991  
3ed3a4f0ddffec Kirill A. Shutemov      2016-03-17  2992  #define pte_alloc_map(mm, pmd, address)			\
4cf58924951ef8 Joel Fernandes (Google  2019-01-03  2993) 	(pte_alloc(mm, pmd) ? NULL : pte_offset_map(pmd, address))
1bb3630e89cb8a Hugh Dickins            2005-10-29  2994  
c74df32c724a16 Hugh Dickins            2005-10-29  2995  #define pte_alloc_map_lock(mm, pmd, address, ptlp)	\
4cf58924951ef8 Joel Fernandes (Google  2019-01-03  2996) 	(pte_alloc(mm, pmd) ?			\
c74df32c724a16 Hugh Dickins            2005-10-29  2997  		 NULL : pte_offset_map_lock(mm, pmd, address, ptlp))
c74df32c724a16 Hugh Dickins            2005-10-29  2998  
1bb3630e89cb8a Hugh Dickins            2005-10-29  2999  #define pte_alloc_kernel(pmd, address)			\
4cf58924951ef8 Joel Fernandes (Google  2019-01-03  3000) 	((unlikely(pmd_none(*(pmd))) && __pte_alloc_kernel(pmd))? \
1bb3630e89cb8a Hugh Dickins            2005-10-29  3001  		NULL: pte_offset_kernel(pmd, address))
^1da177e4c3f41 Linus Torvalds          2005-04-16  3002  
7e25de77bc5ea5 Anshuman Khandual       2022-11-25  3003  static inline struct page *pmd_pgtable_page(pmd_t *pmd)
634391ace193d0 Martin Schwidefsky      2014-02-13  3004  {
634391ace193d0 Martin Schwidefsky      2014-02-13 @3005  	unsigned long mask = ~(PTRS_PER_PMD * sizeof(pmd_t) - 1);
634391ace193d0 Martin Schwidefsky      2014-02-13  3006  	return virt_to_page((void *)((unsigned long) pmd & mask));
634391ace193d0 Martin Schwidefsky      2014-02-13  3007  }
634391ace193d0 Martin Schwidefsky      2014-02-13  3008  

:::::: The code at line 3005 was first introduced by commit
:::::: 634391ace193d00c59a691e9fc227b0f8942bad7 mm: mask bits from pmd in pmd_lockptr/pmd_huge_pte

:::::: TO: Martin Schwidefsky <schwidefsky@de.ibm.com>
:::::: CC: Martin Schwidefsky <schwidefsky@de.ibm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

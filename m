Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47CDA6D18
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Nov 2023 05:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AIOUWff4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699680067; x=1731216067;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6DAcsZSmlaJZUg0ggETEj1N+Moqk+gXgyuTxxW9kWc8=;
  b=AIOUWff4id5Wk7Q+N0d/xwBhiHg+S8og0sY7Z8K+cmgoJ5awgLb5QrHz
   txFvfrfDsBbOpYF0OOybvX6Op7hIxXfBwGCvaNKRrylYyfB0vHs8Hz24t
   DXYfIp4K/g2kum/E8WclhHE+fMwQLGAoxVzJzWimR1OKpbbWk8tHNz7zl
   fpLl4dZUXxCVVQ0EcDFQcEApGwOSGRG/TC2dW/g7DQPpJPSIPvI9O5eij
   xyoZq6hEH5tew805hVEFGHg8KVWM+9ppFZEZm55Se+Nn73HFXiduWAe//
   ShnuCIHMcYu429/5WGzZ3tG1YixMZ75LVeNqOT8Tq99VxnPyolGGxBqlD
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="421353365"
X-IronPort-AV: E=Sophos;i="6.03,294,1694761200"; 
   d="scan'208";a="421353365"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2023 21:21:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="767467544"
X-IronPort-AV: E=Sophos;i="6.03,294,1694761200"; 
   d="scan'208";a="767467544"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 10 Nov 2023 21:21:03 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r1gQX-000AEb-1X;
	Sat, 11 Nov 2023 05:21:01 +0000
Date: Sat, 11 Nov 2023 13:20:50 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Hruska <lhruska@suse.cz>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 2/4 v1] livedump: Add write protection management
Message-ID: <202311111350.ddmhyoBh-lkp@intel.com>
References: <20231110150057.15717-3-lhruska@suse.cz>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231110150057.15717-3-lhruska@suse.cz>

Hi Lukas,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/x86/core]
[also build test WARNING on tip/x86/mm linus/master v6.6 next-20231110]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Lukas-Hruska/crash-vmcore-VMCOREINFO-creation-from-non-kdump-kernel/20231111-022332
base:   tip/x86/core
patch link:    https://lore.kernel.org/r/20231110150057.15717-3-lhruska%40suse.cz
patch subject: [RFC PATCH 2/4 v1] livedump: Add write protection management
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20231111/202311111350.ddmhyoBh-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231111/202311111350.ddmhyoBh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311111350.ddmhyoBh-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/x86/mm/wrprotect.c: In function 'split_large_pages':
>> arch/x86/mm/wrprotect.c:103:13: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
     103 |         int ret;
         |             ^~~
   arch/x86/mm/wrprotect.c: In function 'handle_tasks':
   arch/x86/mm/wrprotect.c:263:9: error: implicit declaration of function 'do_each_thread'; did you mean 'for_each_thread'? [-Werror=implicit-function-declaration]
     263 |         do_each_thread(p, t) {
         |         ^~~~~~~~~~~~~~
         |         for_each_thread
   arch/x86/mm/wrprotect.c:263:29: error: expected ';' before '{' token
     263 |         do_each_thread(p, t) {
         |                             ^~
         |                             ;
   In file included from include/linux/pgtable.h:6,
                    from include/linux/mm.h:29,
                    from arch/x86/include/asm/wrprotect.h:23,
                    from arch/x86/mm/wrprotect.c:21:
   arch/x86/mm/wrprotect.c: In function 'protect_pte':
   arch/x86/include/asm/pgtable.h:461:21: error: too few arguments to function 'pte_mkwrite'
     461 | #define pte_mkwrite pte_mkwrite
         |                     ^~~~~~~~~~~
   arch/x86/mm/wrprotect.c:386:23: note: in expansion of macro 'pte_mkwrite'
     386 |                 pte = pte_mkwrite(pte);
         |                       ^~~~~~~~~~~
   arch/x86/include/asm/pgtable.h:460:7: note: declared here
     460 | pte_t pte_mkwrite(pte_t pte, struct vm_area_struct *vma);
         |       ^~~~~~~~~~~
   arch/x86/mm/wrprotect.c: In function 'wrprotect_uninit':
   arch/x86/mm/wrprotect.c:728:13: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
     728 |         int ret;
         |             ^~~
   cc1: some warnings being treated as errors


vim +/ret +103 arch/x86/mm/wrprotect.c

    95	
    96	/* split_large_pages
    97	 *
    98	 * This function splits all large pages in straight mapping area into 4K ones.
    99	 * Currently wrprotect supports only 4K pages, and so this is needed.
   100	 */
   101	static int split_large_pages(void)
   102	{
 > 103		int ret;
   104		struct mm_walk_ops split_large_pages_walk_ops;
   105	
   106		memset(&split_large_pages_walk_ops, 0, sizeof(struct mm_walk_ops));
   107		split_large_pages_walk_ops.pud_entry = split_large_pages_walk_pud;
   108		split_large_pages_walk_ops.pmd_entry = split_large_pages_walk_pmd;
   109	
   110		mmap_write_lock(&init_mm);
   111		ret = walk_page_range_novma(&init_mm, PAGE_OFFSET, PAGE_OFFSET + DIRECT_MAP_SIZE,
   112			&split_large_pages_walk_ops, init_mm.pgd, NULL);
   113		mmap_write_unlock(&init_mm);
   114	
   115		return 0;
   116	}
   117	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

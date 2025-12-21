Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2527C154BE2
	for <oe-kbuild-all@lists.linux.dev>; Sun, 21 Dec 2025 22:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766357304; cv=none; b=GX7VjJDoU315HMBhNdOaBnBORnl0LxJsRCwGQln9QwAVpVylaSBXL/t3E1hUejHI+We3W9p5Ve6FUeazXzd9De9LBikv5TCHdHtqJnooCFVt2AyT7O/1pYPCGJFzssmgbxFRBsfagoCBV5HIicY0k/UhUM5y7qoA/jDkl9Z8c68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766357304; c=relaxed/simple;
	bh=HuF7Iw3jiX1AuIDltrpCANgtzPXgho1ORNSQL3ILass=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PgX/emFdqjRHbiphNnM9NLmTow8K9BZ/Bzthbzdh80+qoxx2zo7T1B8OD9/ds0mxRi+AwslE9rO+rsopvCX0nKnuSgKtuR2qPdo8J8RGNqNjWdeag+nihf3wFHwVppxnm6I5QMOZdbI0KY3lGqu+LP+nZzF8uexH3RE0W6ap+tA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oJbu3abc; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oJbu3abc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766357302; x=1797893302;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HuF7Iw3jiX1AuIDltrpCANgtzPXgho1ORNSQL3ILass=;
  b=oJbu3abcUtQ5HCTDrdklFo30XE0oAQaRI6gU/G+uIaRujygfeGbcF9t5
   bVfjGuLApewKRzc1NywggvfrJ9/W7Fpk+JXlG7v7zlwiypjQCPhfIrQAI
   nj7N9FaJPq8C5anrHV2o+aWM2mP1tPxtMBXzAtj3oGi0LkVPmizc3m+21
   zSwuKAkRTMrQGVVcSIwkzd8aVWt+GeYLBXg/QhNI1jdNzMufez7T1C9bw
   qtzs1SqOxgqdV7gKiS14BAfoVBaeez+3jY3DyCu/5EEiyiQFmWSM4GrAo
   Y+WORdHpHfTGtfSau9fuoHhTsZeboaPqDS0cgcNQFkXX8VM31tQooI1bb
   w==;
X-CSE-ConnectionGUID: ihBT2brFSjueMUIlBXmuJg==
X-CSE-MsgGUID: fB794v+rTjqCrmGPPkhLFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="78938940"
X-IronPort-AV: E=Sophos;i="6.21,166,1763452800"; 
   d="scan'208";a="78938940"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 14:48:22 -0800
X-CSE-ConnectionGUID: 5GC22FrWQeitCNn2Q90mRw==
X-CSE-MsgGUID: XD/+xXPjQEavrh26Tjzx+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,166,1763452800"; 
   d="scan'208";a="198532539"
Received: from lkp-server01.sh.intel.com (HELO 0713df988ca2) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 21 Dec 2025 14:48:21 -0800
Received: from kbuild by 0713df988ca2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXSDp-000000000GB-427r;
	Sun, 21 Dec 2025 22:48:17 +0000
Date: Mon, 22 Dec 2025 06:48:09 +0800
From: kernel test robot <lkp@intel.com>
To: alexs@kernel.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [alexshi:ptdesc1217 1/1] arch/xtensa/include/asm/pgalloc.h:58:7:
 error: assignment to 'struct page *' from incompatible pointer type
 'pgtable_t' {aka 'struct ptdesc *'}
Message-ID: <202512220624.cxcWToU5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alexshi/linux.git ptdesc1217
head:   5a13c35972782c993b40bf3d92ada4db87f4ee5e
commit: 5a13c35972782c993b40bf3d92ada4db87f4ee5e [1/1] mm/pgtable: convert pgtable_t to ptdesc pointer
config: xtensa-randconfig-r072-20251221 (https://download.01.org/0day-ci/archive/20251222/202512220624.cxcWToU5-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251222/202512220624.cxcWToU5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512220624.cxcWToU5-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/pgalloc.h:6,
                    from mm/filemap.c:51:
   arch/xtensa/include/asm/pgalloc.h: In function 'pte_alloc_one':
>> arch/xtensa/include/asm/pgalloc.h:58:7: error: assignment to 'struct page *' from incompatible pointer type 'pgtable_t' {aka 'struct ptdesc *'} [-Werror=incompatible-pointer-types]
     page = __pte_alloc_one(mm, GFP_PGTABLE_USER);
          ^
>> arch/xtensa/include/asm/pgalloc.h:62:9: error: returning 'struct page *' from a function with incompatible return type 'pgtable_t' {aka 'struct ptdesc *'} [-Werror=incompatible-pointer-types]
     return page;
            ^~~~
   cc1: some warnings being treated as errors
--
   In file included from include/linux/pgalloc.h:6,
                    from mm/memory.c:79:
   arch/xtensa/include/asm/pgalloc.h: In function 'pte_alloc_one':
>> arch/xtensa/include/asm/pgalloc.h:58:7: error: assignment to 'struct page *' from incompatible pointer type 'pgtable_t' {aka 'struct ptdesc *'} [-Werror=incompatible-pointer-types]
     page = __pte_alloc_one(mm, GFP_PGTABLE_USER);
          ^
>> arch/xtensa/include/asm/pgalloc.h:62:9: error: returning 'struct page *' from a function with incompatible return type 'pgtable_t' {aka 'struct ptdesc *'} [-Werror=incompatible-pointer-types]
     return page;
            ^~~~
   In file included from include/linux/shm.h:6,
                    from include/linux/sched.h:23,
                    from include/linux/percpu.h:12,
                    from include/linux/kernel_stat.h:7,
                    from mm/memory.c:42:
   mm/memory.c: In function 'pmd_install':
   include/asm-generic/memory_model.h:19:53: error: invalid operands to binary - (have 'pgtable_t' {aka 'struct ptdesc *'} and 'struct page *')
    #define __page_to_pfn(page) ((unsigned long)((page) - mem_map) + \
                                                 ~~~~~~ ^
   arch/xtensa/include/asm/page.h:169:29: note: in definition of macro '__va'
     ((void *)((unsigned long) (x) - PHYS_OFFSET + PAGE_OFFSET))
                                ^
   include/asm-generic/memory_model.h:73:21: note: in expansion of macro '__page_to_pfn'
    #define page_to_pfn __page_to_pfn
                        ^~~~~~~~~~~~~
   arch/xtensa/include/asm/page.h:172:33: note: in expansion of macro 'page_to_pfn'
    #define page_to_virt(page) __va(page_to_pfn(page) << PAGE_SHIFT)
                                    ^~~~~~~~~~~
   arch/xtensa/include/asm/pgalloc.h:27:38: note: in expansion of macro 'page_to_virt'
     (pmd_val(*(pmdp)) = ((unsigned long)page_to_virt(page)))
                                         ^~~~~~~~~~~~
   mm/memory.c:445:3: note: in expansion of macro 'pmd_populate'
      pmd_populate(mm, pmd, *pte);
      ^~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from include/linux/pgalloc.h:6,
                    from mm/debug_vm_pgtable.c:33:
   arch/xtensa/include/asm/pgalloc.h: In function 'pte_alloc_one':
>> arch/xtensa/include/asm/pgalloc.h:58:7: error: assignment to 'struct page *' from incompatible pointer type 'pgtable_t' {aka 'struct ptdesc *'} [-Werror=incompatible-pointer-types]
     page = __pte_alloc_one(mm, GFP_PGTABLE_USER);
          ^
>> arch/xtensa/include/asm/pgalloc.h:62:9: error: returning 'struct page *' from a function with incompatible return type 'pgtable_t' {aka 'struct ptdesc *'} [-Werror=incompatible-pointer-types]
     return page;
            ^~~~
   In file included from include/linux/mm_types_task.h:14,
                    from include/linux/mm_types.h:5,
                    from include/linux/mmzone.h:22,
                    from include/linux/gfp.h:7,
                    from mm/debug_vm_pgtable.c:13:
   mm/debug_vm_pgtable.c: In function 'pmd_populate_tests':
   include/asm-generic/memory_model.h:19:53: error: invalid operands to binary - (have 'pgtable_t' {aka 'struct ptdesc *'} and 'struct page *')
    #define __page_to_pfn(page) ((unsigned long)((page) - mem_map) + \
                                                 ~~~~~~ ^
   arch/xtensa/include/asm/page.h:169:29: note: in definition of macro '__va'
     ((void *)((unsigned long) (x) - PHYS_OFFSET + PAGE_OFFSET))
                                ^
   include/asm-generic/memory_model.h:73:21: note: in expansion of macro '__page_to_pfn'
    #define page_to_pfn __page_to_pfn
                        ^~~~~~~~~~~~~
   arch/xtensa/include/asm/page.h:172:33: note: in expansion of macro 'page_to_pfn'
    #define page_to_virt(page) __va(page_to_pfn(page) << PAGE_SHIFT)
                                    ^~~~~~~~~~~
   arch/xtensa/include/asm/pgalloc.h:27:38: note: in expansion of macro 'page_to_virt'
     (pmd_val(*(pmdp)) = ((unsigned long)page_to_virt(page)))
                                         ^~~~~~~~~~~~
   mm/debug_vm_pgtable.c:655:2: note: in expansion of macro 'pmd_populate'
     pmd_populate(args->mm, args->pmdp, args->start_ptep);
     ^~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +58 arch/xtensa/include/asm/pgalloc.h

9a8fd558990215 include/asm-xtensa/pgalloc.h      Chris Zankel            2005-06-23  53  
4cf58924951ef8 arch/xtensa/include/asm/pgalloc.h Joel Fernandes (Google  2019-01-03  54) static inline pgtable_t pte_alloc_one(struct mm_struct *mm)
6656920b0b50be include/asm-xtensa/pgalloc.h      Chris Zankel            2007-08-22  55  {
2f569afd9ced9e include/asm-xtensa/pgalloc.h      Martin Schwidefsky      2008-02-08  56  	struct page *page;
2f569afd9ced9e include/asm-xtensa/pgalloc.h      Martin Schwidefsky      2008-02-08  57  
7278914ca1fdb5 arch/xtensa/include/asm/pgalloc.h Mike Rapoport           2020-08-06 @58  	page = __pte_alloc_one(mm, GFP_PGTABLE_USER);
7278914ca1fdb5 arch/xtensa/include/asm/pgalloc.h Mike Rapoport           2020-08-06  59  	if (!page)
8f43123d170ad9 arch/xtensa/include/asm/pgalloc.h Kiryl Shutsemau         2013-11-14  60  		return NULL;
7278914ca1fdb5 arch/xtensa/include/asm/pgalloc.h Mike Rapoport           2020-08-06  61  	ptes_clear(page_address(page));
2f569afd9ced9e include/asm-xtensa/pgalloc.h      Martin Schwidefsky      2008-02-08 @62  	return page;
9a8fd558990215 include/asm-xtensa/pgalloc.h      Chris Zankel            2005-06-23  63  }
9a8fd558990215 include/asm-xtensa/pgalloc.h      Chris Zankel            2005-06-23  64  

:::::: The code at line 58 was first introduced by commit
:::::: 7278914ca1fdb54ba101c8617fb86953b31348cd xtensa: switch to generic version of pte allocation

:::::: TO: Mike Rapoport <rppt@linux.ibm.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

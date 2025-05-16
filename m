Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA6A1182
	for <oe-kbuild-all@lists.linux.dev>; Fri, 16 May 2025 00:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747353943; cv=none; b=DrpmH6tlip7+BhJczbkx6N9gQpbDMaRt1Mgww3u9ZKJS6T3MyUUrmGmnIj+fmfvsm8vWerM9YkF+My1itzAfLaB8XGT1cMFmlgOf15Fscfh+8bKL6+yEWrT1IFq3DFccSu7sc1hP415A4am+lrLSqxXKBrHndCoJFPK8Sp+EwlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747353943; c=relaxed/simple;
	bh=z/YHFbvHDM2woFqjkkVYMbuhjWiCRdPhoz6E4LZpPXQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Zb+LQIZ54hVjWYd34dlFzECX09qnLAM2nyDPKKebOfT2rT8T2dQMfnUl0b7xlGu1zjdqmiHq3NvB0QJReN9Rq1tut5PBVHlGlPO/tpfvCthLzL6+VQQ7r1qDxKwxnY+lzmz3VDdwXxanFDpy32wchldbOwUz5zXf1F8GcA6k5LM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A6yXkIUG; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A6yXkIUG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747353942; x=1778889942;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=z/YHFbvHDM2woFqjkkVYMbuhjWiCRdPhoz6E4LZpPXQ=;
  b=A6yXkIUGBBtYzTTLCiAVhYdcDRtMGV7uM8pLk5RY+6GneluBMtFcHk2n
   iLwdlWPhyT61L2GP5If5KlpCI5SU/AeUPHafn8YRUNN2O9KiFygBBkGK3
   dduJ9w/qUU04+O5igAfMmBSj53svYJXBW88cii63BmFAPIJ5hWw6y+1yE
   QXYOddMTIl2/MhXzFeT2u9b2IqrNgM6z4/JVR/ipMan/82UGyBTJokcMn
   PdIlbHDYE9Z24TW1rLc3pm8St4IRGsfPnKopykF1D1vqRHgbvKenpE5K7
   +jZpNCaZUT2ZqAq9DswRMUn6BM4ja5oz1KTHPeDUui6V+7wb9aciy78Jj
   Q==;
X-CSE-ConnectionGUID: 63qn6cR+RJidPKZLI2zg3g==
X-CSE-MsgGUID: rzvs05PwR6WOvrBgoLJSOA==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="60654500"
X-IronPort-AV: E=Sophos;i="6.15,292,1739865600"; 
   d="scan'208";a="60654500"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 17:05:41 -0700
X-CSE-ConnectionGUID: kQE07YZKQ1yHcgbjtJm8sg==
X-CSE-MsgGUID: 55SOaukfR5KWHig/Q1fPbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,292,1739865600"; 
   d="scan'208";a="138422183"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 15 May 2025 17:05:40 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uFia1-000IrH-1T;
	Fri, 16 May 2025 00:05:37 +0000
Date: Fri, 16 May 2025 08:05:35 +0800
From: kernel test robot <lkp@intel.com>
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [akpm-mm:mm-new 85/89] arch/m68k/mm/motorola.c:108:55: error:
 'struct page' has no member named 'index'
Message-ID: <202505160824.HVpDXsLL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-new
head:   f7bdf6947ac702f4715ea8fdfbc2a43feb46bc0c
commit: bb6d5f838892be8285499f358b14a97b8f7cc168 [85/89] mm: rename page->index to page->__folio_index
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20250516/202505160824.HVpDXsLL-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250516/202505160824.HVpDXsLL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505160824.HVpDXsLL-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/m68k/mm/motorola.c: In function 'init_pointer_table':
>> arch/m68k/mm/motorola.c:108:55: error: 'struct page' has no member named 'index'
     108 | #define PD_MARKBITS(dp) (*(unsigned int *)&PD_PAGE(dp)->index)
         |                                                       ^~
   arch/m68k/mm/motorola.c:127:15: note: in expansion of macro 'PD_MARKBITS'
     127 |         if (!(PD_MARKBITS(dp) & mask)) {
         |               ^~~~~~~~~~~
>> arch/m68k/mm/motorola.c:108:55: error: 'struct page' has no member named 'index'
     108 | #define PD_MARKBITS(dp) (*(unsigned int *)&PD_PAGE(dp)->index)
         |                                                       ^~
   arch/m68k/mm/motorola.c:128:17: note: in expansion of macro 'PD_MARKBITS'
     128 |                 PD_MARKBITS(dp) = ptable_mask(type);
         |                 ^~~~~~~~~~~
>> arch/m68k/mm/motorola.c:108:55: error: 'struct page' has no member named 'index'
     108 | #define PD_MARKBITS(dp) (*(unsigned int *)&PD_PAGE(dp)->index)
         |                                                       ^~
   arch/m68k/mm/motorola.c:132:9: note: in expansion of macro 'PD_MARKBITS'
     132 |         PD_MARKBITS(dp) &= ~mask;
         |         ^~~~~~~~~~~
>> arch/m68k/mm/motorola.c:108:55: error: 'struct page' has no member named 'index'
     108 | #define PD_MARKBITS(dp) (*(unsigned int *)&PD_PAGE(dp)->index)
         |                                                       ^~
   include/linux/dynamic_debug.h:224:29: note: in expansion of macro 'PD_MARKBITS'
     224 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:248:9: note: in expansion of macro '__dynamic_func_call_cls'
     248 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:250:9: note: in expansion of macro '_dynamic_func_call_cls'
     250 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:269:9: note: in expansion of macro '_dynamic_func_call'
     269 |         _dynamic_func_call(fmt, __dynamic_pr_debug,             \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/printk.h:631:9: note: in expansion of macro 'dynamic_pr_debug'
     631 |         dynamic_pr_debug(fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~
   arch/m68k/mm/motorola.c:133:9: note: in expansion of macro 'pr_debug'
     133 |         pr_debug("init_pointer_table: %lx, %x\n", ptable, PD_MARKBITS(dp));
         |         ^~~~~~~~
   arch/m68k/mm/motorola.c: In function 'get_pointer_table':
>> arch/m68k/mm/motorola.c:108:55: error: 'struct page' has no member named 'index'
     108 | #define PD_MARKBITS(dp) (*(unsigned int *)&PD_PAGE(dp)->index)
         |                                                       ^~
   arch/m68k/mm/motorola.c:145:66: note: in expansion of macro 'PD_MARKBITS'
     145 |         unsigned int mask = list_empty(&ptable_list[type]) ? 0 : PD_MARKBITS(dp);
         |                                                                  ^~~~~~~~~~~
>> arch/m68k/mm/motorola.c:108:55: error: 'struct page' has no member named 'index'
     108 | #define PD_MARKBITS(dp) (*(unsigned int *)&PD_PAGE(dp)->index)
         |                                                       ^~
   arch/m68k/mm/motorola.c:180:17: note: in expansion of macro 'PD_MARKBITS'
     180 |                 PD_MARKBITS(new) = ptable_mask(type) - 1;
         |                 ^~~~~~~~~~~
>> arch/m68k/mm/motorola.c:108:55: error: 'struct page' has no member named 'index'
     108 | #define PD_MARKBITS(dp) (*(unsigned int *)&PD_PAGE(dp)->index)
         |                                                       ^~
   arch/m68k/mm/motorola.c:188:9: note: in expansion of macro 'PD_MARKBITS'
     188 |         PD_MARKBITS(dp) = mask & ~tmp;
         |         ^~~~~~~~~~~
>> arch/m68k/mm/motorola.c:108:55: error: 'struct page' has no member named 'index'
     108 | #define PD_MARKBITS(dp) (*(unsigned int *)&PD_PAGE(dp)->index)
         |                                                       ^~
   arch/m68k/mm/motorola.c:189:14: note: in expansion of macro 'PD_MARKBITS'
     189 |         if (!PD_MARKBITS(dp)) {
         |              ^~~~~~~~~~~
   arch/m68k/mm/motorola.c: In function 'free_pointer_table':
>> arch/m68k/mm/motorola.c:108:55: error: 'struct page' has no member named 'index'
     108 | #define PD_MARKBITS(dp) (*(unsigned int *)&PD_PAGE(dp)->index)
         |                                                       ^~
   arch/m68k/mm/motorola.c:204:13: note: in expansion of macro 'PD_MARKBITS'
     204 |         if (PD_MARKBITS (dp) & mask)
         |             ^~~~~~~~~~~
>> arch/m68k/mm/motorola.c:108:55: error: 'struct page' has no member named 'index'
     108 | #define PD_MARKBITS(dp) (*(unsigned int *)&PD_PAGE(dp)->index)
         |                                                       ^~
   arch/m68k/mm/motorola.c:207:9: note: in expansion of macro 'PD_MARKBITS'
     207 |         PD_MARKBITS (dp) |= mask;
         |         ^~~~~~~~~~~
>> arch/m68k/mm/motorola.c:108:55: error: 'struct page' has no member named 'index'
     108 | #define PD_MARKBITS(dp) (*(unsigned int *)&PD_PAGE(dp)->index)
         |                                                       ^~
   arch/m68k/mm/motorola.c:209:13: note: in expansion of macro 'PD_MARKBITS'
     209 |         if (PD_MARKBITS(dp) == ptable_mask(type)) {
         |             ^~~~~~~~~~~


vim +108 arch/m68k/mm/motorola.c

5ad272abee9fe0 Peter Zijlstra 2020-01-31  105  
8f246087724a2f Linus Walleij  2022-06-03  106  #define PD_PTABLE(page) ((ptable_desc *)&(virt_to_page((void *)(page))->lru))
5ad272abee9fe0 Peter Zijlstra 2020-01-31  107  #define PD_PAGE(ptable) (list_entry(ptable, struct page, lru))
0e071ee6815692 Peter Zijlstra 2020-01-31 @108  #define PD_MARKBITS(dp) (*(unsigned int *)&PD_PAGE(dp)->index)
0e071ee6815692 Peter Zijlstra 2020-01-31  109  

:::::: The code at line 108 was first introduced by commit
:::::: 0e071ee6815692a3b241bbe9a9a29f7cdec023ed m68k: mm: Extend table allocator for multiple sizes

:::::: TO: Peter Zijlstra <peterz@infradead.org>
:::::: CC: Geert Uytterhoeven <geert@linux-m68k.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

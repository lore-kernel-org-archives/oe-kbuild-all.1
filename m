Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B985221277
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Aug 2025 10:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755080649; cv=none; b=Zx4mhpNLsWoZm0ATIxHXYAY6+IbzDFXcoQhrCdr9opaeNjZf6uJ6zu+kOlRyDvLE8Yk3wl/epag9dirfb7ZPuJGqweyBCs8T2xfIp6gdwATimyRnqDh/pHjKp3l4jrfTfKYs5pM9L7xVOydbNEoz5nIVk5HpvHR65fS+Dt6Y83M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755080649; c=relaxed/simple;
	bh=cdN6jUduADSVJG+LrCgLE+1pdW2Ltg5jORa1YcWObbY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BkOqLk3asECraJ/UX1Zm4NvwNCJ00xjDJki7RbGmhxsgULHU2FbPPJMr84qFX3zUITxIEYnnlszHsOevdsfZn6/i0uCbtAG+tJQB/vzCa/DDBhZOIRB4Tis//4ctuus2rPXoubg/CTaoGqxW8gGgKvQeZJh6zEblZ26wvrhZoY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TTmfRYr1; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TTmfRYr1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755080647; x=1786616647;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cdN6jUduADSVJG+LrCgLE+1pdW2Ltg5jORa1YcWObbY=;
  b=TTmfRYr1QBHW/HCLj5kIcWwnVEVUvSFjCPoV653njHhpjRQpHovbDECU
   WNQkz2lgsks4cHbHSLf2txCN1act3/GJFaBgNLvtJ5eM6KTyE21HlAm63
   N+O5KeZBCm0OhmatJYElj3KGcGPlr8tM0GHAT+9fADub1TxXp0u3jVSxD
   Gkhl8MUan/WSoiJzlsddpl2ZBvTwYxl2DTmMaN4LVMo8YUB6ulURLYYzo
   baDJvnh1iTiGHwXF+ZmdsaTK3xLLB606rl0jcMQdeJuKeujol9lM969Pn
   qINX7POKtrcJVJsn5tSq4SmQh8k8L3FfOG0r1540ucvFju4Tg5/HKHtY+
   g==;
X-CSE-ConnectionGUID: ZtjiWrUSTnKWZLJisD8p6g==
X-CSE-MsgGUID: ZX9tfcDaQKiCXLN7kuG4ZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="44947177"
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; 
   d="scan'208";a="44947177"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2025 03:24:07 -0700
X-CSE-ConnectionGUID: 6SEpX4RqTySoFfY5gMvlFA==
X-CSE-MsgGUID: ESYd6YFcTIS9gruYAWrKxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; 
   d="scan'208";a="166703547"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 13 Aug 2025 03:24:06 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1um8eJ-0009ma-1N;
	Wed, 13 Aug 2025 10:24:03 +0000
Date: Wed, 13 Aug 2025 18:23:22 +0800
From: kernel test robot <lkp@intel.com>
To: Baoquan He <bhe@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 12/12] mm/kasan: make kasan=on|off take effect for all
 three modes
Message-ID: <202508131826.n8gKkeXB-lkp@intel.com>
References: <20250812124941.69508-13-bhe@redhat.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250812124941.69508-13-bhe@redhat.com>

Hi Baoquan,

kernel test robot noticed the following build errors:

[auto build test ERROR on powerpc/next]
[also build test ERROR on powerpc/fixes jcmvbkbc-xtensa/xtensa-for-next linus/master v6.17-rc1]
[cannot apply to akpm-mm/mm-everything next-20250813]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Baoquan-He/mm-kasan-add-conditional-checks-in-functions-to-return-directly-if-kasan-is-disabled/20250812-205253
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
patch link:    https://lore.kernel.org/r/20250812124941.69508-13-bhe%40redhat.com
patch subject: [PATCH v2 12/12] mm/kasan: make kasan=on|off take effect for all three modes
config: um-randconfig-001-20250813 (https://download.01.org/0day-ci/archive/20250813/202508131826.n8gKkeXB-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250813/202508131826.n8gKkeXB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508131826.n8gKkeXB-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/static_key.h:1,
                    from include/linux/alloc_tag.h:15,
                    from include/linux/percpu.h:5,
                    from include/linux/percpu_counter.h:14,
                    from include/linux/mm_types.h:21,
                    from include/linux/mmzone.h:22,
                    from include/linux/gfp.h:7,
                    from include/linux/umh.h:4,
                    from include/linux/kmod.h:9,
                    from include/linux/module.h:17,
                    from arch/um/kernel/mem.c:7:
   arch/um/kernel/mem.c: In function 'arch_mm_preinit':
>> arch/um/kernel/mem.c:65:31: error: 'kasan_flag_enabled' undeclared (first use in this function); did you mean 'kasan_hw_tags_enabled'?
      65 |         static_branch_enable(&kasan_flag_enabled);
         |                               ^~~~~~~~~~~~~~~~~~
   include/linux/jump_label.h:536:69: note: in definition of macro 'static_branch_enable'
     536 | #define static_branch_enable(x)                 static_key_enable(&(x)->key)
         |                                                                     ^
   arch/um/kernel/mem.c:65:31: note: each undeclared identifier is reported only once for each function it appears in
      65 |         static_branch_enable(&kasan_flag_enabled);
         |                               ^~~~~~~~~~~~~~~~~~
   include/linux/jump_label.h:536:69: note: in definition of macro 'static_branch_enable'
     536 | #define static_branch_enable(x)                 static_key_enable(&(x)->key)
         |                                                                     ^


vim +65 arch/um/kernel/mem.c

^1da177e4c3f41 Linus Torvalds            2005-04-16  61  
0d98484ee3330c Mike Rapoport (Microsoft  2025-03-13  62) void __init arch_mm_preinit(void)
^1da177e4c3f41 Linus Torvalds            2005-04-16  63  {
d44671c927e02c Baoquan He                2025-08-12  64  	/* Safe to call after jump_label_init(). Enables KASAN. */
d44671c927e02c Baoquan He                2025-08-12 @65  	static_branch_enable(&kasan_flag_enabled);
d44671c927e02c Baoquan He                2025-08-12  66  
^1da177e4c3f41 Linus Torvalds            2005-04-16  67  	/* clear the zero-page */
c0a9290ecf0dbb WANG Cong                 2008-02-04  68  	memset(empty_zero_page, 0, PAGE_SIZE);
^1da177e4c3f41 Linus Torvalds            2005-04-16  69  
^1da177e4c3f41 Linus Torvalds            2005-04-16  70  	/* Map in the area just after the brk now that kmalloc is about
^1da177e4c3f41 Linus Torvalds            2005-04-16  71  	 * to be turned on.
^1da177e4c3f41 Linus Torvalds            2005-04-16  72  	 */
^1da177e4c3f41 Linus Torvalds            2005-04-16  73  	brk_end = (unsigned long) UML_ROUND_UP(sbrk(0));
ab26a5276c1b09 Jeff Dike                 2008-02-04  74  	map_memory(brk_end, __pa(brk_end), uml_reserved - brk_end, 1, 1, 0);
4421cca0a3e483 Mike Rapoport             2021-11-05  75  	memblock_free((void *)brk_end, uml_reserved - brk_end);
^1da177e4c3f41 Linus Torvalds            2005-04-16  76  	uml_reserved = brk_end;
e82cf3051e6193 Tiwei Bie                 2025-02-21  77  	min_low_pfn = PFN_UP(__pa(uml_reserved));
0d98484ee3330c Mike Rapoport (Microsoft  2025-03-13  78) 	max_pfn = max_low_pfn;
0d98484ee3330c Mike Rapoport (Microsoft  2025-03-13  79) }
^1da177e4c3f41 Linus Torvalds            2005-04-16  80  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

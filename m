Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39862274FCF
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Apr 2025 22:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745965653; cv=none; b=Vv0VdAInvImPhovaPHbxtjVrow8XydKMDE/C1TXJh4fproWMDJCRW1pvS4O7+nBPppjioWLqtczlS7Kag5Sv51KGcGo7JxQyW3jCbQ+LZxniHYCjiAO7hcdp9HaEcqEj9OkUuT3tk3sRQ1ga10HCknUy+IyCx+d0SFBP8YVVDo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745965653; c=relaxed/simple;
	bh=Pag0FPcnhWBQBIutMJ0x+aKrjbSHlO1C+flVK7qCHYg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UMmukxGufjMzqggj35a/RfvJArePXxnIP4QKL6EPnoXDmOejEXOclxlXLHDorbfbh9txX/dg49oVy/BUQ0bgrqoh/DafvQvR7KGZpHwFNMbEj6DdQ+s9SdCsz/GsxBAZAh8pMjL0OApAPiiV2SxovrUNceNb4tHJJ6Qo+ACV11w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Iv7u6q2+; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Iv7u6q2+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745965651; x=1777501651;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Pag0FPcnhWBQBIutMJ0x+aKrjbSHlO1C+flVK7qCHYg=;
  b=Iv7u6q2+v5lAdTassUzvaLYlVQkcNVbmOgwskMN8CGBa1/Xz4h+tvGJL
   UN7api9XXBlZtIZufTdEwqU9XlvP6G9bLukbvMXIn5DbvkV+soD+aPTk6
   kBWjFJ9GupSSzRARTT66wL95UTwJ0jUU9GL4GMC8U21JF42Hzx4hN60Os
   jZrUuckZXZmigYoo44eX+Xe/AqW65Aybc60L3qF7LyapJGxrHUE8naViB
   Fk8ngqMrRDo6LkowIKIsByxldN7WEIO/F0ikwfUOo2/RSoft2/Vcdy5aX
   GbY0dfrJ+CHc/KSmvHSvBamBVaeAFD1GVlI+lQlnyw0IqP7nVY/QlKGFX
   A==;
X-CSE-ConnectionGUID: N09FoF26SzuoD3crJ5kqsA==
X-CSE-MsgGUID: 9JnCdznBRCSyvDbLg/xVhw==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="47621307"
X-IronPort-AV: E=Sophos;i="6.15,250,1739865600"; 
   d="scan'208";a="47621307"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 15:27:31 -0700
X-CSE-ConnectionGUID: mesilu9BQHeJCpqLHgCETA==
X-CSE-MsgGUID: suF0JcXBSM2+AAhUJxMPTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,250,1739865600"; 
   d="scan'208";a="138755454"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 29 Apr 2025 15:27:30 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u9tQF-0002zD-0j;
	Tue, 29 Apr 2025 22:27:27 +0000
Date: Wed, 30 Apr 2025 06:27:02 +0800
From: kernel test robot <lkp@intel.com>
To: David Hildenbrand <david@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [davidhildenbrand:pat 5/10] include/linux/pgtable.h:1493:1: error:
 expected declaration specifiers or '...' before '{' token
Message-ID: <202504300652.xffIda1s-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/davidhildenbrand/linux pat
head:   f60106362383c7fbbe2d6fc75c7fc17a85ed2da9
commit: 198b01f86519142d65d84243c329c8beb5f9117a [5/10] x86/mm/pat: remove old pfnmap tracking interface
config: riscv-randconfig-001-20250430 (https://download.01.org/0day-ci/archive/20250430/202504300652.xffIda1s-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250430/202504300652.xffIda1s-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504300652.xffIda1s-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from include/linux/mm.h:31:0,
                    from arch/riscv/kernel/asm-offsets.c:8:
>> include/linux/pgtable.h:1493:1: error: expected declaration specifiers or '...' before '{' token
    {
    ^
>> include/linux/pgtable.h:1766:20: error: storage class specified for parameter 'init_espfix_bsp'
    static inline void init_espfix_bsp(void) { }
                       ^~~~~~~~~~~~~~~
>> include/linux/pgtable.h:1766:20: warning: parameter 'init_espfix_bsp' declared 'inline'
>> include/linux/pgtable.h:1766:1: warning: '__gnu_inline__' attribute ignored [-Wattributes]
    static inline void init_espfix_bsp(void) { }
    ^~~~~~
>> include/linux/pgtable.h:1766:20: error: '__no_instrument_function__' attribute applies only to functions
    static inline void init_espfix_bsp(void) { }
                       ^~~~~~~~~~~~~~~
>> include/linux/pgtable.h:1766:42: error: expected ';', ',' or ')' before '{' token
    static inline void init_espfix_bsp(void) { }
                                             ^
   make[3]: *** [scripts/Makefile.build:98: arch/riscv/kernel/asm-offsets.s] Error 1 shuffle=2112879742
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1280: prepare0] Error 2 shuffle=2112879742
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2 shuffle=2112879742
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2 shuffle=2112879742
   make: Target 'prepare' not remade because of errors.


vim +1493 include/linux/pgtable.h

0f8975ec4db2c8 include/asm-generic/pgtable.h Pavel Emelyanov               2013-07-03  1484  
34801ba9bf0381 include/asm-generic/pgtable.h venkatesh.pallipadi@intel.com 2008-12-19  1485  #ifndef __HAVE_PFNMAP_TRACKING
34801ba9bf0381 include/asm-generic/pgtable.h venkatesh.pallipadi@intel.com 2008-12-19  1486  /*
5180da410db636 include/asm-generic/pgtable.h Suresh Siddha                 2012-10-08  1487   * Interfaces that can be used by architecture code to keep track of
5180da410db636 include/asm-generic/pgtable.h Suresh Siddha                 2012-10-08  1488   * memory type of pfn mappings specified by the remap_pfn_range,
67fa1666223d7c include/asm-generic/pgtable.h Matthew Wilcox                2018-10-26  1489   * vmf_insert_pfn.
5180da410db636 include/asm-generic/pgtable.h Suresh Siddha                 2012-10-08  1490   */
5180da410db636 include/asm-generic/pgtable.h Suresh Siddha                 2012-10-08  1491  
3ab6e156f887d9 include/linux/pgtable.h       David Hildenbrand             2025-04-24  1492  static inline int pfnmap_setup_cachemode(unsigned long pfn, unsigned long size,
5180da410db636 include/asm-generic/pgtable.h Suresh Siddha                 2012-10-08 @1493  {
3ab6e156f887d9 include/linux/pgtable.h       David Hildenbrand             2025-04-24  1494  	return 0;
5180da410db636 include/asm-generic/pgtable.h Suresh Siddha                 2012-10-08  1495  }
5180da410db636 include/asm-generic/pgtable.h Suresh Siddha                 2012-10-08  1496  

:::::: The code at line 1493 was first introduced by commit
:::::: 5180da410db6369d1f95c9014da1c9bc33fb043e x86, pat: separate the pfn attribute tracking for remap_pfn_range and vm_insert_pfn

:::::: TO: Suresh Siddha <suresh.b.siddha@intel.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

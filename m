Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4413033A9E0
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Feb 2026 08:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770712834; cv=none; b=mOhs6rLMr3m67JWdWf46cP+8QR8IwKzOf3UlYGblljRbmVV0Z7KmjkrnswGm/sp1q7AXX+a49VzWGvnGUnNUIzW9xmkdx865cTIDuRiUKIes58poKWhmjvQt8CHCP1dUA2eLXSjq1BI+fPfdH1N3hOtyll4D/6xRtP2GTqCmQlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770712834; c=relaxed/simple;
	bh=0CtLq1Xmv1scI6KbKzbZqRpvOGV234SY39jOMdKSV4M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O2dr4meCWIFLSgPfpVkcKa3HWwjseFWGsbNKjZ2ebGF5XASJfmKzv4Y36/ErsoUWJn9rMQ0yaTjL+iFwXlnMgO+v7GFhkcB1V6zTeq0T9e1+WPg5mbvu2T1eTNwsaszrg3ZUVdNRhK2icG0+BC6BZSS01ySF39LCwJytt6VN3p8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E3m0LB5p; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E3m0LB5p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770712832; x=1802248832;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0CtLq1Xmv1scI6KbKzbZqRpvOGV234SY39jOMdKSV4M=;
  b=E3m0LB5pNMdpxcxyLuqSac8k1kJUMSEaH8auGsYzduJJ7ix4hUOZjm/L
   cdJT9dP9IysEOdFfGspsTVVXm+uzS/b+gxOKPuKHtj2UHszCFACzSRYCr
   vva1WhmiGr6jJe8ZHvFfFmv0agdyzIieudfuzNEjla2hjoYaGVwhSjHLj
   Xrv/wUtGxM8fGNR3uGvyQhfGtJs9x99b18x88q4AtBaYaQII4toN18YT3
   14Q2757KSzftvMA8CM3iMqyundrVjIK51AzkgQlhKtPuoT6JYAqrcfdyJ
   UTdTxNyI0jyOl99pk5VRizmRDqxfJgcoKGV3fvY+J7dTY0LzHFXGR9Fm1
   w==;
X-CSE-ConnectionGUID: vm/J05trTNu6SnA3e5Cs3Q==
X-CSE-MsgGUID: +uJpYZyeQT6ySj6+bJoBZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="82158549"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="82158549"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2026 00:40:31 -0800
X-CSE-ConnectionGUID: NuSKp+fgQKK7ZCIRxh02bQ==
X-CSE-MsgGUID: BWtNQ5lUT/qK5nNXWZ9eJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="210936295"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 10 Feb 2026 00:40:31 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpjIK-00000000opE-3DOV;
	Tue, 10 Feb 2026 08:40:28 +0000
Date: Tue, 10 Feb 2026 16:40:21 +0800
From: kernel test robot <lkp@intel.com>
To: Wenchao Hao <haowenchao22@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH] mm: only set fault addrsss' access bit in
 do_anonymous_page
Message-ID: <202602101623.nhfpbIJz-lkp@intel.com>
References: <20260210043456.2137482-1-haowenchao22@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260210043456.2137482-1-haowenchao22@gmail.com>

Hi Wenchao,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Wenchao-Hao/mm-only-set-fault-addrsss-access-bit-in-do_anonymous_page/20260210-123706
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20260210043456.2137482-1-haowenchao22%40gmail.com
patch subject: [RFC PATCH] mm: only set fault addrsss' access bit in do_anonymous_page
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20260210/202602101623.nhfpbIJz-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260210/202602101623.nhfpbIJz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602101623.nhfpbIJz-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/mm.h:32,
                    from include/linux/pid_namespace.h:7,
                    from include/linux/ptrace.h:10,
                    from arch/openrisc/kernel/asm-offsets.c:29:
   include/linux/pgtable.h: In function 'set_anon_ptes':
>> include/linux/pgtable.h:432:39: error: passing argument 2 of 'page_table_check_ptes_set' makes integer from pointer without a cast [-Wint-conversion]
     432 |         page_table_check_ptes_set(mm, ptep, pte, nr);
         |                                       ^~~~
         |                                       |
         |                                       pte_t *
   In file included from include/linux/pgtable.h:18:
   include/linux/page_table_check.h:140:60: note: expected 'long unsigned int' but argument is of type 'pte_t *'
     140 |                                              unsigned long addr, pte_t *ptep,
         |                                              ~~~~~~~~~~~~~~^~~~
>> include/linux/pgtable.h:432:45: error: incompatible type for argument 3 of 'page_table_check_ptes_set'
     432 |         page_table_check_ptes_set(mm, ptep, pte, nr);
         |                                             ^~~
         |                                             |
         |                                             pte_t
   include/linux/page_table_check.h:140:73: note: expected 'pte_t *' but argument is of type 'pte_t'
     140 |                                              unsigned long addr, pte_t *ptep,
         |                                                                  ~~~~~~~^~~~
   include/linux/pgtable.h:432:50: error: incompatible type for argument 4 of 'page_table_check_ptes_set'
     432 |         page_table_check_ptes_set(mm, ptep, pte, nr);
         |                                                  ^~
         |                                                  |
         |                                                  unsigned int
   include/linux/page_table_check.h:141:52: note: expected 'pte_t' but argument is of type 'unsigned int'
     141 |                                              pte_t pte, unsigned int nr)
         |                                              ~~~~~~^~~
>> include/linux/pgtable.h:432:9: error: too few arguments to function 'page_table_check_ptes_set'; expected 5, have 4
     432 |         page_table_check_ptes_set(mm, ptep, pte, nr);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/page_table_check.h:139:20: note: declared here
     139 | static inline void page_table_check_ptes_set(struct mm_struct *mm,
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~
   make[3]: *** [scripts/Makefile.build:182: arch/openrisc/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1314: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +/page_table_check_ptes_set +432 include/linux/pgtable.h

   425	
   426	#ifndef set_ptes
   427	static inline void set_anon_ptes(struct mm_struct *mm, unsigned long addr,
   428			unsigned long fault_addr, pte_t *ptep, pte_t pte, unsigned int nr)
   429	{
   430		bool young = pte_young(pte);
   431	
 > 432		page_table_check_ptes_set(mm, ptep, pte, nr);
   433	
   434		for (;;) {
   435			if (young && addr == fault_addr)
   436				pte = pte_mkyoung(pte);
   437			else
   438				pte = pte_mkold(pte);
   439	
   440			set_pte(ptep, pte);
   441			if (--nr == 0)
   442				break;
   443	
   444			addr += PAGE_SIZE;
   445			ptep++;
   446			pte = pte_next_pfn(pte);
   447		}
   448	}
   449	#else
   450	#define set_anon_ptes(mm, addr, fault_addr, ptep, pte, nr) \
   451			set_ptes(mm, addr, ptep, pte, nr)
   452	#endif
   453	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EBE51EB45
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 Apr 2024 09:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712655003; cv=none; b=COjMYpJfoITC65qhBVfjMjo9kHEoDUR0lZdz9Sfd0dHDGFZZ8wf5bC1C5rnLLab6UKai/Z7qxIed+3JUcPH6VVwGbZsHiM8zaVKixiR5ky5kreq0nzNbazN+SzImPQfxsom6y/qOwVvSeEGuGRZcudiI70RM0F7A985aChTjt2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712655003; c=relaxed/simple;
	bh=/Xq6NFRENsZucwnpNIc9CG9+OpPyDh//GOKmnHuWUyg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=X7a7gXB0ccO2fXUxP4xDTPobAyCBsPkLcyY/chKjgteqlhoBR1ETxTYgYaoQrBpavf0Q9nZfq6e44hqj+bgjHVX2J2OOeM4qsdzV2K35rI06iPJYOGd+RqFG5NWd9E7ElXlCNSXYP6jioCJo74bH26vLP9MCw+tKXijBO9XKVkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h3CwJBlF; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h3CwJBlF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712655002; x=1744191002;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/Xq6NFRENsZucwnpNIc9CG9+OpPyDh//GOKmnHuWUyg=;
  b=h3CwJBlFBsnLe6EhFiuRvN5igefnjGT2WVvLaUV4suEd96tgo674fdME
   +kcYXJZlAYcoSN0rwAuvSHM50O9HjPWV+uwk7NgB76E+Fc/nQnCJSXHyX
   MYb7HZ/AlFbplLG7y+ftrT15VrRgvGxy3B9RVKROonnQaDM6/aJAUjxIl
   VQPAmpgBP+37D3CjhiVvj5w7Pj2tAPHBGLcTbe5xami3bwUjKmlkv3ffQ
   BtnFegQ3iThwSEhqhWuIlDIRm6bDPlgrhgIFiIPF2Q60Bly+GRTBd4xcH
   ZoRfKMspVdVeyrbE+I646kWP0pLQz7HsBuvQtE5T5kuFkguOFHWCWB/nY
   g==;
X-CSE-ConnectionGUID: DCCCe1+lQUa/v7qfJWajNQ==
X-CSE-MsgGUID: oI+efZZuS326dljleGq6og==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="19392441"
X-IronPort-AV: E=Sophos;i="6.07,189,1708416000"; 
   d="scan'208";a="19392441"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2024 02:30:01 -0700
X-CSE-ConnectionGUID: 9M6H6rzXTXikOIpKkmTqgg==
X-CSE-MsgGUID: BHnE3hlqRnGKUjLAIzg+LA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,189,1708416000"; 
   d="scan'208";a="20081893"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 09 Apr 2024 02:29:59 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ru7nh-0005xi-07;
	Tue, 09 Apr 2024 09:29:57 +0000
Date: Tue, 9 Apr 2024 17:29:14 +0800
From: kernel test robot <lkp@intel.com>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master 4283/4584] lib/../mm/internal.h:206:70: warning:
 suggest parentheses around '+' in operand of '&'
Message-ID: <202404091749.ScNPJ8j4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   a053fd3ca5d1b927a8655f239c84b0d790218fda
commit: 3317f7faabc24b500c26d02615ac75ca2786e272 [4283/4584] mm: swap: free_swap_and_cache_nr() as batched free_swap_and_cache()
config: parisc-allnoconfig (https://download.01.org/0day-ci/archive/20240409/202404091749.ScNPJ8j4-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240409/202404091749.ScNPJ8j4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404091749.ScNPJ8j4-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/pgtable.h:6,
                    from include/linux/mm.h:30,
                    from include/linux/kallsyms.h:13,
                    from lib/vsprintf.c:30:
   lib/../mm/internal.h: In function 'pte_next_swp_offset':
>> lib/../mm/internal.h:206:70: warning: suggest parentheses around '+' in operand of '&' [-Wparentheses]
     206 |                                                    swp_offset(entry) + 1));
         |                                                    ~~~~~~~~~~~~~~~~~~^~~
   arch/parisc/include/asm/pgtable.h:432:53: note: in definition of macro '__swp_entry_to_pte'
     432 | #define __swp_entry_to_pte(x)           ((pte_t) { (x).val })
         |                                                     ^
   lib/../mm/internal.h:205:40: note: in expansion of macro '__swp_entry'
     205 |         pte_t new = __swp_entry_to_pte(__swp_entry(swp_type(entry),
         |                                        ^~~~~~~~~~~
>> lib/../mm/internal.h:206:70: warning: suggest parentheses around '+' inside '>>' [-Wparentheses]
     206 |                                                    swp_offset(entry) + 1));
         |                                                    ~~~~~~~~~~~~~~~~~~^~~
   arch/parisc/include/asm/pgtable.h:432:53: note: in definition of macro '__swp_entry_to_pte'
     432 | #define __swp_entry_to_pte(x)           ((pte_t) { (x).val })
         |                                                     ^
   lib/../mm/internal.h:205:40: note: in expansion of macro '__swp_entry'
     205 |         pte_t new = __swp_entry_to_pte(__swp_entry(swp_type(entry),
         |                                        ^~~~~~~~~~~
   lib/vsprintf.c: In function 'va_format':
   lib/vsprintf.c:1683:9: warning: function 'va_format' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
    1683 |         buf += vsnprintf(buf, end > buf ? end - buf : 0, va_fmt->fmt, va);
         |         ^~~


vim +206 lib/../mm/internal.h

   194	
   195	/**
   196	 * pte_next_swp_offset - Increment the swap entry offset field of a swap pte.
   197	 * @pte: The initial pte state; is_swap_pte(pte) must be true.
   198	 *
   199	 * Increments the swap offset, while maintaining all other fields, including
   200	 * swap type, and any swp pte bits. The resulting pte is returned.
   201	 */
   202	static inline pte_t pte_next_swp_offset(pte_t pte)
   203	{
   204		swp_entry_t entry = pte_to_swp_entry(pte);
   205		pte_t new = __swp_entry_to_pte(__swp_entry(swp_type(entry),
 > 206							   swp_offset(entry) + 1));
   207	
   208		if (pte_swp_soft_dirty(pte))
   209			new = pte_swp_mksoft_dirty(new);
   210		if (pte_swp_exclusive(pte))
   211			new = pte_swp_mkexclusive(new);
   212		if (pte_swp_uffd_wp(pte))
   213			new = pte_swp_mkuffd_wp(new);
   214	
   215		return new;
   216	}
   217	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F70723EA90
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Dec 2025 00:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765500544; cv=none; b=bdlZckHeU4kcFPhgedjk4DLZa2wjlTX5/PaJsTRNsznFqSrz1hJiZ1lHLBMT+DcoW1zx3vRwYfYveImLpRjJeMIS3i8QtgKmxd2HCXJjAe5iW7O4sLuw+ewy0z31/4eOTB0+WzeoBge85jdS0AB7iauJ++bjeiL6DUF2q21C8qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765500544; c=relaxed/simple;
	bh=hAe6AAOvyOebdWwsY5kojqH4D7Nkm+axQcV4KqQWf/I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HAIrfLWtPzlA7BYX4SKbCfhF0Xeq4cUej78AbnMavq3qXhWhPYhRkD1o6h18dErd5UZ69qOejEtS6MLJu2WTQLuLmtbspqQDGhhF4sQW/EW/Fa02Ik5s/74c3FQQOINdwsqy3SAkAp8UC+dp7QQGd7kTbTvValFdI7X4DMBKZ0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dV2MogtS; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dV2MogtS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765500543; x=1797036543;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hAe6AAOvyOebdWwsY5kojqH4D7Nkm+axQcV4KqQWf/I=;
  b=dV2MogtSgPiPA6AJc5CJHYLeXtFcWgHfLiTOs2KR3jHJCt1TYLXpnMtt
   i7eDpD71QAiscfda+TICWc1hJRWRGYPe9lCSxwySgy9nKWPJzcfMLgVUU
   Bkmb4LK3CbuxxFsZ+UpaAYDE0jsnZcth2QjMN0gM0M8I2HFQ/aYu1E9LP
   bDagpOJGy/+4WVtMY7ddVNdB25Yk7x1nJruN8WEAm73iyv6893A9lZYhJ
   Wt0sUTS98RPl3ph22upGOFAfDO/h6GoidBLBIUGDdujq2mcxixlcGFz/h
   cJkj2VT5EuUcfBtTgOJjztEi+iglkBqYQxBIhRGR3SXnF7WTKLXVELCUJ
   A==;
X-CSE-ConnectionGUID: Jg9LalZbQXW9houMGyakAQ==
X-CSE-MsgGUID: WO7EXdPvQuCO1ttIpFLjHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="78114221"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="78114221"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 16:49:02 -0800
X-CSE-ConnectionGUID: 31ljWDxmTvqtOvYRtR4LDQ==
X-CSE-MsgGUID: 9vwaFrSoRJqSM2OGFXVN6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="197756649"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 11 Dec 2025 16:48:59 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTrL7-000000005Fl-1fJF;
	Fri, 12 Dec 2025 00:48:57 +0000
Date: Fri, 12 Dec 2025 08:48:24 +0800
From: kernel test robot <lkp@intel.com>
To: Samuel Holland <samuel.holland@sifive.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	David Hildenbrand <david@kernel.org>,
	Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	linux-kernel@vger.kernel.org, Ryan Roberts <ryan.roberts@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Gavin Shan <gshan@redhat.com>, Zi Yan <ziy@nvidia.com>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: Re: [PATCH 1/2] mm/debug_vm_pgtable: Use set_pXd() to write page
 tables
Message-ID: <202512120808.akRJJMa7-lkp@intel.com>
References: <20251211081117.1126521-2-samuel.holland@sifive.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251211081117.1126521-2-samuel.holland@sifive.com>

Hi Samuel,

kernel test robot noticed the following build errors:

[auto build test ERROR on d358e5254674b70f34c847715ca509e46eb81e6f]

url:    https://github.com/intel-lab-lkp/linux/commits/Samuel-Holland/mm-debug_vm_pgtable-Use-set_pXd-to-write-page-tables/20251211-161254
base:   d358e5254674b70f34c847715ca509e46eb81e6f
patch link:    https://lore.kernel.org/r/20251211081117.1126521-2-samuel.holland%40sifive.com
patch subject: [PATCH 1/2] mm/debug_vm_pgtable: Use set_pXd() to write page tables
config: powerpc64-randconfig-r054-20251212 (https://download.01.org/0day-ci/archive/20251212/202512120808.akRJJMa7-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251212/202512120808.akRJJMa7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512120808.akRJJMa7-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/debug_vm_pgtable.c: In function 'pmd_huge_tests':
>> mm/debug_vm_pgtable.c:448:2: error: implicit declaration of function 'set_pmd'; did you mean 'set_pgd'? [-Werror=implicit-function-declaration]
     448 |  set_pmd(args->pmdp, __pmd(0));
         |  ^~~~~~~
         |  set_pgd
   mm/debug_vm_pgtable.c: In function 'pud_huge_tests':
>> mm/debug_vm_pgtable.c:468:2: error: implicit declaration of function 'set_pud'; did you mean 'set_pgd'? [-Werror=implicit-function-declaration]
     468 |  set_pud(args->pudp, __pud(0));
         |  ^~~~~~~
         |  set_pgd
   cc1: some warnings being treated as errors

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for CAN_DEV
   Depends on [n]: NETDEVICES [=n] && CAN [=y]
   Selected by [y]:
   - CAN [=y] && NET [=y]


vim +448 mm/debug_vm_pgtable.c

   433	
   434	#ifdef CONFIG_HAVE_ARCH_HUGE_VMAP
   435	static void __init pmd_huge_tests(struct pgtable_debug_args *args)
   436	{
   437		pmd_t pmd;
   438	
   439		if (!arch_vmap_pmd_supported(args->page_prot) ||
   440		    args->fixed_alignment < PMD_SIZE)
   441			return;
   442	
   443		pr_debug("Validating PMD huge\n");
   444		/*
   445		 * X86 defined pmd_set_huge() verifies that the given
   446		 * PMD is not a populated non-leaf entry.
   447		 */
 > 448		set_pmd(args->pmdp, __pmd(0));
   449		WARN_ON(!pmd_set_huge(args->pmdp, __pfn_to_phys(args->fixed_pmd_pfn), args->page_prot));
   450		WARN_ON(!pmd_clear_huge(args->pmdp));
   451		pmd = pmdp_get(args->pmdp);
   452		WARN_ON(!pmd_none(pmd));
   453	}
   454	
   455	static void __init pud_huge_tests(struct pgtable_debug_args *args)
   456	{
   457		pud_t pud;
   458	
   459		if (!arch_vmap_pud_supported(args->page_prot) ||
   460		    args->fixed_alignment < PUD_SIZE)
   461			return;
   462	
   463		pr_debug("Validating PUD huge\n");
   464		/*
   465		 * X86 defined pud_set_huge() verifies that the given
   466		 * PUD is not a populated non-leaf entry.
   467		 */
 > 468		set_pud(args->pudp, __pud(0));
   469		WARN_ON(!pud_set_huge(args->pudp, __pfn_to_phys(args->fixed_pud_pfn), args->page_prot));
   470		WARN_ON(!pud_clear_huge(args->pudp));
   471		pud = pudp_get(args->pudp);
   472		WARN_ON(!pud_none(pud));
   473	}
   474	#else /* !CONFIG_HAVE_ARCH_HUGE_VMAP */
   475	static void __init pmd_huge_tests(struct pgtable_debug_args *args) { }
   476	static void __init pud_huge_tests(struct pgtable_debug_args *args) { }
   477	#endif /* CONFIG_HAVE_ARCH_HUGE_VMAP */
   478	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

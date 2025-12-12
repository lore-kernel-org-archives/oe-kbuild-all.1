Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 217D1321F5F
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Dec 2025 12:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765541516; cv=none; b=FfmsNklddEZ46EuDae+W6botGIrARy5fs02/LBP0ObXm5dATjknxKt2S4Qk00mglsejO/J06aonJtiuy40sHvwpnZwkqQqzBmeavD8CYOxOjSqS82Hoz3NLPYWz/XB7e0oGN4b556AxdxWhGzQUXD9ycMMr5n4HQUBdG63EDCNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765541516; c=relaxed/simple;
	bh=MDqpf9x6/zW98XOuJ4P5mSb9nLGkqLmY81X4Es6oNDM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cgv7rHmcDVWwSJsotmdUNjwNxpbtjKbwdXvyR5uVvH12fNXzyWDV4hBRGko1D2YwsM4P28wBhoAtplYpYQPFkrgAdYOF8dS3p/1Ax/hZDnaCN4a9xl7jw1xGvjdv0Ylo8ysvSJMyfxjvnzfxFFT2ZRQiER5oV+dE8aX+/KR6Ico=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QWHoforQ; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QWHoforQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765541515; x=1797077515;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MDqpf9x6/zW98XOuJ4P5mSb9nLGkqLmY81X4Es6oNDM=;
  b=QWHoforQIy07PNHiYzY3gKDkU/qU9qlodAVaYXaiAQqEYcPyUCt6oMXP
   RmcIFAA8LhqgM97W3/4cYF9C4T65hP4NG/gdBfUU/S5LGhzVTZwZbUHb/
   3OmSzMoAmwOXBD/TB+D3iMw8XTKbyHH3YslCKHKpTdvsilA69/Q+mkJmL
   llx4+kCGCOFJx5Ufm3umx2J+DB77sBS9fNBcKR6bISmtomBilQhtCgaSX
   pV3hG0PmQ1QhZJt7UjxpiqjT3eFjz2xyzUaIw2pzTymecWN9lKP0AkGJ0
   /WcrTX+f+5Htb7YE+0nYbpmyTonfnbkZL674vMtzgseIAu4/W7tGcXEy6
   A==;
X-CSE-ConnectionGUID: 3blwYpYbSj+nF9cBQXZ0PQ==
X-CSE-MsgGUID: RyCdhPHUQG+mGG5oFv+w3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="71406294"
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; 
   d="scan'208";a="71406294"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 04:11:55 -0800
X-CSE-ConnectionGUID: dDrinyMNQkedM3+/Ezfhfw==
X-CSE-MsgGUID: piMLr2XxQeqmGy2iVmSqfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; 
   d="scan'208";a="197567910"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 12 Dec 2025 04:11:51 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vU1zx-0000000060r-0Qyv;
	Fri, 12 Dec 2025 12:11:49 +0000
Date: Fri, 12 Dec 2025 20:11:46 +0800
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
Message-ID: <202512121948.74kTIiJi-lkp@intel.com>
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
config: powerpc64-randconfig-r064-20251212 (https://download.01.org/0day-ci/archive/20251212/202512121948.74kTIiJi-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 1335a05ab8bc8339ce24be3a9da89d8c3f4e0571)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251212/202512121948.74kTIiJi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512121948.74kTIiJi-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/debug_vm_pgtable.c:448:2: error: call to undeclared function 'set_pmd'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     448 |         set_pmd(args->pmdp, __pmd(0));
         |         ^
>> mm/debug_vm_pgtable.c:468:2: error: call to undeclared function 'set_pud'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     468 |         set_pud(args->pudp, __pud(0));
         |         ^
   2 errors generated.


vim +/set_pmd +448 mm/debug_vm_pgtable.c

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

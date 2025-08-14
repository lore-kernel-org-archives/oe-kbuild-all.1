Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01385248F4E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Aug 2025 23:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755213093; cv=none; b=kD22kATs4ZLH2NpZZEOrhPniYFJ1hqoe+AFugIqdntNxvW1ba0u6KsPjRRgRQXxWzQXBx+0KSLAZazmHUwwRvyrDCwzLF1tB34i706K3vHenPETawDD26FjhkTSEKPdvNIbHSlp8nJJDpcE/GQ+R3ByhG8e7vSWRQTfkoAKPguA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755213093; c=relaxed/simple;
	bh=LXObxiQBWS2V80xOCAlP8oYGJ4yHJ9vK/T1025mBj6s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nWxJAl27fzfqnbv+38J2VJb2uWP5WAjyheAsk8F40ccvSjSFqAZV1VXGaQyalVws40Tl4E4bMe7pKQuBDTlhC1dN1GbZNd11N/JH5hvQY1hV8Ff1TZ2BRgHYjdLLqmJj4h8yU+PgsSxHUCubMyr6pzBdjDy8YPqOWt3pU7uvvfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RBMVwkbN; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RBMVwkbN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755213092; x=1786749092;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LXObxiQBWS2V80xOCAlP8oYGJ4yHJ9vK/T1025mBj6s=;
  b=RBMVwkbN17gWfzEnGUXu1HMtK1VKYW7FFNvIrOtiyWTK8glc03GwZmki
   1QPPz76r6yFiaq84CpzkrCUrcl+hodZxY2TUTBpbh47/c1vaQqpk/Mp/n
   x8pLY4lcwHHntPPd5nvbD0zDv2wImC5yW1Ow6vwMiyo25hsG3TUoW9uW2
   zlcmRyNhHovxDys9vI5eh/tb7HZwfnBYlAeea0UGUtuk+53Uy9TznZulm
   vXQs0jPso1+cPyerfD6cdQhazCktGQIC1q/zJUO51QXubqTWC4niuB2zx
   xT2vx54Fg6h6LzoB7Zu4j9MMmve8HDONu9s9pgCduztMQ74T0/D7SPV6R
   Q==;
X-CSE-ConnectionGUID: ozorL9U4TwGRI04ZmsFmHQ==
X-CSE-MsgGUID: 6fQ0RJHXRcKZBSXXFGoSjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11522"; a="61349677"
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="61349677"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2025 16:11:32 -0700
X-CSE-ConnectionGUID: jOOeWhpcQhSFSzLQgk/KhQ==
X-CSE-MsgGUID: ANgzyivpSPGcQ6n8Nh7SCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="166372701"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 14 Aug 2025 16:11:31 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1umh6E-000BN6-0X;
	Thu, 14 Aug 2025 23:11:19 +0000
Date: Fri, 15 Aug 2025 07:10:58 +0800
From: kernel test robot <lkp@intel.com>
To: Mika =?iso-8859-1?Q?Penttil=E4?= <mpenttil@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 2/4] mm: unified fault and migrate device page paths
Message-ID: <202508150630.antrDWYh-lkp@intel.com>
References: <20250814072045.3637192-4-mpenttil@redhat.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250814072045.3637192-4-mpenttil@redhat.com>

Hi Mika,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]
[also build test ERROR on akpm-mm/mm-nonmm-unstable linus/master v6.17-rc1 next-20250814]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mika-Penttil/mm-use-current-as-mmu-notifier-s-owner/20250814-152712
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20250814072045.3637192-4-mpenttil%40redhat.com
patch subject: [RFC PATCH 2/4] mm: unified fault and migrate device page paths
config: arc-randconfig-002-20250815 (https://download.01.org/0day-ci/archive/20250815/202508150630.antrDWYh-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250815/202508150630.antrDWYh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508150630.antrDWYh-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/pagewalk.h:5,
                    from mm/hmm.c:11:
   include/linux/mm.h:80: warning: "PAGES_TO_MB" redefined
      80 | #define PAGES_TO_MB(pages) ((pages) >> (20 - PAGE_SHIFT))
         | 
   In file included from arch/arc/include/asm/irqflags-compact.h:16,
                    from arch/arc/include/asm/irqflags.h:11,
                    from include/linux/irqflags.h:18,
                    from include/linux/spinlock.h:59,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/mm.h:7,
                    from include/linux/pagewalk.h:5,
                    from mm/hmm.c:11:
   arch/arc/include/asm/arcregs.h:155: note: this is the location of the previous definition
     155 | #define PAGES_TO_MB(n_pages) (PAGES_TO_KB(n_pages) >> 10)
         | 
>> mm/hmm.c:55:30: error: return type is an incomplete type
      55 | static enum migrate_vma_info hmm_want_migrate(struct hmm_range *range)
         |                              ^~~~~~~~~~~~~~~~
   mm/hmm.c: In function 'hmm_want_migrate':
>> mm/hmm.c:57:24: error: storage size of 'minfo' isn't known
      57 |  enum migrate_vma_info minfo;
         |                        ^~~~~
>> mm/hmm.c:59:41: error: dereferencing pointer to incomplete type 'struct migrate_vma'
      59 |  minfo = range->migrate ? range->migrate->flags : 0;
         |                                         ^~
>> mm/hmm.c:61:3: error: 'MIGRATE_VMA_SELECT_SYSTEM' undeclared (first use in this function)
      61 |   MIGRATE_VMA_SELECT_SYSTEM : 0;
         |   ^~~~~~~~~~~~~~~~~~~~~~~~~
   mm/hmm.c:61:3: note: each undeclared identifier is reported only once for each function it appears in
   mm/hmm.c:63:9: warning: 'return' with a value, in function returning void [-Wreturn-type]
      63 |  return minfo;
         |         ^~~~~
   mm/hmm.c:55:30: note: declared here
      55 | static enum migrate_vma_info hmm_want_migrate(struct hmm_range *range)
         |                              ^~~~~~~~~~~~~~~~
   mm/hmm.c:57:24: warning: unused variable 'minfo' [-Wunused-variable]
      57 |  enum migrate_vma_info minfo;
         |                        ^~~~~
   mm/hmm.c: In function 'hmm_pfns_fill':
>> mm/hmm.c:73:7: error: void value not ignored as it ought to be
      73 |   if (hmm_want_migrate(range) &&
         |       ^~~~~~~~~~~~~~~~~~~~~~~
   mm/hmm.c: In function 'hmm_vma_handle_migrate_prepare':
   mm/hmm.c:367:24: error: storage size of 'minfo' isn't known
     367 |  enum migrate_vma_info minfo;
         |                        ^~~~~
>> mm/hmm.c:415:17: error: 'MIGRATE_VMA_SELECT_DEVICE_PRIVATE' undeclared (first use in this function)
     415 |   if (!(minfo & MIGRATE_VMA_SELECT_DEVICE_PRIVATE))
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/hmm.c:425:16: error: 'MIGRATE_VMA_SELECT_SYSTEM' undeclared (first use in this function)
     425 |       (minfo & MIGRATE_VMA_SELECT_SYSTEM)) {
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~
>> mm/hmm.c:437:10: error: 'MIGRATE_VMA_SELECT_DEVICE_COHERENT' undeclared (first use in this function)
     437 |          MIGRATE_VMA_SELECT_DEVICE_COHERENT) ||
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> mm/hmm.c:519:4: error: implicit declaration of function 'flush_tlb_range'; did you mean 'flush_pmd_tlb_range'? [-Werror=implicit-function-declaration]
     519 |    flush_tlb_range(walk->vma, addr, addr + PAGE_SIZE);
         |    ^~~~~~~~~~~~~~~
         |    flush_pmd_tlb_range
   mm/hmm.c:367:24: warning: unused variable 'minfo' [-Wunused-variable]
     367 |  enum migrate_vma_info minfo;
         |                        ^~~~~
   mm/hmm.c: In function 'hmm_vma_capture_migrate_range':
>> mm/hmm.c:580:6: error: invalid use of void expression
     580 |  if (!hmm_want_migrate(range))
         |      ^
   mm/hmm.c: In function 'hmm_vma_walk_pmd':
   mm/hmm.c:637:6: error: void value not ignored as it ought to be
     637 |  if (hmm_want_migrate(range) &&
         |      ^~~~~~~~~~~~~~~~~~~~~~~
   mm/hmm.c: In function 'hmm_range_fault':
   mm/hmm.c:937:6: error: void value not ignored as it ought to be
     937 |  if (hmm_want_migrate(range) && range->migrate &&
         |      ^~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +55 mm/hmm.c

    54	
  > 55	static enum migrate_vma_info hmm_want_migrate(struct hmm_range *range)
    56	{
  > 57		enum migrate_vma_info minfo;
    58	
  > 59		minfo = range->migrate ? range->migrate->flags : 0;
    60		minfo |= (range->default_flags & HMM_PFN_REQ_MIGRATE) ?
  > 61			MIGRATE_VMA_SELECT_SYSTEM : 0;
    62	
    63		return minfo;
    64	}
    65	
    66	static int hmm_pfns_fill(unsigned long addr, unsigned long end,
    67				 struct hmm_vma_walk *hmm_vma_walk, unsigned long cpu_flags)
    68	{
    69		struct hmm_range *range = hmm_vma_walk->range;
    70		unsigned long i = (addr - range->start) >> PAGE_SHIFT;
    71	
    72		if (cpu_flags != HMM_PFN_ERROR)
  > 73			if (hmm_want_migrate(range) &&
    74			    (vma_is_anonymous(hmm_vma_walk->vma)))
    75				cpu_flags |= (HMM_PFN_VALID | HMM_PFN_MIGRATE);
    76	
    77		for (; addr < end; addr += PAGE_SIZE, i++) {
    78			range->hmm_pfns[i] &= HMM_PFN_INOUT_FLAGS;
    79			range->hmm_pfns[i] |= cpu_flags;
    80		}
    81	
    82		return 0;
    83	}
    84	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

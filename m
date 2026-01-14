Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BFAF330B06
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 Jan 2026 18:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768413918; cv=none; b=osQ4KkDhA1XUmj8pCKTEgVpO8ZKnmW9ZacUSWueT+bk9iKeQOIcpCuVCpdiS4Is+ZT3oCVzNU3nofTFhS6SuuRonrZdAqFfT0xwypIo3ebM1jKtqUT1VOdp2L5m2yWjDlqPq6XZ+ZyRss3cB6hmWvHVwvZ1K9uMg+LpujY1p76M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768413918; c=relaxed/simple;
	bh=LlaGqzTDfng3Tgg+O+lRqxSp3VAlDdxXFdUmlzpIn5k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kqu5k6IBQkE3fzrtCgWECzvg5ZOcdq2aLNtJRf7oTPkhhAwkrbjMLiVKhT628ULazs24TyGWBs6mwMMQx/RqV87PwbIaudGN2HMZvaYzeRY62ZOojX7BUXlmYwVpQseLBLXgqlmOw+8WmS/XlvfSQpnCE+nnkha8tMM8O76AM/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eK2zq2rO; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eK2zq2rO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768413915; x=1799949915;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LlaGqzTDfng3Tgg+O+lRqxSp3VAlDdxXFdUmlzpIn5k=;
  b=eK2zq2rOhauLlDlSOQYgEXgCoJvkJ8c0Xg42X3iaTNO4Qzm//W9GQNmO
   u6h5ZX9Lg1IV7Zy0AKjTHPFSnIC0pjMvxOV7PXs0Twuf2sey00uFaUXXW
   u7cYeuM0UlLLFdZ/DJvcH544h1VHSuI9pbL9kGd0KFDWgVwqi7IRbfl9u
   rVdKQx4eOhFF4jX+370QYM4706T8AygfnHCFb/05b6sVYpVWVTpkzCwKm
   NvsIQ/s+Ndp5BtO+lyHeCdM+bPYcGi88Z01jUjuF9XdhxV57wH459jDD4
   AHKhdW4sRtsw38HCdCpBVBTFEmExkrGTrrEh4xLFNBDbg6glxAx5QR2mV
   Q==;
X-CSE-ConnectionGUID: ecOOuDY8QRyoqZ2E9qbWOA==
X-CSE-MsgGUID: cyL5L3KOQMm3QVaNTpK7Jw==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="69772254"
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; 
   d="scan'208";a="69772254"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 10:05:14 -0800
X-CSE-ConnectionGUID: U60Y1ubTQWmjnHP9IXP1sA==
X-CSE-MsgGUID: 1ucytVeoR+WDdax7RARjhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; 
   d="scan'208";a="203959086"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 14 Jan 2026 10:05:09 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vg5Ew-00000000GnQ-3OSu;
	Wed, 14 Jan 2026 18:05:06 +0000
Date: Thu, 15 Jan 2026 02:04:18 +0800
From: kernel test robot <lkp@intel.com>
To: mpenttil@redhat.com, linux-mm@kvack.org
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Mika =?iso-8859-1?Q?Penttil=E4?= <mpenttil@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Leon Romanovsky <leonro@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
	Balbir Singh <balbirs@nvidia.com>, Zi Yan <ziy@nvidia.com>,
	Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH 1/3] mm: unified hmm fault and migrate device pagewalk
 paths
Message-ID: <202601150107.djcXDbUn-lkp@intel.com>
References: <20260114091923.3950465-2-mpenttil@redhat.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260114091923.3950465-2-mpenttil@redhat.com>

Hi,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-nonmm-unstable]
[also build test ERROR on linus/master v6.19-rc5 next-20260114]
[cannot apply to akpm-mm/mm-everything]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/mpenttil-redhat-com/mm-unified-hmm-fault-and-migrate-device-pagewalk-paths/20260114-172232
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
patch link:    https://lore.kernel.org/r/20260114091923.3950465-2-mpenttil%40redhat.com
patch subject: [PATCH 1/3] mm: unified hmm fault and migrate device pagewalk paths
config: hexagon-randconfig-r063-20260114 (https://download.01.org/0day-ci/archive/20260115/202601150107.djcXDbUn-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260115/202601150107.djcXDbUn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601150107.djcXDbUn-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/hmm.c:49:30: error: incomplete result type 'enum migrate_vma_info' in function definition
      49 | static enum migrate_vma_info hmm_select_migrate(struct hmm_range *range)
         |                              ^
   mm/hmm.c:49:13: note: forward declaration of 'enum migrate_vma_info'
      49 | static enum migrate_vma_info hmm_select_migrate(struct hmm_range *range)
         |             ^
>> mm/hmm.c:51:24: error: variable has incomplete type 'enum migrate_vma_info'
      51 |         enum migrate_vma_info minfo;
         |                               ^
   mm/hmm.c:49:13: note: forward declaration of 'enum migrate_vma_info'
      49 | static enum migrate_vma_info hmm_select_migrate(struct hmm_range *range)
         |             ^
>> mm/hmm.c:53:41: error: incomplete definition of type 'struct migrate_vma'
      53 |         minfo = range->migrate ? range->migrate->flags : 0;
         |                                  ~~~~~~~~~~~~~~^
   include/linux/hmm.h:15:8: note: forward declaration of 'struct migrate_vma'
      15 | struct migrate_vma;
         |        ^
>> mm/hmm.c:55:3: error: use of undeclared identifier 'MIGRATE_VMA_SELECT_SYSTEM'
      55 |                 MIGRATE_VMA_SELECT_SYSTEM : 0;
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~
   mm/hmm.c:65:24: error: variable has incomplete type 'enum migrate_vma_info'
      65 |         enum migrate_vma_info minfo;
         |                               ^
   mm/hmm.c:49:13: note: forward declaration of 'enum migrate_vma_info'
      49 | static enum migrate_vma_info hmm_select_migrate(struct hmm_range *range)
         |             ^
>> mm/hmm.c:77:15: error: use of undeclared identifier 'MIGRATE_VMA_SELECT_COMPOUND'
      77 |             (minfo & MIGRATE_VMA_SELECT_COMPOUND) &&
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/hmm.c:423:20: warning: unused variable 'range' [-Wunused-variable]
     423 |         struct hmm_range *range = hmm_vma_walk->range;
         |                           ^~~~~
   mm/hmm.c:493:24: error: variable has incomplete type 'enum migrate_vma_info'
     493 |         enum migrate_vma_info minfo;
         |                               ^
   mm/hmm.c:49:13: note: forward declaration of 'enum migrate_vma_info'
      49 | static enum migrate_vma_info hmm_select_migrate(struct hmm_range *range)
         |             ^
   mm/hmm.c:502:35: error: incomplete definition of type 'struct migrate_vma'
     502 |         fault_folio = (migrate && migrate->fault_page) ?
         |                                   ~~~~~~~^
   include/linux/hmm.h:15:8: note: forward declaration of 'struct migrate_vma'
      15 | struct migrate_vma;
         |        ^
   mm/hmm.c:503:21: error: incomplete definition of type 'struct migrate_vma'
     503 |                 page_folio(migrate->fault_page) : NULL;
         |                            ~~~~~~~^
   include/linux/hmm.h:15:8: note: forward declaration of 'struct migrate_vma'
      15 | struct migrate_vma;
         |        ^
   mm/hmm.c:503:21: error: incomplete definition of type 'struct migrate_vma'
     503 |                 page_folio(migrate->fault_page) : NULL;
         |                            ~~~~~~~^
   include/linux/hmm.h:15:8: note: forward declaration of 'struct migrate_vma'
      15 | struct migrate_vma;
         |        ^
   mm/hmm.c:503:21: error: incomplete definition of type 'struct migrate_vma'
     503 |                 page_folio(migrate->fault_page) : NULL;
         |                            ~~~~~~~^
   include/linux/hmm.h:15:8: note: forward declaration of 'struct migrate_vma'
      15 | struct migrate_vma;
         |        ^
   mm/hmm.c:512:17: error: use of undeclared identifier 'MIGRATE_VMA_SELECT_SYSTEM'
     512 |                 if (!(minfo & MIGRATE_VMA_SELECT_SYSTEM))
         |                               ^~~~~~~~~~~~~~~~~~~~~~~~~
>> mm/hmm.c:529:17: error: use of undeclared identifier 'MIGRATE_VMA_SELECT_DEVICE_PRIVATE'
     529 |                 if (!(minfo & MIGRATE_VMA_SELECT_DEVICE_PRIVATE))
         |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/hmm.c:531:37: error: incomplete definition of type 'struct migrate_vma'
     531 |                 if (folio->pgmap->owner != migrate->pgmap_owner)
         |                                            ~~~~~~~^
   include/linux/hmm.h:15:8: note: forward declaration of 'struct migrate_vma'
      15 | struct migrate_vma;
         |        ^
   mm/hmm.c:548:14: error: incomplete definition of type 'struct migrate_vma'
     548 |             (migrate->flags & MIGRATE_VMA_SELECT_COMPOUND) &&
         |              ~~~~~~~^
   include/linux/hmm.h:15:8: note: forward declaration of 'struct migrate_vma'
      15 | struct migrate_vma;
         |        ^
   mm/hmm.c:548:24: error: use of undeclared identifier 'MIGRATE_VMA_SELECT_COMPOUND'
     548 |             (migrate->flags & MIGRATE_VMA_SELECT_COMPOUND) &&
         |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/hmm.c:603:24: error: variable has incomplete type 'enum migrate_vma_info'
     603 |         enum migrate_vma_info minfo;
         |                               ^
   mm/hmm.c:49:13: note: forward declaration of 'enum migrate_vma_info'
      49 | static enum migrate_vma_info hmm_select_migrate(struct hmm_range *range)
         |             ^
   mm/hmm.c:620:35: error: incomplete definition of type 'struct migrate_vma'
     620 |         fault_folio = (migrate && migrate->fault_page) ?
         |                                   ~~~~~~~^
   include/linux/hmm.h:15:8: note: forward declaration of 'struct migrate_vma'
      15 | struct migrate_vma;
         |        ^
   mm/hmm.c:621:21: error: incomplete definition of type 'struct migrate_vma'
     621 |                 page_folio(migrate->fault_page) : NULL;
         |                            ~~~~~~~^
   include/linux/hmm.h:15:8: note: forward declaration of 'struct migrate_vma'
      15 | struct migrate_vma;
         |        ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   1 warning and 20 errors generated.


vim +49 mm/hmm.c

    48	
  > 49	static enum migrate_vma_info hmm_select_migrate(struct hmm_range *range)
    50	{
  > 51		enum migrate_vma_info minfo;
    52	
  > 53		minfo = range->migrate ? range->migrate->flags : 0;
    54		minfo |= (range->default_flags & HMM_PFN_REQ_MIGRATE) ?
  > 55			MIGRATE_VMA_SELECT_SYSTEM : 0;
    56	
    57		return minfo;
    58	}
    59	
    60	static int hmm_pfns_fill(unsigned long addr, unsigned long end,
    61				 struct hmm_vma_walk *hmm_vma_walk, unsigned long cpu_flags)
    62	{
    63		struct hmm_range *range = hmm_vma_walk->range;
    64		unsigned long i = (addr - range->start) >> PAGE_SHIFT;
    65		enum migrate_vma_info minfo;
    66		bool migrate = false;
    67	
    68		minfo = hmm_select_migrate(range);
    69		if (cpu_flags != HMM_PFN_ERROR) {
    70			if (minfo && (vma_is_anonymous(hmm_vma_walk->vma))) {
    71				cpu_flags |= (HMM_PFN_VALID | HMM_PFN_MIGRATE);
    72				migrate = true;
    73			}
    74		}
    75	
    76		if (migrate && thp_migration_supported() &&
  > 77		    (minfo & MIGRATE_VMA_SELECT_COMPOUND) &&
    78		    IS_ALIGNED(addr, HPAGE_PMD_SIZE) &&
    79		    IS_ALIGNED(end, HPAGE_PMD_SIZE)) {
    80			range->hmm_pfns[i] &= HMM_PFN_INOUT_FLAGS;
    81			range->hmm_pfns[i] |= cpu_flags | HMM_PFN_COMPOUND;
    82			addr += PAGE_SIZE;
    83			i++;
    84			cpu_flags = 0;
    85		}
    86	
    87		for (; addr < end; addr += PAGE_SIZE, i++) {
    88			range->hmm_pfns[i] &= HMM_PFN_INOUT_FLAGS;
    89			range->hmm_pfns[i] |= cpu_flags;
    90		}
    91	
    92		return 0;
    93	}
    94	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB15F1F1302
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Aug 2025 21:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755207410; cv=none; b=lj/drZdZVnhemdB1dBE1kJro0gza0kCrAK5bs5+EINUHgaJhWT2ZyGw7krdtHJwHGpRO2T3bAtn2xaNrYxhsWnzcFK+7lxyho+am+Jo0LNpTvXahUHaH5oN4T1JVRqVuaJ3qh5r+sDME1usjJ1DGzOIHuXNraeqip3lOhM/4sa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755207410; c=relaxed/simple;
	bh=S3dIVy9yToZf6uQIhfOxIHJMX2z1CfuNSc/J74sanZ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jrfe4UGT9hYOHCyueFvv3NLwXScwldM0rlbULa46IMwiPRWnxPZXdC1eS2oZ0ZjyGEDAswUk8pFv2Worf59iGp/5DF038uMvkPDPegvyzC3Ii6UV2kZ18bi08MGQbYm4w35Jd37yaaVfsf5syo5zS/Gf/8+Ze4g0vQyNTw8pTOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nKZXM0nP; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nKZXM0nP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755207409; x=1786743409;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=S3dIVy9yToZf6uQIhfOxIHJMX2z1CfuNSc/J74sanZ0=;
  b=nKZXM0nPlk3vJcGlyzKMcDchxFRr/mH5WdveG/Q37rdDnzfuP/7STMOo
   vHpRtD4Ol7e3GlhEJKhYVFMnY9X6fKv6K3b7LzfIe+tBV09J3O5D9mEfP
   TgQYAcWUwqM71VsBCbZopLxd1UvLWaFapk2t5KeJgF+Pp0baNj6JXXfhl
   VpKJyE4AUIreMFbxFu0NPzl3CAIPAyImMagev5mvkmy6H0mwinAMIF7eG
   do9a2ZqN/yxSzDGLwbRVrMZ0VJ1LPWKiX9yWGRqg80wcH5xQEQVW4a7Z0
   KSz87goNc/BqTENnXRTzkrh6wOjDfMI7Rm1/DaTjxLaUMlyosd1VNmaKX
   g==;
X-CSE-ConnectionGUID: Csld7aJhRj2+LkBIEC+GrQ==
X-CSE-MsgGUID: 0+jw5gxZQWS+bb9RkuhBWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11522"; a="57462892"
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="57462892"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2025 14:36:48 -0700
X-CSE-ConnectionGUID: Q2mTZ13TQF6TroSGFHCo4g==
X-CSE-MsgGUID: /ZpygrPjRGO2g4DnpB7anw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="166833741"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 14 Aug 2025 14:36:47 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1umfca-000BLQ-0I;
	Thu, 14 Aug 2025 21:36:41 +0000
Date: Fri, 15 Aug 2025 05:36:14 +0800
From: kernel test robot <lkp@intel.com>
To: Mika =?iso-8859-1?Q?Penttil=E4?= <mpenttil@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 2/4] mm: unified fault and migrate device page paths
Message-ID: <202508150505.ioccTtkU-lkp@intel.com>
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
kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]
[also build test WARNING on akpm-mm/mm-nonmm-unstable linus/master v6.17-rc1 next-20250814]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mika-Penttil/mm-use-current-as-mmu-notifier-s-owner/20250814-152712
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20250814072045.3637192-4-mpenttil%40redhat.com
patch subject: [RFC PATCH 2/4] mm: unified fault and migrate device page paths
config: arc-randconfig-002-20250815 (https://download.01.org/0day-ci/archive/20250815/202508150505.ioccTtkU-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250815/202508150505.ioccTtkU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508150505.ioccTtkU-lkp@intel.com/

All warnings (new ones prefixed by >>):

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
   mm/hmm.c:55:30: error: return type is an incomplete type
      55 | static enum migrate_vma_info hmm_want_migrate(struct hmm_range *range)
         |                              ^~~~~~~~~~~~~~~~
   mm/hmm.c: In function 'hmm_want_migrate':
   mm/hmm.c:57:24: error: storage size of 'minfo' isn't known
      57 |  enum migrate_vma_info minfo;
         |                        ^~~~~
   mm/hmm.c:59:41: error: dereferencing pointer to incomplete type 'struct migrate_vma'
      59 |  minfo = range->migrate ? range->migrate->flags : 0;
         |                                         ^~
   mm/hmm.c:61:3: error: 'MIGRATE_VMA_SELECT_SYSTEM' undeclared (first use in this function)
      61 |   MIGRATE_VMA_SELECT_SYSTEM : 0;
         |   ^~~~~~~~~~~~~~~~~~~~~~~~~
   mm/hmm.c:61:3: note: each undeclared identifier is reported only once for each function it appears in
>> mm/hmm.c:63:9: warning: 'return' with a value, in function returning void [-Wreturn-type]
      63 |  return minfo;
         |         ^~~~~
   mm/hmm.c:55:30: note: declared here
      55 | static enum migrate_vma_info hmm_want_migrate(struct hmm_range *range)
         |                              ^~~~~~~~~~~~~~~~
>> mm/hmm.c:57:24: warning: unused variable 'minfo' [-Wunused-variable]
      57 |  enum migrate_vma_info minfo;
         |                        ^~~~~
   mm/hmm.c: In function 'hmm_pfns_fill':
   mm/hmm.c:73:7: error: void value not ignored as it ought to be
      73 |   if (hmm_want_migrate(range) &&
         |       ^~~~~~~~~~~~~~~~~~~~~~~
   mm/hmm.c: In function 'hmm_vma_handle_migrate_prepare':
   mm/hmm.c:367:24: error: storage size of 'minfo' isn't known
     367 |  enum migrate_vma_info minfo;
         |                        ^~~~~
   mm/hmm.c:415:17: error: 'MIGRATE_VMA_SELECT_DEVICE_PRIVATE' undeclared (first use in this function)
     415 |   if (!(minfo & MIGRATE_VMA_SELECT_DEVICE_PRIVATE))
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/hmm.c:425:16: error: 'MIGRATE_VMA_SELECT_SYSTEM' undeclared (first use in this function)
     425 |       (minfo & MIGRATE_VMA_SELECT_SYSTEM)) {
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~
   mm/hmm.c:437:10: error: 'MIGRATE_VMA_SELECT_DEVICE_COHERENT' undeclared (first use in this function)
     437 |          MIGRATE_VMA_SELECT_DEVICE_COHERENT) ||
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/hmm.c:519:4: error: implicit declaration of function 'flush_tlb_range'; did you mean 'flush_pmd_tlb_range'? [-Werror=implicit-function-declaration]
     519 |    flush_tlb_range(walk->vma, addr, addr + PAGE_SIZE);
         |    ^~~~~~~~~~~~~~~
         |    flush_pmd_tlb_range
   mm/hmm.c:367:24: warning: unused variable 'minfo' [-Wunused-variable]
     367 |  enum migrate_vma_info minfo;
         |                        ^~~~~
   mm/hmm.c: In function 'hmm_vma_capture_migrate_range':
   mm/hmm.c:580:6: error: invalid use of void expression
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


vim +/return +63 mm/hmm.c

    54	
    55	static enum migrate_vma_info hmm_want_migrate(struct hmm_range *range)
    56	{
  > 57		enum migrate_vma_info minfo;
    58	
    59		minfo = range->migrate ? range->migrate->flags : 0;
    60		minfo |= (range->default_flags & HMM_PFN_REQ_MIGRATE) ?
    61			MIGRATE_VMA_SELECT_SYSTEM : 0;
    62	
  > 63		return minfo;
    64	}
    65	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

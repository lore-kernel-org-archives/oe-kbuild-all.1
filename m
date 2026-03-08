Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FFDA34252C
	for <oe-kbuild-all@lists.linux.dev>; Sun,  8 Mar 2026 10:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772965926; cv=none; b=Rbq9s6h6UNd4KdwfEsJ/VkG/R7k+iUsR2UqGo/lCuNUmaoglrZ/KdSQWcDh357ICBR0Vp7pf8e/3jORTn7QbaRXhVU8kp8xYifQRSSvu7tmeqyDhNhKeSXxUTIfQ92nwGsX63kej51xI9dJM3s6vXW6uvHskha7esAPgChqlPnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772965926; c=relaxed/simple;
	bh=ncBH7QjvcCUBIf8fGdePg33VqPJaQuSli7WHOEg4WB8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rGxuPM5LA+MsOuyM2ni8MnISAsju5atkOEO22khBAIM7ZSsjbiP0U7GrsNNWG3Qkcd1RH6PrG2TBk3o1xDyKdddGEOoMUZ0pcBzJZEuSf1OU6X4IGbm/2Wo5EEt08q7FCsDElteo1RdeVscXPZmYapwf6MrHNWkIM0KfqCWb0go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZClVLNhz; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZClVLNhz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772965925; x=1804501925;
  h=date:from:to:cc:subject:message-id;
  bh=ncBH7QjvcCUBIf8fGdePg33VqPJaQuSli7WHOEg4WB8=;
  b=ZClVLNhzrqseugP70XwpeuFN7M0NBDL39tqMgcKHG5VPDz7eIOYqlT86
   Gus0oUFpNXaQVyID4IIXW7PNLmNr8YBwkausEFnHB/FZukjMpVBk5Fckl
   s7pW4BgowBqrZR8sSY9WeNhmJXhWi6L0ORxq7i6r2/q0fBD2/tYGhL7ws
   WcnEBFWYMAwAV3pCA5AyBUhrCME46UassaVGYcyfm5F7aLJ/5cVR69bGZ
   4z3kIPAyFVUf3wJ6IJqZIZg65k3HY5YFfp3ntMSyhoD4ziSG1Ab2vJcm7
   q+xUQPHEz1BN4FPW2Ls7xhxvNTgIH5tDKzUJECD8K0L3NGH/DRN1MgvrX
   A==;
X-CSE-ConnectionGUID: C6YRvQrYSciXozwNKKxiNA==
X-CSE-MsgGUID: toWtPgxoSKKrPWuzvIbNdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11722"; a="85367061"
X-IronPort-AV: E=Sophos;i="6.23,108,1770624000"; 
   d="scan'208";a="85367061"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2026 03:32:04 -0700
X-CSE-ConnectionGUID: JCVLSz5rSGCm6oCi7/Rklw==
X-CSE-MsgGUID: 6jtu8YqFRVun2BPmiPyb6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,108,1770624000"; 
   d="scan'208";a="219441279"
Received: from lkp-server01.sh.intel.com (HELO 058beb05654c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 08 Mar 2026 03:32:02 -0700
Received: from kbuild by 058beb05654c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vzBQV-0000000031v-1jqF;
	Sun, 08 Mar 2026 10:31:59 +0000
Date: Sun, 08 Mar 2026 18:31:45 +0800
From: kernel test robot <lkp@intel.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [davidhildenbrand:hotplug_vmemmap 14/14]
 mm/sparse-vmemmap.c:756:31: warning: unused variable 'section_nr'
Message-ID: <202603081805.ulEmbVAI-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/davidhildenbrand/linux hotplug_vmemmap
head:   58d0ede3533299d5c6ec069fd491a115558f7c6c
commit: 58d0ede3533299d5c6ec069fd491a115558f7c6c [14/14] mm/sparse: move memory hotplug bits to sparse-vmemmap.c
config: s390-randconfig-001-20260308 (https://download.01.org/0day-ci/archive/20260308/202603081805.ulEmbVAI-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260308/202603081805.ulEmbVAI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603081805.ulEmbVAI-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/sparse-vmemmap.c: In function 'section_deactivate':
>> mm/sparse-vmemmap.c:756:31: warning: unused variable 'section_nr' [-Wunused-variable]
     756 |                 unsigned long section_nr = pfn_to_section_nr(pfn);
         |                               ^~~~~~~~~~


vim +/section_nr +756 mm/sparse-vmemmap.c

   726	
   727	/*
   728	 * To deactivate a memory region, there are 3 cases to handle across
   729	 * two configurations (SPARSEMEM_VMEMMAP={y,n}):
   730	 *
   731	 * 1. deactivation of a partial hot-added section (only possible in
   732	 *    the SPARSEMEM_VMEMMAP=y case).
   733	 *      a) section was present at memory init.
   734	 *      b) section was hot-added post memory init.
   735	 * 2. deactivation of a complete hot-added section.
   736	 * 3. deactivation of a complete section from memory init.
   737	 *
   738	 * For 1, when subsection_map does not empty we will not be freeing the
   739	 * usage map, but still need to free the vmemmap range.
   740	 *
   741	 * For 2 and 3, the SPARSEMEM_VMEMMAP={y,n} cases are unified
   742	 */
   743	static void section_deactivate(unsigned long pfn, unsigned long nr_pages,
   744			struct vmem_altmap *altmap)
   745	{
   746		struct mem_section *ms = __pfn_to_section(pfn);
   747		bool section_is_early = early_section(ms);
   748		struct page *memmap = NULL;
   749		bool empty;
   750	
   751		if (clear_subsection_map(pfn, nr_pages))
   752			return;
   753	
   754		empty = is_subsection_map_empty(ms);
   755		if (empty) {
 > 756			unsigned long section_nr = pfn_to_section_nr(pfn);
   757	
   758			/*
   759			 * Mark the section invalid so that valid_section()
   760			 * return false. This prevents code from dereferencing
   761			 * ms->usage array.
   762			 */
   763			ms->section_mem_map &= ~SECTION_HAS_MEM_MAP;
   764	
   765			/*
   766			 * When removing an early section, the usage map is kept (as the
   767			 * usage maps of other sections fall into the same page). It
   768			 * will be re-used when re-adding the section - which is then no
   769			 * longer an early section. If the usage map is PageReserved, it
   770			 * was allocated during boot.
   771			 */
   772			if (!PageReserved(virt_to_page(ms->usage))) {
   773				kfree_rcu(ms->usage, rcu);
   774				WRITE_ONCE(ms->usage, NULL);
   775			}
   776			memmap = pfn_to_page(SECTION_ALIGN_DOWN(pfn));
   777		}
   778	
   779		/*
   780		 * The memmap of early sections is always fully populated. See
   781		 * section_activate() and pfn_valid() .
   782		 */
   783		if (!section_is_early) {
   784			memmap_pages_add(-1L * (DIV_ROUND_UP(nr_pages * sizeof(struct page), PAGE_SIZE)));
   785			depopulate_section_memmap(pfn, nr_pages, altmap);
   786		} else if (memmap) {
   787			memmap_boot_pages_add(-1L * (DIV_ROUND_UP(nr_pages * sizeof(struct page),
   788								  PAGE_SIZE)));
   789			free_map_bootmem(memmap);
   790		}
   791	
   792		if (empty)
   793			ms->section_mem_map = (unsigned long)NULL;
   794	}
   795	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

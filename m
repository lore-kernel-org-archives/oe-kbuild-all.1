Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB7A723314B
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 Dec 2025 01:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765242655; cv=none; b=fS040Atm5EgZobc2jlDlzrAD1Fn0puKaX7h1AKlYi4+CaikAVthcEp++5P5Zx8DxT+tBwHPmd+ecaKMwdlpxU07NGwkhPY68/3/3+jHoi3QeFG2fMmS4bJH3zBRa+KXM4FV9ZSUPK/8jCyOL50l6hlkbGBconElDbPyIrc4FitM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765242655; c=relaxed/simple;
	bh=/EbTB2VpFhTczeUk+QQoWbLB5Re1Ql5lmWm28tpOWNM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C/lPAK7AyCBCbUG/UKjh+rZNsgj2epFM5FjZS95YVGektetMUYiXIwUx/Afx0ySrzOwLirU/HXnP/tmvrHxuYJoRZfRwz4P1O32jvbBcDxESOEvoLkb/LjaRr/gZXbA5v/012A27b35a3hScmk31atpIoFefPBRNyr1CWu5wyuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a0rfiiOM; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a0rfiiOM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765242654; x=1796778654;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/EbTB2VpFhTczeUk+QQoWbLB5Re1Ql5lmWm28tpOWNM=;
  b=a0rfiiOMelE/DOJss1zOKFWhOY9P4R0Y2fXNFvjKbhg9R80/PV7/u73+
   C+8z++uyWYw87yckhdCOnqVy6eayRLaEbO1jNRua1Bw2zqzmI6cr5KWxs
   Oolg2wK5qboqnAcZCPg43mc7MvQiT5vIDWcKz2Z3uIsHb66dISf8omRzJ
   vFRs3375a05EvzoWq596gvGchNuauSfa27zyjVfawQGq22gBQZS69uckK
   qtfLjKtz/tNr112H5mT4xhkrxYPt7ieoAZkEAI+R0vFvDqQ0Te0GXgjyn
   Wb2zha7vmXqLMbN08/oyLVd+rpIlyrByu3XM2VSFiTW3RB9okLvEVhuNu
   g==;
X-CSE-ConnectionGUID: I/QFqDMUQ56BPHqX222bzg==
X-CSE-MsgGUID: jlt6HvhMTMOdue97ZlQKUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="92669361"
X-IronPort-AV: E=Sophos;i="6.20,260,1758610800"; 
   d="scan'208";a="92669361"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2025 17:10:53 -0800
X-CSE-ConnectionGUID: iU7rIwTtT9yciBOprGY+Sw==
X-CSE-MsgGUID: 3CbqSVE0TaKwTC+/XtMQCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,260,1758610800"; 
   d="scan'208";a="195368149"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 08 Dec 2025 17:10:52 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vSmFc-0000000017W-2zkh;
	Tue, 09 Dec 2025 01:10:48 +0000
Date: Tue, 9 Dec 2025 09:10:40 +0800
From: kernel test robot <lkp@intel.com>
To: Brendan Jackman <jackmanb@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Uladzislau Rezki <urezki@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	linux-kernel@vger.kernel.org, Brendan Jackman <jackmanb@google.com>
Subject: Re: [PATCH] mm/vmalloc: clarify why vmap_range_noflush() might sleep
Message-ID: <202512090844.OmozcWcI-lkp@intel.com>
References: <20251208-b4-vmalloc-might_alloc-v1-1-94a9bb8ecb08@google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251208-b4-vmalloc-might_alloc-v1-1-94a9bb8ecb08@google.com>

Hi Brendan,

kernel test robot noticed the following build errors:

[auto build test ERROR on ecc46e02e0abe025a6e840cba2d647f23fd1d721]

url:    https://github.com/intel-lab-lkp/linux/commits/Brendan-Jackman/mm-vmalloc-clarify-why-vmap_range_noflush-might-sleep/20251208-132202
base:   ecc46e02e0abe025a6e840cba2d647f23fd1d721
patch link:    https://lore.kernel.org/r/20251208-b4-vmalloc-might_alloc-v1-1-94a9bb8ecb08%40google.com
patch subject: [PATCH] mm/vmalloc: clarify why vmap_range_noflush() might sleep
config: nios2-allnoconfig (https://download.01.org/0day-ci/archive/20251209/202512090844.OmozcWcI-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251209/202512090844.OmozcWcI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512090844.OmozcWcI-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/vmalloc.c: In function 'vmap_range_noflush':
>> mm/vmalloc.c:308:21: error: 'GFP_PGTABLE_KERNEL' undeclared (first use in this function)
     308 |         might_alloc(GFP_PGTABLE_KERNEL);
         |                     ^~~~~~~~~~~~~~~~~~
   mm/vmalloc.c:308:21: note: each undeclared identifier is reported only once for each function it appears in


vim +/GFP_PGTABLE_KERNEL +308 mm/vmalloc.c

   297	
   298	static int vmap_range_noflush(unsigned long addr, unsigned long end,
   299				phys_addr_t phys_addr, pgprot_t prot,
   300				unsigned int max_page_shift)
   301	{
   302		pgd_t *pgd;
   303		unsigned long start;
   304		unsigned long next;
   305		int err;
   306		pgtbl_mod_mask mask = 0;
   307	
 > 308		might_alloc(GFP_PGTABLE_KERNEL);
   309		BUG_ON(addr >= end);
   310	
   311		start = addr;
   312		pgd = pgd_offset_k(addr);
   313		do {
   314			next = pgd_addr_end(addr, end);
   315			err = vmap_p4d_range(pgd, addr, next, phys_addr, prot,
   316						max_page_shift, &mask);
   317			if (err)
   318				break;
   319		} while (pgd++, phys_addr += (next - addr), addr = next, addr != end);
   320	
   321		if (mask & ARCH_PAGE_TABLE_SYNC_MASK)
   322			arch_sync_kernel_mappings(start, end);
   323	
   324		return err;
   325	}
   326	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47234283CB5
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Jul 2026 13:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783604062; cv=none; b=g6LU135IXjpY67G47X2KcK4wgviCwxP9kcwdSTrZeDOkPcqFz+Z/txwo7rpuPQ5BEcUHpcAAblvoALVIc8RwNtw/G/pHUuFC6huUcX8vsB9J2y87K5OfMQF/mOeoGncfs6pQEpN55u2aaHTWJWU9KBLO+gZR1tXRIWUUoUJ1ohE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783604062; c=relaxed/simple;
	bh=X3CwQbCqfrcNU9ZylJJlHJqkM//5I2Tgy37tgnnrNBo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iAajeLHAsV0pCffU7yIu6sGX4PyJbOZeVX+y8V5b8Jd/APiTIiDXGqxr0gmo7v6wUjsM2IG3ATQ2N43lAiQ1ZU7OdvjEhh1KHv9I5IMROLyNyhNBvLPw5WPdJ8Krr/nl4SrhUKYB7oRnLEPMd2n1gjXfjJppqIbwnAZRvZv5tss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I22Ny/ZU; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I22Ny/ZU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783604060; x=1815140060;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=X3CwQbCqfrcNU9ZylJJlHJqkM//5I2Tgy37tgnnrNBo=;
  b=I22Ny/ZUw6WJGFctYYlPru+OTcsf1T/aAvF0by00BHLN7iLQdQt/uU/P
   Dz8HQt+92c27RFPvWmFm0FObx9uAl43pZu74TPX01c/lVUArNwa6D3v27
   Crex0nllrdqqsB7lbb5iiS7kMuRwOAU5CUBHagSfKMDlKqVYMsrzQmjOP
   net2YQk4qkuhowqoxBqXewBoJgihbPWedHNr/9veZKsRXH/CznZ33OJci
   3rOIXb9OXSg1+Gd0R/fOjPBy6Mkqzz/e6qKBVfYWYTxVNlkzi2gCAu1sv
   78V5VjCly6KZ2rAuyhQKXq9sCU5390XD5ifN6X5b5KSiRZ5wVQrgTxmYn
   w==;
X-CSE-ConnectionGUID: CFWpng5PTwCoSFfQaW9t1A==
X-CSE-MsgGUID: ygVKAcerSHmuYEPYfaK5gw==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="83258540"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="83258540"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2026 06:34:19 -0700
X-CSE-ConnectionGUID: 9cubGrFMQ5SZBjxcss1LVg==
X-CSE-MsgGUID: SZ4xYWHESIejiE1wEnNLhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="250188140"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 09 Jul 2026 06:34:15 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1whotI-00000000Hih-27Cs;
	Thu, 09 Jul 2026 13:34:12 +0000
Date: Thu, 9 Jul 2026 21:34:01 +0800
From: kernel test robot <lkp@intel.com>
To: Vivian Wang <wangruikang@iscas.ac.cn>, Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Lorenzo Stoakes <ljs@kernel.org>, Michal Hocko <mhocko@suse.com>,
	Mike Rapoport <rppt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Vlastimil Babka <vbabka@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	Muchun Song <muchun.song@linux.dev>,
	Vivian Wang <wangruikang@iscas.ac.cn>
Subject: Re: [PATCH v5] mm/sparse-vmemmap: flush_cache_vmap() after
 hotplugging vmemmap
Message-ID: <202607092128.yG6dYQOt-lkp@intel.com>
References: <20260707-mark-after-vmemmap-populate-v5-1-77d1ded3cae3@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260707-mark-after-vmemmap-populate-v5-1-77d1ded3cae3@iscas.ac.cn>

Hi Vivian,

kernel test robot noticed the following build errors:

[auto build test ERROR on dc59e4fea9d83f03bad6bddf3fa2e52491777482]

url:    https://github.com/intel-lab-lkp/linux/commits/Vivian-Wang/mm-sparse-vmemmap-flush_cache_vmap-after-hotplugging-vmemmap/20260707-121114
base:   dc59e4fea9d83f03bad6bddf3fa2e52491777482
patch link:    https://lore.kernel.org/r/20260707-mark-after-vmemmap-populate-v5-1-77d1ded3cae3%40iscas.ac.cn
patch subject: [PATCH v5] mm/sparse-vmemmap: flush_cache_vmap() after hotplugging vmemmap
config: riscv-randconfig-002-20260709 (https://download.01.org/0day-ci/archive/20260709/202607092128.yG6dYQOt-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260709/202607092128.yG6dYQOt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607092128.yG6dYQOt-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/cacheflush.h:5,
                    from include/linux/highmem.h:8,
                    from include/linux/bvec.h:10,
                    from include/linux/blk_types.h:10,
                    from include/linux/writeback.h:13,
                    from include/linux/memcontrol.h:23,
                    from include/linux/swap.h:9,
                    from include/linux/suspend.h:5,
                    from arch/riscv/kernel/asm-offsets.c:12:
   arch/riscv/include/asm/cacheflush.h: In function 'flush_cache_vmap':
>> arch/riscv/include/asm/cacheflush.h:60:16: error: 'VMEMMAP_START' undeclared (first use in this function)
      60 |      (start >= VMEMMAP_START && end <= VMEMMAP_END))
         |                ^~~~~~~~~~~~~
   arch/riscv/include/asm/cacheflush.h:60:16: note: each undeclared identifier is reported only once for each function it appears in
>> arch/riscv/include/asm/cacheflush.h:60:40: error: 'VMEMMAP_END' undeclared (first use in this function); did you mean 'MEMREMAP_ENC'?
      60 |      (start >= VMEMMAP_START && end <= VMEMMAP_END))
         |                                        ^~~~~~~~~~~
         |                                        MEMREMAP_ENC
   make[3]: *** [scripts/Makefile.build:184: arch/riscv/kernel/asm-offsets.s] Error 1 shuffle=275821313
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1405: prepare0] Error 2 shuffle=275821313
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2 shuffle=275821313
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2 shuffle=275821313
   make: Target 'prepare' not remade because of errors.


vim +/VMEMMAP_START +60 arch/riscv/include/asm/cacheflush.h

    42	
    43	#ifdef CONFIG_64BIT
    44	/* This is accessed in assembly code. cpumask_var_t would be too complex. */
    45	extern DECLARE_BITMAP(new_valid_map_cpus, NR_CPUS);
    46	extern char _end[];
    47	static inline void mark_new_valid_map(void)
    48	{
    49		/*
    50		 * We don't care if concurrently a cpu resets this value since
    51		 * the only place this can happen is in handle_exception() where
    52		 * an sfence.vma is emitted.
    53		 */
    54		bitmap_fill(new_valid_map_cpus, NR_CPUS);
    55	}
    56	#define flush_cache_vmap flush_cache_vmap
    57	static inline void flush_cache_vmap(unsigned long start, unsigned long end)
    58	{
    59		if (is_vmalloc_or_module_addr((void *)start) ||
  > 60		    (start >= VMEMMAP_START && end <= VMEMMAP_END))
    61			mark_new_valid_map();
    62	}
    63	#define flush_cache_vmap_early(start, end)	local_flush_tlb_kernel_range(start, end)
    64	#endif
    65	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

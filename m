Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3C78535D6
	for <oe-kbuild-all@lists.linux.dev>; Tue, 26 Mar 2024 09:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711444274; cv=none; b=SZuawvUNWcWwp8DJsy0t3vAu1cG5Bq0X5IFRV0ZwTcFOtXg2/V+z8CXr9ZTV1YT+FjTLwLpvxIl12JgQpPIDRm+MJv30CP57Eiz0WOW+atskp++m3VV18c3Tl/iNGvlHryO+MnSwHfzKgbea0CaKpdP36z+UENzZpkeeSJimrLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711444274; c=relaxed/simple;
	bh=3gOHfOUHc4A/s7gvfWKALuYbEUz+1DHD78B62wsfrQk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WI5UY+eAkN17yggrR7D2cswp81x/hDUwSQ0OD72d8aDzR2vAA5II4Ij2R9mw8aD+qkzIZvAAThB6dAQC3SZP10R6sb5OD8qrg8Dn7NIpeDf5EaIYJhspE3rt87wsXkL2JzHgm06AiY3JehCKmPe2J2t4LNLAAB3ifI4wNQ9PPL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jx3k1Ske; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jx3k1Ske"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711444273; x=1742980273;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3gOHfOUHc4A/s7gvfWKALuYbEUz+1DHD78B62wsfrQk=;
  b=Jx3k1SkesCvXGJne8kDCv6chw3QS5hwTRQMxlCB5Ce9pLLBMNDKvc7x2
   m33jBhl0VIFx2SVBSi+s+6NjH+tWIPOqqERCX6VdojNdTpyGYaxvunaPx
   G+QGOfSSk6eSgTTGwdKvy2CGvCcuOFmNjhFMGswSybs5CMcfSN9IA/QPi
   gpZ5wb21Sx2ry2MEpFPDmgSbK1aoVHH05Q8hk8UgtSeSdqinO1cL7ynr5
   qnd29FpRl6cNRBr87ekKRBOkOsxSSRX8Who51hz4dPfSqsUemU+PkJGIh
   EgH4GOg7YVRu347cKmJLjg5/ePSZrLx7okowoQvBKp0F+AC4KPLa9tchb
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="9449410"
X-IronPort-AV: E=Sophos;i="6.07,155,1708416000"; 
   d="scan'208";a="9449410"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2024 02:01:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,155,1708416000"; 
   d="scan'208";a="20552265"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 26 Mar 2024 02:01:53 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rp2gp-000NFK-0E;
	Tue, 26 Mar 2024 09:01:51 +0000
Date: Tue, 26 Mar 2024 17:01:21 +0800
From: kernel test robot <lkp@intel.com>
To: Baoquan He <bhe@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 1/7] mm/mm_init.c: remove the useless dma_reserve
Message-ID: <202403261645.M4PkWdmb-lkp@intel.com>
References: <20240325150459.1045407-2-bhe@redhat.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240325150459.1045407-2-bhe@redhat.com>

Hi Baoquan,

kernel test robot noticed the following build errors:

[auto build test ERROR on powerpc/next]
[also build test ERROR on powerpc/fixes linus/master v6.9-rc1]
[cannot apply to akpm-mm/mm-everything next-20240326]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Baoquan-He/mm-mm_init-c-remove-the-useless-dma_reserve/20240325-230756
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
patch link:    https://lore.kernel.org/r/20240325150459.1045407-2-bhe%40redhat.com
patch subject: [PATCH 1/7] mm/mm_init.c: remove the useless dma_reserve
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20240326/202403261645.M4PkWdmb-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240326/202403261645.M4PkWdmb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403261645.M4PkWdmb-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/mm/init.c: In function 'memblock_find_dma_reserve':
>> arch/x86/mm/init.c:1036:9: error: implicit declaration of function 'set_dma_reserve'; did you mean 'get_dma_residue'? [-Werror=implicit-function-declaration]
    1036 |         set_dma_reserve(nr_pages - nr_free_pages);
         |         ^~~~~~~~~~~~~~~
         |         get_dma_residue
   cc1: some warnings being treated as errors


vim +1036 arch/x86/mm/init.c

176239153049a0 Pekka Enberg 2011-11-01   992  
4270fd8b4c27f0 Ingo Molnar  2017-01-28   993  /*
4270fd8b4c27f0 Ingo Molnar  2017-01-28   994   * Calculate the precise size of the DMA zone (first 16 MB of RAM),
4270fd8b4c27f0 Ingo Molnar  2017-01-28   995   * and pass it to the MM layer - to help it set zone watermarks more
4270fd8b4c27f0 Ingo Molnar  2017-01-28   996   * accurately.
4270fd8b4c27f0 Ingo Molnar  2017-01-28   997   *
4270fd8b4c27f0 Ingo Molnar  2017-01-28   998   * Done on 64-bit systems only for the time being, although 32-bit systems
4270fd8b4c27f0 Ingo Molnar  2017-01-28   999   * might benefit from this as well.
4270fd8b4c27f0 Ingo Molnar  2017-01-28  1000   */
4270fd8b4c27f0 Ingo Molnar  2017-01-28  1001  void __init memblock_find_dma_reserve(void)
4270fd8b4c27f0 Ingo Molnar  2017-01-28  1002  {
4270fd8b4c27f0 Ingo Molnar  2017-01-28  1003  #ifdef CONFIG_X86_64
4270fd8b4c27f0 Ingo Molnar  2017-01-28  1004  	u64 nr_pages = 0, nr_free_pages = 0;
4270fd8b4c27f0 Ingo Molnar  2017-01-28  1005  	unsigned long start_pfn, end_pfn;
4270fd8b4c27f0 Ingo Molnar  2017-01-28  1006  	phys_addr_t start_addr, end_addr;
4270fd8b4c27f0 Ingo Molnar  2017-01-28  1007  	int i;
4270fd8b4c27f0 Ingo Molnar  2017-01-28  1008  	u64 u;
4270fd8b4c27f0 Ingo Molnar  2017-01-28  1009  
4270fd8b4c27f0 Ingo Molnar  2017-01-28  1010  	/*
4270fd8b4c27f0 Ingo Molnar  2017-01-28  1011  	 * Iterate over all memory ranges (free and reserved ones alike),
4270fd8b4c27f0 Ingo Molnar  2017-01-28  1012  	 * to calculate the total number of pages in the first 16 MB of RAM:
4270fd8b4c27f0 Ingo Molnar  2017-01-28  1013  	 */
4270fd8b4c27f0 Ingo Molnar  2017-01-28  1014  	nr_pages = 0;
4270fd8b4c27f0 Ingo Molnar  2017-01-28  1015  	for_each_mem_pfn_range(i, MAX_NUMNODES, &start_pfn, &end_pfn, NULL) {
4270fd8b4c27f0 Ingo Molnar  2017-01-28  1016  		start_pfn = min(start_pfn, MAX_DMA_PFN);
4270fd8b4c27f0 Ingo Molnar  2017-01-28  1017  		end_pfn   = min(end_pfn,   MAX_DMA_PFN);
4270fd8b4c27f0 Ingo Molnar  2017-01-28  1018  
4270fd8b4c27f0 Ingo Molnar  2017-01-28  1019  		nr_pages += end_pfn - start_pfn;
4270fd8b4c27f0 Ingo Molnar  2017-01-28  1020  	}
4270fd8b4c27f0 Ingo Molnar  2017-01-28  1021  
4270fd8b4c27f0 Ingo Molnar  2017-01-28  1022  	/*
4270fd8b4c27f0 Ingo Molnar  2017-01-28  1023  	 * Iterate over free memory ranges to calculate the number of free
4270fd8b4c27f0 Ingo Molnar  2017-01-28  1024  	 * pages in the DMA zone, while not counting potential partial
4270fd8b4c27f0 Ingo Molnar  2017-01-28  1025  	 * pages at the beginning or the end of the range:
4270fd8b4c27f0 Ingo Molnar  2017-01-28  1026  	 */
4270fd8b4c27f0 Ingo Molnar  2017-01-28  1027  	nr_free_pages = 0;
4270fd8b4c27f0 Ingo Molnar  2017-01-28  1028  	for_each_free_mem_range(u, NUMA_NO_NODE, MEMBLOCK_NONE, &start_addr, &end_addr, NULL) {
4270fd8b4c27f0 Ingo Molnar  2017-01-28  1029  		start_pfn = min_t(unsigned long, PFN_UP(start_addr), MAX_DMA_PFN);
4270fd8b4c27f0 Ingo Molnar  2017-01-28  1030  		end_pfn   = min_t(unsigned long, PFN_DOWN(end_addr), MAX_DMA_PFN);
4270fd8b4c27f0 Ingo Molnar  2017-01-28  1031  
4270fd8b4c27f0 Ingo Molnar  2017-01-28  1032  		if (start_pfn < end_pfn)
4270fd8b4c27f0 Ingo Molnar  2017-01-28  1033  			nr_free_pages += end_pfn - start_pfn;
4270fd8b4c27f0 Ingo Molnar  2017-01-28  1034  	}
4270fd8b4c27f0 Ingo Molnar  2017-01-28  1035  
4270fd8b4c27f0 Ingo Molnar  2017-01-28 @1036  	set_dma_reserve(nr_pages - nr_free_pages);
4270fd8b4c27f0 Ingo Molnar  2017-01-28  1037  #endif
4270fd8b4c27f0 Ingo Molnar  2017-01-28  1038  }
4270fd8b4c27f0 Ingo Molnar  2017-01-28  1039  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

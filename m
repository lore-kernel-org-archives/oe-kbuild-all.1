Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F7CC32C85
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 Aug 2025 15:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755012053; cv=none; b=JgpbDptlTwUakRa08mqu4hDmujUxOPf10vTUEFle8KUO6VQosXVsK9ASzA7OuHPL/nLja9tleI6tS9ghAt+TYXlSCxcdU334VxtL/c9+DNKpCuzFnqIGv4anxxMx8jJZKM7stxYYjtg2FnwRKb0zqjBuoPPoU2RX1vW8M6LJWsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755012053; c=relaxed/simple;
	bh=Oiv44p6aKIEG4xSPKNyltEPRDVOfxciCNzXH9u6JBIY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ejxsxvd82Mc2RLjJyJ8SE5vteLlpzEXFjwvNrR8EXTWB8flEWsRGNvOWI5F6slPASH6nohhXM9+PVspSuBgIQGFuE9Mc/cq/azoY1YUnylff7ZKhBEEB+6YSbvjDC1WB4QV1cnoBh+HJ8szvFHF79hNxeO0Q37vLREhD2lSsIRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dvffMTWL; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dvffMTWL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755012052; x=1786548052;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Oiv44p6aKIEG4xSPKNyltEPRDVOfxciCNzXH9u6JBIY=;
  b=dvffMTWLrpT+etVz5uuQu8yrEb3AoBtNYXPhpJi/dyliMibQNrnNB1Fo
   71TpY5YO+AHR8j7MfrCggGgLVxS5EiTF1sKXJwBfnJGIwbfMB3acfvsi8
   5aGeNEAal4xTlTeFfvKmJzwJhrQhNN/jWdQ92ankPkm/XoxZDtjvwGdnz
   wC2S3sTK2AQtVeNFgLOfIFqTwF//jPGOCfWpsSiOP/cnY7LbxZIkURuGj
   QjCwZkfQ8z+xLHQFVwpdG+swaUzkIOgY/9bnkfTYIWgSLRP5ppuoVxdcD
   ZbcNNjQM643wlUvPuTwpMYr/DsN4QmhJCDn/hFpY4Qv9zXfHZZdFq8DYC
   A==;
X-CSE-ConnectionGUID: kBvNAlpOS0WDn1Y6SXR7kQ==
X-CSE-MsgGUID: wHJDWPD7TRua8rVSyrcoDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="60913936"
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; 
   d="scan'208";a="60913936"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2025 08:20:52 -0700
X-CSE-ConnectionGUID: X6pU2BjFTTOoFWgitBWL7Q==
X-CSE-MsgGUID: 4+sncj2mQjeFybYlCvxjqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; 
   d="scan'208";a="165721257"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 12 Aug 2025 08:20:45 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ulqnb-0006vX-0q;
	Tue, 12 Aug 2025 15:20:35 +0000
Date: Tue, 12 Aug 2025 23:19:23 +0800
From: kernel test robot <lkp@intel.com>
To: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>,
	nathan@kernel.org, arnd@arndb.de, broonie@kernel.org,
	Liam.Howlett@oracle.com, urezki@gmail.com, will@kernel.org,
	kaleshsingh@google.com, rppt@kernel.org, leitao@debian.org,
	coxu@redhat.com, surenb@google.com, akpm@linux-foundation.org,
	luto@kernel.org, jpoimboe@kernel.org, changyuanl@google.com,
	hpa@zytor.com, dvyukov@google.com, kas@kernel.org, corbet@lwn.net,
	vincenzo.frascino@arm.com, smostafa@google.com,
	nick.desaulniers+lkml@gmail.com, morbo@google.com,
	andreyknvl@gmail.com, alexander.shishkin@linux.intel.com,
	thiago.bauermann@linaro.org, catalin.marinas@arm.com,
	ryabinin.a.a@gmail.com, jan.kiszka@siemens.com, jbohac@suse.cz
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v4 07/18] mm: x86: Untag addresses in EXECMEM_ROX related
 pointer arithmetic
Message-ID: <202508122324.wqY9i4tm-lkp@intel.com>
References: <aa501a8133ee0f336dc9f905fdc3453d964109ed.1755004923.git.maciej.wieczor-retman@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aa501a8133ee0f336dc9f905fdc3453d964109ed.1755004923.git.maciej.wieczor-retman@intel.com>

Hi Maciej,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]
[also build test ERROR on arm64/for-next/core tip/x86/mm linus/master v6.17-rc1 next-20250812]
[cannot apply to tip/x86/core]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Maciej-Wieczor-Retman/kasan-sw_tags-Use-arithmetic-shift-for-shadow-computation/20250812-213257
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/aa501a8133ee0f336dc9f905fdc3453d964109ed.1755004923.git.maciej.wieczor-retman%40intel.com
patch subject: [PATCH v4 07/18] mm: x86: Untag addresses in EXECMEM_ROX related pointer arithmetic
config: riscv-randconfig-002-20250812 (https://download.01.org/0day-ci/archive/20250812/202508122324.wqY9i4tm-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250812/202508122324.wqY9i4tm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508122324.wqY9i4tm-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/kernel.h:28,
                    from include/linux/cpumask.h:11,
                    from include/linux/alloc_tag.h:13,
                    from include/linux/vmalloc.h:5,
                    from mm/vmalloc.c:11:
   mm/vmalloc.c: In function 'vm_reset_perms':
>> mm/vmalloc.c:3331:31: error: implicit declaration of function 'arch_kasan_reset_tag'; did you mean 'kasan_reset_tag'? [-Werror=implicit-function-declaration]
       start = min((unsigned long)arch_kasan_reset_tag(addr), start);
                                  ^~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:92:20: note: in definition of macro '__careful_cmp_once'
     __auto_type ux = (x); __auto_type uy = (y); \
                       ^
   include/linux/minmax.h:105:19: note: in expansion of macro '__careful_cmp'
    #define min(x, y) __careful_cmp(min, x, y)
                      ^~~~~~~~~~~~~
   mm/vmalloc.c:3331:12: note: in expansion of macro 'min'
       start = min((unsigned long)arch_kasan_reset_tag(addr), start);
               ^~~
   cc1: some warnings being treated as errors


vim +3331 mm/vmalloc.c

  3309	
  3310	/*
  3311	 * Flush the vm mapping and reset the direct map.
  3312	 */
  3313	static void vm_reset_perms(struct vm_struct *area)
  3314	{
  3315		unsigned long start = ULONG_MAX, end = 0;
  3316		unsigned int page_order = vm_area_page_order(area);
  3317		int flush_dmap = 0;
  3318		int i;
  3319	
  3320		/*
  3321		 * Find the start and end range of the direct mappings to make sure that
  3322		 * the vm_unmap_aliases() flush includes the direct map.
  3323		 */
  3324		for (i = 0; i < area->nr_pages; i += 1U << page_order) {
  3325			unsigned long addr = (unsigned long)page_address(area->pages[i]);
  3326	
  3327			if (addr) {
  3328				unsigned long page_size;
  3329	
  3330				page_size = PAGE_SIZE << page_order;
> 3331				start = min((unsigned long)arch_kasan_reset_tag(addr), start);
  3332				end = max((unsigned long)arch_kasan_reset_tag(addr) + page_size, end);
  3333				flush_dmap = 1;
  3334			}
  3335		}
  3336	
  3337		/*
  3338		 * Set direct map to something invalid so that it won't be cached if
  3339		 * there are any accesses after the TLB flush, then flush the TLB and
  3340		 * reset the direct map permissions to the default.
  3341		 */
  3342		set_area_direct_map(area, set_direct_map_invalid_noflush);
  3343		_vm_unmap_aliases(start, end, flush_dmap);
  3344		set_area_direct_map(area, set_direct_map_default_noflush);
  3345	}
  3346	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

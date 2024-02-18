Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1852C1078D
	for <oe-kbuild-all@lists.linux.dev>; Sun, 18 Feb 2024 08:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708245427; cv=none; b=kJRtwgm0Fy9n3ggdAILi7tv/4K9gohd8b7ISENXA8drTPj7NyYhxr/o7+GVHQAwHFozL+iiyug2YqeWwi4avu4z7cWGYSO5/WrT4Apz/b0soYumAzZvVQXTPKJnBSRBZR/0Gv34y5xWyrITwHv59Eve5I7WGDelN8b7jrsA/Vck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708245427; c=relaxed/simple;
	bh=WGNt6hKK9uNSWgNU5gKE1teMMRSciE2CUlblAx40J8Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jD2BE9vV104ysEtvypcY6eM9qVQ+Ci/6a/mT24Yq2g7ypIpZbCuFN2pPtX32RzSyu2bATk/3HN5ZDaSRL3DRHrtAZZLF66FT3AFqS1J8oiZ1tITewnQh3HNn7d458QPrG9qA6/p4GGsDMyhgjwofYJ24nYYtfy5QK/ZAoWqOq4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VXeR11xb; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VXeR11xb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708245426; x=1739781426;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WGNt6hKK9uNSWgNU5gKE1teMMRSciE2CUlblAx40J8Y=;
  b=VXeR11xbeT3FB03pgbtUhK5IvgBkKNENpvx1j3soyr1moO63LyeeawCP
   MbvhieWjJo/F9Om0GTedIAvMxxvI0s7r6XbnTAYRxnoVDhLTUOg3TZcI0
   4tf15f3AW2ED3ML4z0WcU64MOZKuhBPJsRUi2BQdrCIwsO+6AOiwyUT+d
   cz7XNjvRzMnzwQkM4xKQj2v+2dQBKmdclrVIJYfQcLgzEtTNDp94gEy/3
   x2egbVHPHhZ7Kw4hc7zGKx93/BitH0RGAU6iFPjAVKcp/6V4xeTsFcwXX
   B+pSu09mg5bYy37DM3oOYNBqA8YzGAY89E+X0/6k/0veM5NcrnMx13bRF
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10987"; a="2209006"
X-IronPort-AV: E=Sophos;i="6.06,168,1705392000"; 
   d="scan'208";a="2209006"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2024 00:37:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,168,1705392000"; 
   d="scan'208";a="4513886"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 18 Feb 2024 00:37:04 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rbcfF-0002u6-2H;
	Sun, 18 Feb 2024 08:36:54 +0000
Date: Sun, 18 Feb 2024 16:36:23 +0800
From: kernel test robot <lkp@intel.com>
To: Suren Baghdasaryan <surenb@google.com>
Cc: oe-kbuild-all@lists.linux.dev, Suren Baghdasaryan <surenb@google.com>
Subject: [surenbaghdasaryan:memalloc_prof_v4 49/49]
 include/linux/mm.h:3116:13: error: implicit declaration of function
 'mem_alloc_profiling_enabled'
Message-ID: <202402181634.LPJIuQMI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/surenbaghdasaryan/linux.git memalloc_prof_v4
head:   a9e8134c559030b55a98c4be4b3efaf0604c4e57
commit: a9e8134c559030b55a98c4be4b3efaf0604c4e57 [49/49] fixup: move mem_alloc_profiling_enabled() to be checked earlier
config: alpha-allnoconfig (https://download.01.org/0day-ci/archive/20240218/202402181634.LPJIuQMI-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240218/202402181634.LPJIuQMI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402181634.LPJIuQMI-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/pid_namespace.h:7,
                    from include/linux/ptrace.h:10,
                    from arch/alpha/kernel/asm-offsets.c:11:
   include/linux/mm.h: In function 'free_reserved_page':
>> include/linux/mm.h:3116:13: error: implicit declaration of function 'mem_alloc_profiling_enabled' [-Werror=implicit-function-declaration]
    3116 |         if (mem_alloc_profiling_enabled()) {
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
   make[3]: *** [scripts/Makefile.build:116: arch/alpha/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1199: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:240: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:240: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +/mem_alloc_profiling_enabled +3116 include/linux/mm.h

  3109	
  3110	extern void reserve_bootmem_region(phys_addr_t start,
  3111					   phys_addr_t end, int nid);
  3112	
  3113	/* Free the reserved page into the buddy system, so it gets managed. */
  3114	static inline void free_reserved_page(struct page *page)
  3115	{
> 3116		if (mem_alloc_profiling_enabled()) {
  3117			union codetag_ref *ref = get_page_tag_ref(page);
  3118	
  3119			if (ref) {
  3120				set_codetag_empty(ref);
  3121				put_page_tag_ref(ref);
  3122			}
  3123		}
  3124		ClearPageReserved(page);
  3125		init_page_count(page);
  3126		__free_page(page);
  3127		adjust_managed_page_count(page, 1);
  3128	}
  3129	#define free_highmem_page(page) free_reserved_page(page)
  3130	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

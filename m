Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 496571BD9CE
	for <oe-kbuild-all@lists.linux.dev>; Sat, 24 May 2025 06:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748068588; cv=none; b=e7Qm2WvjDOeBcqcHzNdx6tN1IDDQ6DmJHhGRG+aE09vGIUCXIdtqEcu51BqinqoROCaZF6f+4OWgifo6H2v9yn2vnfzMFCmJOwkRmTtWPJBPG7VE5mmobNvjfrEmmkDpTUib7GqN0FxgBGi52+BuCSfoPHkfqf23NSQTSfkvhZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748068588; c=relaxed/simple;
	bh=snynyCbScmyyIcdddYcqon29QdVeucKv/hUHwfNLrBk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XC/W0x4MW9C1JEgQLIPtlyURHr2HWVg2ow/ba6C+NIvA3I3REB1P8NBJqwOXctgyfHkr5Hk1vvrBXbcEqRnO7/Dl7urZiIR5Ic4KdS0Tzpww3LUazWoS63qpNh4jMETBXeWW3kCbkow+VppxRF9UKSvbhu2JmIA6M9qmI7r7qoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TJFwlvDB; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TJFwlvDB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748068588; x=1779604588;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=snynyCbScmyyIcdddYcqon29QdVeucKv/hUHwfNLrBk=;
  b=TJFwlvDBL5CEh6TqbM0sf1kCxBuvGzwvs4VDk6wlxbRvauZWuk0/95Lo
   2Xq9kAc4/MlVvJhOUEHBPgT+cqxBSnuMtbKyAE8/b+rfjc2vx+KhxqfDi
   /qn48/At2c6/6JN20nHLZNYBFFlPytV8/Tg87VvE61Qv53fYGj0dpG20t
   1IFVQGJqFc62HyJw33I3couqi8DWw1qLga5XT9tci5fpA0zYOUfedS4jA
   0HwC4udap8CG/bWwsPDAi5j3/BXGsCHLFBuhBSlMPFRJL9ahqpeLhNi3u
   8sJy/Jth3eEf00dHGY2od8G6WhrX2ZZlTmXHWYjBNd7P3KTAI2UD3vtSZ
   Q==;
X-CSE-ConnectionGUID: 3+mMzigtQQChJb4yJ7Ub9Q==
X-CSE-MsgGUID: H8cczIvqTKeQ6jaNifCaWQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="72646302"
X-IronPort-AV: E=Sophos;i="6.15,310,1739865600"; 
   d="scan'208";a="72646302"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2025 23:36:27 -0700
X-CSE-ConnectionGUID: WHuzWYMiQSGj4Pi3BwzhAA==
X-CSE-MsgGUID: Po5NifVHQzW+29KZF4IY4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,310,1739865600"; 
   d="scan'208";a="142404277"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 23 May 2025 23:36:25 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uIiUZ-000QzQ-1W;
	Sat, 24 May 2025 06:36:23 +0000
Date: Sat, 24 May 2025 14:36:02 +0800
From: kernel test robot <lkp@intel.com>
To: Ankur Arora <ankur.a.arora@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev, LUCI Bot <vijayendra.suman@oracle.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: [jlayton:uek-localio 2023/2262] mm/memory.c:6938:3: error: implicit
 declaration of function 'clear_page_uncached_flush'; did you mean
 'clear_page_guard'?
Message-ID: <202505241445.4dEeoXP2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git uek-localio
head:   65b0dc6bb1f5c18e63d8ee9ea1cca997456a81a9
commit: defc802af1f519dd356334f3bd1eac8651eff77a [2023/2262] mm, clear_huge_page: use clear_page_uncached() for gigantic pages
config: sparc64-randconfig-001-20250524 (https://download.01.org/0day-ci/archive/20250524/202505241445.4dEeoXP2-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250524/202505241445.4dEeoXP2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505241445.4dEeoXP2-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/bvec.h:10,
                    from include/linux/blk_types.h:10,
                    from include/linux/writeback.h:13,
                    from include/linux/memcontrol.h:23,
                    from include/linux/swap.h:9,
                    from include/linux/mm_inline.h:8,
                    from mm/memory.c:44:
   include/linux/highmem.h: In function 'clear_user_highpage_uncached':
   include/linux/highmem.h:265:2: error: implicit declaration of function 'clear_user_page_uncached'; did you mean 'clear_user_highpage_uncached'? [-Werror=implicit-function-declaration]
     clear_user_page_uncached(addr, vaddr, page);
     ^~~~~~~~~~~~~~~~~~~~~~~~
     clear_user_highpage_uncached
   mm/memory.c: In function 'folio_zero_user':
>> mm/memory.c:6938:3: error: implicit declaration of function 'clear_page_uncached_flush'; did you mean 'clear_page_guard'? [-Werror=implicit-function-declaration]
      clear_page_uncached_flush();
      ^~~~~~~~~~~~~~~~~~~~~~~~~
      clear_page_guard
   cc1: some warnings being treated as errors


vim +6938 mm/memory.c

  6926	
  6927	/**
  6928	 * folio_zero_user - Zero a folio which will be mapped to userspace.
  6929	 * @folio: The folio to zero.
  6930	 * @addr_hint: The address will be accessed or the base address if uncelar.
  6931	 */
  6932	void folio_zero_user(struct folio *folio, unsigned long addr_hint)
  6933	{
  6934		unsigned int nr_pages = folio_nr_pages(folio);
  6935	
  6936		if (unlikely(nr_pages > MAX_ORDER_NR_PAGES)) {
  6937			clear_gigantic_page(folio, addr_hint, nr_pages);
> 6938			clear_page_uncached_flush();
  6939		} else {
  6940			process_huge_page(addr_hint, nr_pages, clear_subpage, folio);
  6941		}
  6942	}
  6943	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

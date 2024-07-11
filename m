Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34CC716EB48
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jul 2024 18:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720721320; cv=none; b=OmCzh39P0165iWPiYj0akfZn211zIwZJwrTTMx7D0QbU1o7yRNny0g0i4DenxC0mA7t4NZ0PVOThRdRb3xi74N6jN8hqPNYAkZqljyMtkLLDhmbnfXk5CtvXaMlh0o9jzhKIxecczXn1UQ+YS0LhsCSmxfzDF214jnJYukb5FC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720721320; c=relaxed/simple;
	bh=q4qDFH0ebJqczU3XxiCts2DAUFYaEP19lub6RaQolsY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WMLz7bzKHWSgoNoj61TroUNqNPuo9jvgEuHUEiV/Autg9SnrM8aDLag/pCK6+jBfeNG+h/M7pQpiy6xabfoVQu1+u7mt2c/LztVuiwEwJL7mCtEC5Ah7sqMsL2IQ9+urH2fSBpoKmQuUwX5WYRCtafPs9ybELuuFyXjdvq2yES8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gbOsEFgo; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gbOsEFgo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720721318; x=1752257318;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=q4qDFH0ebJqczU3XxiCts2DAUFYaEP19lub6RaQolsY=;
  b=gbOsEFgoktU8+QHkrqK3VzCuKH6jMCG8DB0SzM9SPXuh0cmkZnQyLGE2
   6vCAGv714wtkaJYRMerRDHeMcovzDhe24JtFmbMPyz93KrbFEFA2BaY9Z
   4sFp2LSxJNNuJzy0q9AMH6cc35WBaB1tw72lbDr7wLNtAO7VoBf3y831X
   I5lG6kd82VrtxYBtjE/ztmtw0Xm112sgZC7PA+FveAb/xowaxFOrlbyv/
   hiVcMDZLsTTTFn9XgVwn/qvARmBC7kD2DWJrDVjBV34hbBjp+Om4mMFDl
   KUOHNkz6J6H2HpVOcXi9kAQ/kVncXq0wp4xyFWKmEdwfNz9yDthzfkqys
   w==;
X-CSE-ConnectionGUID: R+LZvThRT1eUrFrthwLcqQ==
X-CSE-MsgGUID: 48UZW6exR06AlNGN+ni8LQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11130"; a="29279295"
X-IronPort-AV: E=Sophos;i="6.09,200,1716274800"; 
   d="scan'208";a="29279295"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2024 11:08:37 -0700
X-CSE-ConnectionGUID: 7iijRhKxRVGoNPYY/50SJg==
X-CSE-MsgGUID: gQ2Re5e8TWeoQ6WrDpQwhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,200,1716274800"; 
   d="scan'208";a="86162214"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 11 Jul 2024 11:08:37 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sRyDa-000Zbf-1w;
	Thu, 11 Jul 2024 18:08:34 +0000
Date: Fri, 12 Jul 2024 02:07:58 +0800
From: kernel test robot <lkp@intel.com>
To: "Alex Shi (Tencent)" <alexs@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [alexshi:nextstable 3/3] mm/slab.h:104:15: error: static assertion
 failed due to requirement 'sizeof(struct slab) <= sizeof(struct page)':
 sizeof(struct slab) <= sizeof(struct page)
Message-ID: <202407120151.8RdNlFJT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alexshi/linux.git nextstable
head:   f6298aa45bae2ca50cf1c5ebd407363353b6a1ae
commit: f6298aa45bae2ca50cf1c5ebd407363353b6a1ae [3/3] mm/memcg: alignment memcg_data define condition
config: i386-randconfig-141-20240712 (https://download.01.org/0day-ci/archive/20240712/202407120151.8RdNlFJT-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240712/202407120151.8RdNlFJT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407120151.8RdNlFJT-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/mempool.c:21:
>> mm/slab.h:104:15: error: static assertion failed due to requirement 'sizeof(struct slab) <= sizeof(struct page)': sizeof(struct slab) <= sizeof(struct page)
     104 | static_assert(sizeof(struct slab) <= sizeof(struct page));
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                                  ^~~~
   include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   mm/slab.h:104:35: note: expression evaluates to '36 <= 32'
     104 | static_assert(sizeof(struct slab) <= sizeof(struct page));
         |               ~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                                  ^~~~
   include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   1 error generated.


vim +104 mm/slab.h

d122019bf061cc Matthew Wilcox (Oracle  2021-10-04   94) 
d122019bf061cc Matthew Wilcox (Oracle  2021-10-04   95) #define SLAB_MATCH(pg, sl)						\
d122019bf061cc Matthew Wilcox (Oracle  2021-10-04   96) 	static_assert(offsetof(struct page, pg) == offsetof(struct slab, sl))
d122019bf061cc Matthew Wilcox (Oracle  2021-10-04   97) SLAB_MATCH(flags, __page_flags);
130d4df57390a2 Vlastimil Babka         2022-08-26   98  SLAB_MATCH(compound_head, slab_cache);	/* Ensure bit 0 is clear */
d122019bf061cc Matthew Wilcox (Oracle  2021-10-04   99) SLAB_MATCH(_refcount, __page_refcount);
f6298aa45bae2c Alex Shi (Tencent       2024-07-08  100) #if defined(CONFIG_SLAB_OBJ_EXT) && defined(CONFIG_MEMCG)
21c690a349baab Suren Baghdasaryan      2024-03-21  101  SLAB_MATCH(memcg_data, obj_exts);
d122019bf061cc Matthew Wilcox (Oracle  2021-10-04  102) #endif
d122019bf061cc Matthew Wilcox (Oracle  2021-10-04  103) #undef SLAB_MATCH
d122019bf061cc Matthew Wilcox (Oracle  2021-10-04 @104) static_assert(sizeof(struct slab) <= sizeof(struct page));
a9e0b9f27266d4 Vlastimil Babka         2023-10-02  105  #if defined(system_has_freelist_aba)
6801be4f2653e5 Peter Zijlstra          2023-05-31  106  static_assert(IS_ALIGNED(offsetof(struct slab, freelist), sizeof(freelist_aba_t)));
130d4df57390a2 Vlastimil Babka         2022-08-26  107  #endif
d122019bf061cc Matthew Wilcox (Oracle  2021-10-04  108) 

:::::: The code at line 104 was first introduced by commit
:::::: d122019bf061cccc4583eb9ad40bf58c2fe517be mm: Split slab into its own type

:::::: TO: Matthew Wilcox (Oracle) <willy@infradead.org>
:::::: CC: Vlastimil Babka <vbabka@suse.cz>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

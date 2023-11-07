Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96BEE2B9A6
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Nov 2023 23:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S5wvYGmt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699398574; x=1730934574;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Prv8RWaOJBgcHqG+v97OCQqFifK+KHLwdXmy+7IQHXo=;
  b=S5wvYGmt+0UBY1SGYprWNOC+/WvHlB8fW/qbG2/saxj8Rqr1UWFB97ss
   QXohRrpX4bbZ6hLdr3vWlTDEkj/X7doWk1gAZfg5J0f5JngkRSDX1F/vb
   +k/HBucz56qaWzNSDiMNflqiJJZW+RRJjCzB4fKWK/sj1/ce6jEYxvYFO
   C3Tj+OgKD0ihDxcm/hBeJ/qNLxKtfXuVJWLmnEpkKXAYlUR79x0ICOBA0
   5+s5b5jSUK3t1LQ7c5s0WeQSIlwaeNbErCguTxGr8C9QyG+aXi0nQ1iFh
   gLhOZDLSHvo7BUY0s5idj7qMFR6qUbXLvPwKXfvsyUx6bjXUOop27gmAc
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="388503389"
X-IronPort-AV: E=Sophos;i="6.03,284,1694761200"; 
   d="scan'208";a="388503389"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2023 15:09:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="886465327"
X-IronPort-AV: E=Sophos;i="6.03,284,1694761200"; 
   d="scan'208";a="886465327"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 07 Nov 2023 15:09:32 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r0VCM-0007TY-1q;
	Tue, 07 Nov 2023 23:09:30 +0000
Date: Wed, 8 Nov 2023 07:08:34 +0800
From: kernel test robot <lkp@intel.com>
To: andrey.konovalov@linux.dev
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC 12/20] kasan: save alloc stack traces for mempool
Message-ID: <202311080634.DC7IwptF-lkp@intel.com>
References: <325b1285d95f7bb6d2865750aa0088ab4cb5e0c3.1699297309.git.andreyknvl@google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <325b1285d95f7bb6d2865750aa0088ab4cb5e0c3.1699297309.git.andreyknvl@google.com>

Hi,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]
[also build test WARNING on vbabka-slab/for-next linus/master v6.6 next-20231107]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/andrey-konovalov-linux-dev/kasan-rename-kasan_slab_free_mempool-to-kasan_mempool_poison_object/20231107-042850
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/325b1285d95f7bb6d2865750aa0088ab4cb5e0c3.1699297309.git.andreyknvl%40google.com
patch subject: [PATCH RFC 12/20] kasan: save alloc stack traces for mempool
config: arm64-randconfig-002-20231107 (https://download.01.org/0day-ci/archive/20231108/202311080634.DC7IwptF-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231108/202311080634.DC7IwptF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311080634.DC7IwptF-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/kasan/common.c:270:6: warning: no previous prototype for 'unpoison_slab_object' [-Wmissing-prototypes]
     270 | void unpoison_slab_object(struct kmem_cache *cache, void *object, gfp_t flags,
         |      ^~~~~~~~~~~~~~~~~~~~


vim +/unpoison_slab_object +270 mm/kasan/common.c

   269	
 > 270	void unpoison_slab_object(struct kmem_cache *cache, void *object, gfp_t flags,
   271				  bool init)
   272	{
   273		/*
   274		 * Unpoison the whole object. For kmalloc() allocations,
   275		 * poison_kmalloc_redzone() will do precise poisoning.
   276		 */
   277		kasan_unpoison(object, cache->object_size, init);
   278	
   279		/* Save alloc info (if possible) for non-kmalloc() allocations. */
   280		if (kasan_stack_collection_enabled() && !is_kmalloc_cache(cache))
   281			kasan_save_alloc_info(cache, object, flags);
   282	}
   283	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

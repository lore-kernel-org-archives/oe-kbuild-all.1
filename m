Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B74DC62813
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 Dec 2023 17:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HBTxcjI0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703180366; x=1734716366;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=e/FBcjzmD1rkea6FJgbFPNUBORRIdW8obfr9avr7a1s=;
  b=HBTxcjI0aKzsYMxM0QDW5pJ/KwqRHPyP4NOBSGREiYB0h7y438c66lLl
   U58px5rUTFmiis2soyfeW909uNHBL6E4WwMkzB7jppVtrnesXHs9tp4Z8
   Cpf7NSyP2vY/iYofVUDy4svCO1wxSjPPPN49jaiNoTvhqCaRLj1ZoJY68
   v6PS73YtebN4R4DvQLEhIbFl97Bw/ooBLpxyLvyOsSeZTcbTKamUOsQdO
   QCRYQcFhvh5ZoS9JLfCOV6OQEQUgRf1eBCTHLbN1VPPj77/sbdomnk2qr
   QHsnRS7eUBnfwlGtmGrJP/RQt6WCtFa1c0j3P01rpDhrT7BlkR/th3AMt
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10931"; a="398794705"
X-IronPort-AV: E=Sophos;i="6.04,294,1695711600"; 
   d="scan'208";a="398794705"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2023 09:39:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10931"; a="847183063"
X-IronPort-AV: E=Sophos;i="6.04,294,1695711600"; 
   d="scan'208";a="847183063"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 21 Dec 2023 09:39:24 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rGN0y-0008Xt-2u;
	Thu, 21 Dec 2023 17:39:21 +0000
Date: Fri, 22 Dec 2023 01:38:56 +0800
From: kernel test robot <lkp@intel.com>
To: Andrey Konovalov <andreyknvl@google.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master 9549/9925] mm/kasan/common.c:280:6: sparse:
 sparse: symbol 'unpoison_slab_object' was not declared. Should it be static?
Message-ID: <202312220147.TAQKNUdL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   857647efa9be89a13cf8963c7e167fab062b28bb
commit: 7cd408d15052b2a3912781842ee7a11e6d9a4dcd [9549/9925] kasan: save alloc stack traces for mempool
config: x86_64-randconfig-123-20231221 (https://download.01.org/0day-ci/archive/20231222/202312220147.TAQKNUdL-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231222/202312220147.TAQKNUdL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312220147.TAQKNUdL-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/kasan/common.c:280:6: sparse: sparse: symbol 'unpoison_slab_object' was not declared. Should it be static?
>> mm/kasan/common.c:511:53: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected restricted gfp_t [usertype] flags @@     got unsigned long [usertype] size @@
   mm/kasan/common.c:511:53: sparse:     expected restricted gfp_t [usertype] flags
   mm/kasan/common.c:511:53: sparse:     got unsigned long [usertype] size

vim +/unpoison_slab_object +280 mm/kasan/common.c

   279	
 > 280	void unpoison_slab_object(struct kmem_cache *cache, void *object, gfp_t flags,
   281				  bool init)
   282	{
   283		/*
   284		 * Unpoison the whole object. For kmalloc() allocations,
   285		 * poison_kmalloc_redzone() will do precise poisoning.
   286		 */
   287		kasan_unpoison(object, cache->object_size, init);
   288	
   289		/* Save alloc info (if possible) for non-kmalloc() allocations. */
   290		if (kasan_stack_collection_enabled() && !is_kmalloc_cache(cache))
   291			kasan_save_alloc_info(cache, object, flags);
   292	}
   293	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

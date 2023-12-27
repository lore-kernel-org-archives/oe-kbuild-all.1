Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84A3720F4
	for <oe-kbuild-all@lists.linux.dev>; Wed, 27 Dec 2023 02:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nbO3sHd0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703643369; x=1735179369;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5RXuw92YAUGjAHlMcwY0yA6Rn/jyU8gFUDG/57Vnuf0=;
  b=nbO3sHd091WalbpzAt+DgsP+ycen0xXSXk8MyPHtdxXIWh+3nz1yYaOt
   N7lvzfGmz9vcMwB9phEePUVMUOJa5GLYhJWea7EhL9tOKhxe2PcQQc7xS
   BHR46jQWgxbk6upqgEwMGzh95eyIwLlUAdFAPIdjfMjUv6K7ikifmzSuQ
   zBnYM1IQrfIc4y5mAlxUtEJi7lBm0tWOLx7lQvUpnWHFpj11LpW8zwNPX
   HGW94gAP+toPu4z9/Z3hLhlqzxChlNNaNvPUjnSVUoGPRBGtHE5dAeYhW
   AyXREy5naBUrgSwBXlfRu1ENZfSV1Tup1rvR9fZiO6/pxQyOJKem5dv7n
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10935"; a="3232786"
X-IronPort-AV: E=Sophos;i="6.04,307,1695711600"; 
   d="scan'208";a="3232786"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Dec 2023 18:16:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10935"; a="848562559"
X-IronPort-AV: E=Sophos;i="6.04,307,1695711600"; 
   d="scan'208";a="848562559"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 26 Dec 2023 18:16:07 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rIJSn-000Ext-0L;
	Wed, 27 Dec 2023 02:16:05 +0000
Date: Wed, 27 Dec 2023 10:15:24 +0800
From: kernel test robot <lkp@intel.com>
To: Andrey Konovalov <andreyknvl@google.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master 9655/10295] mm/kasan/common.c:511:53: sparse:
 sparse: incorrect type in argument 3 (different base types)
Message-ID: <202312271042.FsuPQlul-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   39676dfe52331dba909c617f213fdb21015c8d10
commit: 3f38c3c5bc402c3b13c3bc08fbbdecb70e4164a9 [9655/10295] kasan: save alloc stack traces for mempool
config: powerpc-randconfig-r123-20231227 (https://download.01.org/0day-ci/archive/20231227/202312271042.FsuPQlul-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20231227/202312271042.FsuPQlul-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312271042.FsuPQlul-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   mm/kasan/common.c:280:6: sparse: sparse: symbol 'unpoison_slab_object' was not declared. Should it be static?
>> mm/kasan/common.c:511:53: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected restricted gfp_t [usertype] flags @@     got unsigned int [usertype] size @@
   mm/kasan/common.c:511:53: sparse:     expected restricted gfp_t [usertype] flags
   mm/kasan/common.c:511:53: sparse:     got unsigned int [usertype] size

vim +511 mm/kasan/common.c

   489	
   490	void __kasan_mempool_unpoison_object(void *ptr, size_t size, unsigned long ip)
   491	{
   492		struct slab *slab;
   493		gfp_t flags = 0; /* Might be executing under a lock. */
   494	
   495		if (is_kfence_address(kasan_reset_tag(ptr)))
   496			return;
   497	
   498		slab = virt_to_slab(ptr);
   499	
   500		/*
   501		 * This function can be called for large kmalloc allocation that get
   502		 * their memory from page_alloc.
   503		 */
   504		if (unlikely(!slab)) {
   505			kasan_unpoison(ptr, size, false);
   506			poison_kmalloc_large_redzone(ptr, size, flags);
   507			return;
   508		}
   509	
   510		/* Unpoison the object and save alloc info for non-kmalloc() allocations. */
 > 511		unpoison_slab_object(slab->slab_cache, ptr, size, flags);
   512	
   513		/* Poison the redzone and save alloc info for kmalloc() allocations. */
   514		if (is_kmalloc_cache(slab->slab_cache))
   515			poison_kmalloc_redzone(slab->slab_cache, ptr, size, flags);
   516	}
   517	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

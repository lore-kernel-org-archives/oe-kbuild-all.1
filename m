Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B43A33EC
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Apr 2023 21:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681938006; x=1713474006;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cOQWjMVMOEue3hBuK2Ef0YSNUKoOn3X0lAnruYrlKLo=;
  b=FiGlwFXLFb12mybSDrZixUrCIX7c1t99afBGnqdGuV8LFtLVZE6A4+EN
   pzz/XG2zaIZXKaId7HpmNv5MEtYvkRMcNf/N/gMCnAmtf0UeWGhupvWlU
   7lWVsFxT+yyxuQaM8dGZv+A+/Z6QVCQeFhGK6NA9ek3ilPwwaBLF0v+Ul
   01Mh8Ye3XPd+RSlux6VinrrEXSlKKokUtZ21Hkml0umZvNW4MiPVm4uqt
   ttVcIti9BsqV9vRIRYpoU4Q/qDpcbgpUGu4btranjQNg4JEKCyfHNgkM3
   GpxFyyZwYZfNUnJwX8Q0l5bzGi7XUE9DSbVfQdAdWTN8UI5QBA1YBkU1P
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="325171751"
X-IronPort-AV: E=Sophos;i="5.99,210,1677571200"; 
   d="scan'208";a="325171751"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2023 14:00:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="724177944"
X-IronPort-AV: E=Sophos;i="5.99,210,1677571200"; 
   d="scan'208";a="724177944"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 19 Apr 2023 14:00:04 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ppEuJ-000fBq-25;
	Wed, 19 Apr 2023 21:00:03 +0000
Date: Thu, 20 Apr 2023 04:59:35 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.4 5500/27000] mm/page_alloc.c:2741:29:
 sparse: sparse: Using plain integer as NULL pointer
Message-ID: <202304200438.SubrBldc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android12-5.4
head:   0108362f3305895e7647eadd89008241bcf32ae6
commit: b9d3d8f1e991052edb89b0537b8f2e8b2aa941ac [5500/27000] ANDROID: GKI: cma: redirect page allocation to CMA
config: i386-randconfig-s003 (https://download.01.org/0day-ci/archive/20230420/202304200438.SubrBldc-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        git remote add android-common https://android.googlesource.com/kernel/common
        git fetch --no-tags android-common android12-5.4
        git checkout b9d3d8f1e991052edb89b0537b8f2e8b2aa941ac
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 olddefconfig
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304200438.SubrBldc-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   mm/page_alloc.c:106:1: sparse: sparse: symbol 'pcpu_drain_mutex' was not declared. Should it be static?
>> mm/page_alloc.c:2741:29: sparse: sparse: Using plain integer as NULL pointer
   mm/page_alloc.c:3252:51: sparse: sparse: incorrect type in argument 7 (different base types) @@     expected int cma @@     got restricted gfp_t @@
   mm/page_alloc.c:3252:51: sparse:     expected int cma
   mm/page_alloc.c:3252:51: sparse:     got restricted gfp_t
   mm/page_alloc.c: note: in included file (through include/linux/mm.h):
   include/linux/gfp.h:325:27: sparse: sparse: restricted gfp_t degrades to integer
   include/linux/gfp.h:325:27: sparse: sparse: restricted gfp_t degrades to integer

vim +2741 mm/page_alloc.c

  2736	
  2737	static struct page *__rmqueue_cma(struct zone *zone, unsigned int order,
  2738						int migratetype,
  2739						unsigned int alloc_flags)
  2740	{
> 2741		struct page *page = 0;
  2742	
  2743	retry:
  2744	#ifdef CONFIG_CMA
  2745		if (migratetype == MIGRATE_MOVABLE && !zone->cma_alloc)
  2746			page = __rmqueue_cma_fallback(zone, order);
  2747		else
  2748	#endif
  2749			page = __rmqueue_smallest(zone, order, migratetype);
  2750	
  2751		if (unlikely(!page) && __rmqueue_fallback(zone, order, migratetype,
  2752							  alloc_flags))
  2753			goto retry;
  2754	
  2755		trace_mm_page_alloc_zone_locked(page, order, migratetype);
  2756		return page;
  2757	}
  2758	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

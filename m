Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C06A6199CA
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 Sep 2023 16:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695315374; x=1726851374;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+Dknht6e5rk+PusZbz3bAJv78BqJQfG4bkHHRsRcFKA=;
  b=V0RH+v7/GFEVd7CE/5M5bSRYbRfB51AnMWZOARk8AxL5yk6Js3VKash/
   kuZIIlskWDQjwLOibUVTjQGKLYAhJJabXMpVMHvIz9VyUTkti5MTz6JOU
   Rh+IAcmBUVVpofM2ewf2N8SeR3qd2qUKfsfxwD7FHBDuSwI1WK73dyfLk
   pRD23v2TCvQKezWNk8VT26gIsfyNlTWteDM4/AdCnxdTzWPtQrlvRuk9X
   fSKW7ztx5bVr8TPUVQuchcT7obBf4BobpCCp8MB1+br0vuT99AVMVux8y
   4P0LC95Fu+Kpfndj7wan55u4ZiJRnGxsCNmTR52IQunWBDqMc/vk3t3DI
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="379467349"
X-IronPort-AV: E=Sophos;i="6.03,165,1694761200"; 
   d="scan'208";a="379467349"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2023 09:56:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="1077960479"
X-IronPort-AV: E=Sophos;i="6.03,165,1694761200"; 
   d="scan'208";a="1077960479"
Received: from lkp-server02.sh.intel.com (HELO b77866e22201) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 21 Sep 2023 09:56:11 -0700
Received: from kbuild by b77866e22201 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qjMyH-0000Ah-1L;
	Thu, 21 Sep 2023 16:56:09 +0000
Date: Fri, 22 Sep 2023 00:55:46 +0800
From: kernel test robot <lkp@intel.com>
To: Nhat Pham <nphamcs@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 2/2] zswap: shrinks zswap pool based on memory pressure
Message-ID: <202309220008.tGqPMxKU-lkp@intel.com>
References: <20230919171447.2712746-3-nphamcs@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230919171447.2712746-3-nphamcs@gmail.com>

Hi Nhat,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.6-rc2]
[cannot apply to akpm-mm/mm-everything next-20230921]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Nhat-Pham/zswap-make-shrinking-memcg-aware/20230920-011604
base:   linus/master
patch link:    https://lore.kernel.org/r/20230919171447.2712746-3-nphamcs%40gmail.com
patch subject: [PATCH v2 2/2] zswap: shrinks zswap pool based on memory pressure
config: x86_64-randconfig-076-20230921 (https://download.01.org/0day-ci/archive/20230922/202309220008.tGqPMxKU-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230922/202309220008.tGqPMxKU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309220008.tGqPMxKU-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/zswap.c: In function 'zswap_shrinker_scan':
   mm/zswap.c:520:36: error: 'struct shrinker' has no member named 'private_data'
     struct zswap_pool *pool = shrinker->private_data;
                                       ^~
   mm/zswap.c: In function 'zswap_shrinker_count':
   mm/zswap.c:552:36: error: 'struct shrinker' has no member named 'private_data'
     struct zswap_pool *pool = shrinker->private_data;
                                       ^~
   mm/zswap.c: In function 'zswap_alloc_shrinker':
   mm/zswap.c:592:3: error: implicit declaration of function 'shrinker_alloc'; did you mean 'warn_alloc'? [-Werror=implicit-function-declaration]
      shrinker_alloc(SHRINKER_NUMA_AWARE | SHRINKER_MEMCG_AWARE, "mm-zswap");
      ^~~~~~~~~~~~~~
      warn_alloc
>> mm/zswap.c:591:17: warning: assignment makes pointer from integer without a cast [-Wint-conversion]
     pool->shrinker =
                    ^
   mm/zswap.c:596:16: error: 'struct shrinker' has no member named 'private_data'
     pool->shrinker->private_data = pool;
                   ^~
   mm/zswap.c: In function 'zswap_pool_create':
   mm/zswap.c:1004:2: error: implicit declaration of function 'shrinker_register'; did you mean 'driver_register'? [-Werror=implicit-function-declaration]
     shrinker_register(pool->shrinker);
     ^~~~~~~~~~~~~~~~~
     driver_register
   mm/zswap.c:1012:2: error: implicit declaration of function 'shrinker_free'; did you mean 'shstk_free'? [-Werror=implicit-function-declaration]
     shrinker_free(pool->shrinker);
     ^~~~~~~~~~~~~
     shstk_free
   cc1: some warnings being treated as errors


vim +591 mm/zswap.c

   588	
   589	static void zswap_alloc_shrinker(struct zswap_pool *pool)
   590	{
 > 591		pool->shrinker =
   592			shrinker_alloc(SHRINKER_NUMA_AWARE | SHRINKER_MEMCG_AWARE, "mm-zswap");
   593		if (!pool->shrinker)
   594			return;
   595	
   596		pool->shrinker->private_data = pool;
   597		pool->shrinker->scan_objects = zswap_shrinker_scan;
   598		pool->shrinker->count_objects = zswap_shrinker_count;
   599		pool->shrinker->batch = 0;
   600		pool->shrinker->seeks = DEFAULT_SEEKS;
   601	}
   602	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

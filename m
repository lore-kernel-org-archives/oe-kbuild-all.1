Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3FDF2566
	for <oe-kbuild-all@lists.linux.dev>; Sun,  1 Dec 2024 01:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733017301; cv=none; b=J3zOmoVwgmGsud3Uj16ktkFvwK1J6lGV6gwwcniVvHWY1lIST1bJuhkFraFTLJvqf4ECddV3F+JxDZ71SlyI9IKZFwlpU0gfj8MeHVeYo+qa4aJh5VREF/XMWJhgLajVZ2R9wWGgYfsAeKhWDi/aP56N979zTWdgMnnOcoCk87Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733017301; c=relaxed/simple;
	bh=iXqtfiU8BkHonIcPWB4ctqYf+Lr+KE71WaJz5litmWo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VAOk91+srpc2Bp6fs8liPSLvTomOs+Tql2Pfdn+GoZq8BQzTnYiUyMy9/wBBgWcLVX6mVRWkar+nmFsikYVS5XaQ1WJu/NjZ4U7fHIipPcgAePTVZJyH9ArnO9JYOT6eVJ7dMrlelXSepuZdOhco4OZWQ8m9aU4xlJiLyv2bDVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UBTd0AqP; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UBTd0AqP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733017300; x=1764553300;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iXqtfiU8BkHonIcPWB4ctqYf+Lr+KE71WaJz5litmWo=;
  b=UBTd0AqPTyzbZv0yI32rnSniHo7zUH2dQL6dgA8XTCEeiw5hEqBceiNi
   YhvC2sVs23zACjm3U9jhnCSeTVZZnti2RfIYdE5YE9k86kh9U4ZC7+cEC
   JoDHawHFN1hAWZYkO8DAhbWqUKuoGxFCarPmQKUjo8MJlcPka09G+z+0Y
   8Z91dP1kttMYNq8oSwEIx9+29B2H1pyXbcvCJFQwzQYXqfNLvR6oEihhz
   gthoEQLGrMDzhMjihWkgucaPw8/J6bO+8rt93upFRdJ/esOwmUbRoYQ9i
   fBexKyY9+2J5vdUpeE9oUwNoyANHyoMA6rDW9v2HkYBK8EIg/UmNQJT/S
   A==;
X-CSE-ConnectionGUID: L9Lw86HlSReKvd1oCNhC1g==
X-CSE-MsgGUID: mRe/8jS5Q4mFxpTSR9/DpQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11272"; a="33129164"
X-IronPort-AV: E=Sophos;i="6.12,199,1728975600"; 
   d="scan'208";a="33129164"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2024 17:41:39 -0800
X-CSE-ConnectionGUID: gbzNWhblTteuSZK7QOrFhw==
X-CSE-MsgGUID: cWEMipS3S/uZFNfOREkLnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,199,1728975600"; 
   d="scan'208";a="92935683"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 30 Nov 2024 17:41:38 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tHYxY-00017V-1N;
	Sun, 01 Dec 2024 01:41:22 +0000
Date: Sun, 1 Dec 2024 09:40:24 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Zengkai <zhengzengkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2461/2461] lib/../mm/kasan/kasan.h:198:84:
 warning: 'return' with a value, in function returning void
Message-ID: <202412010900.FbFVIhnf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   a2b4d661a5ca59dd7cf972c1cce8b98422102ab7
commit: d5ddd7080c7442f22d6b92d6fed0dacc606013d1 [2461/2461] kasan: sanitize objects when metadata doesn't fit
config: arm64-randconfig-001-20241120 (https://download.01.org/0day-ci/archive/20241201/202412010900.FbFVIhnf-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241201/202412010900.FbFVIhnf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412010900.FbFVIhnf-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from lib/test_kasan.c:26:
   lib/../mm/kasan/kasan.h: In function 'quarantine_put':
>> lib/../mm/kasan/kasan.h:198:84: warning: 'return' with a value, in function returning void [-Wreturn-mismatch]
     198 | static inline void quarantine_put(struct kmem_cache *cache, void *object) { return false; }
         |                                                                                    ^~~~~
   lib/../mm/kasan/kasan.h:198:20: note: declared here
     198 | static inline void quarantine_put(struct kmem_cache *cache, void *object) { return false; }
         |                    ^~~~~~~~~~~~~~


vim +/return +198 lib/../mm/kasan/kasan.h

   185	
   186	depot_stack_handle_t kasan_save_stack(gfp_t flags);
   187	void kasan_set_track(struct kasan_track *track, gfp_t flags);
   188	void kasan_set_free_info(struct kmem_cache *cache, void *object, u8 tag);
   189	struct kasan_track *kasan_get_free_track(struct kmem_cache *cache,
   190					void *object, u8 tag);
   191	
   192	#if defined(CONFIG_KASAN_GENERIC) && \
   193		(defined(CONFIG_SLAB) || defined(CONFIG_SLUB))
   194	bool quarantine_put(struct kmem_cache *cache, void *object);
   195	void quarantine_reduce(void);
   196	void quarantine_remove_cache(struct kmem_cache *cache);
   197	#else
 > 198	static inline void quarantine_put(struct kmem_cache *cache, void *object) { return false; }
   199	static inline void quarantine_reduce(void) { }
   200	static inline void quarantine_remove_cache(struct kmem_cache *cache) { }
   201	#endif
   202	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C4A3192598
	for <oe-kbuild-all@lists.linux.dev>; Sat, 30 Nov 2024 16:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732985150; cv=none; b=lV5OY3K17LVbCwpDInJmRZZE9hQHJGxwta10vfwFrbqDjE/YpXFpGFtW/UkiWYFstqUSZIZ3f3GbdKthSEGH0OKm+xic1HZF6W4Fhc9HWqPq1R41XeI03RX37BroqIxMA6jNZPmP9IZaLsyHxRfdyyDkmLudvu6PsV76pCMQQ78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732985150; c=relaxed/simple;
	bh=x9UHFfRtF72zY0mxYO0ZdT38dIHv6xllRPoZfEP72N4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=m3/OOtfoPydzEWOiEiomb0kEGCPjsQ433kE7XVuGni1Wz/T0Ur7wc7Md1efJsc5JTpjTiweIKR1G4golxW82T8hj1J5Xfc/SQuwfenCCFOfZBA1qgmr17csN6VXJNY9WXBoChTxMeFC5d3pj1iQB9bx0i2jGX5xF8a6UyzV2r+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PRkSzKPl; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PRkSzKPl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732985149; x=1764521149;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=x9UHFfRtF72zY0mxYO0ZdT38dIHv6xllRPoZfEP72N4=;
  b=PRkSzKPl7nQgrBOhrYBMOXmcrycRWTQtz4Qwqt2AQezc4wv1Nqswp5av
   2VT4Aj1pJ8/at5NpybIsno3TsPSHEatIrv86gqz+OARRuk5NFkXVW69Dg
   6HOs0QgVxfNL9Sk/C8Nafc73ZoDytaId1NcKWQWwKNcdz5ojbQ4/aJkqu
   xBMHh83uB9tdmAFqMjwosqpCCF2pF43lyvyaxWy3XCB+HSANwJzMIHkPv
   f948W3Iblsqc+RPKWgs07xcRI0LhUuavdtVJXdduTkzUQXfj0o92C+f7e
   msA+wGak6DXjj6KIDb/TnQjR6KRKERYXLLKJSs+hGRzFZZ5g7BkQcD+cl
   w==;
X-CSE-ConnectionGUID: rFV0frj/R1qWyt0HO0wt5w==
X-CSE-MsgGUID: 457S3lhfRFO6gS0XjrJOIA==
X-IronPort-AV: E=McAfee;i="6700,10204,11272"; a="32938600"
X-IronPort-AV: E=Sophos;i="6.12,198,1728975600"; 
   d="scan'208";a="32938600"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2024 08:45:48 -0800
X-CSE-ConnectionGUID: qRkhNyhaQ3u6FeXaxDSNNw==
X-CSE-MsgGUID: epE4MBQ6S5yIQxUohubQOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,198,1728975600"; 
   d="scan'208";a="92879380"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 30 Nov 2024 08:45:46 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tHQbH-0000pY-39;
	Sat, 30 Nov 2024 16:45:43 +0000
Date: Sun, 1 Dec 2024 00:41:12 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Zengkai <zhengzengkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2441/2441] mm/kasan/kasan.h:198:84: warning:
 'return' with a value, in function returning void
Message-ID: <202412010032.cXm8NPEf-lkp@intel.com>
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
commit: d5ddd7080c7442f22d6b92d6fed0dacc606013d1 [2441/2441] kasan: sanitize objects when metadata doesn't fit
config: arm64-randconfig-003-20241118 (https://download.01.org/0day-ci/archive/20241201/202412010032.cXm8NPEf-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241201/202412010032.cXm8NPEf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412010032.cXm8NPEf-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from mm/kasan/common.c:40:
   mm/kasan/kasan.h: In function 'quarantine_put':
>> mm/kasan/kasan.h:198:84: warning: 'return' with a value, in function returning void [-Wreturn-mismatch]
     198 | static inline void quarantine_put(struct kmem_cache *cache, void *object) { return false; }
         |                                                                                    ^~~~~
   mm/kasan/kasan.h:198:20: note: declared here
     198 | static inline void quarantine_put(struct kmem_cache *cache, void *object) { return false; }
         |                    ^~~~~~~~~~~~~~
   mm/kasan/common.c: In function '__kasan_slab_free':
   mm/kasan/common.c:471:16: error: void value not ignored as it ought to be
     471 |         return quarantine_put(cache, object);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> mm/kasan/common.c:472:1: warning: control reaches end of non-void function [-Wreturn-type]
     472 | }
         | ^
--
   In file included from mm/kasan/report.c:39:
   mm/kasan/kasan.h: In function 'quarantine_put':
>> mm/kasan/kasan.h:198:84: warning: 'return' with a value, in function returning void [-Wreturn-mismatch]
     198 | static inline void quarantine_put(struct kmem_cache *cache, void *object) { return false; }
         |                                                                                    ^~~~~
   mm/kasan/kasan.h:198:20: note: declared here
     198 | static inline void quarantine_put(struct kmem_cache *cache, void *object) { return false; }
         |                    ^~~~~~~~~~~~~~


vim +/return +198 mm/kasan/kasan.h

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

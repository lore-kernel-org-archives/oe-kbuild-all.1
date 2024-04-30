Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0770F2C184
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Apr 2024 07:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714461983; cv=none; b=un4eJYuk4p2gpzVsEDu52Pre0I/DmlqZc6YZTqbewZOnWVTSg8oLrMnmaGPyf6Ru/zzH9H4Ll3PFM+pKgX4ApG4bsPW5cCKzr8Ote01aSd9k6EYO7B0ZLL08q5rihfkPbMsAtjc5exM4psLChfO0lFgdNIrX/0knTV5swLfG8Ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714461983; c=relaxed/simple;
	bh=wlrbFvEbeDXVRodcyYD0oBOmJhnuRmuDynM3TRgHbKM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XhplUL/o0Uwb4ePbpZ4uFIIsrins9CUqvlWWurMXg/p1bVzFkA70c0uYgZ+2lv8k29n0yc9LsMsdr/Pke0pK+df0N65t0gA+cbdLqLea34f9gpMajb3gsDTTukkkfEVmgnWIeDnH3kkpl0lPlnbULT1wkBlS+CB+6P6xMFiiOyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fJBY3wWu; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fJBY3wWu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714461981; x=1745997981;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wlrbFvEbeDXVRodcyYD0oBOmJhnuRmuDynM3TRgHbKM=;
  b=fJBY3wWu1hp5pzjo4NO1T1kkSs2UvmQVgJUhTvk6/550zhM6omdfnGUK
   nd6N+RrtsHMeHpQwtdPlKATAPnRTr7J7GjTo9Lmpxr6iVErEnv78Utp3J
   cFaiqlvLXGX9byiqYSmAZZ1MaGuZdS8YJvAOGq9V9qTKRD3wN02LrNbJO
   an0QBuoz6jGy8AzKrhjPQq0gxZCW0HEORJaJnOZs1ygHlhsnoXYppVUVr
   mFt2GXXD3c1b4DJ3QZJ+Ke7mZfJOFJ1agVLcQGgD/F5scRyTb3Zp1P9by
   B2EgLyBNZe5XdfJHoPwYL3j8D6GfoVSb7BeOANo0k+E4aVLhzVBZLEFYR
   A==;
X-CSE-ConnectionGUID: gZGGysHLQAqQ/RlqF62nVA==
X-CSE-MsgGUID: 9mFrhg+nRSu+6gh2t5HCww==
X-IronPort-AV: E=McAfee;i="6600,9927,11059"; a="10371335"
X-IronPort-AV: E=Sophos;i="6.07,241,1708416000"; 
   d="scan'208";a="10371335"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2024 00:26:19 -0700
X-CSE-ConnectionGUID: uzcNJ2j2QnyAzqoTzIl9vg==
X-CSE-MsgGUID: E/DQSNcQRWGjVAFITpy19w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,241,1708416000"; 
   d="scan'208";a="30847461"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 30 Apr 2024 00:26:17 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s1hsV-0007sY-0J;
	Tue, 30 Apr 2024 07:26:15 +0000
Date: Tue, 30 Apr 2024 15:25:31 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Liu Shixin <liushixin2@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 7192/7643] mm/page_alloc.c:4110:9: error: call to
 undeclared function 'dynamic_pool_should_alloc'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202404301532.nTD4ftcZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   3fd472966bcc21f40dc20bb47c7ad18392fbec05
commit: fd855715f24e3eeadaa56de5fde21c55a14aeea0 [7192/7643] mm/mem_reliable: Fallback to dpool if reliable memory is not enough
config: arm64-randconfig-r053-20240430 (https://download.01.org/0day-ci/archive/20240430/202404301532.nTD4ftcZ-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 37ae4ad0eef338776c7e2cffb3896153d43dcd90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240430/202404301532.nTD4ftcZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404301532.nTD4ftcZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/page_alloc.c:19:
   In file included from include/linux/mm.h:2204:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from mm/page_alloc.c:43:
   include/linux/mm_inline.h:47:41: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      47 |         __mod_lruvec_state(lruvec, NR_LRU_BASE + lru, nr_pages);
         |                                    ~~~~~~~~~~~ ^ ~~~
   include/linux/mm_inline.h:49:22: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      49 |                                 NR_ZONE_LRU_BASE + lru, nr_pages);
         |                                 ~~~~~~~~~~~~~~~~ ^ ~~~
   mm/page_alloc.c:2769:2: warning: arithmetic between different enumeration types ('enum vm_event_item' and 'enum zone_type') [-Wenum-enum-conversion]
    2769 |         __count_zid_vm_events(PGALLOC, page_zonenum(page), 1 << order);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:135:34: note: expanded from macro '__count_zid_vm_events'
     135 |         __count_vm_events(item##_NORMAL - ZONE_NORMAL + zid, delta)
         |                           ~~~~~~~~~~~~~ ^ ~~~~~~~~~~~
   mm/page_alloc.c:2886:3: warning: arithmetic between different enumeration types ('enum vm_event_item' and 'enum zone_type') [-Wenum-enum-conversion]
    2886 |                 __count_zid_vm_events(PGALLOC, page_zonenum(page), 1 << order);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:135:34: note: expanded from macro '__count_zid_vm_events'
     135 |         __count_vm_events(item##_NORMAL - ZONE_NORMAL + zid, delta)
         |                           ~~~~~~~~~~~~~ ^ ~~~~~~~~~~~
>> mm/page_alloc.c:4110:9: error: call to undeclared function 'dynamic_pool_should_alloc'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    4110 |         return dynamic_pool_should_alloc(gfp_mask & ~GFP_RELIABLE, order);
         |                ^
   mm/page_alloc.c:4596:2: warning: arithmetic between different enumeration types ('enum vm_event_item' and 'enum zone_type') [-Wenum-enum-conversion]
    4596 |         __count_zid_vm_events(PGALLOC, zone_idx(zone), nr_account);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:135:34: note: expanded from macro '__count_zid_vm_events'
     135 |         __count_vm_events(item##_NORMAL - ZONE_NORMAL + zid, delta)
         |                           ~~~~~~~~~~~~~ ^ ~~~~~~~~~~~
   6 warnings and 1 error generated.


vim +/dynamic_pool_should_alloc +4110 mm/page_alloc.c

  4101	
  4102	static inline bool mem_reliable_fallback_dpool(gfp_t gfp_mask, unsigned int order)
  4103	{
  4104		if (!reliable_allow_fb_enabled())
  4105			return false;
  4106	
  4107		if (!(gfp_mask & GFP_RELIABLE))
  4108			return false;
  4109	
> 4110		return dynamic_pool_should_alloc(gfp_mask & ~GFP_RELIABLE, order);
  4111	}
  4112	#else
  4113	static inline struct zone *mem_reliable_fallback_zone(gfp_t gfp_mask,
  4114							      struct alloc_context *ac)
  4115	{
  4116		return NULL;
  4117	}
  4118	static inline void mem_reliable_fallback_slowpath(gfp_t gfp_mask,
  4119							  struct alloc_context *ac) {}
  4120	static inline bool mem_reliable_fallback_dpool(gfp_t gfp_mask, unsigned int order)
  4121	{
  4122		return false;
  4123	}
  4124	#endif
  4125	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

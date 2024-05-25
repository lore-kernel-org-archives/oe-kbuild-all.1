Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CF5D391
	for <oe-kbuild-all@lists.linux.dev>; Sat, 25 May 2024 00:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716596577; cv=none; b=g8ybMB/zKpHX4XjzAKVyjoQBmC9yj23pXOcumtIrk+s/j3lMbzb/urhwCbE1A2CiyWLB/uybsN2UV3VtjOq4HnkI03apfToqLmKLymOjQ012FauiB/RKl0BM+wrwR/ErwXv6bnk4f7zWzV+NcAZtJO/8MfxU3sb/VjWYOrlg3lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716596577; c=relaxed/simple;
	bh=ONZwBm6LCG0CzcZyt/cgk0vmUQFJ5wGj6IQkAPruz/Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CCKrIDX+lUjRdV2L+3xg0ttvAKzKscEdwhblZJVGPpCt0AGmJSkPGjKZZp8KGrioitsJUoqrlo1hKIqMe7ivvrxNBgkP3GUpNdeAo7L4r7IUJowThQexrUQnXntgE8uTAL/vz+xXZBmvNmPQ78g9Oa+S+VDZaIlQBBHmsO/3fVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i0gIGOCU; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i0gIGOCU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716596575; x=1748132575;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ONZwBm6LCG0CzcZyt/cgk0vmUQFJ5wGj6IQkAPruz/Q=;
  b=i0gIGOCU5UwuTytCG/vTl1qa3Qrd5ig8H9Exl0tv3jBetutvQK3FW4LM
   MV6+FWSgcBef1MuYnOZrGhuXEdGzUa2Ug6XNYiH9GLlsSzkucTlS1WlNE
   fRF8s4OlJ/d3zg9CKAa1DQ5nGF2NC2bXjpDhNRk2UFHMuK4aTEZn0UOVr
   ari17TjATjCBmgRPjInfkYH09sy7C4lvw/0C7ysp7ni1SVziWZ9V4UTvZ
   sQ5M7BIplAlAnXJfA6bTNV9BvfBoMJcePZe5EP0b89odgU4nj9qoDmXJp
   KBHx8Rzzwd38SaKHn/LdyhKE+/MFHvv90EMpayMusC+dWpg71aJwKFBxT
   g==;
X-CSE-ConnectionGUID: 5KB9MLMzRDO7OH0IahmgKg==
X-CSE-MsgGUID: G2LdRCd9TGav2G0G6WqPJw==
X-IronPort-AV: E=McAfee;i="6600,9927,11082"; a="13109718"
X-IronPort-AV: E=Sophos;i="6.08,187,1712646000"; 
   d="scan'208";a="13109718"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2024 17:22:54 -0700
X-CSE-ConnectionGUID: +NjJeDMoT0G8kAdFYyFiKg==
X-CSE-MsgGUID: 90b8R4Y4SH2kkyskJVukvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,187,1712646000"; 
   d="scan'208";a="57395026"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 24 May 2024 17:22:53 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sAfBT-00062J-19;
	Sat, 25 May 2024 00:22:51 +0000
Date: Sat, 25 May 2024 08:21:52 +0800
From: kernel test robot <lkp@intel.com>
To: David Hildenbrand <david@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [davidhildenbrand:page_mapcount_reset 3/6] ld:
 drivers/block/zram/zram_drv.c:1132:undefined reference to `zs_pool_stats'
Message-ID: <202405250804.TfdZUbxP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/davidhildenbrand/linux page_mapcount_reset
head:   bb934c8e0dd03840e2d3335f1df8bd00d317e782
commit: e628075773dea3e7c8f270ad9a0699bb36216a50 [3/6] mm/zsmalloc: use a proper page type
config: i386-randconfig-005-20240525 (https://download.01.org/0day-ci/archive/20240525/202405250804.TfdZUbxP-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240525/202405250804.TfdZUbxP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405250804.TfdZUbxP-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/block/zram/zram_drv.o: in function `zram_free_page':
   drivers/block/zram/zram_drv.c:1277:(.text+0x9e): undefined reference to `zs_free'
   ld: drivers/block/zram/zram_drv.o: in function `mm_stat_show':
   drivers/block/zram/zram_drv.c:1131:(.text+0x3a6): undefined reference to `zs_get_total_pages'
>> ld: drivers/block/zram/zram_drv.c:1132:(.text+0x3ba): undefined reference to `zs_pool_stats'
   ld: drivers/block/zram/zram_drv.o: in function `mem_used_max_store':
   drivers/block/zram/zram_drv.c:279:(.text+0x424): undefined reference to `zs_get_total_pages'
   ld: drivers/block/zram/zram_drv.o: in function `compact_store':
   drivers/block/zram/zram_drv.c:1095:(.text+0x4ce): undefined reference to `zs_compact'
   ld: drivers/block/zram/zram_drv.o: in function `zram_meta_alloc':
   drivers/block/zram/zram_drv.c:1221:(.text+0x57a): undefined reference to `zs_create_pool'
   ld: drivers/block/zram/zram_drv.o: in function `zram_meta_free':
   drivers/block/zram/zram_drv.c:1208:(.text+0x684): undefined reference to `zs_destroy_pool'
   ld: drivers/block/zram/zram_drv.o: in function `zram_meta_alloc':
>> drivers/block/zram/zram_drv.c:1228:(.text+0x699): undefined reference to `zs_huge_class_size'
   ld: drivers/block/zram/zram_drv.o: in function `zram_meta_free':
   drivers/block/zram/zram_drv.c:1208:(.text+0xbc4): undefined reference to `zs_destroy_pool'
   ld: drivers/block/zram/zram_drv.o: in function `zram_read_from_zspool':
   drivers/block/zram/zram_drv.c:1322:(.text+0x11be): undefined reference to `zs_map_object'
>> ld: drivers/block/zram/zram_drv.c:1334:(.text+0x11f4): undefined reference to `zs_unmap_object'
>> ld: drivers/block/zram/zram_drv.c:1322:(.text+0x135a): undefined reference to `zs_map_object'
   ld: drivers/block/zram/zram_drv.o: in function `zram_write_page':
   drivers/block/zram/zram_drv.c:1469:(.text+0x15eb): undefined reference to `zs_get_total_pages'
   ld: drivers/block/zram/zram_drv.c:1478:(.text+0x1621): undefined reference to `zs_map_object'
   ld: drivers/block/zram/zram_drv.c:1488:(.text+0x165e): undefined reference to `zs_unmap_object'
>> ld: drivers/block/zram/zram_drv.c:1423:(.text+0x17d8): undefined reference to `zs_free'
>> ld: drivers/block/zram/zram_drv.c:1443:(.text+0x17ec): undefined reference to `zs_malloc'
   ld: drivers/block/zram/zram_drv.c:1451:(.text+0x1821): undefined reference to `zs_malloc'
   ld: drivers/block/zram/zram_drv.c:1474:(.text+0x1870): undefined reference to `zs_free'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

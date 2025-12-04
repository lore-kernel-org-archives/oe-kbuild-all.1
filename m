Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A23033A6E8
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 Dec 2025 10:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764845229; cv=none; b=Go32MWkL1tEKp6XSz6w4qf+Ng8b4YPHlDeF3d++Hql0qiUlI/FVPZdE3h8WI8BoQayth1oAsZESrWGh9juenKBL4XUB7TGkVxPbrORpo9vmL4ZFomhVxIIu26TIJyN15l7eNn3bRVb1P4jB/qoaRkFlqhVWwd2D9f+lsPie8BDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764845229; c=relaxed/simple;
	bh=MREolQwMG3jKWKEzwqTaI+0vQ/GZEc5WwqHQGNmOUso=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CpPmyjOYjZOEUZLi+02Q/1STVLH+s9q//xAom830TjDazX2AAwkQguAINLHa0nr/veer4UmqN33cwt4CTPrOPTEeTlk/El3XSJq/Qb0e8uOQdmJ/MAwmP9To51vBFrW2LiU+9WhQxCTYTEcCoRLQTZCe6gpVRI2n4RRSuHszTf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=je0g/bXA; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="je0g/bXA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764845226; x=1796381226;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MREolQwMG3jKWKEzwqTaI+0vQ/GZEc5WwqHQGNmOUso=;
  b=je0g/bXAlat+ACrXFd4OqY+rYsuwg6NtqLy+IedEO/5MiS8nOZQkPb1k
   MXBcyy1/f5M9kKpWCeIF+B8G56L2acXwEGh/SfE/ZZ5VL/2OweimbiCzj
   7kYpGu09hUmpii7a+2a+lRE1iJq/BIwg3HdUUnKUua9euE2Uv9+tK5E14
   cyIHwACzzl+RjcMiQ0GHrEPG5wMiTHTdYvovpr/1tXXnBci7fQldoW+Zj
   R3TOg5S4tdLOi9LjCTCXFA2zOV2rdqsNOYZChAULkUtkX6uRacBraVPJ4
   MDHQ2KJglW2pEZm/UlyS1ovlIbgjkOn0ZMmTa5PhsD6kT+18C7piZBWCQ
   A==;
X-CSE-ConnectionGUID: j76gM9giR8KOYpUSBCWJsg==
X-CSE-MsgGUID: RK33ZN58SRC7ykZC0Zw+aQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="89507993"
X-IronPort-AV: E=Sophos;i="6.20,248,1758610800"; 
   d="scan'208";a="89507993"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2025 02:47:05 -0800
X-CSE-ConnectionGUID: mxnLqcHwS5eBXo/b2pw6Hg==
X-CSE-MsgGUID: yocxMr2BQ8q3QNnx9B/yDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,248,1758610800"; 
   d="scan'208";a="218306984"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 04 Dec 2025 02:47:02 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vR6rU-00000000Dif-1Kl3;
	Thu, 04 Dec 2025 10:47:00 +0000
Date: Thu, 4 Dec 2025 18:46:22 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.18/zen-sauce 5/29] mm/memcontrol.c:1675:2: warning: 'locked'
 is used uninitialized in this function
Message-ID: <202512041816.LluJkn6J-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/zen-kernel/zen-kernel 6.18/zen-sauce
head:   669f0096c96eda5618f4e42766c665f3ed341e92
commit: cd32ade31c0d6aa492e3af6249fa039521129a0d [5/29] ZEN: Restore CONFIG_OPTIMIZE_FOR_PERFORMANCE_O3
config: s390-randconfig-r133-20251204 (https://download.01.org/0day-ci/archive/20251204/202512041816.LluJkn6J-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251204/202512041816.LluJkn6J-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512041816.LluJkn6J-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/memcontrol.c: In function 'try_charge_memcg':
>> mm/memcontrol.c:1675:2: warning: 'locked' is used uninitialized in this function [-Wuninitialized]
     memcg1_oom_finish(memcg, locked);
     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/memcontrol.c:1663:7: note: 'locked' was declared here
     bool locked, ret;
          ^~~~~~
--
   In file included from include/linux/string.h:65,
                    from include/linux/bitmap.h:13,
                    from include/linux/cpumask.h:12,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/spinlock.h:63,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/umh.h:4,
                    from include/linux/kmod.h:9,
                    from include/linux/module.h:18,
                    from drivers/gpu/drm/amd/amdgpu/atom.c:25:
   drivers/gpu/drm/amd/amdgpu/atom.c: In function 'amdgpu_atom_parse':
>> arch/s390/include/asm/string.h:176:14: warning: array subscript 64 is above array bounds of 'char[9]' [-Warray-bounds]
     const char *end = s + n;
                 ^~~
   arch/s390/include/asm/string.h:176:14: warning: array subscript 64 is above array bounds of 'char[15]' [-Warray-bounds]
     const char *end = s + n;
                 ^~~


vim +/locked +1675 mm/memcontrol.c

9cbb78bb314360 David Rientjes    2012-07-31  1656  
becdf89d776c8f Shakeel Butt      2022-03-22  1657  /*
becdf89d776c8f Shakeel Butt      2022-03-22  1658   * Returns true if successfully killed one or more processes. Though in some
becdf89d776c8f Shakeel Butt      2022-03-22  1659   * corner cases it can return true even without killing any process.
becdf89d776c8f Shakeel Butt      2022-03-22  1660   */
becdf89d776c8f Shakeel Butt      2022-03-22  1661  static bool mem_cgroup_oom(struct mem_cgroup *memcg, gfp_t mask, int order)
867578cbccb089 KAMEZAWA Hiroyuki 2010-03-10  1662  {
becdf89d776c8f Shakeel Butt      2022-03-22  1663  	bool locked, ret;
7056d3a37d2c6a Michal Hocko      2018-12-28  1664  
29ef680ae7c211 Michal Hocko      2018-08-17  1665  	if (order > PAGE_ALLOC_COSTLY_ORDER)
becdf89d776c8f Shakeel Butt      2022-03-22  1666  		return false;
29ef680ae7c211 Michal Hocko      2018-08-17  1667  
7a1adfddaf0d11 Roman Gushchin    2018-10-26  1668  	memcg_memory_event(memcg, MEMCG_OOM);
7a1adfddaf0d11 Roman Gushchin    2018-10-26  1669  
292fc2e0204aa0 Roman Gushchin    2024-06-24  1670  	if (!memcg1_oom_prepare(memcg, &locked))
becdf89d776c8f Shakeel Butt      2022-03-22  1671  		return false;
29ef680ae7c211 Michal Hocko      2018-08-17  1672  
becdf89d776c8f Shakeel Butt      2022-03-22  1673  	ret = mem_cgroup_out_of_memory(memcg, mask, order);
7056d3a37d2c6a Michal Hocko      2018-12-28  1674  
292fc2e0204aa0 Roman Gushchin    2024-06-24 @1675  	memcg1_oom_finish(memcg, locked);
29ef680ae7c211 Michal Hocko      2018-08-17  1676  
7056d3a37d2c6a Michal Hocko      2018-12-28  1677  	return ret;
3812c8c8f39539 Johannes Weiner   2013-09-12  1678  }
3812c8c8f39539 Johannes Weiner   2013-09-12  1679  

:::::: The code at line 1675 was first introduced by commit
:::::: 292fc2e0204aa02a24f6d2684d71801068fec803 mm: memcg: move cgroup v1 oom handling code into memcontrol-v1.c

:::::: TO: Roman Gushchin <roman.gushchin@linux.dev>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

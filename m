Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8972A2BE650
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Nov 2025 05:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763012850; cv=none; b=iritPSy77iGebO5QVqz8FWj+uLu9NQIHvdN9iddA2tXKOw9Q54NhsH2t23EfK46a0m8fAz9PvMHgSUl+zyFsV8LUdvO37xKPcFX0F2APeMcUGia8wC5lBKN72Qr0NlTyuXyPy9TJr55PpCdFKRrJ2/OneiHFfeD3BzP9vn9Wlyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763012850; c=relaxed/simple;
	bh=tjndJ3zHYAq7SXc8qPB2yBcFmQhauc/Ka+lg/4N25Sc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rXBthTWN3GlEMxlynDI2irRRtCgnEx6SMtN2oyucuOx0zrIzrza0CdG64fis2Ir2neGsVDJeJDlH8PC546i01DanyOij127+rYuYHz7M8tSxL0rUyWHDge/uzx+kyakWIi9cFP8G7uLgZnTxyaHDSJ8sLZgUjpI2Y95TTYHU4+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z+XiAgZe; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z+XiAgZe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763012847; x=1794548847;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tjndJ3zHYAq7SXc8qPB2yBcFmQhauc/Ka+lg/4N25Sc=;
  b=Z+XiAgZea87MrcLuDAI6eb+006VzTdxYJaxf/yc+vpsnvqqDQHq6YvEK
   sZnKBBdrOpuE2H8NoHaJxdcT88zk2ivlqblfHPwM1w4deown3xbsMrws6
   WhL0i4MGs6dodv1SEIL8UNpKwUsaEWTezoiApgdPV2e88StQ9qOZ0paMZ
   dZ8QlVvZ3uVniMVXZLkcBXnP+8z2VOZeBR5CoGRji5WLjwmYQDNWMpNXK
   c1Eyajgxq6oZxA0lFyL61WHeMMUzBMV9HuXvx5ZWjw+mkSi6d8a7oCvGr
   /nsHXXeTWCUUfboGp+7fBN+adbhqpq+4Pt+FLLfMx/HkPC4kGCJzL9Woy
   g==;
X-CSE-ConnectionGUID: 1A0ubXoBTRe4305Lv09ung==
X-CSE-MsgGUID: y4qVav+dQ6iX7+nzEjvjbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11611"; a="64793329"
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; 
   d="scan'208";a="64793329"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2025 21:47:26 -0800
X-CSE-ConnectionGUID: zJhx/FnQQkyAiQw9mgWaAw==
X-CSE-MsgGUID: 8KQmQwWUTHin84Z++jtsUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; 
   d="scan'208";a="188694679"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 12 Nov 2025 21:47:26 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vJQB1-0004wn-2V;
	Thu, 13 Nov 2025 05:47:23 +0000
Date: Thu, 13 Nov 2025 13:46:27 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Price <gourry@gourry.net>
Cc: oe-kbuild-all@lists.linux.dev, Gregory Price <gourry@gourry.net>
Subject: [gourryinverse:scratch/gourry/isolation/linus 4/11]
 include/linux/memory-tiers.h:198: multiple definition of `mt_set_node_type';
 kernel/sched/fair.o:include/linux/memory-tiers.h:198: first defined here
Message-ID: <202511131304.SK60Ekqw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/gourryinverse/linux scratch/gourry/isolation/linus
head:   a7558d7fe54cbdd6f44e8e25612bde25f80e6cdb
commit: 96bc1584e93242e2b4a7a015d21e8089880b12ba [4/11] memory-tiers: Introduce SysRAM and Specific Purpose Memory Nodes
config: x86_64-randconfig-r072-20251113 (https://download.01.org/0day-ci/archive/20251113/202511131304.SK60Ekqw-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251113/202511131304.SK60Ekqw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511131304.SK60Ekqw-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: mm/vmscan.o: in function `mt_set_node_type':
>> include/linux/memory-tiers.h:198: multiple definition of `mt_set_node_type'; kernel/sched/fair.o:include/linux/memory-tiers.h:198: first defined here
   ld: mm/memory.o: in function `mt_set_node_type':
>> include/linux/memory-tiers.h:198: multiple definition of `mt_set_node_type'; kernel/sched/fair.o:include/linux/memory-tiers.h:198: first defined here
   ld: mm/mprotect.o: in function `mt_set_node_type':
>> include/linux/memory-tiers.h:198: multiple definition of `mt_set_node_type'; kernel/sched/fair.o:include/linux/memory-tiers.h:198: first defined here
   ld: mm/migrate.o: in function `mt_set_node_type':
>> include/linux/memory-tiers.h:198: multiple definition of `mt_set_node_type'; kernel/sched/fair.o:include/linux/memory-tiers.h:198: first defined here
   ld: drivers/cxl/core/region.o: in function `mt_set_node_type':
>> include/linux/memory-tiers.h:198: multiple definition of `mt_set_node_type'; kernel/sched/fair.o:include/linux/memory-tiers.h:198: first defined here


vim +198 include/linux/memory-tiers.h

   196	
   197	int mt_set_node_type(int node, int type)
 > 198	{

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FD1612DDA4
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 May 2024 11:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715252586; cv=none; b=MawPl/VsXu4J0vyG7JLa/I4UvdRKnnE4QHR/uVZQhjwKxjmC+XLbW6X8rTezuf8EIwTUHPl702cP/eB/amsXsL9+fY8u7WjmVrTH9ryFLyuGDVlUYFIzqHsi6p1/BIlk3EWPO5//LFssnV4quUq6tkSfmy/fxNX96UCgt95BOlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715252586; c=relaxed/simple;
	bh=SlUZPaYC4gI0rnfqubTzezKJ4eWADjOnWkE8sK6jgqY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hAOvnu+feyZKuQa6u0I8fGgOqYf0zXRzi6rcCyV6/dFiKAE2r8eeU6B+MzjO+SDGI0lT2yjvZUqfsaa64wuIk5yvm5A1XBTtAQiixKUmNWHtilrNFbiu1Bk5Du8wDJaUup2syRXaHObOGdn6uFMB1oRnC40eropn+UWdwFJwQoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ckCPpRBv; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ckCPpRBv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715252584; x=1746788584;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SlUZPaYC4gI0rnfqubTzezKJ4eWADjOnWkE8sK6jgqY=;
  b=ckCPpRBvPHrtrazjTisWDOitYC7B0+OCC1Rz4LUYXqZ1VG2E4Gjs/Gfi
   E+Fug9Z9MM3jQP6Xf7ctO66BdUbqDUGAsR56LSM1jGV3t6bY/Y/GIku45
   YROHxJ9hefgLW3ndIbpAjqAB0VsqN+/kmZl8dl8/JSO3EIUu5zt6prchG
   ZYpp6h5fXBt1jAXSUfkSQBqYsjCt50TmxAkC9KLCb2PgLIhU8Tq+2kiWD
   rUyn0BEcCb9zE45jVeDJHN/CcUZwny/G3XhGEq7hFydABDZESubELqmJy
   AMlMUxRqSSxB6CHCFeQ4QURF8GxbdmbQjntte1/PP0F97yqvMbklzM60J
   Q==;
X-CSE-ConnectionGUID: Q4y3aSz8SSG8Oey8EHkJ9g==
X-CSE-MsgGUID: hXz7XZoLT2Obrs+09u/FlA==
X-IronPort-AV: E=McAfee;i="6600,9927,11067"; a="14986058"
X-IronPort-AV: E=Sophos;i="6.08,147,1712646000"; 
   d="scan'208";a="14986058"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2024 04:03:03 -0700
X-CSE-ConnectionGUID: liHfLyTmRc+wwMqp5UAXug==
X-CSE-MsgGUID: sTe/MwhOTXeMCQF5hYulxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,147,1712646000"; 
   d="scan'208";a="34059511"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 09 May 2024 04:03:03 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s51YC-0004no-1X;
	Thu, 09 May 2024 11:03:00 +0000
Date: Thu, 9 May 2024 19:02:57 +0800
From: kernel test robot <lkp@intel.com>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rgushchin:memcontrol_v1.1 6/9] mm/memcontrol-v1.c:1475:6: warning:
 no previous prototype for 'mem_cgroup_oom_notify'
Message-ID: <202405091859.wnBrRurA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/rgushchin/linux.git memcontrol_v1.1
head:   4e1c777d2317dbb58d002c700e3c7b09bb4364ae
commit: bd76bb4b8e7feecffcbf151dc6a6809d4126efcf [6/9] mm: memcg: move cgroup v1 oom handling code into memcontrol-v1.c
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240509/202405091859.wnBrRurA-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240509/202405091859.wnBrRurA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405091859.wnBrRurA-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/memcontrol-v1.c:1475:6: warning: no previous prototype for 'mem_cgroup_oom_notify' [-Wmissing-prototypes]
    1475 | void mem_cgroup_oom_notify(struct mem_cgroup *memcg)
         |      ^~~~~~~~~~~~~~~~~~~~~


vim +/mem_cgroup_oom_notify +1475 mm/memcontrol-v1.c

d93eaf0623ab87 Roman Gushchin 2024-05-06  1474  
d93eaf0623ab87 Roman Gushchin 2024-05-06 @1475  void mem_cgroup_oom_notify(struct mem_cgroup *memcg)
d93eaf0623ab87 Roman Gushchin 2024-05-06  1476  {
d93eaf0623ab87 Roman Gushchin 2024-05-06  1477  	struct mem_cgroup *iter;
d93eaf0623ab87 Roman Gushchin 2024-05-06  1478  
d93eaf0623ab87 Roman Gushchin 2024-05-06  1479  	for_each_mem_cgroup_tree(iter, memcg)
d93eaf0623ab87 Roman Gushchin 2024-05-06  1480  		mem_cgroup_oom_notify_cb(iter);
d93eaf0623ab87 Roman Gushchin 2024-05-06  1481  }
d93eaf0623ab87 Roman Gushchin 2024-05-06  1482  

:::::: The code at line 1475 was first introduced by commit
:::::: d93eaf0623ab87511b49667b28956a4c33bc45f6 mm: memcg: move legacy memcg event code into memcontrol-v1.c

:::::: TO: Roman Gushchin <roman.gushchin@linux.dev>
:::::: CC: Roman Gushchin <roman.gushchin@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

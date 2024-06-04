Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A004F33F6
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Jun 2024 03:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717471250; cv=none; b=dkCXMdGxepX94HA+83UMGdOAlPvSlwCQw0/eMupPP0B9LFi0cKxtOI+ba+ULNhVdtxHLsusX0nszY6YNAh3atrLH5XpxJvkJCO+s4Vbh+tRUnVZmkFGcmIklvXN2tPjhTybQWOto32GW0UXovTM6inX4K2a8dhjcaFSE+qTQerg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717471250; c=relaxed/simple;
	bh=nDJJLPRgaTwmezQQx2sKWYNbbDh6+QwbieU3LpVxtWU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NjZKpFeO9J5xImH1DxTGETBenzh3M/0sRmV83V/KBM9CUAZ+jKfoj+pL0cz4D021Bv7TIT52D7PfJ/Beztrlpx4QCHXvK8liapo88bCmxs6SNSqR53MMjQ/v1CPtnOcsIoKM0kELIOzqRvRvmNvbJrU4JMepVd73LQeC2pFVrP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XBWnM7YV; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XBWnM7YV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717471249; x=1749007249;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nDJJLPRgaTwmezQQx2sKWYNbbDh6+QwbieU3LpVxtWU=;
  b=XBWnM7YV4pB0sdsVwW0OU5dkAadfIj2zTWMor2poemvuc1mFRmXN4ceC
   c2srqv61VSLXY/FVb0xMWsA1BfdiUPah5tMm/2ulL9F+b83AQdx6xVtX7
   GrmJQK3vF2LEXZJTqjeP9VKYXlxTvUReHyhIdyNNX6404w8Oo9l4il8VA
   pQyWsUPnOUW4OnMBv/WgJpIkDaAd6CMbEI3VcstyNDRMoRHnBmzj+s+We
   N8uZwhrWEetPNM3pM1U5lF4Tnd/GmCRhvZyabtsZgCraq961CLFmPCeIO
   esE4QCSZUYm2oIBoq6odCAAc1b0DsqVIMfF1e7Gop/g+0dHCiKbOwtzGt
   Q==;
X-CSE-ConnectionGUID: HFZX42CTSbe7okxe0CeBhw==
X-CSE-MsgGUID: RVqHLNquQmSAZidDT1LN2g==
X-IronPort-AV: E=McAfee;i="6600,9927,11092"; a="17827298"
X-IronPort-AV: E=Sophos;i="6.08,213,1712646000"; 
   d="scan'208";a="17827298"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2024 20:20:46 -0700
X-CSE-ConnectionGUID: 9bwiE4vUTJmGuDMGyUy5bg==
X-CSE-MsgGUID: Uj/9yymYSVeQKfmvPi0GKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,213,1712646000"; 
   d="scan'208";a="37202782"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 03 Jun 2024 20:20:44 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sEKj3-000MV9-1d;
	Tue, 04 Jun 2024 03:20:41 +0000
Date: Tue, 4 Jun 2024 11:19:52 +0800
From: kernel test robot <lkp@intel.com>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rgushchin:memcontrol_v1.2 6/15] mm/memcontrol-v1.c:1297:12: error:
 static declaration of 'memcg1_can_attach' follows non-static declaration
Message-ID: <202406041117.fVWtbhJU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Roman,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://github.com/rgushchin/linux.git memcontrol_v1.2
head:   95565b6663a1eaa4a2bb06f3b5b7d3345b009a40
commit: 1624ea43c8bfb0b64888ace5d067503989bdbdcc [6/15] mm: memcg: rename charge move-related functions
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20240604/202406041117.fVWtbhJU-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240604/202406041117.fVWtbhJU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406041117.fVWtbhJU-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> mm/memcontrol-v1.c:1297:12: error: static declaration of 'memcg1_can_attach' follows non-static declaration
    1297 | static int memcg1_can_attach(struct cgroup_taskset *tset)
         |            ^~~~~~~~~~~~~~~~~
   In file included from mm/memcontrol-v1.c:12:
   mm/memcontrol-v1.h:34:5: note: previous declaration of 'memcg1_can_attach' with type 'int(struct cgroup_taskset *)'
      34 | int memcg1_can_attach(struct cgroup_taskset *tset);
         |     ^~~~~~~~~~~~~~~~~
>> mm/memcontrol-v1.c:1301:13: error: static declaration of 'memcg1_cancel_attach' follows non-static declaration
    1301 | static void memcg1_cancel_attach(struct cgroup_taskset *tset)
         |             ^~~~~~~~~~~~~~~~~~~~
   mm/memcontrol-v1.h:35:6: note: previous declaration of 'memcg1_cancel_attach' with type 'void(struct cgroup_taskset *)'
      35 | void memcg1_cancel_attach(struct cgroup_taskset *tset);
         |      ^~~~~~~~~~~~~~~~~~~~
>> mm/memcontrol-v1.c:1304:13: error: static declaration of 'memcg1_move_task' follows non-static declaration
    1304 | static void memcg1_move_task(void)
         |             ^~~~~~~~~~~~~~~~
   mm/memcontrol-v1.h:36:6: note: previous declaration of 'memcg1_move_task' with type 'void(void)'
      36 | void memcg1_move_task(void);
         |      ^~~~~~~~~~~~~~~~
>> mm/memcontrol-v1.c:1304:13: warning: 'memcg1_move_task' defined but not used [-Wunused-function]
    1304 | static void memcg1_move_task(void)
         |             ^~~~~~~~~~~~~~~~
>> mm/memcontrol-v1.c:1301:13: warning: 'memcg1_cancel_attach' defined but not used [-Wunused-function]
    1301 | static void memcg1_cancel_attach(struct cgroup_taskset *tset)
         |             ^~~~~~~~~~~~~~~~~~~~
>> mm/memcontrol-v1.c:1297:12: warning: 'memcg1_can_attach' defined but not used [-Wunused-function]
    1297 | static int memcg1_can_attach(struct cgroup_taskset *tset)
         |            ^~~~~~~~~~~~~~~~~


vim +/memcg1_can_attach +1297 mm/memcontrol-v1.c

  1295	
  1296	#else	/* !CONFIG_MMU */
> 1297	static int memcg1_can_attach(struct cgroup_taskset *tset)
  1298	{
  1299		return 0;
  1300	}
> 1301	static void memcg1_cancel_attach(struct cgroup_taskset *tset)
  1302	{
  1303	}
> 1304	static void memcg1_move_task(void)
  1305	{
  1306	}
  1307	#endif
  1308	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

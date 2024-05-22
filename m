Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0EC713C3C5
	for <oe-kbuild-all@lists.linux.dev>; Wed, 22 May 2024 11:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716378397; cv=none; b=pNhmWk5rMlj5iIXsgQNnCjIavutKmjaCKZW2nEGWzByADDgT4Jffe2HZxM2XErPLiF3h//YVLYPovOHgeJvZzddTiLlS0fIY/yBTiBblk3KPHrCPVkRPCytvN7x6xTrD5YStOd0rH3Nfi1AN/tMzy8ITdfO9TQwPJ+ooi4szrMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716378397; c=relaxed/simple;
	bh=QYjnHRK/jm5wf+7fgTydOVunwQlYu2h/AYbeGi2VzEw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EwHkOXFF1WxrGvIYvRI8T9OBJlRDhQ2eUSWE0OTaWZ+NqPz/PDXf2SjKOBoTy/WwA+7kCoUlfzLHJsQ3+CBO3ZsReygnYq8GQu7tDp19X0YAXr6uvRntmRH5fXJrDPKtGAeHIfHcfh17QN93XVDl2UJudFvS3pAKF52BPTfY12k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aTT4dTnV; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aTT4dTnV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716378396; x=1747914396;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QYjnHRK/jm5wf+7fgTydOVunwQlYu2h/AYbeGi2VzEw=;
  b=aTT4dTnVaaLX4+HubkBjHOFx4OZpxGd46gCCqkS5EytnIzCOjgrNCdo/
   vV8cZ+vS2vGAyg0hvvLTjKDBZUD3jdE8qoZvutCisUUKWpWIE/jmaFzxI
   8XlaBnfKe21udf34tcLNg7PB5sc1c/ZcAelRqIf6S44tlElIYzMAbf4BN
   x6E9dpoWRQHFIeda300JZAYRGyCzeGgMJWLVVzZoaD4WDISlKhLulviit
   LM8GuO1bjNRdoIlsbpz8JVm3Urbp89Zn4yg8t4tZ5MRbbfY3GFwYXpuez
   YV41Fl2J06dnQdimPnvLCVDSsBBlDiENeCB94e7X3oippu+0h59w0VqRh
   A==;
X-CSE-ConnectionGUID: MAp5cLEqSNaDVYEDf/Ti6A==
X-CSE-MsgGUID: 9MIGWcYfRUStWJo79hmmXg==
X-IronPort-AV: E=McAfee;i="6600,9927,11079"; a="23752003"
X-IronPort-AV: E=Sophos;i="6.08,179,1712646000"; 
   d="scan'208";a="23752003"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2024 04:46:00 -0700
X-CSE-ConnectionGUID: ZazfksIoQpWoiL38+Xitmw==
X-CSE-MsgGUID: D/620D0/QmmZyy51CKtbmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,179,1712646000"; 
   d="scan'208";a="33847684"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 22 May 2024 04:45:59 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s9kPp-0001NO-2o;
	Wed, 22 May 2024 11:45:54 +0000
Date: Wed, 22 May 2024 19:44:49 +0800
From: kernel test robot <lkp@intel.com>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rgushchin:memcontrol_v1.1 5/12] mm/memcontrol-v1.c:1304:13:
 warning: 'mem_cgroup_move_task' defined but not used
Message-ID: <202405221952.Oha8qNr1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/rgushchin/linux.git memcontrol_v1.1
head:   b636dcac61bd7f9452f842ed39f80ce9795f1cf9
commit: fc54dcd85ac8c0fd38653910a9445cf4f12f344b [5/12] mm: memcg: move charge migration code to memcontrol-v1.c
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20240522/202405221952.Oha8qNr1-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240522/202405221952.Oha8qNr1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405221952.Oha8qNr1-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/memcontrol-v1.c:1297:12: error: static declaration of 'mem_cgroup_can_attach' follows non-static declaration
    1297 | static int mem_cgroup_can_attach(struct cgroup_taskset *tset)
         |            ^~~~~~~~~~~~~~~~~~~~~
   In file included from mm/memcontrol-v1.c:12:
   mm/memcontrol-v1.h:34:5: note: previous declaration of 'mem_cgroup_can_attach' with type 'int(struct cgroup_taskset *)'
      34 | int mem_cgroup_can_attach(struct cgroup_taskset *tset);
         |     ^~~~~~~~~~~~~~~~~~~~~
   mm/memcontrol-v1.c:1301:13: error: static declaration of 'mem_cgroup_cancel_attach' follows non-static declaration
    1301 | static void mem_cgroup_cancel_attach(struct cgroup_taskset *tset)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~
   mm/memcontrol-v1.h:35:6: note: previous declaration of 'mem_cgroup_cancel_attach' with type 'void(struct cgroup_taskset *)'
      35 | void mem_cgroup_cancel_attach(struct cgroup_taskset *tset);
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
   mm/memcontrol-v1.c:1304:13: error: static declaration of 'mem_cgroup_move_task' follows non-static declaration
    1304 | static void mem_cgroup_move_task(void)
         |             ^~~~~~~~~~~~~~~~~~~~
   mm/memcontrol-v1.h:36:6: note: previous declaration of 'mem_cgroup_move_task' with type 'void(void)'
      36 | void mem_cgroup_move_task(void);
         |      ^~~~~~~~~~~~~~~~~~~~
>> mm/memcontrol-v1.c:1304:13: warning: 'mem_cgroup_move_task' defined but not used [-Wunused-function]
    1304 | static void mem_cgroup_move_task(void)
         |             ^~~~~~~~~~~~~~~~~~~~
>> mm/memcontrol-v1.c:1301:13: warning: 'mem_cgroup_cancel_attach' defined but not used [-Wunused-function]
    1301 | static void mem_cgroup_cancel_attach(struct cgroup_taskset *tset)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~
>> mm/memcontrol-v1.c:1297:12: warning: 'mem_cgroup_can_attach' defined but not used [-Wunused-function]
    1297 | static int mem_cgroup_can_attach(struct cgroup_taskset *tset)
         |            ^~~~~~~~~~~~~~~~~~~~~


vim +/mem_cgroup_move_task +1304 mm/memcontrol-v1.c

  1295	
  1296	#else	/* !CONFIG_MMU */
> 1297	static int mem_cgroup_can_attach(struct cgroup_taskset *tset)
  1298	{
  1299		return 0;
  1300	}
> 1301	static void mem_cgroup_cancel_attach(struct cgroup_taskset *tset)
  1302	{
  1303	}
> 1304	static void mem_cgroup_move_task(void)
  1305	{
  1306	}
  1307	#endif
  1308	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

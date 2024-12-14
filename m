Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E97CE26AC3
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Dec 2024 05:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734152806; cv=none; b=BsVhTWhJLl9z42XhETTEMBwhuRDOyqdl5iH6uPl7Ku0Ur0tPq81hipDjv8rUKMOSSNyfxKgHBz1BY+rYUIiIFYMZykKBTVRwwyT+tQ/WMQmkpVlKe07EAR10kFZPK4l7wtThBfkF+W4zVdU06yjZmURWQ/xUAq/BiVvwR7gS0EA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734152806; c=relaxed/simple;
	bh=CiUrVaJu0qvmveqvURjmw5FOaB4lZlGVNIqXJ2E0G/4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VGPTYYfEUAq9hPkGiYHt1L4q5enwn5tgesOzB9J3dYGVXpD58L1rbarDQ4CGv1//aZG1HQByIZxIexF597crcW7epxZFRHNEyeVS7yZwdMosp/DhIks9jpYMxHaIMU972lQU39NUPSn1vq1IslQuMvyWUDjK6tBI6gpjEWlLDCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TmBqH3Nt; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TmBqH3Nt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734152804; x=1765688804;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CiUrVaJu0qvmveqvURjmw5FOaB4lZlGVNIqXJ2E0G/4=;
  b=TmBqH3NtA4v4FLFZk56ayibkVwc2I29FXNXJ27nS3hveLaZEvYOIOnik
   V4CLRrRQCG4N3WWmm98+bQLtk35DPnr+jN8lsF9oms8eb/mABc+6ODFUC
   54iwdqIGKt05L5MfiMPUWinJRBAlIyNG28RoQtYLADEUayrmzWBQwRTo2
   84SP+/307Z7uCZUIWHWsG78GPGJLjQ3JXyulP+SmD/Q6xmCnEd64iowKd
   KuMtVIKKu/9GACt2W3c58WNArzlJY80gFqHxUHHImahi1Ta9mJSG3dcPo
   KGHROhQT+crwc3urhMnpjfkUrpiJWl4SkHPWd8FkrfetkEduX/2WcTLRo
   g==;
X-CSE-ConnectionGUID: KC9rD0r1RIuYfx76EoDULA==
X-CSE-MsgGUID: qUSpccKVSDuw2GDnUfYzkQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11285"; a="52033316"
X-IronPort-AV: E=Sophos;i="6.12,233,1728975600"; 
   d="scan'208";a="52033316"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2024 21:06:43 -0800
X-CSE-ConnectionGUID: NFJW6NmBRVG+btEIeLpNew==
X-CSE-MsgGUID: IVnsh9oIRzCbostIVPdAFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,233,1728975600"; 
   d="scan'208";a="97270106"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 13 Dec 2024 21:06:41 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tMKMR-000CiR-2G;
	Sat, 14 Dec 2024 05:06:39 +0000
Date: Sat, 14 Dec 2024 13:05:59 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Hui Tang <tanghui20@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2579/2579] kernel/sched/relationship.c:46:51:
 error: 'struct task_struct' has no member named 'mems_allowed'
Message-ID: <202412141314.NmcppncZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   6c3413fbf8c430b89f5d23f465e10e99ea145199
commit: 2ac826b258e9aceefd719f7b0c3e3a9e73901ce5 [2579/2579] sched: Introduce task relationship by net and memory
config: arm64-randconfig-004-20241213 (https://download.01.org/0day-ci/archive/20241214/202412141314.NmcppncZ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241214/202412141314.NmcppncZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412141314.NmcppncZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/sched.h:23,
                    from arch/arm64/include/asm/compat.h:16,
                    from arch/arm64/include/asm/stat.h:13,
                    from include/linux/stat.h:6,
                    from include/linux/module.h:13,
                    from include/linux/bpf.h:20,
                    from include/linux/bpf_sched.h:5,
                    from kernel/sched/relationship.c:19:
   kernel/sched/relationship.c: In function 'task_relationship_supported':
>> kernel/sched/relationship.c:46:51: error: 'struct task_struct' has no member named 'mems_allowed'
      46 |                 !nodes_subset(node_online_map, tsk->mems_allowed) ||
         |                                                   ^~
   include/linux/nodemask.h:218:51: note: in definition of macro 'nodes_subset'
     218 |                         __nodes_subset(&(src1), &(src2), MAX_NUMNODES)
         |                                                   ^~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PGP_KEY_PARSER
   Depends on [n]: CRYPTO [=y] && ASYMMETRIC_KEY_TYPE [=y] && ASYMMETRIC_PUBLIC_KEY_SUBTYPE [=n]
   Selected by [y]:
   - PGP_PRELOAD [=y] && CRYPTO [=y] && ASYMMETRIC_KEY_TYPE [=y]


vim +46 kernel/sched/relationship.c

    38	
    39	bool task_relationship_supported(struct task_struct *tsk)
    40	{
    41		if (!task_relationship_used())
    42			return false;
    43	
    44		if (!tsk->rship || !tsk->mm ||
    45			!cpumask_subset(cpu_online_mask, tsk->cpus_ptr) ||
  > 46			!nodes_subset(node_online_map, tsk->mems_allowed) ||
    47			get_task_policy(tsk)->mode == MPOL_BIND ||
    48			get_task_policy(tsk)->mode == MPOL_INTERLEAVE)
    49			return false;
    50	
    51		return true;
    52	}
    53	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

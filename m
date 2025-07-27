Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBA569460
	for <oe-kbuild-all@lists.linux.dev>; Sun, 27 Jul 2025 22:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753653631; cv=none; b=ViskbVXuzXuNFjD53pCQgyqqCXnQngkZK/gN8cR2Cf8s1vCRpcjS6X4KNd2vjva5okuhwpcl61vB1X+1idXsuYh6oK/IUOBF839Bma0lJpQCEuep4+bf0Gjsu3lElHoOneIvTgfgSRsLIwXkff+JGhnqpxFJceQBX7txBGGsprA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753653631; c=relaxed/simple;
	bh=U6ykNCIbhA/9QERLknfL1WIMn9k/Y0X9EoeMDG4hjaM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IFC1b9bsvrDERKqNllfn/AOZN1FH8uXYsR06U6V1BZERn313DqtpQ1tfqYo6U4LPYWT7sLxztgp50DxftKwa/T2T8OtmPZIG4X2jP/0Svgc3xVppvYMznXMlVWjJ0VE7aq2sPQzneCovJddLERYGjBHwftMTob14fc6GnV7c7Vs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LjwSYxSt; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LjwSYxSt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753653630; x=1785189630;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=U6ykNCIbhA/9QERLknfL1WIMn9k/Y0X9EoeMDG4hjaM=;
  b=LjwSYxStzxQexwNp3GE6rveAR4zgJb6aUFaWT4FPcZk7s3SUro4IKsK5
   dEbvxDCOvpaCiIerInKnyu3Mw9+1m/u7dgVH6Gq/iu01O8GEZgz7XGEmj
   1o5D3jfz6wyhAYU3XvxFyDjIr8WYhhbvHrci9Wb10YlqNyr4BpJUANVJX
   SbDc3jaNfnhTUpOMePxD5OKuDQgW4ztJVwDu5s5SxFEsK13QoeGX/Axp4
   gAJIbDWegzOEojqL9nlE83Rk4yEcyx2Uxykc0pbnEPokr1fUG7wNIInLU
   d9J6+gyHJgCgs8gu3is5vyMlgG/4cVc/Bgk8gY6Wu/XDtp8BYmNOVgmtk
   g==;
X-CSE-ConnectionGUID: D/r2Z0WZROuFDzhIe9atxw==
X-CSE-MsgGUID: +9lQML/0THy9YLw9cFgI6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11504"; a="55995080"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="55995080"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2025 15:00:29 -0700
X-CSE-ConnectionGUID: tWGKpFExSKipKf4OvR57lw==
X-CSE-MsgGUID: wHu8WL2RRLun86BUHpqYtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="166422545"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by orviesa003.jf.intel.com with ESMTP; 27 Jul 2025 15:00:28 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ug9Pu-0000S7-0O;
	Sun, 27 Jul 2025 22:00:26 +0000
Date: Mon, 28 Jul 2025 00:00:20 +0200
From: kernel test robot <lkp@intel.com>
To: jason.zeng@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bytedance:5.15-velinux 92/92] kernel/sched/fair.c:1432:14: warning:
 no previous prototype for 'bpf_should_numa_migrate'
Message-ID: <202507280004.VODxmgMH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/bytedance/kernel.git 5.15-velinux
head:   c71e88ad12bfbc44f855b681ef923e1acc2e984a
commit: 8ab508cd4a0d43a39fb35ed59cc74b23bc2ec452 [92/92] bytedance: mm: numa-balance: Introduce new numa balance bpf hook
config: arm64-randconfig-2005-20250719 (https://download.01.org/0day-ci/archive/20250728/202507280004.VODxmgMH-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250728/202507280004.VODxmgMH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507280004.VODxmgMH-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/sched/fair.c: In function 'update_curr':
   kernel/sched/fair.c:841:28: warning: variable 'stats' set but not used [-Wunused-but-set-variable]
     841 |   struct sched_statistics *stats;
         |                            ^~~~~
   kernel/sched/fair.c: In function 'update_stats_wait_start':
   kernel/sched/fair.c:874:27: warning: variable 'stats' set but not used [-Wunused-but-set-variable]
     874 |  struct sched_statistics *stats;
         |                           ^~~~~
   kernel/sched/fair.c: In function 'update_stats_wait_end':
   kernel/sched/fair.c:894:27: warning: variable 'stats' set but not used [-Wunused-but-set-variable]
     894 |  struct sched_statistics *stats;
         |                           ^~~~~
   kernel/sched/fair.c: In function 'update_stats_enqueue_sleeper':
   kernel/sched/fair.c:938:27: warning: variable 'stats' set but not used [-Wunused-but-set-variable]
     938 |  struct sched_statistics *stats;
         |                           ^~~~~
   kernel/sched/fair.c: At top level:
>> kernel/sched/fair.c:1432:14: warning: no previous prototype for 'bpf_should_numa_migrate' [-Wmissing-prototypes]
    1432 | noinline int bpf_should_numa_migrate(struct task_struct *p, int nodes)
         |              ^~~~~~~~~~~~~~~~~~~~~~~
>> kernel/sched/fair.c:2138:14: warning: no previous prototype for 'bpf_disable_migrate_preferred' [-Wmissing-prototypes]
    2138 | noinline int bpf_disable_migrate_preferred(struct task_struct *p)
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c: In function 'set_next_entity':
   kernel/sched/fair.c:4729:28: warning: variable 'stats' set but not used [-Wunused-but-set-variable]
    4729 |   struct sched_statistics *stats;
         |                            ^~~~~


vim +/bpf_should_numa_migrate +1432 kernel/sched/fair.c

  1431	
> 1432	noinline int bpf_should_numa_migrate(struct task_struct *p, int nodes)
  1433	{
  1434		return BPF_MIGRATE_DEFAULT;
  1435	}
  1436	ALLOW_ERROR_INJECTION(bpf_should_numa_migrate, ERRNO);
  1437	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

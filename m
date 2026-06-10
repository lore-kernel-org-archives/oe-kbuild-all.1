Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6ACC175A6B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Jun 2026 06:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781071346; cv=none; b=nEAyPK1v1GnIY27eYOZIptaMITxrTNeeHF41L5SqVesAA8SzvXakynhM/uUV258zkortm8bP8zQEPx8TJWKB7ZBK7U9srj1kiyB03ZgggLk7fkTqBD25hSaN7Udo10d1Xte6BXTRVClHLsK8deaqk5TTBf4fJh37mzQ0m3stDQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781071346; c=relaxed/simple;
	bh=smzxCaw6gLzbNyX3j5iAgrkacLRNEFdfvj+ngKqYP5w=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CE4MzfSc2+Mos/05xp9nQxXmryAh1nm+VLHVy3AhjuHeWlhKabuON/XRNqQKuncPppIuB54WSNHv34HOYphcuzcdsoV8FK3B0aCtCz7MaHlpGS8DaK8g8joWKPJDowyDHoqtHhCRO5dI2dZ41Eg4+F/h+JBgQxf4/yErmxdas7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fjkKX3X7; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fjkKX3X7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781071345; x=1812607345;
  h=date:from:to:cc:subject:message-id;
  bh=smzxCaw6gLzbNyX3j5iAgrkacLRNEFdfvj+ngKqYP5w=;
  b=fjkKX3X7iXFMqcLBwu/gqYexrmFV6G8I9YfkWh+TGwdrpCw1IWSX/L9D
   QycIcH94tbb3l3AOGIaOQ6I+s0huhtPDd72E03KpFMhNqklP9sFdTgkai
   3HUusvurJM2fePtxnGeDkrbzLNLbCfv3dop6BPkj5YsPVKSxCX4XGGCa/
   kVsIiFgUC9UyQZlWoumFiIvkOQHNW+1jD6oz/Gzx1lPSKv9y/svkZizIh
   W2Tqn5E6swoA2DhXRhhLfrnL/rbcaIMNsHXr+QpM6u2YAs0gafDbHzOVf
   9DzXuXx2Fb8fnO4hR4EGLlDrgeIqkICfHEpWibVLQEDaOqYvKw6+Cz6/5
   A==;
X-CSE-ConnectionGUID: 92oe9szhT4ujkKLAq4/wfA==
X-CSE-MsgGUID: +UvLiqbMSPaEWAdoLnIx4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="104521020"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="104521020"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2026 23:02:25 -0700
X-CSE-ConnectionGUID: rogjDycVSDiU+U0v6tFv+g==
X-CSE-MsgGUID: G13AqSvETuuaKMKijB4yZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="243104716"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 09 Jun 2026 23:02:23 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wXC16-00000000KyM-400r;
	Wed, 10 Jun 2026 06:02:20 +0000
Date: Wed, 10 Jun 2026 14:01:55 +0800
From: kernel test robot <lkp@intel.com>
To: "Harry Yoo (Oracle)" <harry@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [harry:kfree-rcu-nolock-rfc-v3-wip-r1 4/5] core.c:undefined
 reference to `kfree_call_rcu'
Message-ID: <202606101324.svDhUiIk-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/harry/linux.git kfree-rcu-nolock-rfc-v3-wip-r1
head:   fef982439aa9f00c2475864d0a66e05afea29725
commit: a089eb769c0fe966aa6bae0f48312934bf82e2be [4/5] mm/slab: introduce kfree_rcu_nolock()
config: i386-allnoconfig (https://download.01.org/0day-ci/archive/20260610/202606101324.svDhUiIk-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260610/202606101324.svDhUiIk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606101324.svDhUiIk-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: kernel/workqueue.o: in function `pwq_release_workfn':
   workqueue.c:(.text+0x4e71): undefined reference to `kfree_call_rcu'
   ld: kernel/sched/core.o: in function `set_cpus_allowed_force':
>> core.c:(.text+0x4271): undefined reference to `kfree_call_rcu'
   ld: kernel/events/core.o: in function `sw_perf_event_destroy':
   core.c:(.text+0x20bd): undefined reference to `kfree_call_rcu'
   ld: mm/vmalloc.o: in function `free_vmap_block':
>> vmalloc.c:(.text+0xa67): undefined reference to `kfree_call_rcu'
   ld: fs/fcntl.o: in function `fasync_remove_entry':
>> fcntl.c:(.text+0x1215): undefined reference to `kfree_call_rcu'
   ld: fs/dcache.o:dcache.c:(.text+0x6b3): more undefined references to `kfree_call_rcu' follow

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D246A1F03C5
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Oct 2025 20:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761338064; cv=none; b=INutZv8XfuuMrkYN1v00E3jv71NHvOziP5l6z1C5Mzr4fUIDm/s14pHlDXQwWcGuUgt5T+VK8XvcXHLCafgFqxwUGMtv7NQx1QlpAzvMmemtJb+INt2+iZo0+3tdPM6izd06oYyn019SHIw+T85AyUhwaaq8V30TljwihUyMYdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761338064; c=relaxed/simple;
	bh=pKU6p3iB7vMyj8J8kab77yHdbg/r6dgu2ZavDd7PWzo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=up1Ndrzpcmtm3lAPQAKPWZYSo0Are4ivmcmV4RE2u65AGi40brP9urp9ho8TyC/eQkxRvqtCccyAGh6jWdPklSJdTHmYsALYH86hNfHVRlfM+1TjSUzsJbFO9BoNHdMem1ybFmTrC3SKPXApWpmrf/R/gA1kRmpfqOo1YO9a7KM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LAyw0ncL; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LAyw0ncL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761338061; x=1792874061;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pKU6p3iB7vMyj8J8kab77yHdbg/r6dgu2ZavDd7PWzo=;
  b=LAyw0ncLUD35SD3F3+7PHtzA0EQla8EQJCMwTGg6KLWswUhFUpFHVh+c
   2xgm/mj2aCAbNChxr/szUYgUdozM37YOGH5xyuf4IVnfKvvOtFm9YZhAR
   BURq+TEfAdZgzqEO49AGs0F0/03P/ohwJHjD8HtbDVeCFL5UaIxNKrpYk
   KHewvrZOfI3PLvXPSzXWTLzK50gJHebbjlKmOOyf/3YljXnyLc2ZdXQzk
   ZdcBcSuDHuX4Sm5XcQSEha4rzv48dhpikfAR0IArbqSLi/Fu8DvE8IxR7
   tT9pBHZBh29bU6PjjH8mHknZLaP2eAPgekiQJvryv9jyGhS/Act5oDq+h
   A==;
X-CSE-ConnectionGUID: vN6nD+wlTLKC8ldf8FyqZA==
X-CSE-MsgGUID: 1TuLIOpZTxKNpyvqhXX4lA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="88995301"
X-IronPort-AV: E=Sophos;i="6.19,253,1754982000"; 
   d="scan'208";a="88995301"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2025 13:34:21 -0700
X-CSE-ConnectionGUID: +fRkRsjKSP+wghBuzIqeKg==
X-CSE-MsgGUID: m0jH5tBHSt+pn3c41097iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,253,1754982000"; 
   d="scan'208";a="184997525"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 24 Oct 2025 13:34:20 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vCOUL-000Erl-2I;
	Fri, 24 Oct 2025 20:34:17 +0000
Date: Sat, 25 Oct 2025 04:33:33 +0800
From: kernel test robot <lkp@intel.com>
To: Tejun Heo <tj@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Andrea Righi <arighi@nvidia.com>
Subject: [linux-next:master 3470/4098] kernel/sched/ext.c:3898:50: sparse:
 sparse: incorrect type in initializer (different address spaces)
Message-ID: <202510250422.YmoOlBv8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Tejun,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   72fb0170ef1f45addf726319c52a0562b6913707
commit: 987e00035c0e68bc0d44dec811cc9c26310b5bff [3470/4098] sched_ext: Rename pnt_seq to kick_sync
config: parisc-randconfig-r132-20251024 (https://download.01.org/0day-ci/archive/20251025/202510250422.YmoOlBv8-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251025/202510250422.YmoOlBv8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510250422.YmoOlBv8-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/ext.c:872:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext.c:1022:56: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/ext.c:1022:56: sparse:    struct task_struct *
   kernel/sched/ext.c:1022:56: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/ext.c:1047:66: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/ext.c:1047:66: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/ext.c:1047:66: sparse:    struct task_struct *
   kernel/sched/ext.c:1237:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [toplevel] scx_root @@
   kernel/sched/ext.c:1237:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:1237:33: sparse:     got struct scx_sched [noderef] __rcu *static [toplevel] scx_root
   kernel/sched/ext.c:1355:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [toplevel] scx_root @@
   kernel/sched/ext.c:1355:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:1355:33: sparse:     got struct scx_sched [noderef] __rcu *static [toplevel] scx_root
   kernel/sched/ext.c:1402:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [toplevel] scx_root @@
   kernel/sched/ext.c:1402:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:1402:33: sparse:     got struct scx_sched [noderef] __rcu *static [toplevel] scx_root
   kernel/sched/ext.c:1451:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [toplevel] scx_root @@
   kernel/sched/ext.c:1451:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:1451:33: sparse:     got struct scx_sched [noderef] __rcu *static [toplevel] scx_root
   kernel/sched/ext.c:1495:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [toplevel] scx_root @@
   kernel/sched/ext.c:1495:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:1495:33: sparse:     got struct scx_sched [noderef] __rcu *static [toplevel] scx_root
   kernel/sched/ext.c:1496:35: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext.c:1496:35: sparse:     expected struct task_struct *p
   kernel/sched/ext.c:1496:35: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/ext.c:1506:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [toplevel] scx_root @@
   kernel/sched/ext.c:1506:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:1506:33: sparse:     got struct scx_sched [noderef] __rcu *static [toplevel] scx_root
   kernel/sched/ext.c:1507:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *from @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext.c:1507:38: sparse:     expected struct task_struct *from
   kernel/sched/ext.c:1507:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/ext.c:2061:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [toplevel] scx_root @@
   kernel/sched/ext.c:2061:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:2061:33: sparse:     got struct scx_sched [noderef] __rcu *static [toplevel] scx_root
   kernel/sched/ext.c:2204:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [toplevel] scx_root @@
   kernel/sched/ext.c:2204:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:2204:33: sparse:     got struct scx_sched [noderef] __rcu *static [toplevel] scx_root
   kernel/sched/ext.c:2260:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [toplevel] scx_root @@
   kernel/sched/ext.c:2260:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:2260:33: sparse:     got struct scx_sched [noderef] __rcu *static [toplevel] scx_root
   kernel/sched/ext.c:2301:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [toplevel] scx_root @@
   kernel/sched/ext.c:2301:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:2301:33: sparse:     got struct scx_sched [noderef] __rcu *static [toplevel] scx_root
   kernel/sched/ext.c:2355:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *prev @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext.c:2355:38: sparse:     expected struct task_struct *prev
   kernel/sched/ext.c:2355:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/ext.c:2468:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:2468:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:2468:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:2529:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:2529:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:2529:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:2548:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:2548:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:2548:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:2670:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:2670:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:2670:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:2749:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:2749:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:2749:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:2802:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:2802:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:2802:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:2830:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:2830:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:2830:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:2843:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:2843:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:2843:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:2973:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:2973:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:2973:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:2989:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:2989:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:2989:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:3057:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:3057:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:3057:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:3086:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:3086:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:3086:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:3099:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:3099:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:3099:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:3148:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:3148:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:3148:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:3167:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:3167:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:3167:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:3185:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:3185:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:3185:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:3201:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:3201:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:3201:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:3218:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:3218:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:3218:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
>> kernel/sched/ext.c:3898:50: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_kick_syncs **ksyncs @@     got struct scx_kick_syncs [noderef] __rcu ** @@
   kernel/sched/ext.c:3898:50: sparse:     expected struct scx_kick_syncs **ksyncs
   kernel/sched/ext.c:3898:50: sparse:     got struct scx_kick_syncs [noderef] __rcu **
   kernel/sched/ext.c:3901:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/ext.c:3901:27: sparse:    struct scx_kick_syncs [noderef] __rcu *
   kernel/sched/ext.c:3901:27: sparse:    struct scx_kick_syncs *
   kernel/sched/ext.c:3901:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/ext.c:3901:27: sparse:    struct scx_kick_syncs [noderef] __rcu *
   kernel/sched/ext.c:3901:27: sparse:    struct scx_kick_syncs *
   kernel/sched/ext.c:4182:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [assigned] [toplevel] scx_root @@
   kernel/sched/ext.c:4225:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [assigned] [toplevel] scx_root @@
   kernel/sched/ext.c:4336:52: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext.c:4413:50: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_kick_syncs **ksyncs @@     got struct scx_kick_syncs [noderef] __rcu ** @@
   kernel/sched/ext.c:4416:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/ext.c:4416:17: sparse:    struct scx_kick_syncs [noderef] __rcu *
   kernel/sched/ext.c:4416:17: sparse:    struct scx_kick_syncs *
   kernel/sched/ext.c:4425:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/ext.c:4425:17: sparse:    struct scx_kick_syncs [noderef] __rcu *
   kernel/sched/ext.c:4425:17: sparse:    struct scx_kick_syncs *
   kernel/sched/ext.c:5119:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct const *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext.c:5246:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [assigned] [toplevel] scx_root @@
   kernel/sched/ext.c:5573:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [assigned] [toplevel] scx_root @@
   kernel/sched/ext.c:6537:15: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/ext.c:6537:15: sparse:    struct scx_sched [noderef] __rcu *
   kernel/sched/ext.c:6537:15: sparse:    struct scx_sched *
   kernel/sched/ext.c:6632:33: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/ext.c:6632:33: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/ext.c:6632:33: sparse:    struct task_struct const *
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/ext_idle.c:736:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [assigned] [toplevel] scx_root @@
   kernel/sched/ext_idle.c:756:49: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct const *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/syscalls.c:185:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/syscalls.c:185:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/syscalls.c:185:22: sparse:    struct task_struct *
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/sched.h:2281:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2281:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2281:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2281:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2281:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2281:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2292:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2292:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2292:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2281:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2281:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2281:25: sparse:    struct task_struct *

vim +3898 kernel/sched/ext.c

  3892	
  3893	static void free_kick_syncs(void)
  3894	{
  3895		int cpu;
  3896	
  3897		for_each_possible_cpu(cpu) {
> 3898			struct scx_kick_syncs **ksyncs = per_cpu_ptr(&scx_kick_syncs, cpu);
  3899			struct scx_kick_syncs *to_free;
  3900	
  3901			to_free = rcu_replace_pointer(*ksyncs, NULL, true);
  3902			if (to_free)
  3903				call_rcu(&to_free->rcu, free_kick_syncs_rcu);
  3904		}
  3905	}
  3906	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BA2737649C
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Apr 2026 03:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775534381; cv=none; b=UrPb14ZQprbEj3G7+SuGESvobvFoW3jJHjwGm2O15tQqzAS9inSzutYh9iq7TEUShsk1CXa5txYBGOWanNwAzWsDbbFCNaryx15DVxKlV6E5U/cKK4n1kORA2MB1apXtryk/571rhlKMot2vIYFNbQdlq4zRpBHVVI8lCZHxbU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775534381; c=relaxed/simple;
	bh=8jXfmODUPLeQMkpOTZqiphcmvWEvUvZdZalkaFbXUaU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=PWkpdXXf8DCszHNGLC0lDi/xWPOCi5Zi3y2lNCfoa0Q+SUE0w5GW/AMCWTvbtUFLtPSgyZ25DSEGR66AuyKnMbAYjZeT03G73AmxKOwPOkd7STc8KYwVgdIUdz0ebN4sSHyONP7AUVh/MJJhDjObylOWMHq3KMVVj5i361YAL64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fyNOD7qv; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fyNOD7qv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775534379; x=1807070379;
  h=date:from:to:cc:subject:message-id;
  bh=8jXfmODUPLeQMkpOTZqiphcmvWEvUvZdZalkaFbXUaU=;
  b=fyNOD7qvt9t6ryHbDoqoBUYFS1l/N5wQ0x6VqodUqc2V+6GGLheLQisB
   vbRXbzLCwL+s2ztKjapi5q7u9Q16y5z4DzpyD0zyil9tfdHMTJxwL0Q54
   YTJnU+RkRzIqSXGDEQ9oZuY89OVOfdg2wbNFZDG77oCAL69nx3azASTvJ
   g6rpC2XQxee+t03LD9XSdxeR7mDHxvtoyxTp33ur171stPPMASu7kaOW8
   yieZTc53+1fhZt2Sgz8/9TEIRb3wiV1DWmI1v0bTmHVJ/T/35BS066uFR
   C4xeRwa4SLHSnn8jXm0+jqA3WU/VYh7qi7whXkHX0fVxd/586DNG8+2lk
   w==;
X-CSE-ConnectionGUID: r/CRGm2jSrS7+QJh8zPIjQ==
X-CSE-MsgGUID: ZWrGPSmKRM6eZtBOmY6Ryw==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="76204327"
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="76204327"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2026 20:59:37 -0700
X-CSE-ConnectionGUID: prlRcBeRRceiZmMTBkc6Sg==
X-CSE-MsgGUID: ql/Ugm3NQOGv+elFyr7d+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="251193029"
Received: from lkp-server01.sh.intel.com (HELO d00eb8a6782a) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 06 Apr 2026 20:59:35 -0700
Received: from kbuild by d00eb8a6782a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w9xbB-0000000006w-1cCm;
	Tue, 07 Apr 2026 03:59:33 +0000
Date: Tue, 07 Apr 2026 11:59:07 +0800
From: kernel test robot <lkp@intel.com>
To: Tejun Heo <tj@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Andrea Righi <arighi@nvidia.com>
Subject: kernel/sched/ext.c:3898:50: sparse: sparse: incorrect type
 in initializer (different address spaces)
Message-ID: <202604051621.G8CWy2bc-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Tejun,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   3aae9383f42f687221c011d7ee87529398e826b3
commit: 987e00035c0e68bc0d44dec811cc9c26310b5bff sched_ext: Rename pnt_seq to kick_sync
date:   5 months ago
config: sparc-randconfig-r134-20260404 (https://download.01.org/0day-ci/archive/20260405/202604051621.G8CWy2bc-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260405/202604051621.G8CWy2bc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 987e00035c0e ("sched_ext: Rename pnt_seq to kick_sync")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604051621.G8CWy2bc-lkp@intel.com/

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

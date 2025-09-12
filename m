Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B77F2D2489
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Sep 2025 07:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757663375; cv=none; b=gWANgb4zZaydTiV3Z1lKtO8BdJDkvUx5Aq89a+hF54nsZ9YZtDrxABj03FpwGaqtkUd8gsH0Rcm/ukrvOg0Pr3/Xf11E9CvaMYQ/HdwiGFanDOfOQjXPRCXPq5PFKxoF3fKQvzBCJBdI6vurhvtdhrO2nV1il83OeFzd/+q8cHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757663375; c=relaxed/simple;
	bh=y9rXwdqj+p/aqnuqC6uEkRjR/CBaem9J8TCsaW50A7Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=j79dSf+haGCEiBY0Vqg6NNZjuonYLYPW2wpA26icRbIW8Y58G3tYej3B8l4r44aZ4jmvLQwQnZFmk551/8Dlg8Q6+AJggHMf/5EGXyS/S7bJ6OLlHyDVaddcXK6yJGMtB5D+BvqPuG5vM2CDPyv1ndXQweymNv2G4dmRM3dF+DQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DlAwIO8T; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DlAwIO8T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757663374; x=1789199374;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=y9rXwdqj+p/aqnuqC6uEkRjR/CBaem9J8TCsaW50A7Q=;
  b=DlAwIO8TDIhMIFT4hMwZQrxVj2q8nQrJXnSRCwCYS4jQNmO3nd4ZpifM
   7GzAb8J+BTFTYizmQ0E5a+bi8fvDKPdBbCRYx+un/CZFCONztdFiVHNlJ
   CB1ifShFlI6MXOThRpJiYkxKrLIoAXNKT5gicQXvTr5hSGimjXYp5GUfC
   0lzHc3tpAvZ/2c+jUtfESKRTdAxglF0rTrylmLhDNVF/2n/B5GYZj8DKU
   ji4hxJao4QfxkbA7nEE+5nYb3ISkztGtdakuwvlQetDmlE4WLiuJ6h/mw
   HkHpVr4r3IWZJsf3ziEb2xgeGem6sljOi2q1iOQ6afkvGdEjdASACM9AM
   w==;
X-CSE-ConnectionGUID: jv6C+F+yQmqfiwmKgrINVw==
X-CSE-MsgGUID: 1Jg4B2TpT1Cx11ZfCvLOwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11550"; a="59864327"
X-IronPort-AV: E=Sophos;i="6.18,259,1751266800"; 
   d="scan'208";a="59864327"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2025 00:49:32 -0700
X-CSE-ConnectionGUID: sSTERbPiSVuPVLO9NT6gVA==
X-CSE-MsgGUID: 4DwTn5BLSq23scey+fVy9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,259,1751266800"; 
   d="scan'208";a="173452809"
Received: from lkp-server02.sh.intel.com (HELO eb5fdfb2a9b7) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 12 Sep 2025 00:49:31 -0700
Received: from kbuild by eb5fdfb2a9b7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uwyXA-0000ua-1n;
	Fri, 12 Sep 2025 07:49:28 +0000
Date: Fri, 12 Sep 2025 15:49:13 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 66/66] kernel/sched/sched.h:2575:9:
 warning: conversion from 'long unsigned int' to 'unsigned int' changes value
 from '17580779487' to '400910303'
Message-ID: <202509121509.Eh330lqW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   b5892828e17dc790129accddd7b4c537452cd391
commit: d293a754cf1338f5f03897c4b2322ee6accfe3c0 [66/66] anolis: sched: increase the maximum number of supported sched features
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20250912/202509121509.Eh330lqW-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250912/202509121509.Eh330lqW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509121509.Eh330lqW-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/sched/core.c:87:
>> kernel/sched/sched.h:2575:9: warning: conversion from 'long unsigned int' to 'unsigned int' changes value from '17580779487' to '400910303' [-Woverflow]
    2575 |         (1UL << __SCHED_FEAT_##name) * enabled |
         |         ^
   kernel/sched/features.h:7:1: note: in expansion of macro 'SCHED_FEAT'
       7 | SCHED_FEAT(PLACE_LAG, true)
         | ^~~~~~~~~~
--
   In file included from kernel/sched/fair.c:56:
>> kernel/sched/sched.h:2575:9: warning: conversion from 'long unsigned int' to 'unsigned int' changes value from '17580779487' to '400910303' [-Woverflow]
    2575 |         (1UL << __SCHED_FEAT_##name) * enabled |
         |         ^
   kernel/sched/features.h:7:1: note: in expansion of macro 'SCHED_FEAT'
       7 | SCHED_FEAT(PLACE_LAG, true)
         | ^~~~~~~~~~
   kernel/sched/fair.c:4264:6: warning: no previous prototype for 'set_group_prefer_node' [-Wmissing-prototypes]
    4264 | void set_group_prefer_node(struct task_group *tg)
         |      ^~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c: In function 'set_group_prefer_node':
   kernel/sched/fair.c:4293:33: error: implicit declaration of function 'cpu_load'; did you mean 'cpu_of'? [-Wimplicit-function-declaration]
    4293 |                         load += cpu_load(cpu_rq(cpu));
         |                                 ^~~~~~~~
         |                                 cpu_of
   kernel/sched/fair.c: At top level:
   kernel/sched/fair.c:7451:22: error: conflicting types for 'cpu_load'; have 'long unsigned int(struct rq *)'
    7451 | static unsigned long cpu_load(struct rq *rq)
         |                      ^~~~~~~~
   kernel/sched/fair.c:4293:33: note: previous implicit declaration of 'cpu_load' with type 'int()'
    4293 |                         load += cpu_load(cpu_rq(cpu));
         |                                 ^~~~~~~~
   kernel/sched/fair.c:9186:6: warning: no previous prototype for 'id_can_stop_tick' [-Wmissing-prototypes]
    9186 | bool id_can_stop_tick(struct rq *rq)
         |      ^~~~~~~~~~~~~~~~
--
   In file included from kernel/sched/build_utility.c:53:
>> kernel/sched/sched.h:2575:9: warning: conversion from 'long unsigned int' to 'unsigned int' changes value from '17580779487' to '400910303' [-Woverflow]
    2575 |         (1UL << __SCHED_FEAT_##name) * enabled |
         |         ^
   kernel/sched/features.h:7:1: note: in expansion of macro 'SCHED_FEAT'
       7 | SCHED_FEAT(PLACE_LAG, true)
         | ^~~~~~~~~~
   In file included from kernel/sched/build_utility.c:105:
   kernel/sched/isolation.c:324:6: warning: no previous prototype for 'update_wilds_cpumask' [-Wmissing-prototypes]
     324 | void update_wilds_cpumask(cpumask_var_t new_allowed, cpumask_var_t old_allowed)
         |      ^~~~~~~~~~~~~~~~~~~~


vim +2575 kernel/sched/sched.h

765cc3a4b224e2 Patrick Bellasi 2017-11-08  2568  
765cc3a4b224e2 Patrick Bellasi 2017-11-08  2569  /*
765cc3a4b224e2 Patrick Bellasi 2017-11-08  2570   * Each translation unit has its own copy of sysctl_sched_features to allow
765cc3a4b224e2 Patrick Bellasi 2017-11-08  2571   * constants propagation at compile time and compiler optimization based on
765cc3a4b224e2 Patrick Bellasi 2017-11-08  2572   * features default.
765cc3a4b224e2 Patrick Bellasi 2017-11-08  2573   */
765cc3a4b224e2 Patrick Bellasi 2017-11-08  2574  #define SCHED_FEAT(name, enabled)	\
765cc3a4b224e2 Patrick Bellasi 2017-11-08 @2575  	(1UL << __SCHED_FEAT_##name) * enabled |
765cc3a4b224e2 Patrick Bellasi 2017-11-08  2576  static const_debug __maybe_unused unsigned int sysctl_sched_features =
765cc3a4b224e2 Patrick Bellasi 2017-11-08  2577  #include "features.h"
765cc3a4b224e2 Patrick Bellasi 2017-11-08  2578  	0;
765cc3a4b224e2 Patrick Bellasi 2017-11-08  2579  #undef SCHED_FEAT
765cc3a4b224e2 Patrick Bellasi 2017-11-08  2580  

:::::: The code at line 2575 was first introduced by commit
:::::: 765cc3a4b224e22bf524fabe40284a524f37cdd0 sched/core: Optimize sched_feat() for !CONFIG_SCHED_DEBUG builds

:::::: TO: Patrick Bellasi <patrick.bellasi@arm.com>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

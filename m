Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80D991F0995
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Sep 2025 20:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756930494; cv=none; b=mex/v06TEdlU63NHwoRJIMeVc+iJfgVKkfaFtAAqNKnb3o0tc44my5W50BkhUU2HIVX00dRZXiFv4iDSHf7zJSHvlivFIxr0U3ePwxGUR14UIskD3bLVKQJXy8pUfBsEK8aXx4op/HkygUYvMUsq8D4C6oOEa8LwKcxfiVv15a8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756930494; c=relaxed/simple;
	bh=NmuBfM5LmeVF0aHh+7ic8Ih2jlRUXgBwWZzRQVCkhKA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jJAj5AulEpxU5bTu8NKGgKgYTJedc9P3slumb+UyMIB+uI3oP1l3SXs/d1XqIkrDQfq6G8EjK8GPvLErG+gOjKGI4HTy1ov5XDUNYxYDeiYnWOeOHTBhorqKmzqWD8mrvfN+/VqsgGviCNFFmc4T2GXOrKUGCPY343/kkexOMz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FxGbYgg6; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FxGbYgg6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756930493; x=1788466493;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NmuBfM5LmeVF0aHh+7ic8Ih2jlRUXgBwWZzRQVCkhKA=;
  b=FxGbYgg6thwfnOqqJe5+9cHUYV3eD8DYkbc4PBNV1Qh8+MeHDHU3Kb47
   zDfE/6Cnd8wa6eMXJZxFmqWxWaZSUnKm9rUN+I8wyN/grE9TS2AQV0G77
   7i2PJf+DWBtzJTwo696JvZZbk1Zrtdvi6CMeQaVbXDwmO4U4DJQafA2ak
   S1wWksQkEtdY2DnZQ4d9XJ6VEA1a4wEr/zWmhRiRwrjT0dfe91sgnFgtd
   OzoqbLjh44XxefF/BdTeK+rFOw+pZNPHYNhM8fGOaS0gWcxKtTfdvPXvY
   S0dGI/Zq9c0Lv9/bYjxZXH44p49xMfYcmfaqj06t7HBWMUU4olH8Iigho
   g==;
X-CSE-ConnectionGUID: 3H5SHTJSRgWVyJTl2uVBEQ==
X-CSE-MsgGUID: akdXubH3QhSan4FuTEyMzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11542"; a="59325881"
X-IronPort-AV: E=Sophos;i="6.18,236,1751266800"; 
   d="scan'208";a="59325881"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 13:14:52 -0700
X-CSE-ConnectionGUID: OCZnKYd+SfyHLE2M1lWhVw==
X-CSE-MsgGUID: Wak1Mt9IRumkxJAkSq0Kxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,236,1751266800"; 
   d="scan'208";a="172135109"
Received: from igk-lkp-server01.igk.intel.com (HELO ca260db0ef79) ([10.91.175.65])
  by fmviesa009.fm.intel.com with ESMTP; 03 Sep 2025 13:14:47 -0700
Received: from kbuild by ca260db0ef79 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uttsQ-0003br-0p;
	Wed, 03 Sep 2025 20:14:42 +0000
Date: Wed, 3 Sep 2025 22:13:57 +0200
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 1/1] kernel/sched/fair.c:1679:22:
 warning: no previous prototype for function '__pick_first_entity'
Message-ID: <202509032217.naO9EALS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   119e72f374248c57f950f0658c1e1099b40e2ffa
commit: 9372f9beab4213be5b70136fe15a6cdc3b034be3 [1/1] ck: sched: introduce group identity 'smt expeller'
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250903/202509032217.naO9EALS-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project d26ea02060b1c9db751d188b2edb0059a9eb273d)
rustc: rustc 1.58.0 (02072b482 2022-01-11)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250903/202509032217.naO9EALS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509032217.naO9EALS-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/sched/fair.c:1679:22: warning: no previous prototype for function '__pick_first_entity' [-Wmissing-prototypes]
    1679 | struct sched_entity *__pick_first_entity(struct cfs_rq *cfs_rq)
         |                      ^
   kernel/sched/fair.c:1679:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1679 | struct sched_entity *__pick_first_entity(struct cfs_rq *cfs_rq)
         | ^
         | static 
   kernel/sched/fair.c:8052:7: warning: variable 'min_vruntime' set but not used [-Wunused-but-set-variable]
    8052 |                 u64 min_vruntime;
         |                     ^
   kernel/sched/fair.c:794:20: warning: unused function 'is_underclass_task' [-Wunused-function]
     794 | static inline bool is_underclass_task(struct task_struct *p)
         |                    ^~~~~~~~~~~~~~~~~~
   3 warnings generated.


vim +/__pick_first_entity +1679 kernel/sched/fair.c

9372f9beab4213 kernel/sched/fair.c Michael Wang   2020-08-05  1678  
029632fbb7b7c9 kernel/sched_fair.c Peter Zijlstra 2011-10-25 @1679  struct sched_entity *__pick_first_entity(struct cfs_rq *cfs_rq)
bf0f6f24a1ece8 kernel/sched_fair.c Ingo Molnar    2007-07-09  1680  {
b37e67a6c64803 kernel/sched/fair.c Michael Wang   2020-08-04  1681  	struct rb_node *left = id_rb_first_cached(cfs_rq);
f4b6755fb37595 kernel/sched_fair.c Peter Zijlstra 2008-11-04  1682  
f4b6755fb37595 kernel/sched_fair.c Peter Zijlstra 2008-11-04  1683  	if (!left)
f4b6755fb37595 kernel/sched_fair.c Peter Zijlstra 2008-11-04  1684  		return NULL;
f4b6755fb37595 kernel/sched_fair.c Peter Zijlstra 2008-11-04  1685  
1e922847e9c480 kernel/sched/fair.c Peter Zijlstra 2021-05-31  1686  	return __node_2_se(left);
bf0f6f24a1ece8 kernel/sched_fair.c Ingo Molnar    2007-07-09  1687  }
bf0f6f24a1ece8 kernel/sched_fair.c Ingo Molnar    2007-07-09  1688  

:::::: The code at line 1679 was first introduced by commit
:::::: 029632fbb7b7c9d85063cc9eb470de6c54873df3 sched: Make separate sched*.c translation units

:::::: TO: Peter Zijlstra <a.p.zijlstra@chello.nl>
:::::: CC: Ingo Molnar <mingo@elte.hu>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

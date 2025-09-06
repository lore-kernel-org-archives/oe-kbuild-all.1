Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A08F62D5406
	for <oe-kbuild-all@lists.linux.dev>; Sat,  6 Sep 2025 22:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757196634; cv=none; b=XxBr1m6Gexg2UH61Jxe8v6jO6mxQj3Oehsq9V0MZG+Y1Qm+IA5UFhHPpp7S6es35ksFb+n99LUKFIXqztFjQu2hKZ5tjP7eizkmRpFR8ipz8FtJw3OdSPkhbGaYrVagBdODB6cSvAj87SN6Gj14enoYF/tLLEXPkwY7SzLsZdR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757196634; c=relaxed/simple;
	bh=AU6qsMPsZ9dAh13rOIBOUl/mIch472a7UYJ7uW77cS0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=d4UywZjoygZ40UmlQYQV0jeO21VcHJ7Njg1sxm5XqmGar6WS+SlFQNdv8iM5zU2UXNeiYiMSwTW8l3TbFnXQJ27Cb4ZpR7veRim8wqcN5HeuoYP6qISKh4NEapWFvgBcaVP2cyd9bzIe9ox9G66vpRUdfk7GiK0a5iDJ5zK87lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NEp2levq; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NEp2levq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757196632; x=1788732632;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AU6qsMPsZ9dAh13rOIBOUl/mIch472a7UYJ7uW77cS0=;
  b=NEp2levqI41lXTJgWJPipS7hYNPvaa70IPGCuKcUPRXqPC8jGjMFSCl/
   aG/wuQoltxRWgm+cpAu0wSD7bue3WjcvQrooihZ0Drnyz9+e10Q8k1k7F
   f4q6Ijb+l1KlIKErTgn4WoCmWvw7pV9PU6fjsV4t+uS2YUthR+T1TrCEE
   mw1gtF6KZLICGKL8IqMYUTJy8GRY9ryW3iabfczDciAlZMktVY+Nf6hSK
   rV+4UHlcdnBEJipkQsaolNth2DR165AW8ab2Bq1LIuDsNO1m12oY2u+FY
   s4Sc2nzc7vEi4yXsjXeMkjdIdDCD7/lF8iZlB3hTniV8mEDzKq3le0YIK
   A==;
X-CSE-ConnectionGUID: V68H4a/ZSU66lq2FBd5NKg==
X-CSE-MsgGUID: EJraObl6RHi41p+JREuVIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="59430789"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="59430789"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2025 15:10:32 -0700
X-CSE-ConnectionGUID: UQn4Gc93QPuHM7pUvQuv7A==
X-CSE-MsgGUID: OytK6ZQGSh23jT3A6O7/gA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,245,1751266800"; 
   d="scan'208";a="196108069"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 06 Sep 2025 15:10:31 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uv176-0001pL-37;
	Sat, 06 Sep 2025 22:10:28 +0000
Date: Sun, 7 Sep 2025 06:09:43 +0800
From: kernel test robot <lkp@intel.com>
To: Gabriele Monaco <gmonaco@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [glemco:staging_rv_hybrid_automata 14/20]
 include/rv/ha_monitor.h:345:16: sparse: sparse: incompatible types in
 comparison expression (different type sizes):
Message-ID: <202509070644.lhEgApct-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.com/glemco/linux staging_rv_hybrid_automata
head:   d0a99d11f00051b8cee88d40d9a29a4a315d0d09
commit: f862e3145d2e90d7575202c1ce9d7e269afec204 [14/20] rv: Add sample hybrid monitors stall
config: arm64-randconfig-r121-20250907 (https://download.01.org/0day-ci/archive/20250907/202509070644.lhEgApct-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce: (https://download.01.org/0day-ci/archive/20250907/202509070644.lhEgApct-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509070644.lhEgApct-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/trace/rv/monitors/stall/stall.c: note: in included file:
>> include/rv/ha_monitor.h:345:16: sparse: sparse: incompatible types in comparison expression (different type sizes):
   include/rv/ha_monitor.h:345:16: sparse:    unsigned long *
   include/rv/ha_monitor.h:345:16: sparse:    unsigned long long *

vim +345 include/rv/ha_monitor.h

119cf0b7b4fcf8 Gabriele Monaco 2025-05-13  326  
119cf0b7b4fcf8 Gabriele Monaco 2025-05-13  327  /*
119cf0b7b4fcf8 Gabriele Monaco 2025-05-13  328   * Helper functions for env variables describing clocks with jiffy granularity
119cf0b7b4fcf8 Gabriele Monaco 2025-05-13  329   */
119cf0b7b4fcf8 Gabriele Monaco 2025-05-13  330  static inline u64 ha_get_clk_jiffy(struct ha_monitor *ha_mon, enum envs env)
119cf0b7b4fcf8 Gabriele Monaco 2025-05-13  331  {
119cf0b7b4fcf8 Gabriele Monaco 2025-05-13  332  	return jiffies - READ_ONCE(ha_mon->env_store[env]);
119cf0b7b4fcf8 Gabriele Monaco 2025-05-13  333  }
119cf0b7b4fcf8 Gabriele Monaco 2025-05-13  334  static inline void ha_reset_clk_jiffy(struct ha_monitor *ha_mon, enum envs env)
119cf0b7b4fcf8 Gabriele Monaco 2025-05-13  335  {
119cf0b7b4fcf8 Gabriele Monaco 2025-05-13  336  	WRITE_ONCE(ha_mon->env_store[env], jiffies);
119cf0b7b4fcf8 Gabriele Monaco 2025-05-13  337  }
119cf0b7b4fcf8 Gabriele Monaco 2025-05-13  338  static inline void ha_set_invariant_jiffy(struct ha_monitor *ha_mon,
119cf0b7b4fcf8 Gabriele Monaco 2025-05-13  339  					  enum envs env, u64 value)
119cf0b7b4fcf8 Gabriele Monaco 2025-05-13  340  {
119cf0b7b4fcf8 Gabriele Monaco 2025-05-13  341  	WRITE_ONCE(ha_mon->env_store[env], jiffies + value);
119cf0b7b4fcf8 Gabriele Monaco 2025-05-13  342  }
119cf0b7b4fcf8 Gabriele Monaco 2025-05-13  343  static inline bool ha_check_invariant_jiffy(struct ha_monitor *ha_mon, enum envs env)
119cf0b7b4fcf8 Gabriele Monaco 2025-05-13  344  {
119cf0b7b4fcf8 Gabriele Monaco 2025-05-13 @345  	return time_after(READ_ONCE(ha_mon->env_store[env]), jiffies);
119cf0b7b4fcf8 Gabriele Monaco 2025-05-13  346  

:::::: The code at line 345 was first introduced by commit
:::::: 119cf0b7b4fcf8d8a1248d7d9620b9e292559008 rv: Add Hybrid Automata monitor type

:::::: TO: Gabriele Monaco <gmonaco@redhat.com>
:::::: CC: Gabriele Monaco <gmonaco@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

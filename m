Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CFEF2D879E
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 May 2026 10:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778151322; cv=none; b=Di3srWuGGgjEZgsZfFlblxFSomIXEXa3RPwg8Df7ZTdZihp/tOg4waZhBx1auS83D11Bo4HqSU5Nd0K++FnU5c8fxyDrvLb1c5T/quzefLEx3IoVP6U5XpnQyWRak8LLA7DUc5gFXtHb27ScX3OaLvrBxsXx0hu7Tc4Oydaf98Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778151322; c=relaxed/simple;
	bh=rcW5piGPfnnRZWIe1CCa0jYI8j7c5xp47tMw8XvbHIM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XvVoK0KjY4k+5z7Li6VpcbERssa1iPu9o/dYh0fr4aD6hWlfebOA6CYAaviJr1mcq/VgTOg65LuigawjU5iY2JbvS53W1rx/c08p33m6s9LVsg8RdlpWJZgvnwHA5FMMVLLCI+CeRLq9FZyi/ElJZEl94uUwrkmCTNXDWrESq5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Iy4PRWUT; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Iy4PRWUT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778151317; x=1809687317;
  h=date:from:to:cc:subject:message-id;
  bh=rcW5piGPfnnRZWIe1CCa0jYI8j7c5xp47tMw8XvbHIM=;
  b=Iy4PRWUTx4N0Tx5E2O/lsjpwuBsqJ/2gS6GRyK6pJFRCDknxsYjAl0FS
   rw3Bn+hRVI7WYSBAU7AgmF1F6JWpOX7/w/GYMpfsN7i/ISy88y6Xf7ZpH
   QTHEY03S0NE7Oav80/UTRtudF2qsVPcPvAdFcou6Ia0N1n7zBud/T2qWr
   Et7u9cX8Q8EKXeZGfb9/GWgy/g4pb+qgy61eiCLzq+nTp5HH3MytJ/CTW
   +l2aZtUYuUWmMRdi7c4JmPrQ2kGIypcIhQz7Z0WMJ61brv1db27LR7uVv
   VaSBlTlqWHbR6E59vdBo6p2n9/johdBy1Ns8bJ4XPQrncLphj1c2jIsDw
   A==;
X-CSE-ConnectionGUID: XIoMa8KpRPagPaUbgB13/Q==
X-CSE-MsgGUID: Szbte5OKR3aZR2k2Ho6Bow==
X-IronPort-AV: E=McAfee;i="6800,10657,11778"; a="90199799"
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; 
   d="scan'208";a="90199799"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2026 03:55:10 -0700
X-CSE-ConnectionGUID: JSy1wbI/SIGQsFusBdoSnQ==
X-CSE-MsgGUID: Dt+0dmBaSFm6fEFooo95Lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; 
   d="scan'208";a="233766835"
Received: from lkp-server01.sh.intel.com (HELO 8365ac1094ea) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 07 May 2026 03:55:08 -0700
Received: from kbuild by 8365ac1094ea with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wKwNm-000000000Bx-0lFx;
	Thu, 07 May 2026 10:55:06 +0000
Date: Thu, 07 May 2026 18:54:35 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 20/20]
 kernel/sched/sched.h:1842:54: warning: 'struct cgroup_taskset' declared
 inside parameter list will not be visible outside of this definition or
 declaration
Message-ID: <202605071812.SwSkld7e-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Cruz,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   7869ad90f786f903dadc68707ecf94fd3e89b98c
commit: 54118d6b739756063c9deb7c27113cf731cf6c2e [20/20] anolis: sched: introduce SMT expeller and SMT expellee
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20260507/202605071812.SwSkld7e-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260507/202605071812.SwSkld7e-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605071812.SwSkld7e-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/sched/core.c:87:
>> kernel/sched/sched.h:1842:54: warning: 'struct cgroup_taskset' declared inside parameter list will not be visible outside of this definition or declaration
    1842 | static inline void sched_core_identity_attach(struct cgroup_taskset *tset) { }
         |                                                      ^~~~~~~~~~~~~~


vim +1842 kernel/sched/sched.h

  1835	
  1836	static inline bool sched_group_cookie_match(struct rq *rq,
  1837						    struct task_struct *p,
  1838						    struct sched_group *group)
  1839	{
  1840		return true;
  1841	}
> 1842	static inline void sched_core_identity_attach(struct cgroup_taskset *tset) { }
  1843	#endif /* CONFIG_SCHED_CORE */
  1844	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66D0515853B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 15 Oct 2024 01:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728956182; cv=none; b=ntUPoKYTQam86PpVoljhUgGOIeLQfy+PFc+G1r54+E6Gyp0YNjltLDDQDl6rvUKxWD3C3451DAJjB9vSCBRrjBoVI1fPhYKW7NqrBKwssSkAUSXi7xioElXnvQIj/tOH+UKGe11YojdxispyxiF70DgLP4290E6mmsrG3MhoMbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728956182; c=relaxed/simple;
	bh=S1zjPgDl3bivG03Ac107mHABYgj8Zua8f912DuTVLTg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UqxxZD6TjFb6MC9Sxek4+2Deau1MOwC1D9g8q3j/YsLAEI7a/Ce/Q5Sdkd/632sDEVCLfTbg8ZYbHRqHNMs3pG1TPcF7KSnuvqn8y6vhA/pmtXWOM6NTATAzNWCKhUF0kKyCdahZxCA/vMfuHQOJSocejAAJmCaL2zvmY+75ZoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PDQiBvKn; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PDQiBvKn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728956181; x=1760492181;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=S1zjPgDl3bivG03Ac107mHABYgj8Zua8f912DuTVLTg=;
  b=PDQiBvKnh7W2o31CxNHMmILHF9smrdMSTa1oMVC6uK5+jBtYTR3gDrZL
   3/yAMi4xSum8i4eyISE5CueVZ9xALUs3eSaalLe4fZB9aq2K5xzzFGeqt
   okEHFUZmQ7xARfdA3y08s/IGFCgvVWPbgvMts1etOw/i9RnIuGj4/a/0k
   lKf+SWni52sIJRCXLTjaCS1swtjq7fGFLMbGFrovHKwSSierN61vVOyWy
   gvJ7sTUAY0EruudJb0velIdsm/Ini4ZWH2Yy20zhV7WKF0HRUbZg59TdW
   UNN4oODxJeAKQqdUGCkOXTr+E1uhdWyxlwv3FdIoCdf4iYpzS9mXDnCRa
   A==;
X-CSE-ConnectionGUID: IgTeFy6jTLesQO7ldfzkmQ==
X-CSE-MsgGUID: B7HdepLcQ5aTqJuIBzxSzg==
X-IronPort-AV: E=McAfee;i="6700,10204,11225"; a="38961847"
X-IronPort-AV: E=Sophos;i="6.11,204,1725346800"; 
   d="scan'208";a="38961847"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2024 18:36:20 -0700
X-CSE-ConnectionGUID: un0nDIEeSrS8QTPaYnhCQQ==
X-CSE-MsgGUID: 74tpxjSTR2uVUr/5470jGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,204,1725346800"; 
   d="scan'208";a="77604845"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 14 Oct 2024 18:36:19 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t0WTw-000HRY-1s;
	Tue, 15 Oct 2024 01:36:16 +0000
Date: Tue, 15 Oct 2024 09:35:54 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Aubrey Li <aubrey.li@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 22909/30000] kernel/sched/topology.c:1749:9:
 error: implicit declaration of function 'register_sysctl_init'; did you mean
 'register_sysctl'?
Message-ID: <202410150906.0KpoaIkq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   5f264976b651040f3fac9a10fca21c542662709b
commit: f4128ae8e6ff03b4c805707fe75d0345797f7f53 [22909/30000] sched: Add cluster scheduler level for x86
config: x86_64-buildonly-randconfig-002-20241013 (https://download.01.org/0day-ci/archive/20241015/202410150906.0KpoaIkq-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241015/202410150906.0KpoaIkq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410150906.0KpoaIkq-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/sched/topology.c: In function 'sched_cluster_sysctl_init':
>> kernel/sched/topology.c:1749:9: error: implicit declaration of function 'register_sysctl_init'; did you mean 'register_sysctl'? [-Werror=implicit-function-declaration]
    1749 |         register_sysctl_init("kernel", sched_cluster_sysctls);
         |         ^~~~~~~~~~~~~~~~~~~~
         |         register_sysctl
   cc1: some warnings being treated as errors


vim +1749 kernel/sched/topology.c

8ce3e706b31409 Tim Chen 2021-12-03  1746  
8ce3e706b31409 Tim Chen 2021-12-03  1747  static int __init sched_cluster_sysctl_init(void)
8ce3e706b31409 Tim Chen 2021-12-03  1748  {
8ce3e706b31409 Tim Chen 2021-12-03 @1749  	register_sysctl_init("kernel", sched_cluster_sysctls);
8ce3e706b31409 Tim Chen 2021-12-03  1750  	return 0;
8ce3e706b31409 Tim Chen 2021-12-03  1751  }
8ce3e706b31409 Tim Chen 2021-12-03  1752  late_initcall(sched_cluster_sysctl_init);
9e68cc2bf535a2 Tim Chen 2021-12-03  1753  

:::::: The code at line 1749 was first introduced by commit
:::::: 8ce3e706b31409147f035c037055caa68e450ce5 scheduler: Add runtime knob sysctl_sched_cluster

:::::: TO: Tim Chen <tim.c.chen@linux.intel.com>
:::::: CC: Jie Liu <liujie375@h-partners.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

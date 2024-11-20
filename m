Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 636AC1AB6FD
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 Nov 2024 17:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732123161; cv=none; b=N5QjWwFvA4w7n3xCREd95lZT6egZZG6qSEWdPYxPHl0b7boXkCMTzxMCqzXpUe39qFfKb2LDlVIogD85AK0oGmpCWmS2JwxPAdJjKtSUypk8hake6tpQJp9p4wxwleq7ctV7FEK1RAQge4OHHyXkx5RcRuPRZy68swi5Num2wgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732123161; c=relaxed/simple;
	bh=mlOUdY6+JgBm7VW8qg6jTnG6GEK8F7eqFsgmzUwc+bQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=N5wLtwJRy/hAMcuLABDSrwUPsGP8fhIYDHIgA0D1MFCKovViDXIIviHE+DuBPsd2TU8GNt6dKTACu41hBxbEDj3GwMbF/NODNz8CsNW1lII0PbRMWd8GBV9dz1gWag5XwaBQeqHst2PeXdo981+0FlHnRW1UIORiKnu0smDcVSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jVmEFh3/; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jVmEFh3/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732123158; x=1763659158;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mlOUdY6+JgBm7VW8qg6jTnG6GEK8F7eqFsgmzUwc+bQ=;
  b=jVmEFh3/XkP2ZMM3Bz+VF5555LEk6ZoCRl/YFriSiXO5jXg+UVoWfFuB
   sTF4k7qGobgHElPwAW2pFeO7nkk8M1884x0LgC3xLw2ws/Eq1AY0h3t5q
   hKf2l6xkzoCtf9ijsXN7O3rb/R6XEVo/Sz21I1qY/HjsFkvlPRUYBJFTL
   A8k7aM0AJveLSd5JNiizAGlbqeNy4acQrpisr393eedfzb8wr9/rhfbhs
   4T76OhFF8JJA8kKkHCNvOGEbPPXEj5i+STN59TA1E1iW91FZ29NqtXhd1
   2wGNqioOKv4Lz8MjjOagY7xkQ4AFIqLs77t4/u5pCygVFiq28l5BWERwt
   Q==;
X-CSE-ConnectionGUID: hyt0BxcpTjejOyaoMGEI0w==
X-CSE-MsgGUID: 0mWRn6cgQz+CDQhc3o/9KQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11262"; a="42836327"
X-IronPort-AV: E=Sophos;i="6.12,170,1728975600"; 
   d="scan'208";a="42836327"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2024 09:19:18 -0800
X-CSE-ConnectionGUID: 6SBtqlrQSDOHR7jOUm9jFw==
X-CSE-MsgGUID: dJFtUUKwSN+hdIdP7tp6Jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,170,1728975600"; 
   d="scan'208";a="90364814"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 20 Nov 2024 09:19:17 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tDoME-00013J-2M;
	Wed, 20 Nov 2024 17:19:14 +0000
Date: Thu, 21 Nov 2024 01:18:51 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Jie Liu <liujie375@h-partners.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2461/2461] kernel/sched/topology.c:1618:9:
 error: implicit declaration of function 'register_sysctl_init'; did you mean
 'register_sysctl'?
Message-ID: <202411210134.Bj6P9eSh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Tim,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   bf0212daf6239e1b0e65e6dd7ee9fdec378c5dd4
commit: 8ce3e706b31409147f035c037055caa68e450ce5 [2461/2461] scheduler: Add runtime knob sysctl_sched_cluster
config: arm64-randconfig-001-20241120 (https://download.01.org/0day-ci/archive/20241121/202411210134.Bj6P9eSh-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241121/202411210134.Bj6P9eSh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411210134.Bj6P9eSh-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/topology.c:5:
   kernel/sched/sched.h:2967:22: error: array type has incomplete element type 'struct cftype'
    2967 | extern struct cftype cgroup_v1_psi_files[];
         |                      ^~~~~~~~~~~~~~~~~~~
   kernel/sched/topology.c: In function 'sched_cluster_sysctl_init':
>> kernel/sched/topology.c:1618:9: error: implicit declaration of function 'register_sysctl_init'; did you mean 'register_sysctl'? [-Werror=implicit-function-declaration]
    1618 |         register_sysctl_init("kernel", sched_cluster_sysctls);
         |         ^~~~~~~~~~~~~~~~~~~~
         |         register_sysctl
   cc1: some warnings being treated as errors


vim +1618 kernel/sched/topology.c

  1615	
  1616	static int __init sched_cluster_sysctl_init(void)
  1617	{
> 1618		register_sysctl_init("kernel", sched_cluster_sysctls);
  1619		return 0;
  1620	}
  1621	late_initcall(sched_cluster_sysctl_init);
  1622	#endif
  1623	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

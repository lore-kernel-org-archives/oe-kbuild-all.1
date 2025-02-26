Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B555F25CC6D
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Feb 2025 22:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740608357; cv=none; b=AntCevCDsd6W3PhhwawipEGenPFMQ+WNVzvyWueu8rlRAiff4n5HHNfcMwFRJ5x/7riJJZtG+9FP9Djk453RTTjSN+sexVkmodaZvYUd1DbOJXaELRHLEq3mMA1DtAF39JxRE8/loFYr7GDXhuoaoSgfO8Ej1HZIwP/E6Zl8Jqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740608357; c=relaxed/simple;
	bh=MpSKsO7Wz80UJ2k67q5x+6+O4yXkYiiUwsiakU4YqgU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=je6ZR21tw6szGj/5XYr2a7dOpRP9LuMhBIs5xfd9XPVXouZTwcSHHC9kVwodtPXUbhy00uJqNmcLvqojH/fLFfuuB8bneKHcuW1eADJjTQipbGnT8FlhxYfAuFGGiYiJzofqTOKrPUXmt7TZgifdmPbeHdHngZwCzZLiLgy7/YI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JZ0sE+VK; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JZ0sE+VK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740608356; x=1772144356;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MpSKsO7Wz80UJ2k67q5x+6+O4yXkYiiUwsiakU4YqgU=;
  b=JZ0sE+VKCfxzjQWNtXiGgguDP/yTGtGywNUkxBb0x7tWx8sSwWlCUKp3
   tfcCoZ96QrOC/vyr5OeH0zQdc63oNvoFOWz63JHO/JzH29NSrREjtBMc3
   dSjjIXtwWhgcWeHFO1HrBeSrJzVqVBVgfqHl7TNofEgFgVvAGWkcphYTJ
   nAt7Mp+QR7Gj+OvFDJBjQsWJeKi1P9EShtBzPFpMf86+QRfaaHHclJN88
   GGeXvaZ6CvmLD3fmrhwrRXxmWCPzlCgRmlrzfRevRa2Jhr4lc/RCDJ9vk
   jgqwZatGhSLDx0YMe6Xi3isjB4Bpb057e70ebj8iGDIjEo+jpqd0STj4F
   w==;
X-CSE-ConnectionGUID: pI9KX0SqRvmR0ZAzgWMJcg==
X-CSE-MsgGUID: zvgPYPE5SEu8iFrSjjlAPg==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="41181836"
X-IronPort-AV: E=Sophos;i="6.13,318,1732608000"; 
   d="scan'208";a="41181836"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 14:19:16 -0800
X-CSE-ConnectionGUID: /EVeCsPZR5a08I3f5f/dLg==
X-CSE-MsgGUID: lqFW1vX8STuCVPHcR8OSww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="154016828"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 26 Feb 2025 14:19:14 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tnPkA-000CXa-1b;
	Wed, 26 Feb 2025 22:19:09 +0000
Date: Thu, 27 Feb 2025 06:17:59 +0800
From: kernel test robot <lkp@intel.com>
To: Juri Lelli <juri.lelli@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jlelli:upstream/deadline/domains-suspend 3/4]
 kernel/sched/topology.c:2796: undefined reference to
 `dl_rebuild_rd_accounting'
Message-ID: <202502270602.2gkcu0Y8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jlelli/linux.git upstream/deadline/domains-suspend
head:   78c2e4083eeedc3526f07bedfca514eefbe45e38
commit: 2d96e08126551c9773a9c9854d08c7559c9c90e6 [3/4] sched/deadline: Rebuild root domain accounting after every update
config: i386-buildonly-randconfig-002-20250227 (https://download.01.org/0day-ci/archive/20250227/202502270602.2gkcu0Y8-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250227/202502270602.2gkcu0Y8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502270602.2gkcu0Y8-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: kernel/sched/build_utility.o: in function `partition_sched_domains':
>> kernel/sched/topology.c:2796: undefined reference to `dl_rebuild_rd_accounting'
>> ld: kernel/sched/topology.c:2796: undefined reference to `dl_rebuild_rd_accounting'


vim +2796 kernel/sched/topology.c

  2787	
  2788	/*
  2789	 * Call with hotplug lock held
  2790	 */
  2791	void partition_sched_domains(int ndoms_new, cpumask_var_t doms_new[],
  2792				     struct sched_domain_attr *dattr_new)
  2793	{
  2794		mutex_lock(&sched_domains_mutex);
  2795		partition_sched_domains_locked(ndoms_new, doms_new, dattr_new);
> 2796		dl_rebuild_rd_accounting();

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

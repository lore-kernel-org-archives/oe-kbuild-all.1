Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6571A126C17
	for <oe-kbuild-all@lists.linux.dev>; Wed, 27 May 2026 04:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779856340; cv=none; b=OIxW3eX785XCu9ajZ8h+3iPljkpTwCrCkVow9XRRy7IP/hNg71QH3p2wI+el3zUVr0vJpmZ786m3k6N3ImMPesr1duejFc8l5NGsag+N2RY8VRwB7P+vOK+xL3OQAznlK2egy4XtwJiGHW0Nkb6NJOTItRfhV2w7AM20sLHcy5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779856340; c=relaxed/simple;
	bh=fbe6A5LbVi+V+mwix5z3t4kk9A3ckE8EaUeDuFuRIg4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=EwOhqQ5rryTf7ZPA1SqymKY6UoqczfMIYYC8iqw0cpLR2mof900RqgOfMZN59fIosERwWuOEu4Ay0SNGYJmsbsYXPbrDHW8G3rKCPjPgIZ1s3wqkVghAUmySCNcvMXDgjfk3YhWiirPMMz+AV8749h0rHpW7QatfOsgADIICLx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WthKZqjh; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WthKZqjh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779856338; x=1811392338;
  h=date:from:to:cc:subject:message-id;
  bh=fbe6A5LbVi+V+mwix5z3t4kk9A3ckE8EaUeDuFuRIg4=;
  b=WthKZqjhM9mqFStY2sd5BwaLxFsOB8a1JurgHq4jwVEyZWhTWNPzz+4C
   OntLYkRz8agytDlN4mPmtnLqf/8hlqdznstCOgjB4Fe3Wet7zXG0UXALa
   IYcc2lx9u7LN2wzEL8yte8yPsal+iZdsPwvVL7IHrIORdecRPIG+j6OXM
   9x6eVYYJPsJ+JT2ntseO4SKu8NJcNk0HogQHe13QDw9/NskfVoetWfP3u
   2+hm8CNNSVOdTYxYVIxTUQN0I0PV1AnIWnGl0nSi+8rSq3FJ/Mj85AKi+
   CsTcqj97MqVLAicOrxfi/5GHiwGdskPeknJcczayjTsme/l/iJcGfyPro
   g==;
X-CSE-ConnectionGUID: EnyXfub0S/iIAnMBLswEdw==
X-CSE-MsgGUID: 271e7XAZQ1CFlxXNyfofug==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="91252252"
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; 
   d="scan'208";a="91252252"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2026 21:32:18 -0700
X-CSE-ConnectionGUID: cak8tgbDQqq05qSPC8DTcQ==
X-CSE-MsgGUID: MvAAuVTYTuud1O7tEcsQYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; 
   d="scan'208";a="265725722"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 26 May 2026 21:32:16 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wS5wD-000000003Oo-3u58;
	Wed, 27 May 2026 04:32:13 +0000
Date: Wed, 27 May 2026 12:31:35 +0800
From: kernel test robot <lkp@intel.com>
To: Harry Wentland <harry.wentland@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Alex Deucher <alexander.deucher@amd.com>, Alex Hung <alex.hung@amd.com>
Subject: [linux-next:master 5292/8275]
 drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_topology.c:2357:1: warning: control
 reaches end of non-void function
Message-ID: <202605271203.r58wncYu-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Harry,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   e7e28506af98ce4e1059e5ec59334b335c00a246
commit: af3f2f5db2659a13c256d2fb096c473eb50412ef [5292/8275] drm/amdgpu: Remove UML build exclusion from Kconfig
config: um-allyesconfig (https://download.01.org/0day-ci/archive/20260527/202605271203.r58wncYu-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260527/202605271203.r58wncYu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605271203.r58wncYu-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_topology.c: In function 'kfd_cpumask_to_apic_id':
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_topology.c:2353:16: error: implicit declaration of function 'cpu_data' [-Wimplicit-function-declaration]
    2353 |         return cpu_data(first_cpu_of_numa_node).topo.apicid;
         |                ^~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_topology.c:2353:48: error: request for member 'topo' in something not a structure or union
    2353 |         return cpu_data(first_cpu_of_numa_node).topo.apicid;
         |                                                ^
>> drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_topology.c:2357:1: warning: control reaches end of non-void function [-Wreturn-type]
    2357 | }
         | ^


vim +2357 drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_topology.c

851a645efd0fee7 Felix Kuehling  2017-11-27  2342  
520b8fb755ccfb0 Felix Kuehling  2017-12-08  2343  static int kfd_cpumask_to_apic_id(const struct cpumask *cpumask)
520b8fb755ccfb0 Felix Kuehling  2017-12-08  2344  {
520b8fb755ccfb0 Felix Kuehling  2017-12-08  2345  	int first_cpu_of_numa_node;
520b8fb755ccfb0 Felix Kuehling  2017-12-08  2346  
520b8fb755ccfb0 Felix Kuehling  2017-12-08  2347  	if (!cpumask || cpumask == cpu_none_mask)
520b8fb755ccfb0 Felix Kuehling  2017-12-08  2348  		return -1;
520b8fb755ccfb0 Felix Kuehling  2017-12-08  2349  	first_cpu_of_numa_node = cpumask_first(cpumask);
520b8fb755ccfb0 Felix Kuehling  2017-12-08  2350  	if (first_cpu_of_numa_node >= nr_cpu_ids)
520b8fb755ccfb0 Felix Kuehling  2017-12-08  2351  		return -1;
df1dd4f4a7271eb Felix Kuehling  2019-01-02  2352  #ifdef CONFIG_X86_64
b9655e702dc5d85 Thomas Gleixner 2023-08-14 @2353  	return cpu_data(first_cpu_of_numa_node).topo.apicid;
df1dd4f4a7271eb Felix Kuehling  2019-01-02  2354  #else
df1dd4f4a7271eb Felix Kuehling  2019-01-02  2355  	return first_cpu_of_numa_node;
df1dd4f4a7271eb Felix Kuehling  2019-01-02  2356  #endif
520b8fb755ccfb0 Felix Kuehling  2017-12-08 @2357  }
520b8fb755ccfb0 Felix Kuehling  2017-12-08  2358  

:::::: The code at line 2357 was first introduced by commit
:::::: 520b8fb755ccfb07d8d743da5753cff1fcb74b9f drm/amdkfd: Add topology support for CPUs

:::::: TO: Felix Kuehling <Felix.Kuehling@amd.com>
:::::: CC: Oded Gabbay <oded.gabbay@gmail.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

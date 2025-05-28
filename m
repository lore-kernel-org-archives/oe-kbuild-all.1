Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4625B246778
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 May 2025 13:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748438410; cv=none; b=MwK8SvFbYstZGtP1NWMhiC6Avzao+4Nofgg/VT3PVKS03ovKMSYye0eLVkV3PupKhb28xJ1j+OVhafOaCb5t83Z/yl7K/wKI87KbDsytouytNSL0eopJKbqdaCsBeB5l7boPWEbtBpDYVezD1BVl7N2+gL1N5BpUpnUuxJhullU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748438410; c=relaxed/simple;
	bh=bPH0RsXh8CUY9DVZuQTmwZogDUPDTmCZ6sNYfNoMwTg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gT6VQH3hoScxEC7Ps2cY9RNebYNE+3fqx8z+ZFoTnqp9tGecTDm+z06DyGmQYeJ/30qTIXEFzOtPs12E25a+g0jMDXruSaCdRtKBYB7pbeX6c0LoBbP9MsG6fu/vMaX/U6pSzyslXqd6xm+vX1Qp83bN33/+sm4iszf5tj5eqQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kk4iMafm; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kk4iMafm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748438409; x=1779974409;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bPH0RsXh8CUY9DVZuQTmwZogDUPDTmCZ6sNYfNoMwTg=;
  b=kk4iMafmTbaKnXdYqHjE8vRS3pSCz6kxAdfzL/O3dTVpMKQ/Cw3CSunQ
   1GrSF5kuThF6H5BzwpoRkkpJ2M3HT4bBVk7IN0eCYHRo7TVG32foEG7uc
   4Pe9RbmKU57zGYW4tVgMPcOYSDB18yLqABJ5n+k1gvHQEMuOES99soz0/
   uA7e+P+aN55KzfcO7YtzVZ/Ng7iWZecuLsc15mgIp+DcZXetG9mrAAnoX
   0uTLxS8PFzER/p9udxrkL/hmFmXh+YdENbraeYobmNEme2KZafyqscH1x
   zEOn6UWFJw6gIZyD8LdadjQNCLdhR87jIIkib2slJNoOFy3EAApnNfeRW
   w==;
X-CSE-ConnectionGUID: BYT6r7SLSsejrmC5lLyKWA==
X-CSE-MsgGUID: 5EyQNGEXR/SKOpy+huXk6A==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="61092851"
X-IronPort-AV: E=Sophos;i="6.15,321,1739865600"; 
   d="scan'208";a="61092851"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2025 06:20:08 -0700
X-CSE-ConnectionGUID: pnKs4wRlRiu0kYOJOld5Yw==
X-CSE-MsgGUID: KC2V5fp4TzW8wHm6pZ7e6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,321,1739865600"; 
   d="scan'208";a="143684747"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 28 May 2025 06:20:07 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uKGhR-000Vgk-0P;
	Wed, 28 May 2025 13:20:05 +0000
Date: Wed, 28 May 2025 21:19:57 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Pu Lehui <pulehui@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2325/2325] drivers/base/arch_topology.c:811:2:
 error: implicit declaration of function 'cgroup_ifs_set_smt'
Message-ID: <202505282112.qVJOB1Zd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   cfad96a37ec3a62cb1ea2535fad80e91a1c10ec6
commit: edff31302c6d1f41a3da02c92118b06a203f3248 [2325/2325] interference: Add smt interference track support
config: arm64-randconfig-001-20250528 (https://download.01.org/0day-ci/archive/20250528/202505282112.qVJOB1Zd-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250528/202505282112.qVJOB1Zd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505282112.qVJOB1Zd-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/base/arch_topology.c: In function 'update_siblings_masks':
>> drivers/base/arch_topology.c:811:2: error: implicit declaration of function 'cgroup_ifs_set_smt' [-Werror=implicit-function-declaration]
     811 |  cgroup_ifs_set_smt(&cpuid_topo->thread_sibling);
         |  ^~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for HALTPOLL_CPUIDLE
   Depends on [n]: CPU_IDLE [=n] && ARCH_CPUIDLE_HALTPOLL [=y] && ARCH_HAS_OPTIMIZED_POLL [=y]
   Selected by [y]:
   - ARM64 [=y]


vim +/cgroup_ifs_set_smt +811 drivers/base/arch_topology.c

   771	
   772	void update_siblings_masks(unsigned int cpuid)
   773	{
   774		struct cpu_topology *cpu_topo, *cpuid_topo = &cpu_topology[cpuid];
   775		int cpu, ret;
   776	
   777		ret = detect_cache_attributes(cpuid);
   778		if (ret && ret != -ENOENT)
   779			pr_info("Early cacheinfo allocation failed, ret = %d\n", ret);
   780	
   781		/* update core and thread sibling masks */
   782		for_each_online_cpu(cpu) {
   783			cpu_topo = &cpu_topology[cpu];
   784	
   785			if (last_level_cache_is_shared(cpu, cpuid)) {
   786				cpumask_set_cpu(cpu, &cpuid_topo->llc_sibling);
   787				cpumask_set_cpu(cpuid, &cpu_topo->llc_sibling);
   788			}
   789	
   790			if (cpuid_topo->package_id != cpu_topo->package_id)
   791				continue;
   792	
   793			cpumask_set_cpu(cpuid, &cpu_topo->core_sibling);
   794			cpumask_set_cpu(cpu, &cpuid_topo->core_sibling);
   795	
   796			if (cpuid_topo->cluster_id != cpu_topo->cluster_id)
   797				continue;
   798	
   799			if (cpuid_topo->cluster_id >= 0) {
   800				cpumask_set_cpu(cpu, &cpuid_topo->cluster_sibling);
   801				cpumask_set_cpu(cpuid, &cpu_topo->cluster_sibling);
   802			}
   803	
   804			if (cpuid_topo->core_id != cpu_topo->core_id)
   805				continue;
   806	
   807			cpumask_set_cpu(cpuid, &cpu_topo->thread_sibling);
   808			cpumask_set_cpu(cpu, &cpuid_topo->thread_sibling);
   809		}
   810	
 > 811		cgroup_ifs_set_smt(&cpuid_topo->thread_sibling);
   812	}
   813	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

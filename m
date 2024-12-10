Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CED1B644
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Dec 2024 03:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733801017; cv=none; b=LqmyQ1/I1vr4tdtiuGGWIgOwxKfCIiQgL9txnMoF8L2r4j/ifVC1Aw8KA4UEXtX4+8bb3W8+7IS4dHUSJ0ok/VlSd1CpCr9BdQViek4LlT2h1EIm+SW+vKqe+ooYhFEm2IxM0iOm4pggvn2CqLaVdjI7qf2XJbiLvFoGrmrfdH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733801017; c=relaxed/simple;
	bh=bXDcCcicOUqIS73xD/McSiXFPB0TU/oHGQ+2eeHGH30=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gFkT7gi5159sxBfKtJfvUv8T/KWVYKh3Q2k3A9XwPk1uPpKQ1Q0SyxKxTMlmqponiIdea/fZOoATHfrdMatRjtKDzxJ2Xb5wHd4stc6S/sQgaRU/Im+ttQsBGUlRkG976GjnOk4PrGUzYxmexg5KIb4Z9D5os5X/5s2xtHvkEYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DHT38MVd; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DHT38MVd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733801015; x=1765337015;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bXDcCcicOUqIS73xD/McSiXFPB0TU/oHGQ+2eeHGH30=;
  b=DHT38MVd0VgbHYQNT35Ee61GKLpNqqSJL08z2hqKuJ4qBrydR+7CHxpM
   989B+EUbkOTHXGt9Zs5y2Dno27dHSuEykEhK7aXefBcXy7PYefkr/nlVF
   r0aUbOMehFXL/JwS2Sl5ErtS/UTwvUiwM3FGVlPEqSCQHXmGZOpK/cE0v
   M20MBkE7V39rTvW8eUb+hh7rzkx6HD4R8fZzyRgTwWJ7O7tt4HN7BMvxH
   iO56/VxIz1Jtz0GEdJEyW8YQ4NeOlv/58277h3yB39EVbdoZbMS4G9Gkz
   zlPtS4NTlvbhGPHdejKD7sgE8BuUn4iRLXeLqH3vM4IhJLe6CKObFgkvA
   A==;
X-CSE-ConnectionGUID: gPdtD2o+RsWMsLl3KN/RBA==
X-CSE-MsgGUID: YRHSzKyZTbKhNhUKPng19w==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="36963527"
X-IronPort-AV: E=Sophos;i="6.12,221,1728975600"; 
   d="scan'208";a="36963527"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2024 19:23:34 -0800
X-CSE-ConnectionGUID: SSNrk6PwQp2JAUlDugMckg==
X-CSE-MsgGUID: rPpohbghQRyq9dK12hDF/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,221,1728975600"; 
   d="scan'208";a="95721286"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 09 Dec 2024 19:23:33 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKqqQ-00053h-1J;
	Tue, 10 Dec 2024 03:23:30 +0000
Date: Tue, 10 Dec 2024 11:23:05 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, xiajingze <xiajingze1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1609/1609]
 drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_topology.c:1922:5: warning: stack
 frame size (2200) exceeds limit (2048) in 'kfd_topology_add_device'
Message-ID: <202412101126.LSCSnI7W-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi xiajingze,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   db988390007bce595dba0dfd782c610578e26d2d
commit: 241ad43fe7e9c24d5ba4cdd1ec22e731cdd22d14 [1609/1609] Compiler: Add clang's PGO support for kernel.
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20241210/202412101126.LSCSnI7W-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241210/202412101126.LSCSnI7W-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412101126.LSCSnI7W-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_topology.c:26:
   In file included from include/linux/pci.h:1666:
   In file included from include/linux/dmapool.h:14:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2235:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_topology.c:1922:5: warning: stack frame size (2200) exceeds limit (2048) in 'kfd_topology_add_device' [-Wframe-larger-than]
    1922 | int kfd_topology_add_device(struct kfd_node *gpu)
         |     ^
   6 warnings generated.
--
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/dml/calcs/dcn_calc_auto.c:26:
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/dm_services.h:35:
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/dm_services_types.h:29:
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/os_types.h:31:
   In file included from include/linux/kgdb.h:19:
   In file included from include/linux/kprobes.h:28:
   In file included from include/linux/ftrace.h:13:
   In file included from include/linux/kallsyms.h:13:
   In file included from include/linux/mm.h:2235:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/amd/amdgpu/../display/dc/dml/calcs/dcn_calc_auto.c:121:6: warning: stack frame size (2568) exceeds limit (2048) in 'mode_support_and_system_configuration' [-Wframe-larger-than]
     121 | void mode_support_and_system_configuration(struct dcn_bw_internal_vars *v)
         |      ^
   6 warnings generated.


vim +/kfd_topology_add_device +1922 drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_topology.c

d230f1bfe7a197 Jonathan Kim           2022-03-25  1921  
8dc1db3172ae2f Mukul Joshi            2022-09-14 @1922  int kfd_topology_add_device(struct kfd_node *gpu)
f701acb6a4ed0a Felix Kuehling         2022-11-16  1923  {
f701acb6a4ed0a Felix Kuehling         2022-11-16  1924  	uint32_t gpu_id;
f701acb6a4ed0a Felix Kuehling         2022-11-16  1925  	struct kfd_topology_device *dev;
f701acb6a4ed0a Felix Kuehling         2022-11-16  1926  	struct kfd_cu_info cu_info;
f701acb6a4ed0a Felix Kuehling         2022-11-16  1927  	int res = 0;
f701acb6a4ed0a Felix Kuehling         2022-11-16  1928  	int i;
f701acb6a4ed0a Felix Kuehling         2022-11-16  1929  	const char *asic_name = amdgpu_asic_name[gpu->adev->asic_type];
f701acb6a4ed0a Felix Kuehling         2022-11-16  1930  
f701acb6a4ed0a Felix Kuehling         2022-11-16  1931  	gpu_id = kfd_generate_gpu_id(gpu);
400a39f1ec43d2 James Zhu              2023-08-09  1932  	if (gpu->xcp && !gpu->xcp->ddev) {
400a39f1ec43d2 James Zhu              2023-08-09  1933  		dev_warn(gpu->adev->dev,
400a39f1ec43d2 James Zhu              2023-08-09  1934  		"Won't add GPU (ID: 0x%x) to topology since it has no drm node assigned.",
400a39f1ec43d2 James Zhu              2023-08-09  1935  		gpu_id);
400a39f1ec43d2 James Zhu              2023-08-09  1936  		return 0;
400a39f1ec43d2 James Zhu              2023-08-09  1937  	} else {
f701acb6a4ed0a Felix Kuehling         2022-11-16  1938  		pr_debug("Adding new GPU (ID: 0x%x) to topology\n", gpu_id);
400a39f1ec43d2 James Zhu              2023-08-09  1939  	}
f701acb6a4ed0a Felix Kuehling         2022-11-16  1940  
f701acb6a4ed0a Felix Kuehling         2022-11-16  1941  	/* Check to see if this gpu device exists in the topology_device_list.
f701acb6a4ed0a Felix Kuehling         2022-11-16  1942  	 * If so, assign the gpu to that device,
f701acb6a4ed0a Felix Kuehling         2022-11-16  1943  	 * else create a Virtual CRAT for this gpu device and then parse that
f701acb6a4ed0a Felix Kuehling         2022-11-16  1944  	 * CRAT to create a new topology device. Once created assign the gpu to
f701acb6a4ed0a Felix Kuehling         2022-11-16  1945  	 * that topology device
f701acb6a4ed0a Felix Kuehling         2022-11-16  1946  	 */
f701acb6a4ed0a Felix Kuehling         2022-11-16  1947  	down_write(&topology_lock);
f701acb6a4ed0a Felix Kuehling         2022-11-16  1948  	dev = kfd_assign_gpu(gpu);
f701acb6a4ed0a Felix Kuehling         2022-11-16  1949  	if (!dev)
f701acb6a4ed0a Felix Kuehling         2022-11-16  1950  		res = kfd_topology_add_device_locked(gpu, gpu_id, &dev);
c0cc999f3c32e6 Ma Jun                 2022-11-02  1951  	up_write(&topology_lock);
f701acb6a4ed0a Felix Kuehling         2022-11-16  1952  	if (res)
f701acb6a4ed0a Felix Kuehling         2022-11-16  1953  		return res;
5b5c4e40a37e85 Evgeny Pinchuk         2014-07-16  1954  
5b5c4e40a37e85 Evgeny Pinchuk         2014-07-16  1955  	dev->gpu_id = gpu_id;
5b5c4e40a37e85 Evgeny Pinchuk         2014-07-16  1956  	gpu->id = gpu_id;
3a87177eb14113 Harish Kasiviswanathan 2017-12-08  1957  
0f28cca87e9afc Ramesh Errabolu        2022-05-26  1958  	kfd_dev_create_p2p_links();
0f28cca87e9afc Ramesh Errabolu        2022-05-26  1959  
3a87177eb14113 Harish Kasiviswanathan 2017-12-08  1960  	/* TODO: Move the following lines to function
3a87177eb14113 Harish Kasiviswanathan 2017-12-08  1961  	 *	kfd_add_non_crat_information
3a87177eb14113 Harish Kasiviswanathan 2017-12-08  1962  	 */
3a87177eb14113 Harish Kasiviswanathan 2017-12-08  1963  
3a87177eb14113 Harish Kasiviswanathan 2017-12-08  1964  	/* Fill-in additional information that is not available in CRAT but
3a87177eb14113 Harish Kasiviswanathan 2017-12-08  1965  	 * needed for the topology
3a87177eb14113 Harish Kasiviswanathan 2017-12-08  1966  	 */
3a87177eb14113 Harish Kasiviswanathan 2017-12-08  1967  
574c4183ef7511 Graham Sider           2021-10-19  1968  	amdgpu_amdkfd_get_cu_info(dev->gpu->adev, &cu_info);
c181159a5b1e1e Yong Zhao              2019-08-01  1969  
b7675b7bbc3c4c Graham Sider           2021-11-11  1970  	for (i = 0; i < KFD_TOPOLOGY_PUBLIC_NAME_SIZE-1; i++) {
b7675b7bbc3c4c Graham Sider           2021-11-11  1971  		dev->node_props.name[i] = __tolower(asic_name[i]);
b7675b7bbc3c4c Graham Sider           2021-11-11  1972  		if (asic_name[i] == '\0')
b7675b7bbc3c4c Graham Sider           2021-11-11  1973  			break;
b7675b7bbc3c4c Graham Sider           2021-11-11  1974  	}
b7675b7bbc3c4c Graham Sider           2021-11-11  1975  	dev->node_props.name[i] = '\0';
c181159a5b1e1e Yong Zhao              2019-08-01  1976  
3a87177eb14113 Harish Kasiviswanathan 2017-12-08  1977  	dev->node_props.simd_arrays_per_engine =
3a87177eb14113 Harish Kasiviswanathan 2017-12-08  1978  		cu_info.num_shader_arrays_per_engine;
3a87177eb14113 Harish Kasiviswanathan 2017-12-08  1979  
8dc1db3172ae2f Mukul Joshi            2022-09-14  1980  	dev->node_props.gfx_target_version =
8dc1db3172ae2f Mukul Joshi            2022-09-14  1981  				gpu->kfd->device_info.gfx_target_version;
d69a3b762dc4c9 Mukul Joshi            2022-05-09  1982  	dev->node_props.vendor_id = gpu->adev->pdev->vendor;
d69a3b762dc4c9 Mukul Joshi            2022-05-09  1983  	dev->node_props.device_id = gpu->adev->pdev->device;
c6d1ec4134edc1 Joseph Greathouse      2020-04-16  1984  	dev->node_props.capability |=
02274fc0f67259 Graham Sider           2021-11-05  1985  		((dev->gpu->adev->rev_id << HSA_CAP_ASIC_REVISION_SHIFT) &
c6d1ec4134edc1 Joseph Greathouse      2020-04-16  1986  			HSA_CAP_ASIC_REVISION_MASK);
92085240ef9c0e Jonathan Kim           2022-05-03  1987  
d69a3b762dc4c9 Mukul Joshi            2022-05-09  1988  	dev->node_props.location_id = pci_dev_id(gpu->adev->pdev);
92085240ef9c0e Jonathan Kim           2022-05-03  1989  	if (KFD_GC_VERSION(dev->gpu->kfd) == IP_VERSION(9, 4, 3))
92085240ef9c0e Jonathan Kim           2022-05-03  1990  		dev->node_props.location_id |= dev->gpu->node_id;
92085240ef9c0e Jonathan Kim           2022-05-03  1991  
d69a3b762dc4c9 Mukul Joshi            2022-05-09  1992  	dev->node_props.domain = pci_domain_nr(gpu->adev->pdev->bus);
3a87177eb14113 Harish Kasiviswanathan 2017-12-08  1993  	dev->node_props.max_engine_clk_fcompute =
574c4183ef7511 Graham Sider           2021-10-19  1994  		amdgpu_amdkfd_get_max_engine_clock_in_mhz(dev->gpu->adev);
3a87177eb14113 Harish Kasiviswanathan 2017-12-08  1995  	dev->node_props.max_engine_clk_ccompute =
3a87177eb14113 Harish Kasiviswanathan 2017-12-08  1996  		cpufreq_quick_get_max(0) / 1000;
a476c0c645535c Philip Yang            2023-02-23  1997  
a476c0c645535c Philip Yang            2023-02-23  1998  	if (gpu->xcp)
a476c0c645535c Philip Yang            2023-02-23  1999  		dev->node_props.drm_render_minor = gpu->xcp->ddev->render->index;
a476c0c645535c Philip Yang            2023-02-23  2000  	else
7c9b717196b1af Oak Zeng               2018-03-15  2001  		dev->node_props.drm_render_minor =
8dc1db3172ae2f Mukul Joshi            2022-09-14  2002  				gpu->kfd->shared_resources.drm_render_minor;
3a87177eb14113 Harish Kasiviswanathan 2017-12-08  2003  
8dc1db3172ae2f Mukul Joshi            2022-09-14  2004  	dev->node_props.hive_id = gpu->kfd->hive_id;
ee2f17f4d02b14 Amber Lin              2021-11-18  2005  	dev->node_props.num_sdma_engines = kfd_get_num_sdma_engines(gpu);
14568cf6583e9d Oak Zeng               2019-02-08  2006  	dev->node_props.num_sdma_xgmi_engines =
ee2f17f4d02b14 Amber Lin              2021-11-18  2007  					kfd_get_num_xgmi_sdma_engines(gpu);
bb71c74db3c554 Huang Rui              2019-12-16  2008  	dev->node_props.num_sdma_queues_per_engine =
8dc1db3172ae2f Mukul Joshi            2022-09-14  2009  				gpu->kfd->device_info.num_sdma_queues_per_engine -
8dc1db3172ae2f Mukul Joshi            2022-09-14  2010  				gpu->kfd->device_info.num_reserved_sdma_queues_per_engine;
29633d0e204df1 Joseph Greathouse      2020-01-15  2011  	dev->node_props.num_gws = (dev->gpu->gws &&
29e764621bbcd4 Oak Zeng               2019-05-03  2012  		dev->gpu->dqm->sched_policy != KFD_SCHED_POLICY_NO_HWS) ?
02274fc0f67259 Graham Sider           2021-11-05  2013  		dev->gpu->adev->gds.gws_size : 0;
e6945304187dea Yong Zhao              2020-01-30  2014  	dev->node_props.num_cp_queues = get_cp_queues_num(dev->gpu->dqm);
0c1690e38b5e68 Shaoyun Liu            2018-07-06  2015  
3a87177eb14113 Harish Kasiviswanathan 2017-12-08  2016  	kfd_fill_mem_clk_max_info(dev);
3a87177eb14113 Harish Kasiviswanathan 2017-12-08  2017  	kfd_fill_iolink_non_crat_info(dev);
3a87177eb14113 Harish Kasiviswanathan 2017-12-08  2018  
7eb0502ac0538e Graham Sider           2021-11-10  2019  	switch (dev->gpu->adev->asic_type) {
3a87177eb14113 Harish Kasiviswanathan 2017-12-08  2020  	case CHIP_KAVERI:
3a87177eb14113 Harish Kasiviswanathan 2017-12-08  2021  	case CHIP_HAWAII:
3a87177eb14113 Harish Kasiviswanathan 2017-12-08  2022  	case CHIP_TONGA:
3a87177eb14113 Harish Kasiviswanathan 2017-12-08  2023  		dev->node_props.capability |= ((HSA_CAP_DOORBELL_TYPE_PRE_1_0 <<
3a87177eb14113 Harish Kasiviswanathan 2017-12-08  2024  			HSA_CAP_DOORBELL_TYPE_TOTALBITS_SHIFT) &
3a87177eb14113 Harish Kasiviswanathan 2017-12-08  2025  			HSA_CAP_DOORBELL_TYPE_TOTALBITS_MASK);
3a87177eb14113 Harish Kasiviswanathan 2017-12-08  2026  		break;
3a87177eb14113 Harish Kasiviswanathan 2017-12-08  2027  	case CHIP_CARRIZO:
3a87177eb14113 Harish Kasiviswanathan 2017-12-08  2028  	case CHIP_FIJI:
3a87177eb14113 Harish Kasiviswanathan 2017-12-08  2029  	case CHIP_POLARIS10:
3a87177eb14113 Harish Kasiviswanathan 2017-12-08  2030  	case CHIP_POLARIS11:
846a44d7e918a4 Gang Ba                2018-09-05  2031  	case CHIP_POLARIS12:
ed81cd6e0e9f37 Kent Russell           2019-03-21  2032  	case CHIP_VEGAM:
42aa8793d795f1 Felix Kuehling         2017-12-08  2033  		pr_debug("Adding doorbell packet type capability\n");
3a87177eb14113 Harish Kasiviswanathan 2017-12-08  2034  		dev->node_props.capability |= ((HSA_CAP_DOORBELL_TYPE_1_0 <<
3a87177eb14113 Harish Kasiviswanathan 2017-12-08  2035  			HSA_CAP_DOORBELL_TYPE_TOTALBITS_SHIFT) &
3a87177eb14113 Harish Kasiviswanathan 2017-12-08  2036  			HSA_CAP_DOORBELL_TYPE_TOTALBITS_MASK);
3a87177eb14113 Harish Kasiviswanathan 2017-12-08  2037  		break;
e4804a39ba5f72 Graham Sider           2021-10-28  2038  	default:
d230f1bfe7a197 Jonathan Kim           2022-03-25  2039  		if (KFD_GC_VERSION(dev->gpu) < IP_VERSION(9, 0, 1))
3a87177eb14113 Harish Kasiviswanathan 2017-12-08  2040  			WARN(1, "Unexpected ASIC family %u",
7eb0502ac0538e Graham Sider           2021-11-10  2041  			     dev->gpu->adev->asic_type);
d230f1bfe7a197 Jonathan Kim           2022-03-25  2042  		else
d230f1bfe7a197 Jonathan Kim           2022-03-25  2043  			kfd_topology_set_capabilities(dev);
7639a8c420f04c Ben Goz                2015-06-07  2044  	}
7639a8c420f04c Ben Goz                2015-06-07  2045  
1ae99eab34f90c Oak Zeng               2019-06-10  2046  	/*
1ae99eab34f90c Oak Zeng               2019-06-10  2047  	 * Overwrite ATS capability according to needs_iommu_device to fix
1ae99eab34f90c Oak Zeng               2019-06-10  2048  	 * potential missing corresponding bit in CRAT of BIOS.
1ae99eab34f90c Oak Zeng               2019-06-10  2049  	 */
1ae99eab34f90c Oak Zeng               2019-06-10  2050  	dev->node_props.capability &= ~HSA_CAP_ATS_PRESENT;
1ae99eab34f90c Oak Zeng               2019-06-10  2051  
3a87177eb14113 Harish Kasiviswanathan 2017-12-08  2052  	/* Fix errors in CZ CRAT.
3a87177eb14113 Harish Kasiviswanathan 2017-12-08  2053  	 * simd_count: Carrizo CRAT reports wrong simd_count, probably
3a87177eb14113 Harish Kasiviswanathan 2017-12-08  2054  	 *		because it doesn't consider masked out CUs
70f372bffcc84c Philip Cox             2017-12-08  2055  	 * max_waves_per_simd: Carrizo reports wrong max_waves_per_simd
3a87177eb14113 Harish Kasiviswanathan 2017-12-08  2056  	 */
7eb0502ac0538e Graham Sider           2021-11-10  2057  	if (dev->gpu->adev->asic_type == CHIP_CARRIZO) {
3a87177eb14113 Harish Kasiviswanathan 2017-12-08  2058  		dev->node_props.simd_count =
3a87177eb14113 Harish Kasiviswanathan 2017-12-08  2059  			cu_info.simd_per_cu * cu_info.cu_active_number;
70f372bffcc84c Philip Cox             2017-12-08  2060  		dev->node_props.max_waves_per_simd = 10;
70f372bffcc84c Philip Cox             2017-12-08  2061  	}
3a87177eb14113 Harish Kasiviswanathan 2017-12-08  2062  
5436ab94cd9460 Stanley.Yang           2020-08-17  2063  	/* kfd only concerns sram ecc on GFX and HBM ecc on UMC */
0dee45a25a63f7 Eric Huang             2019-01-11  2064  	dev->node_props.capability |=
56c5977eae8799 Graham Sider           2021-10-19  2065  		((dev->gpu->adev->ras_enabled & BIT(AMDGPU_RAS_BLOCK__GFX)) != 0) ?
0dee45a25a63f7 Eric Huang             2019-01-11  2066  		HSA_CAP_SRAM_EDCSUPPORTED : 0;
56c5977eae8799 Graham Sider           2021-10-19  2067  	dev->node_props.capability |=
56c5977eae8799 Graham Sider           2021-10-19  2068  		((dev->gpu->adev->ras_enabled & BIT(AMDGPU_RAS_BLOCK__UMC)) != 0) ?
0dee45a25a63f7 Eric Huang             2019-01-11  2069  		HSA_CAP_MEM_EDCSUPPORTED : 0;
0dee45a25a63f7 Eric Huang             2019-01-11  2070  
046e674b961594 Graham Sider           2021-11-09  2071  	if (KFD_GC_VERSION(dev->gpu) != IP_VERSION(9, 0, 1))
56c5977eae8799 Graham Sider           2021-10-19  2072  		dev->node_props.capability |= (dev->gpu->adev->ras_enabled != 0) ?
0dee45a25a63f7 Eric Huang             2019-01-11  2073  			HSA_CAP_RASEVENTNOTIFY : 0;
0dee45a25a63f7 Eric Huang             2019-01-11  2074  
610dab118ff501 Philip Yang            2023-03-31  2075  	if (KFD_IS_SVM_API_SUPPORTED(dev->gpu->adev))
4c166eb95decf0 Philip Yang            2020-12-09  2076  		dev->node_props.capability |= HSA_CAP_SVMAPI_SUPPORTED;
4c166eb95decf0 Philip Yang            2020-12-09  2077  
03d400e7605e3d Alex Sierra            2023-06-15  2078  	if (dev->gpu->adev->gmc.is_app_apu ||
03d400e7605e3d Alex Sierra            2023-06-15  2079  		dev->gpu->adev->gmc.xgmi.connected_to_cpu)
03d400e7605e3d Alex Sierra            2023-06-15  2080  		dev->node_props.capability |= HSA_CAP_FLAGS_COHERENTHOSTACCESS;
03d400e7605e3d Alex Sierra            2023-06-15  2081  
3a87177eb14113 Harish Kasiviswanathan 2017-12-08  2082  	kfd_debug_print_topology();
3a87177eb14113 Harish Kasiviswanathan 2017-12-08  2083  
5b5c4e40a37e85 Evgeny Pinchuk         2014-07-16  2084  	kfd_notify_gpu_change(gpu_id, 1);
f701acb6a4ed0a Felix Kuehling         2022-11-16  2085  
7d4f8db4a1448e Dan Carpenter          2022-11-25  2086  	return 0;
5b5c4e40a37e85 Evgeny Pinchuk         2014-07-16  2087  }
5b5c4e40a37e85 Evgeny Pinchuk         2014-07-16  2088  

:::::: The code at line 1922 was first introduced by commit
:::::: 8dc1db3172ae2f17ae71e33b608a33411ce8a1aa drm/amdkfd: Introduce kfd_node struct (v5)

:::::: TO: Mukul Joshi <mukul.joshi@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

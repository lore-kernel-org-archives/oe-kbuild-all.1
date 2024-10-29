Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9629F206076
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Oct 2024 14:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730211730; cv=none; b=ljP0gmxHcuBcI9iKxnSiijjLb9oEIRDuFdi7ZcORwNdxQHBl5oDaWa6cwFJRtu7G0dJcOmIdLKKG08E2KRWEIjwzl5kpR0gAfzMcLxYfO3dHGmOa/dZCYcHaT0r5XjI+4SL115TFOCpP2Vdw9ucXPaduth7OELqjMfG6GpxwXuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730211730; c=relaxed/simple;
	bh=ZvEHviW0DTtLskOH7T8lU3YWg9ODydIfTbTz5FWhpT4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GBTKgZ7H4E5iUfrVcxWh7TRC6r62aGlW5uQ477kgmVIPcyjG+I4SGgDBNU7TUi2Bn7WGDpjn5eUKFGgKbX1Ko+F8aC5XVxF/I0IRuss1dBLy9SJmZ3AnP/wdMp8mvhpJbVz3AJgsJjWxon3b9YcwvEfXMtrmqHXSNrU5flZ+Z94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ok63+BX7; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ok63+BX7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730211729; x=1761747729;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZvEHviW0DTtLskOH7T8lU3YWg9ODydIfTbTz5FWhpT4=;
  b=Ok63+BX7lfJ+TyNzBf54dfAaBQ8NuQlEin9RtMN0W+UjR1NJYv2bMK5N
   0BQ5x1XiiQjrIof2IEnlguuuuFzZsOHPlUKmbz8DAXKlbYzgnJCOub6C+
   EBVZh1ixKwk8+LMhDx9pFL0zTrxqXNO105crIqpI3qP7wkxAdFSrD0ilF
   AEQeB00O9xvXqasz+7QeMWb1nSjhKILvadzyeJC/WksWZNFvZFOzg/ZbY
   CKIi8RMBtMW5an3Sc1plcNOo4h57l7i/nHZvpSPg8d18Xeg6LwYxMT2nr
   GOYb9CQFwsYwDyPV+Srq4i/pIJyd2Egxo8lQBYpV0L5UtMIpSC1gmWFK2
   w==;
X-CSE-ConnectionGUID: 6fcHq6i7Q4KXuSiCqtGFUw==
X-CSE-MsgGUID: cDRHO7GDTjCvb7etLJO39g==
X-IronPort-AV: E=McAfee;i="6700,10204,11240"; a="33651417"
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; 
   d="scan'208";a="33651417"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2024 07:22:08 -0700
X-CSE-ConnectionGUID: YSpH/AWIS1eMWRkVgWwOtA==
X-CSE-MsgGUID: y9AoVrYsTAiIaM9MwnplMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; 
   d="scan'208";a="82787643"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 29 Oct 2024 07:22:05 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t5n6g-000dlJ-1m;
	Tue, 29 Oct 2024 14:22:02 +0000
Date: Tue, 29 Oct 2024 22:21:28 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jingqunli@tencent.com, jason.zeng@intel.com,
	wu.zheng@intel.com, yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 6450/13046]
 arch/x86/events/zhaoxin/uncore.c:323:1: sparse: sparse: symbol
 '__pcpu_scope_zx_package_id' was not declared. Should it be static?
Message-ID: <202410292204.J2knWjKy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   ce9f9d823a41831d622fa11e29c3d620c044f51b
commit: 64ed8094654cceec3ab5411352b161c6093b38e4 [6450/13046] x86/perf: Add PMU uncore support for Zhaoxin CPU
config: x86_64-randconfig-122-20241029 (https://download.01.org/0day-ci/archive/20241029/202410292204.J2knWjKy-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241029/202410292204.J2knWjKy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410292204.J2knWjKy-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/x86/events/zhaoxin/uncore.c:323:1: sparse: sparse: symbol '__pcpu_scope_zx_package_id' was not declared. Should it be static?
>> arch/x86/events/zhaoxin/uncore.c:324:1: sparse: sparse: symbol '__pcpu_scope_zx_subnode_id' was not declared. Should it be static?
>> arch/x86/events/zhaoxin/uncore.c:325:1: sparse: sparse: symbol '__pcpu_scope_zx_cluster_id' was not declared. Should it be static?
>> arch/x86/events/zhaoxin/uncore.c:380:1: sparse: sparse: symbol '__pcpu_scope_zx_cluster_core_bits' was not declared. Should it be static?
>> arch/x86/events/zhaoxin/uncore.c:381:1: sparse: sparse: symbol '__pcpu_scope_zx_subnode_core_bits' was not declared. Should it be static?
>> arch/x86/events/zhaoxin/uncore.c:2388:28: sparse: sparse: symbol 'uncore_msr_cluster_uncores' was not declared. Should it be static?
>> arch/x86/events/zhaoxin/uncore.c:2393:28: sparse: sparse: symbol 'uncore_msr_subnode_uncores' was not declared. Should it be static?
>> arch/x86/events/zhaoxin/uncore.c:2399:28: sparse: sparse: symbol 'uncore_pci_subnode_uncores' was not declared. Should it be static?
>> arch/x86/events/zhaoxin/uncore.c:2762:6: sparse: sparse: symbol 'kx5000_uncore_cpu_init' was not declared. Should it be static?
>> arch/x86/events/zhaoxin/uncore.c:2771:6: sparse: sparse: symbol 'kh40000_uncore_cpu_init' was not declared. Should it be static?
>> arch/x86/events/zhaoxin/uncore.c:2776:5: sparse: sparse: symbol 'kh40000_uncore_pci_init' was not declared. Should it be static?
   arch/x86/events/zhaoxin/uncore.c:2792:6: sparse: sparse: symbol 'kx8000_uncore_cpu_init' was not declared. Should it be static?
   arch/x86/events/zhaoxin/uncore.c:2797:5: sparse: sparse: symbol 'kx8000_uncore_pci_init' was not declared. Should it be static?
   arch/x86/events/zhaoxin/uncore.c:2805:6: sparse: sparse: symbol 'kx8000_uncore_mmio_init' was not declared. Should it be static?
   arch/x86/events/zhaoxin/uncore.c: note: in included file (through include/linux/preempt.h, include/linux/spinlock.h, include/linux/mmzone.h, ...):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true

vim +/__pcpu_scope_zx_package_id +323 arch/x86/events/zhaoxin/uncore.c

   322	
 > 323	DEFINE_PER_CPU(int, zx_package_id);
 > 324	DEFINE_PER_CPU(int, zx_subnode_id);
 > 325	DEFINE_PER_CPU(int, zx_cluster_id);
   326	
   327	static void get_topology_info(void)
   328	{
   329		int cpu;
   330		int cluster_id;
   331		int socket_id;
   332		int die_id;
   333		int subnode_id;
   334	
   335		int die_info;
   336		int subnode_info;
   337		int cluster_info;
   338	
   339		u64 config;
   340	
   341		for_each_present_cpu(cpu) {
   342			smp_call_function_single(cpu, get_global_status_msr, &config, 1);
   343			socket_id = (int)((config >> 3) & 0x1);
   344			per_cpu(zx_package_id, cpu) = socket_id;
   345	
   346			/* only kh40000 needs cluster and subnode info */
   347			if (boot_cpu_data.x86_model != ZHAOXIN_FAM7_KH40000)
   348				continue;
   349	
   350			smp_call_function_single(cpu, get_hdw_config_msr, &config, 1);
   351	
   352			die_info = (int)((config >> 21) & 0x3);
   353			die_id = socket_id * dies_per_socket + die_info;
   354	
   355			subnode_info = (int)((config >> 20) & 0x1);
   356			subnode_id = die_id * subnodes_per_die + subnode_info;
   357			per_cpu(zx_subnode_id, cpu) = subnode_id;
   358	
   359			cluster_info = (int)((config >> 18) & 0x3);
   360			cluster_id = subnode_id * clusters_per_subnode + cluster_info;
   361			per_cpu(zx_cluster_id, cpu) = cluster_id;
   362		}
   363	}
   364	
   365	static int zx_topology_cluster_id(int cpu)
   366	{
   367		return per_cpu(zx_cluster_id, cpu);
   368	}
   369	
   370	static int zx_topology_subnode_id(int cpu)
   371	{
   372		return per_cpu(zx_subnode_id, cpu);
   373	}
   374	
   375	static int zx_topology_package_id(int cpu)
   376	{
   377		return per_cpu(zx_package_id, cpu);
   378	}
   379	
 > 380	DEFINE_PER_CPU(cpumask_t, zx_cluster_core_bits);
 > 381	DEFINE_PER_CPU(cpumask_t, zx_subnode_core_bits);
   382	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

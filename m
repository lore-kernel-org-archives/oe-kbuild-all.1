Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 739DA29A9
	for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Jan 2024 04:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.55.52.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705465911; cv=none; b=kuL7nPOCA5v/z9wrO8CZV0MYs05nQGQBHAcXRSJe+zNFRYkfZ8X4AITeKMi0M4SmaS3KRSQa92VLE5qe3j7oHptFxa7icse9NrB/oE2yu9+H4wYwmxah46DSoAc4Dc97TDsf15r23PSpmpecelFaKwbmcth7DkvD6PVs8FvBwyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705465911; c=relaxed/simple;
	bh=AQ8JCeKKurhoZIOzTrmJrSJ4kwz4lkbh+BEWZzQEjF4=;
	h=DKIM-Signature:X-IronPort-AV:X-IronPort-AV:Received:X-ExtLoop1:
	 X-IronPort-AV:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition; b=cSOl3qFIVXYRdH5SSSDdMlKrJtioCacQSAzaS5pigt57F9CtKO1PDAPYryWfqWWX5Hm2+FCBFaZttJVnpBggP9oQjHp1MVnG8J5lc7StOlIt0EEPkC2m8hmKFZXNMkXuzIE+dC3EQmRP0e0yDnz9aQ+cBeVB8/b7QiaelwybHeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kPKWXizP; arc=none smtp.client-ip=192.55.52.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kPKWXizP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705465909; x=1737001909;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AQ8JCeKKurhoZIOzTrmJrSJ4kwz4lkbh+BEWZzQEjF4=;
  b=kPKWXizPMS+PEWmohvsBYH4roZtz5448hutQ8s7i7/6SZySIwpFDQ7T4
   e48KgGQFpZ+QELFo23icWqX5PRKURo9H9KuJo2yHGlgamlxpHjz+vOVCH
   KJyQSgo79WgC2L/ZqoAAdVYZC/gYM1vm/ZNFAiqJebxSiMb2MyihvFrUs
   Qj9BF2mjv47KwKOy4Mo+rwtntNlya3nywwmp5re4H6bb7+JJqu7QQaIau
   lHwhGoaPXvPJZh00oFXZC3z+zsG5J5CGRh6ZF5yaGJ8z/XduMQzzp+qYi
   yTROUkyqw0L+QMtWp6D1dTXtPUtpqHzIv33xQWfj82MX85Zx9nbyr9q2J
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="398936850"
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; 
   d="scan'208";a="398936850"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2024 20:31:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; 
   d="scan'208";a="26034232"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 16 Jan 2024 20:31:46 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rPxaY-0001ak-2E;
	Wed, 17 Jan 2024 04:31:42 +0000
Date: Wed, 17 Jan 2024 12:30:52 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 27238/30000]
 arch/x86/events/zhaoxin/uncore.c:255:1: sparse: sparse: symbol
 '__pcpu_scope_zx_package_id' was not declared. Should it be static?
Message-ID: <202401171233.0Y6Js6pB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   e4bd0053052e24e0c30e34d05ec042203c41976c
commit: 2bb7fd043b4123c569fbbde1f18e98d7565a4997 [27238/30000] x86/perf: Update PMU support for more Zhaoxin CPU
config: x86_64-randconfig-122-20240114 (https://download.01.org/0day-ci/archive/20240117/202401171233.0Y6Js6pB-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240117/202401171233.0Y6Js6pB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401171233.0Y6Js6pB-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/x86/events/zhaoxin/uncore.c:255:1: sparse: sparse: symbol '__pcpu_scope_zx_package_id' was not declared. Should it be static?
>> arch/x86/events/zhaoxin/uncore.c:256:1: sparse: sparse: symbol '__pcpu_scope_zx_subnode_id' was not declared. Should it be static?
>> arch/x86/events/zhaoxin/uncore.c:257:1: sparse: sparse: symbol '__pcpu_scope_zx_cluster_id' was not declared. Should it be static?
>> arch/x86/events/zhaoxin/uncore.c:312:1: sparse: sparse: symbol '__pcpu_scope_zx_cluster_core_bits' was not declared. Should it be static?
>> arch/x86/events/zhaoxin/uncore.c:313:1: sparse: sparse: symbol '__pcpu_scope_zx_subnode_core_bits' was not declared. Should it be static?
   arch/x86/events/zhaoxin/uncore.c:1788:28: sparse: sparse: symbol 'uncore_msr_cluster_uncores' was not declared. Should it be static?
   arch/x86/events/zhaoxin/uncore.c:1793:28: sparse: sparse: symbol 'uncore_msr_subnode_uncores' was not declared. Should it be static?
   arch/x86/events/zhaoxin/uncore.c:1799:28: sparse: sparse: symbol 'uncore_pci_subnode_uncores' was not declared. Should it be static?

vim +/__pcpu_scope_zx_package_id +255 arch/x86/events/zhaoxin/uncore.c

   254	
 > 255	DEFINE_PER_CPU(int, zx_package_id);
 > 256	DEFINE_PER_CPU(int, zx_subnode_id);
 > 257	DEFINE_PER_CPU(int, zx_cluster_id);
   258	
   259	static void get_topology_info(void)
   260	{
   261		int cpu;
   262		int cluster_id;
   263		int socket_id;
   264		int die_id;
   265		int subnode_id;
   266	
   267		int die_info;
   268		int subnode_info;
   269		int cluster_info;
   270	
   271		u64 config;
   272	
   273		for_each_present_cpu(cpu) {
   274			smp_call_function_single(cpu, get_global_status_msr, &config, 1);
   275			socket_id = (int)((config >> 3) & 0x1);
   276			per_cpu(zx_package_id, cpu) = socket_id;
   277	
   278			/* only yongfeng needs cluster and subnode info */
   279			if (boot_cpu_data.x86_model != ZHAOXIN_FAM7_YONGFENG)
   280				continue;
   281	
   282			smp_call_function_single(cpu, get_hdw_config_msr, &config, 1);
   283	
   284			die_info = (int)((config >> 21) & 0x3);
   285			die_id = socket_id * dies_per_socket + die_info;
   286	
   287			subnode_info = (int)((config >> 20) & 0x1);
   288			subnode_id = die_id * subnodes_per_die + subnode_info;
   289			per_cpu(zx_subnode_id, cpu) = subnode_id;
   290	
   291			cluster_info = (int)((config >> 18) & 0x3);
   292			cluster_id = subnode_id * clusters_per_subnode + cluster_info;
   293			per_cpu(zx_cluster_id, cpu) = cluster_id;
   294		}
   295	}
   296	
   297	static int zx_topology_cluster_id(int cpu)
   298	{
   299		return per_cpu(zx_cluster_id, cpu);
   300	}
   301	
   302	static int zx_topology_subnode_id(int cpu)
   303	{
   304		return per_cpu(zx_subnode_id, cpu);
   305	}
   306	
   307	static int zx_topology_package_id(int cpu)
   308	{
   309		return per_cpu(zx_package_id, cpu);
   310	}
   311	
 > 312	DEFINE_PER_CPU(cpumask_t, zx_cluster_core_bits);
 > 313	DEFINE_PER_CPU(cpumask_t, zx_subnode_core_bits);
   314	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

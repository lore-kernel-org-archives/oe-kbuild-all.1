Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 451E9819
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 Nov 2024 00:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731888459; cv=none; b=ib8Jh/kH14ghmF+VebRl2V3wYXvZuKZ/fV/TuaoFnOUfhOljrQlHL1V1eqRf1yVUK076bBM6+0M/wbIrrGyLmJs/OiCTPaL2L9Ha2yNCkQdCvEZWCEnhw2e6fOM3+/VlChqm5C4TIbb6JGckFMSGUoVa5CusXopgv98EYbzBQr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731888459; c=relaxed/simple;
	bh=YkwRrgSUqLw5HvLeeSXfjPUewR0fEkJZhrIn2XRY3qM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iJsJ5YZYK1/yuvwghgUt/hXQZWEBUSWStGmsw0HcgJZahPdLsFuzzS4KBQkp2gcRJf/LdB2CljUvGRRih2l0wmJZu17OxkXBMIK24WjpY2eOfmAY4ckQofrRrAenBlTluB131r420TKDPwPB+naqWzjlBYhW30hRoqghN/e0E8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dAZ+k8wd; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dAZ+k8wd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731888458; x=1763424458;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YkwRrgSUqLw5HvLeeSXfjPUewR0fEkJZhrIn2XRY3qM=;
  b=dAZ+k8wdcWKzfhz24+NKNYNjovffwzOHdSoE3D9GpU4qxx8kPKpNTMju
   x6neZJ/qeIQftEsOuCRNczW2sCTLFUxPQFxffnaoMqIDtZWt+oAHRmFEd
   +3zJFvZqxu34inofjlUcpbE46AnSEU0Q4glxboHG0rlPvQkoNmUcSypMX
   k3x4l7UAjIwEwQ5Gwl6M6u9/7XYm3P+K2ZHRS+c1jTSCH6SIsJyFBRszN
   iCVw7CPrK3tnoBjNQatKRMpiYWECdfND+9aMFIXbbzMdlIMOfb2MtFr5g
   XGaU8sIR3vAQmX2Ruwxk+uMOFdwYhnbMZNP8xVMyn2zBjy//qdTSE3BxV
   A==;
X-CSE-ConnectionGUID: MMZSm06+QPm9TLgH0f+iVw==
X-CSE-MsgGUID: O7nMrmQjSmqB1/HgZfw/Rw==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="31679430"
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; 
   d="scan'208";a="31679430"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2024 16:07:35 -0800
X-CSE-ConnectionGUID: HXF82JipSgqM6UYRRgtvkQ==
X-CSE-MsgGUID: WbsSQeMMQ5Kak1y7yTMF9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; 
   d="scan'208";a="93526989"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 17 Nov 2024 16:07:33 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tCpIg-00028d-2i;
	Mon, 18 Nov 2024 00:07:30 +0000
Date: Mon, 18 Nov 2024 08:07:17 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, leoliu-oc <leoliu-oc@zhaoxin.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1474/1474]
 arch/x86/events/zhaoxin/uncore.c:255:1: sparse: sparse: symbol
 '__pcpu_scope_zx_package_id' was not declared. Should it be static?
Message-ID: <202411180830.hUwnz6AZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   7c547c6bbe6b6a9cedf63d7cdadb2529404df633
commit: 5cbf647edcff3d5cda5cb172c6bf0e4c1b6e8ec6 [1474/1474] x86/perf: Add uncore performance events support for Zhaoxin CPU
config: x86_64-randconfig-123-20241118 (https://download.01.org/0day-ci/archive/20241118/202411180830.hUwnz6AZ-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241118/202411180830.hUwnz6AZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411180830.hUwnz6AZ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/x86/events/zhaoxin/uncore.c:255:1: sparse: sparse: symbol '__pcpu_scope_zx_package_id' was not declared. Should it be static?
>> arch/x86/events/zhaoxin/uncore.c:256:1: sparse: sparse: symbol '__pcpu_scope_zx_subnode_id' was not declared. Should it be static?
>> arch/x86/events/zhaoxin/uncore.c:257:1: sparse: sparse: symbol '__pcpu_scope_zx_cluster_id' was not declared. Should it be static?
>> arch/x86/events/zhaoxin/uncore.c:312:1: sparse: sparse: symbol '__pcpu_scope_zx_cluster_core_bits' was not declared. Should it be static?
>> arch/x86/events/zhaoxin/uncore.c:313:1: sparse: sparse: symbol '__pcpu_scope_zx_subnode_core_bits' was not declared. Should it be static?
   arch/x86/events/zhaoxin/uncore.c:1788:28: sparse: sparse: symbol 'uncore_msr_cluster_uncores' was not declared. Should it be static?
   arch/x86/events/zhaoxin/uncore.c:1793:28: sparse: sparse: symbol 'uncore_msr_subnode_uncores' was not declared. Should it be static?
   arch/x86/events/zhaoxin/uncore.c:1799:28: sparse: sparse: symbol 'uncore_pci_subnode_uncores' was not declared. Should it be static?
   arch/x86/events/zhaoxin/uncore.c: note: in included file (through arch/x86/include/asm/cpuid.h, arch/x86/include/asm/processor.h, arch/x86/include/asm/cpu_device_id.h):
>> arch/x86/include/asm/paravirt.h:229:9: sparse: sparse: cast truncates bits from constant value (10000000f becomes f)

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

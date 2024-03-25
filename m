Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3E1227210C
	for <oe-kbuild-all@lists.linux.dev>; Mon, 25 Mar 2024 03:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711337303; cv=none; b=IezoHgEqiQlfoxXxknJrX9Fa4vHtGLuMb533CzinlFNqeM1jqeBsti2hiGcpmnD8+jDPUOXKZELsbR0musKoS2KKrKvVdYLCEZgaL/chOsBtVeYGnR5VaNDoCaFuJH2CL5tPuIHNFl9jB17st1xQ/I2bmsj8vMAdHXSGaOCeww4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711337303; c=relaxed/simple;
	bh=2FGTLeh6tbeOhY6345WilvPOd/v2zbsDOVYjy++YaFU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Pn12ZQYhuizuoHeIcstkXjzBzTtkM4V+chMR3z3MN/576Kb3j7U316b9a01CTtcxeLw6ASyHj2Ssdk7pgANAxXBidtpzafc3bCIqc+FyJg52JTeb3aVuLo8zkTM8/+1FOuNcaTtudh/8/KFYvGkcbuCdXyjZZ1cx0sOEMGolAdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jBFTkXmE; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jBFTkXmE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711337302; x=1742873302;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2FGTLeh6tbeOhY6345WilvPOd/v2zbsDOVYjy++YaFU=;
  b=jBFTkXmEnt2rk02qTGcS26ZzsWjZnKTdNqQfyn6E8CD4GFxN8m5pD2Dt
   fEEDHV/w+sOYQukpNDevUJw6+M7c16R3YIgXY0IDjkCnEFKg6Us1Gy//P
   wGQN047Ia1JiKfyF+ucW6hScQumbjLFcyEjULH8MKibaR6g54mb0ICUw5
   zmsdrrHyuS43pnaJER2YjuNjXk28z+IQ7EfC/O2BOxP0exOdhrOIL2Zof
   t7kAIJg+IILKeI0yyKn5v1jlCs4/nIflA60Xc54r80TnlWfN6YI/bjl7q
   wYCL+q8ve1a1dF3lbaTgfAdJ5+eJucA8N8bnCxtv6hY5tt14Dj9aHf5bu
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11023"; a="9277140"
X-IronPort-AV: E=Sophos;i="6.07,152,1708416000"; 
   d="scan'208";a="9277140"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2024 20:28:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,152,1708416000"; 
   d="scan'208";a="46474522"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 24 Mar 2024 20:28:17 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rob0Q-000MCb-0W;
	Mon, 25 Mar 2024 03:28:14 +0000
Date: Mon, 25 Mar 2024 11:27:56 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 4603/4615]
 arch/x86/events/zhaoxin/uncore.c:2762:6: sparse: sparse: symbol
 'kx5000_uncore_cpu_init' was not declared. Should it be static?
Message-ID: <202403251125.h3xPJVYN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   e0ee18f8b8228a1b9598534057943383c2ed23a5
commit: 706da336689b0e28091e742d5dbc3640f33d51c4 [4603/4615] x86/perf: Add PMU uncore support for Zhaoxin CPU
config: x86_64-randconfig-121-20240325 (https://download.01.org/0day-ci/archive/20240325/202403251125.h3xPJVYN-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240325/202403251125.h3xPJVYN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403251125.h3xPJVYN-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/x86/events/zhaoxin/uncore.c:323:1: sparse: sparse: symbol '__pcpu_scope_zx_package_id' was not declared. Should it be static?
   arch/x86/events/zhaoxin/uncore.c:324:1: sparse: sparse: symbol '__pcpu_scope_zx_subnode_id' was not declared. Should it be static?
   arch/x86/events/zhaoxin/uncore.c:325:1: sparse: sparse: symbol '__pcpu_scope_zx_cluster_id' was not declared. Should it be static?
   arch/x86/events/zhaoxin/uncore.c:380:1: sparse: sparse: symbol '__pcpu_scope_zx_cluster_core_bits' was not declared. Should it be static?
   arch/x86/events/zhaoxin/uncore.c:381:1: sparse: sparse: symbol '__pcpu_scope_zx_subnode_core_bits' was not declared. Should it be static?
   arch/x86/events/zhaoxin/uncore.c:2388:28: sparse: sparse: symbol 'uncore_msr_cluster_uncores' was not declared. Should it be static?
   arch/x86/events/zhaoxin/uncore.c:2393:28: sparse: sparse: symbol 'uncore_msr_subnode_uncores' was not declared. Should it be static?
   arch/x86/events/zhaoxin/uncore.c:2399:28: sparse: sparse: symbol 'uncore_pci_subnode_uncores' was not declared. Should it be static?
>> arch/x86/events/zhaoxin/uncore.c:2762:6: sparse: sparse: symbol 'kx5000_uncore_cpu_init' was not declared. Should it be static?
>> arch/x86/events/zhaoxin/uncore.c:2771:6: sparse: sparse: symbol 'kh40000_uncore_cpu_init' was not declared. Should it be static?
>> arch/x86/events/zhaoxin/uncore.c:2776:5: sparse: sparse: symbol 'kh40000_uncore_pci_init' was not declared. Should it be static?
>> arch/x86/events/zhaoxin/uncore.c:2792:6: sparse: sparse: symbol 'kx8000_uncore_cpu_init' was not declared. Should it be static?
>> arch/x86/events/zhaoxin/uncore.c:2797:5: sparse: sparse: symbol 'kx8000_uncore_pci_init' was not declared. Should it be static?
>> arch/x86/events/zhaoxin/uncore.c:2805:6: sparse: sparse: symbol 'kx8000_uncore_mmio_init' was not declared. Should it be static?

vim +/kx5000_uncore_cpu_init +2762 arch/x86/events/zhaoxin/uncore.c

  2761	
> 2762	void kx5000_uncore_cpu_init(void)
  2763	{
  2764		uncore_msr_uncores = kx5000_msr_uncores;
  2765	}
  2766	
  2767	static const struct zhaoxin_uncore_init_fun kx5000_uncore_init __initconst = {
  2768		.cpu_init = kx5000_uncore_cpu_init,
  2769	};
  2770	
> 2771	void kh40000_uncore_cpu_init(void)
  2772	{
  2773		uncore_msr_uncores = kh40000_msr_uncores;
  2774	}
  2775	
> 2776	int kh40000_uncore_pci_init(void)
  2777	{
  2778		int ret = kh40000_pci2node_map_init();/*pci_bus to package mapping, do nothing*/
  2779	
  2780		if (ret)
  2781			return ret;
  2782		uncore_pci_uncores = kh40000_pci_uncores;
  2783		uncore_pci_driver = &kh40000_uncore_pci_driver;
  2784		return 0;
  2785	}
  2786	
  2787	static const struct zhaoxin_uncore_init_fun kh40000_uncore_init __initconst = {
  2788		.cpu_init = kh40000_uncore_cpu_init,
  2789		.pci_init = kh40000_uncore_pci_init,
  2790	};
  2791	
> 2792	void kx8000_uncore_cpu_init(void)
  2793	{
  2794		uncore_msr_uncores = kx8000_msr_uncores;
  2795	}
  2796	
> 2797	int kx8000_uncore_pci_init(void)
  2798	{
  2799		uncore_pci_uncores = kx8000_pci_uncores;
  2800		uncore_pci_driver = &kx8000_uncore_pci_driver;
  2801	
  2802		return 0;
  2803	}
  2804	
> 2805	void kx8000_uncore_mmio_init(void)
  2806	{
  2807		uncore_mmio_uncores = kx8000_mmio_uncores;
  2808	}
  2809	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

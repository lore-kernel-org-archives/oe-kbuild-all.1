Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16A4146425
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 Aug 2024 04:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724731733; cv=none; b=t/0UFP5RNr8k7OUROUFvmOCgawIADK4KhUntFCYErYOaq1EGcx96Wu+2UrxZ3jeCeKuU40jdaPk/ruexm9lcNxtK9NhCUthAKPcyCHqItx4Rb5t4J6yOC2wfjfUsQaKAxhsoWXkqdsQft2krEv45L9lOBGJ7nQmoxMUgTSblRiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724731733; c=relaxed/simple;
	bh=2RhMA9ld3TYGzT3Zu+RPllo4dcYLHnnqBKdlP/aQ6B4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fUfe3gu/4mSnhTaD2TTAEbIyYnYcHn3gNVGVMdTRhEGSmdOTBwjhO7toHzE+DNfpQ9EPUH9vWjdSUN4x0Bf3fTAWv5B60dCH1f1fQRsqJBBd6nQit6y0hgFFYx2d8Rtj17BCtm4JoXJCbcFllT89SJl2PCmHrotZbBLk6Hd28bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EETMQjOU; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EETMQjOU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724731731; x=1756267731;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2RhMA9ld3TYGzT3Zu+RPllo4dcYLHnnqBKdlP/aQ6B4=;
  b=EETMQjOUMVfQyrK8PjvsN9cViYVJM5XJU1+qn7E0c0uHQEjrYAyiiAtD
   3bAN6qlSwy8ft53mR03WDBhWwYf/gnwfgZKS+IZ6XcLVyHSKmawyNRQ4s
   hPQ3hs3H3X3VnP9VVHuL/UePKgJSUM9LTZHi7wqq1c50c6N9qC5c6PptZ
   SN4WW4VSYb6d3rtgGnBy5IYzJKdcLLWOFvdJeZBw0HM+tz7VcZmScQSnr
   LaDGmuNR6pUbreWVLvPjoZJCIDXwIov58haLKK98nvsMJw49EKIu5cBa9
   ujZc4Ck4x12FzR9LE1z+w0tCEMfY7l5juppoloPTdPfDIz/HZqMNJDmpv
   g==;
X-CSE-ConnectionGUID: e6DNQdeQRcWAKsEUWBDg9Q==
X-CSE-MsgGUID: KSgkJRgNRSa1V6Z+3JCNgw==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="23314260"
X-IronPort-AV: E=Sophos;i="6.10,179,1719903600"; 
   d="scan'208";a="23314260"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2024 21:08:50 -0700
X-CSE-ConnectionGUID: mmwA98pyQ4Os67mvf7OvHA==
X-CSE-MsgGUID: 6uDs9tbTRI2SS1wWObW+eA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,179,1719903600"; 
   d="scan'208";a="85919016"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 26 Aug 2024 21:08:47 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sinVd-000Hua-1C;
	Tue, 27 Aug 2024 04:08:45 +0000
Date: Tue, 27 Aug 2024 12:07:58 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 9912/9936]
 arch/x86/events/zhaoxin/uncore.c:2835:6: sparse: sparse: symbol
 'kx7000_uncore_cpu_init' was not declared. Should it be static?
Message-ID: <202408271119.oDFiELvZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   304e0163925d5bb281ad9846c091c122b6cc42a9
commit: 008053bcdeaad929fa3f96b75eee49da15ab0a04 [9912/9936] perf/x86/zhaoxin/uncore: update KX-7000 support
config: x86_64-randconfig-121-20240827 (https://download.01.org/0day-ci/archive/20240827/202408271119.oDFiELvZ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240827/202408271119.oDFiELvZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408271119.oDFiELvZ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/x86/events/zhaoxin/uncore.c:339:1: sparse: sparse: symbol '__pcpu_scope_zx_package_id' was not declared. Should it be static?
   arch/x86/events/zhaoxin/uncore.c:340:1: sparse: sparse: symbol '__pcpu_scope_zx_subnode_id' was not declared. Should it be static?
   arch/x86/events/zhaoxin/uncore.c:341:1: sparse: sparse: symbol '__pcpu_scope_zx_cluster_id' was not declared. Should it be static?
   arch/x86/events/zhaoxin/uncore.c:396:1: sparse: sparse: symbol '__pcpu_scope_zx_cluster_core_bits' was not declared. Should it be static?
   arch/x86/events/zhaoxin/uncore.c:397:1: sparse: sparse: symbol '__pcpu_scope_zx_subnode_core_bits' was not declared. Should it be static?
   arch/x86/events/zhaoxin/uncore.c:2433:28: sparse: sparse: symbol 'uncore_msr_cluster_uncores' was not declared. Should it be static?
   arch/x86/events/zhaoxin/uncore.c:2438:28: sparse: sparse: symbol 'uncore_msr_subnode_uncores' was not declared. Should it be static?
   arch/x86/events/zhaoxin/uncore.c:2444:28: sparse: sparse: symbol 'uncore_pci_subnode_uncores' was not declared. Should it be static?
   arch/x86/events/zhaoxin/uncore.c:2805:6: sparse: sparse: symbol 'kx5000_uncore_cpu_init' was not declared. Should it be static?
   arch/x86/events/zhaoxin/uncore.c:2814:6: sparse: sparse: symbol 'kh40000_uncore_cpu_init' was not declared. Should it be static?
   arch/x86/events/zhaoxin/uncore.c:2819:5: sparse: sparse: symbol 'kh40000_uncore_pci_init' was not declared. Should it be static?
>> arch/x86/events/zhaoxin/uncore.c:2835:6: sparse: sparse: symbol 'kx7000_uncore_cpu_init' was not declared. Should it be static?
>> arch/x86/events/zhaoxin/uncore.c:2850:5: sparse: sparse: symbol 'kx7000_uncore_pci_init' was not declared. Should it be static?
>> arch/x86/events/zhaoxin/uncore.c:2858:6: sparse: sparse: symbol 'kx7000_uncore_mmio_init' was not declared. Should it be static?
   arch/x86/events/zhaoxin/uncore.c: note: in included file (through include/linux/preempt.h, include/linux/spinlock.h, include/linux/mmzone.h, ...):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true

vim +/kx7000_uncore_cpu_init +2835 arch/x86/events/zhaoxin/uncore.c

  2834	
> 2835	void kx7000_uncore_cpu_init(void)
  2836	{
  2837		u64 val;
  2838		int cpu;
  2839	
  2840		uncore_msr_uncores = kx7000_msr_uncores;
  2841	
  2842		/* clear bit 16 of MSR 0x1877 so that HIF can work normally */
  2843		for_each_present_cpu(cpu) {
  2844			rdmsrl_on_cpu(cpu, 0x1877, &val);
  2845			val = val & 0xfffffffffffeffffULL;
  2846			wrmsrl_on_cpu(cpu, 0x1877, val);
  2847		}
  2848	}
  2849	
> 2850	int kx7000_uncore_pci_init(void)
  2851	{
  2852		uncore_pci_uncores = kx7000_pci_uncores;
  2853		uncore_pci_driver = &kx7000_uncore_pci_driver;
  2854	
  2855		return 0;
  2856	}
  2857	
> 2858	void kx7000_uncore_mmio_init(void)
  2859	{
  2860		uncore_mmio_uncores = kx7000_mmio_uncores;
  2861	}
  2862	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

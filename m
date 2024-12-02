Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A85518494
	for <oe-kbuild-all@lists.linux.dev>; Mon,  2 Dec 2024 01:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733102953; cv=none; b=gOAVPERwIg4vBrsYYBdPJaAesBSbxyrWgcXqwoyI4zN9tv7pJKa236vMj79Q/9dVLVVLNTi5ahm8V05SQQvl4Fwiv5qhY1x6jHGJvl4lnPZFqWPHDxHc+s+qbMOdJjoMQ80iPNTnKg0TjAp10Cl69aQyXOQrhNHhrky3HnOPnbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733102953; c=relaxed/simple;
	bh=Wyb3eD+3plbaKeedyfnO/Tepb77uRLjEn+fvCsOUXJ4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Dz46rFYg5E1ZMrt1+UEg54OYtPVTuwfmSDMcWiEWn3ioZC3751fFLKEpd3LAtaGxDxbpz6QclAc55VZek/WQe6sYuLGZzT9n59ZAuBry3Uma4V4q0gj2IXKFPc/J74fS6jgg1JxwUOKOtmYlGsnkvp0xJjleeVzkg8uRHj340QY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GoDzUHtJ; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GoDzUHtJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733102951; x=1764638951;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Wyb3eD+3plbaKeedyfnO/Tepb77uRLjEn+fvCsOUXJ4=;
  b=GoDzUHtJMytGdHisN6tCDQr0yl2t8Z4x1OE+BsQqGchWspGg71shPdDA
   +QtvGwhGue5xBT6Csd/EkXw/DVr1Np/TLgE0+nzvACa7y/uFImcHOgoOF
   kw9xJ3jTaTyE74X2+7/xg16GBJRcVfKssclTHDmo15DCX1EdvhK9K8B2N
   qSku9iL2XD6tr2Ml6tF45zqSlqNfKVqcWzUem0peeahXwVVW13OMW01kb
   KT5SDBd1A8M65G0IKecvKbV4WWFopbtsEGVii5nJcI/BW0AizbPxAn+xx
   lXkby/T7K9foG0MIJ90joHY8wCK4lh7i05ZvObIMjxm5IavawwWJUnAhS
   g==;
X-CSE-ConnectionGUID: 58503oz8Rs+c5lq9XzGhJw==
X-CSE-MsgGUID: Cl72GTfxSCWtPs8pbzswQw==
X-IronPort-AV: E=McAfee;i="6700,10204,11273"; a="33384410"
X-IronPort-AV: E=Sophos;i="6.12,201,1728975600"; 
   d="scan'208";a="33384410"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2024 17:29:11 -0800
X-CSE-ConnectionGUID: DJX1ytfYQ8CEx+ZANjTbbg==
X-CSE-MsgGUID: GVzvSnncQgyjZdQs4X8IWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,201,1728975600"; 
   d="scan'208";a="93129955"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 01 Dec 2024 17:29:09 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tHvFL-0001zT-2M;
	Mon, 02 Dec 2024 01:29:07 +0000
Date: Mon, 2 Dec 2024 09:28:44 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, leoliu-oc <leoliu-oc@zhaoxin.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1474/1474]
 arch/x86/events/zhaoxin/uncore.c:2761:6: sparse: sparse: symbol
 'kx5000_uncore_cpu_init' was not declared. Should it be static?
Message-ID: <202412020914.wVMtku1t-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   df4c334beecb4cf58e4e8d63b491aa5ac0a84f46
commit: dc5b97374ba722156acbdfc4e3adbc69e2dbe7f4 [1474/1474] perf/x86/zhaoxin/uncore: Add KX-7000 support
config: x86_64-randconfig-121-20241118 (https://download.01.org/0day-ci/archive/20241202/202412020914.wVMtku1t-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241202/202412020914.wVMtku1t-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412020914.wVMtku1t-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/x86/events/zhaoxin/uncore.c:2387:28: sparse: sparse: symbol 'uncore_msr_cluster_uncores' was not declared. Should it be static?
   arch/x86/events/zhaoxin/uncore.c:2392:28: sparse: sparse: symbol 'uncore_msr_subnode_uncores' was not declared. Should it be static?
   arch/x86/events/zhaoxin/uncore.c:2398:28: sparse: sparse: symbol 'uncore_pci_subnode_uncores' was not declared. Should it be static?
>> arch/x86/events/zhaoxin/uncore.c:2761:6: sparse: sparse: symbol 'kx5000_uncore_cpu_init' was not declared. Should it be static?
>> arch/x86/events/zhaoxin/uncore.c:2770:6: sparse: sparse: symbol 'kh40000_uncore_cpu_init' was not declared. Should it be static?
>> arch/x86/events/zhaoxin/uncore.c:2775:5: sparse: sparse: symbol 'kh40000_uncore_pci_init' was not declared. Should it be static?
   arch/x86/events/zhaoxin/uncore.c:2791:6: sparse: sparse: symbol 'kx8000_uncore_cpu_init' was not declared. Should it be static?
   arch/x86/events/zhaoxin/uncore.c:2796:5: sparse: sparse: symbol 'kx8000_uncore_pci_init' was not declared. Should it be static?
   arch/x86/events/zhaoxin/uncore.c:2804:6: sparse: sparse: symbol 'kx8000_uncore_mmio_init' was not declared. Should it be static?
   arch/x86/events/zhaoxin/uncore.c: note: in included file (through include/linux/preempt.h, include/linux/spinlock.h, include/linux/mmzone.h, ...):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true

vim +/kx5000_uncore_cpu_init +2761 arch/x86/events/zhaoxin/uncore.c

  2760	
> 2761	void kx5000_uncore_cpu_init(void)
  2762	{
  2763		uncore_msr_uncores = kx5000_msr_uncores;
  2764	}
  2765	
  2766	static const struct zhaoxin_uncore_init_fun kx5000_uncore_init __initconst = {
  2767		.cpu_init = kx5000_uncore_cpu_init,
  2768	};
  2769	
> 2770	void kh40000_uncore_cpu_init(void)
  2771	{
  2772		uncore_msr_uncores = kh40000_msr_uncores;
  2773	}
  2774	
> 2775	int kh40000_uncore_pci_init(void)
  2776	{
  2777		int ret = kh40000_pci2node_map_init();/*pci_bus to package mapping, do nothing*/
  2778	
  2779		if (ret)
  2780			return ret;
  2781		uncore_pci_uncores = kh40000_pci_uncores;
  2782		uncore_pci_driver = &kh40000_uncore_pci_driver;
  2783		return 0;
  2784	}
  2785	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

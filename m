Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB0AA3DBB6
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 Nov 2024 01:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732065154; cv=none; b=LKiYzIffokIplCzLFXqLAw8ZHa0gcVtHY8q+DaNln/bqBY8Lm/Iy1XtSytwDhPcyQ/Emfqc55CV99UzHxnqOFPa7XqalTTJzTCxYS54hs2WTE5jlX+yDCt9DZin2wTcX2vWN1dlclqcWwlic6F2u+Au4wtsWv9lsbhQpqHOC+iE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732065154; c=relaxed/simple;
	bh=34WVWdqa1aND69ZjV4rZiJIPumawMnaosseFQ8RIqeQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=l4LpIn7jHieh1SUP5CoOHsyL3e04/l6vJLG6A2ajE+9dt10Cb2/ztcAPqDLZBNoaC0QKiNp8G/IUI8fTXm8sflaudnVuAjHWHW4Ox4QpZm4cNdKDpR/3n8upDEyDb8z91+U0XE0HzABTOB4qknjhrXI3K9OKAnhwjZOAPfurClE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UzpowJsO; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UzpowJsO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732065152; x=1763601152;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=34WVWdqa1aND69ZjV4rZiJIPumawMnaosseFQ8RIqeQ=;
  b=UzpowJsO1hRqRgmxv4T4zVFrgt5rgWlG1U8ii8k2v9f85alKsKgtGMDB
   z3DErO12sk8/Lxenhc4FITLCsskBy+UKuA9eBqNgOKkEl+7eH57pF/HCi
   qJOxGB8N9pebL5EMLPgcdXsLYceT2hP2AK3OMA+2Vi+YpdTz3xBq58QRF
   oEwCHXdwb/pNh7d8t/+oFVJJM957NySqgyMSAuPe5PCtM22aVBiJQlMJ9
   DjjdF5/K1O8/VN/BHBEUU2ZCJzGJkmHiv4Kcayr61zeTVzgBsYj2Eu+i8
   2eRTV9GnrPXl8nS/NrxeXulMPvFC8OAROFHiFgb6wtroNc6LjxoWdqVUx
   g==;
X-CSE-ConnectionGUID: dYKCtS5zTaGJQV0LVAKBFQ==
X-CSE-MsgGUID: Oem6BvdZQZKepQKXMdW15Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11261"; a="54602142"
X-IronPort-AV: E=Sophos;i="6.12,168,1728975600"; 
   d="scan'208";a="54602142"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2024 17:12:30 -0800
X-CSE-ConnectionGUID: jkHM6X7RRF+zEWI5xB4qCg==
X-CSE-MsgGUID: crD+yZT8Q8iDNBp8Min6Gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="94805467"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 19 Nov 2024 17:12:29 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tDZGc-0000Ol-1U;
	Wed, 20 Nov 2024 01:12:26 +0000
Date: Wed, 20 Nov 2024 09:11:49 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, leoliu-oc <leoliu-oc@zhaoxin.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1474/1474]
 arch/x86/events/zhaoxin/uncore.c:2761:6: sparse: sparse: symbol
 'kx5000_uncore_cpu_init' was not declared. Should it be static?
Message-ID: <202411192009.C5J9m2a8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   cd76a7555127aa134a2a1113685da60b70553e6f
commit: dc5b97374ba722156acbdfc4e3adbc69e2dbe7f4 [1474/1474] perf/x86/zhaoxin/uncore: Add KX-7000 support
config: x86_64-randconfig-121-20241118 (https://download.01.org/0day-ci/archive/20241119/202411192009.C5J9m2a8-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241119/202411192009.C5J9m2a8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411192009.C5J9m2a8-lkp@intel.com/

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

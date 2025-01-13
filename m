Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D34EF1BDCF
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Jan 2025 22:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736805672; cv=none; b=PtrCsEi9nP90HyovCJAn/aPdZY25ATvEExaTAZpVFMZhVZ+AMAIneCxdqx+rtiS9c0qiuheq5V9Op0weLQFCHP6GWrwRn1+G2TBitqpFsYYkVbnfLQujq3YIps44tY4I3xbdSlvsa9xKHsTdgTFOF6tEsZc0Fjpt3V4aye+ZCU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736805672; c=relaxed/simple;
	bh=moY9TlEl+wOsN+EtTp06fWc0zut0Hfa8HsbnqNmI+tc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qzQ7V/9TLkAEVezpf60FYMhU+5AXf4JBDJPV3/09/v1VXtMaxehOItk8o1TwUqHNQABg5K/lahDJnwbBiIe1YGty88gHczSljt9pgCgj4PzIDH48cQNH5M1xh9OQr37rGF0Uf5cFTKPesRBmoDF5PndHUIKqSGhkWHUZ7qMks18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KT9N0X0V; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KT9N0X0V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736805670; x=1768341670;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=moY9TlEl+wOsN+EtTp06fWc0zut0Hfa8HsbnqNmI+tc=;
  b=KT9N0X0VY+vZaeBUy/GF6abM5F+w8N3Yt82iaU5En1b4MvMPVU+miuYl
   JWB2y01t74LpRYmas6lmtq9FE4MGxADHFYyVYhBiYUbVpY+wjlYLDLc5q
   hOvgLXA3OOCljNu2f/2iam/Op17+iKzpozBWAByznYBqt1NX3AoktQMCL
   TfSalRmOMaOkWMfD54fPJFKK47ZZOfbsIOecyvJywKJSNYpIdPWhnqE3t
   OUaV8lFKlDyoLGvg7JKvlWNHx+MmjreY0VNx/r5h+pGXrCmlsZsOkW3Qh
   BsrzO9XAZSGyjPE9eR8ewjvdX5vOMX75zPd/LeYYKbLri6a9OCGzl0p61
   g==;
X-CSE-ConnectionGUID: WnJcHFVzS5i4dv2yGaJF/A==
X-CSE-MsgGUID: eZQ1CONXQ/+HtozzMwIZrw==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="37202684"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="37202684"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2025 14:01:10 -0800
X-CSE-ConnectionGUID: 0S/zfiizRVil/UnnrwpIpw==
X-CSE-MsgGUID: ySjUptFyQ8WfAUNTvTuIHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,312,1728975600"; 
   d="scan'208";a="104438016"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 13 Jan 2025 14:01:07 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tXSUb-000Njn-2V;
	Mon, 13 Jan 2025 22:01:05 +0000
Date: Tue, 14 Jan 2025 06:00:21 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, yangxiangkai <yangxiangkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1823/1823]
 include/../drivers/pci/msi/msi.h:113:57: warning: declaration of 'struct
 msix_entry' will not be visible outside of this function
Message-ID: <202501140558.Dz2Pe9bS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   4fbc633527d173d6e350da6be39009c6a449a802
commit: ad540a13eb8292fc92651b3bf281088a502a85f9 [1823/1823] virtcca feature: fix msi iova map
config: arm64-randconfig-004-20250114 (https://download.01.org/0day-ci/archive/20250114/202501140558.Dz2Pe9bS-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project f5cd181ffbb7cb61d582fe130d46580d5969d47a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250114/202501140558.Dz2Pe9bS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501140558.Dz2Pe9bS-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/coda/coda_pci.c:5:
   In file included from include/linux/kvm_host.h:16:
   In file included from include/linux/mm.h:2243:
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
   In file included from drivers/coda/coda_pci.c:8:
>> include/../drivers/pci/msi/msi.h:113:57: warning: declaration of 'struct msix_entry' will not be visible outside of this function [-Wvisibility]
     113 | int __pci_enable_msix_range(struct pci_dev *dev, struct msix_entry *entries, int minvec,
         |                                                         ^
   6 warnings generated.


vim +113 include/../drivers/pci/msi/msi.h

897a0b6aa8c7ee Ahmed S. Darwish 2022-11-11  107  
b12d0bec385b7a Ahmed S. Darwish 2022-11-11  108  /* MSI internal functions invoked from the public APIs */
b12d0bec385b7a Ahmed S. Darwish 2022-11-11  109  void pci_msi_shutdown(struct pci_dev *dev);
18e1926b8c8b7c Ahmed S. Darwish 2022-11-11  110  void pci_msix_shutdown(struct pci_dev *dev);
b12d0bec385b7a Ahmed S. Darwish 2022-11-11  111  void pci_free_msi_irqs(struct pci_dev *dev);
bbda3407982211 Ahmed S. Darwish 2022-11-11  112  int __pci_enable_msi_range(struct pci_dev *dev, int minvec, int maxvec, struct irq_affinity *affd);
be7496c1ef47e1 Ahmed S. Darwish 2022-11-11 @113  int __pci_enable_msix_range(struct pci_dev *dev, struct msix_entry *entries, int minvec,
be7496c1ef47e1 Ahmed S. Darwish 2022-11-11  114  			    int maxvec,  struct irq_affinity *affd, int flags);
57127da98bc876 Ahmed S. Darwish 2022-11-11  115  void __pci_restore_msi_state(struct pci_dev *dev);
57127da98bc876 Ahmed S. Darwish 2022-11-11  116  void __pci_restore_msix_state(struct pci_dev *dev);
b12d0bec385b7a Ahmed S. Darwish 2022-11-11  117  

:::::: The code at line 113 was first introduced by commit
:::::: be7496c1ef47e1ba8c4b389ee23178fcf066cc4e PCI/MSI: Move pci_enable_msix_range() to api.c

:::::: TO: Ahmed S. Darwish <darwi@linutronix.de>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

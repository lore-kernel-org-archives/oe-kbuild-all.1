Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 239161FAC51
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Oct 2024 23:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729727969; cv=none; b=H8kWqTeBihfErywPh0fwgnC1jY7NL5K0KVWD1ozK0efleb+bSetxn+7BZ9FiLvrpeKyzU/u5tWtsS8BgIIhCYRIBoERsj4ByMGwh3631LselCKZb9PSx/HPKQ8QwkBXrFDVHaqn3HptB4Ps49qYS6Ef/AoCRJeBo+MhiiDpLuOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729727969; c=relaxed/simple;
	bh=nub4F/nlLuzzmz8pvFA7kijfXZXvQ2y9djCgDZ4qbNo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LY8Fns7BhE7BIEAuhlQtBaxazOv6RaovCrwcveR9EnNkIyyMBmbqHy2xvAdybDYkWKMzgpyyDlQ51foJsgyMcQd/WwGLsUzaIhuaNl1FXDf29O6kPTNt4sA5+h3L5Me+8sslapdSON98fhZ/aW6qZIf2j7ba9uBwgd3UMIwS7+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SreCo9Kl; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SreCo9Kl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729727968; x=1761263968;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nub4F/nlLuzzmz8pvFA7kijfXZXvQ2y9djCgDZ4qbNo=;
  b=SreCo9Klx16ifIsTWqNzmxxMr4010IOvWEXYiz9MYO7NAM4p8DA126Tg
   pc3U4uZ0cezC/3ZqoCQScvxBE2HFQXuZE8LRY/Siimo2zvXIb1el32hYq
   Bg4Qet15QdnWV1n9Suvh98NyA8wZ3ShASw9zUbil+0MCpkqSNC4l+Pwsp
   V8VJeRyPEptXhYWOEhxK4jpnAxTWvbPJhtHLVHzdLSN4wbZyEyuJAptF/
   2tgcZ/pQSd4jBtfsydNE5RiF0+16aFDerIItcoDwzQzIKHy05/92Pv95Y
   mgprx1NI2RjEjHlG2EtSIbLHsHMF0NrSBRmcU9YNqeepjf8PN7lPiaJwK
   w==;
X-CSE-ConnectionGUID: U+IeInFLSh+3qg1JIETmJw==
X-CSE-MsgGUID: gAfU3iKaQ12QIpRM7q43GQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29462515"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="29462515"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2024 16:59:25 -0700
X-CSE-ConnectionGUID: fSlvYolgSk6aiHBw3dFy0w==
X-CSE-MsgGUID: thVT9uevSNugFAIBorTXJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,227,1725346800"; 
   d="scan'208";a="85209898"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 23 Oct 2024 16:59:24 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t3lG4-000Vj2-34;
	Wed, 23 Oct 2024 23:59:20 +0000
Date: Thu, 24 Oct 2024 07:58:30 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15 1/5] drivers/pci/pci.h:610:61: error:
 expected identifier or '('
Message-ID: <202410240705.xKW4Z5iy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi David,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   38edc4724f5ea26f3015dbe044c2ac4f79f7adcf
commit: eaddd7157d019ff9415b6f65ae506f169a5d54c6 [1/5] BACKPORT: PCI/ASPM: Move pci_save_ltr_state() to aspm.c
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20241024/202410240705.xKW4Z5iy-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 5886454669c3c9026f7f27eab13509dd0241f2d6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241024/202410240705.xKW4Z5iy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410240705.xKW4Z5iy-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/pci/of.c:11:
   In file included from include/linux/pci.h:2484:
   In file included from include/linux/pci-dma-compat.h:8:
   In file included from include/linux/dma-mapping.h:10:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:1661:
   include/linux/vmstat.h:357:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     357 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from drivers/pci/of.c:16:
>> drivers/pci/pci.h:610:61: error: expected identifier or '('
     610 | static inline void pci_save_ltr_state(struct pci_dev *dev); { }
         |                                                             ^
   drivers/pci/pci.h:611:64: error: expected identifier or '('
     611 | static inline void pci_restore_ltr_state(struct pci_dev *dev); { }
         |                                                                ^
   1 warning and 2 errors generated.


vim +610 drivers/pci/pci.h

   589	
   590	/* PCI error reporting and recovery */
   591	pci_ers_result_t pcie_do_recovery(struct pci_dev *dev,
   592			pci_channel_state_t state,
   593			pci_ers_result_t (*reset_subordinates)(struct pci_dev *pdev));
   594	
   595	bool pcie_wait_for_link(struct pci_dev *pdev, bool active);
   596	#ifdef CONFIG_PCIEASPM
   597	void pcie_aspm_init_link_state(struct pci_dev *pdev);
   598	void pcie_aspm_exit_link_state(struct pci_dev *pdev);
   599	void pcie_aspm_pm_state_change(struct pci_dev *pdev);
   600	void pcie_aspm_powersave_config_link(struct pci_dev *pdev);
   601	void pci_configure_ltr(struct pci_dev *pdev);
   602	void pci_save_ltr_state(struct pci_dev *dev);
   603	void pci_restore_ltr_state(struct pci_dev *dev);
   604	#else
   605	static inline void pcie_aspm_init_link_state(struct pci_dev *pdev) { }
   606	static inline void pcie_aspm_exit_link_state(struct pci_dev *pdev) { }
   607	static inline void pcie_aspm_pm_state_change(struct pci_dev *pdev) { }
   608	static inline void pcie_aspm_powersave_config_link(struct pci_dev *pdev) { }
   609	static inline void pci_configure_ltr(struct pci_dev *pdev) { }
 > 610	static inline void pci_save_ltr_state(struct pci_dev *dev); { }
   611	static inline void pci_restore_ltr_state(struct pci_dev *dev); { }
   612	#endif
   613	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

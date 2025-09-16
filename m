Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFAEC1A5B8F
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Sep 2025 13:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758028328; cv=none; b=Olok89AYAHXgnNX/vz17Um+YtCJiccr3lsjLpy3LP9DDan847V9LS3fmA6MkW4NSrQhxvhhwVrn+8bvy80kmvZ76fhiLxzSjbiIptagHQsKnkjIwAWIYMIrsGwGwMPss+c9BbASeZkhlWPpxkQVV+OeW5j6tv12uPTs+Z59yyro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758028328; c=relaxed/simple;
	bh=fal/nAYfVniOmy7nq5p95hFpTwJxWElkDshx65CgdKI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IT3Yvim4kKVyTTZJYaGibUHNGqBzXK03rG9hENFFjTGIk9PIFJk+UlEHHj1QPcuy4Ic9az/Nm2OZ0Kv3oMoF+uvXBXsiHw68LHgxlHG0x0lpzj2vSSlC7gqjql7QbmBZsGEytIBOHxTL/W+IV6tbY1imtAdfpTGVVpbPEFeynGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K19lgWxr; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K19lgWxr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758028326; x=1789564326;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fal/nAYfVniOmy7nq5p95hFpTwJxWElkDshx65CgdKI=;
  b=K19lgWxrMOgM6thwPdACYh0dxBhAuRw5QuQqPvMQ82trf7pwmOTAnEiR
   XURfSaeKb/TBKAF/w6wwB9Z4YStplXH2zoEacxMq4euDiCXD60mo9LsSP
   WW2Yd2Gf8V4ISVXYcA9ExGVg3QW4mH+rNKSj7Iz9D+qumNSXI+KJFhkwQ
   +2iri0bJFRUw0cGPJGE6BvE4E+fYJJlLQ7kfcYmSg1hF85/Q9zboucT3q
   QAeB1oT5WJEnxoL4MbkXw3ym+FuwynXfKNgvd24yKi6XL3uwlczkdSMdi
   I/LH/OG7AB/LRPiPcWUDT9+yCzQNsOX2h7ozoJiG2jph94LNWaXEjxECR
   w==;
X-CSE-ConnectionGUID: VPbXKVA0Q3Op7ceomoxCYw==
X-CSE-MsgGUID: prsvDuNfT4KG94SgGwdi+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11555"; a="60416369"
X-IronPort-AV: E=Sophos;i="6.18,269,1751266800"; 
   d="scan'208";a="60416369"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2025 06:12:05 -0700
X-CSE-ConnectionGUID: QFXWE9E4RdO50gp/89NoJw==
X-CSE-MsgGUID: ls3xdA86T+OnshIDpVmgkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,269,1751266800"; 
   d="scan'208";a="175716991"
Received: from lkp-server01.sh.intel.com (HELO 84a20bd60769) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 16 Sep 2025 06:12:04 -0700
Received: from kbuild by 84a20bd60769 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uyVTV-0000J9-2l;
	Tue, 16 Sep 2025 13:12:01 +0000
Date: Tue, 16 Sep 2025 21:11:31 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, Donald Dutile <ddutile@redhat.com>
Subject: [jgunthorpe:pcie_switch_groups 7/13] drivers/iommu/iommu.c:1512:34:
 warning: unused variable 'devfns'
Message-ID: <202509162120.dPKPWVKV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jgunthorpe/linux pcie_switch_groups
head:   359e58e015929f167700789bde9365e492d57b00
commit: 82200d264461e06d24e496a8b583e95995740170 [7/13] iommu: Compute iommu_groups properly for PCIe MFDs
config: i386-buildonly-randconfig-001-20250916 (https://download.01.org/0day-ci/archive/20250916/202509162120.dPKPWVKV-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250916/202509162120.dPKPWVKV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509162120.dPKPWVKV-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/iommu/iommu.c:24:
   include/linux/pci.h:866:9: warning: "/*" within comment [-Wcomment]
     866 |         /*
   include/linux/pci.h:871:9: warning: data definition has no type or storage class
     871 |         PCIE_ISOLATED,
         |         ^~~~~~~~~~~~~
   include/linux/pci.h:871:9: error: type defaults to 'int' in declaration of 'PCIE_ISOLATED' [-Wimplicit-int]
   include/linux/pci.h:876:9: error: type defaults to 'int' in declaration of 'PCIE_SWITCH_DSP_NON_ISOLATED' [-Wimplicit-int]
     876 |         PCIE_SWITCH_DSP_NON_ISOLATED,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/pci.h:878:9: error: type defaults to 'int' in declaration of 'PCIE_NON_ISOLATED' [-Wimplicit-int]
     878 |         PCIE_NON_ISOLATED,
         |         ^~~~~~~~~~~~~~~~~
   include/linux/pci.h:884:9: error: type defaults to 'int' in declaration of 'PCI_BUS_NON_ISOLATED' [-Wimplicit-int]
     884 |         PCI_BUS_NON_ISOLATED,
         |         ^~~~~~~~~~~~~~~~~~~~
   include/linux/pci.h:889:9: error: type defaults to 'int' in declaration of 'PCI_BRIDGE_NON_ISOLATED' [-Wimplicit-int]
     889 |         PCI_BRIDGE_NON_ISOLATED,
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/pci.h:890:1: error: expected identifier or '(' before '}' token
     890 | };
         | ^
   include/linux/pci.h:1280:35: warning: 'struct pci_reachable_set' declared inside parameter list will not be visible outside of this definition or declaration
    1280 |                            struct pci_reachable_set *devfns,
         |                                   ^~~~~~~~~~~~~~~~~
   drivers/iommu/iommu.c: In function 'pci_get_function_group':
   drivers/iommu/iommu.c:1512:34: error: storage size of 'devfns' isn't known
    1512 |         struct pci_reachable_set devfns;
         |                                  ^~~~~~
   In file included from include/linux/bitmap.h:11,
                    from include/linux/cpumask.h:12,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/mutex.h:17,
                    from include/linux/notifier.h:14,
                    from include/linux/clk.h:14,
                    from include/linux/amba/bus.h:14,
                    from drivers/iommu/iommu.c:9:
   include/linux/find.h:586:69: warning: left-hand operand of comma expression has no effect [-Wunused-value]
     586 |         for ((bit) = 0; (bit) = find_next_bit((addr), (size), (bit)), (bit) < (size); (bit)++)
         |                                                                     ^
   drivers/iommu/iommu.c:1540:9: note: in expansion of macro 'for_each_set_bit'
    1540 |         for_each_set_bit(devfn, devfns.devfns, NR_DEVFNS) {
         |         ^~~~~~~~~~~~~~~~
>> drivers/iommu/iommu.c:1512:34: warning: unused variable 'devfns' [-Wunused-variable]
    1512 |         struct pci_reachable_set devfns;
         |                                  ^~~~~~
   drivers/iommu/iommu.c: In function 'pci_device_group':
   drivers/iommu/iommu.c:1663:17: error: invalid use of undefined type 'enum pci_bus_isolation'
    1663 |         switch (pci_bus_isolated(pci_physfn(pdev)->bus)) {
         |                 ^~~~~~~~~~~~~~~~


vim +/devfns +1512 drivers/iommu/iommu.c

  1505	
  1506	/*
  1507	 * Return a group if the function has isolation restrictions related to
  1508	 * aliases or MFD ACS.
  1509	 */
  1510	static struct iommu_group *pci_get_function_group(struct pci_dev *pdev)
  1511	{
> 1512		struct pci_reachable_set devfns;
  1513		const unsigned int NR_DEVFNS = sizeof(devfns.devfns) * BITS_PER_BYTE;
  1514		unsigned int devfn;
  1515	
  1516		/*
  1517		 * Look for existing groups on device aliases and multi-function ACS. If
  1518		 * we alias another device or another device aliases us, use the same
  1519		 * group.
  1520		 *
  1521		 * pci_reachable_bus_set() should return the same bitmap if called for
  1522		 * any device in the set and we want all devices in the set to have the
  1523		 * same group.
  1524		 */
  1525		pci_reachable_bus_set(pdev, &devfns, pci_devs_are_same_group);
  1526		/* start is known to have iommu_group_get() == NULL */
  1527		__clear_bit(pdev->devfn, devfns.devfns);
  1528	
  1529		/*
  1530		 * When MFD functions are included in the set due to ACS we assume that
  1531		 * if ACS permits an internal loopback between functions it also permits
  1532		 * the loopback to go downstream if any function is a bridge.
  1533		 *
  1534		 * It is less clear what aliases mean when applied to a bridge. For now
  1535		 * be conservative and also propagate the group downstream.
  1536		 */
  1537		if (bitmap_empty(devfns.devfns, NR_DEVFNS))
  1538			return NULL;
  1539	
  1540		for_each_set_bit(devfn, devfns.devfns, NR_DEVFNS) {
  1541			struct iommu_group *group;
  1542			struct pci_dev *pdev_slot;
  1543	
  1544			pdev_slot = pci_get_slot(pdev->bus, devfn);
  1545			group = iommu_group_get(&pdev_slot->dev);
  1546			pci_dev_put(pdev_slot);
  1547			if (group) {
  1548				if (WARN_ON(!(group->bus_data &
  1549					      BUS_DATA_PCI_NON_ISOLATED)))
  1550					group->bus_data |= BUS_DATA_PCI_NON_ISOLATED;
  1551				return group;
  1552			}
  1553		}
  1554		return iommu_group_alloc_data(BUS_DATA_PCI_NON_ISOLATED);
  1555	}
  1556	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

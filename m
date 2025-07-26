Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60D6C19E968
	for <oe-kbuild-all@lists.linux.dev>; Sat, 26 Jul 2025 04:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753505111; cv=none; b=h7nHx9d8qwwEu9kqHe5KCmCdCPIvj85gzm7NB97sLGYR/SDY+t9nPYRNXgG6RsokES2+FiafbYlHYSwC0HkL6NC5ln3uR9j71RM2455t5iFH7fY1dKxTQm1nLIo5/s1PBcOtVysd2rbJ3jAWODhzJHIES5P7kld/qcIo4aq1V74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753505111; c=relaxed/simple;
	bh=TxqBeSRo2Mw1goOvku/w+9p1ilOgD8xv9mEvep0TlOM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pzxryGsuVeywIZ7xnzEomRKh4fmsH0QoAKiN4OR0M8cOSa8POqX3K1qsIIjlub4iBBx7q/GK7L8F45O9vtIpsyzDFNMNxs1y+xwa8GlizJSwUL+AhFywb+CLkVONUZhSe8KgMfEC8p6YNj7YTWkw3hyZ03p2NSgLgfi4lsSPmYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jqN0AxNd; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jqN0AxNd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753505109; x=1785041109;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TxqBeSRo2Mw1goOvku/w+9p1ilOgD8xv9mEvep0TlOM=;
  b=jqN0AxNd3gflYSeIONeWDn5P9IrT8aO3GQK7Tt7lKvhcLvU60w0OHhdR
   ockJ9TPrmXFP3tj4N4jMEnBNDGvNFoHYyxKYiE2fTGP3IAB6EHyGMtYV+
   UAm4g7/tpVa1Dj7xX2X4tOpnulhvlNOBNdf9YIwo5rmpzVwCoRL9bbe7d
   p/iEkVCdgRmKHnu5e6dIvqaZMqP/0hNNV/l22V24xCCSgmkmaGqbpJyBR
   Npkhh/AkhkKpcuB1Ls4g9zDPC7jFeEAT/EVUAZr1+99SvFjZzhP8NlxDG
   r7LyFVjCtyAcBer4xc/zbp+1utJVqXu4I+rmiJtdcUV0Gn0FmLmEGBdoF
   Q==;
X-CSE-ConnectionGUID: fUHlcisWRg2H2FZyKjoLww==
X-CSE-MsgGUID: U9pOzQUJT1aKkuMN5jhW1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11503"; a="66915246"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="66915246"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2025 21:45:08 -0700
X-CSE-ConnectionGUID: txCbtRbzQ9OYEZu6+jxsXg==
X-CSE-MsgGUID: V/ZF22nHRoub+awFDOUqag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="166703949"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by fmviesa004.fm.intel.com with ESMTP; 25 Jul 2025 21:45:07 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ufWmP-0000EF-0A;
	Sat, 26 Jul 2025 04:45:05 +0000
Date: Sat, 26 Jul 2025 06:44:52 +0200
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, Leon Romanovsky <leon@kernel.org>
Subject: [leon-rdma:rdma-next 90/112] drivers/iommu/iommu.c:1619:12: warning:
 assignment to 'struct pci_dev *' from 'int' makes pointer from integer
 without a cast
Message-ID: <202507260636.eeHS4uo9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git rdma-next
head:   aea452cc27ca9e5169f7279d7b524190c39e7260
commit: b6ad3735a7afc29ce93ff75fbd98aac2466749be [90/112] iommu: Compute iommu_groups properly for PCIe switches
config: arm-randconfig-2002-20250720 (https://download.01.org/0day-ci/archive/20250726/202507260636.eeHS4uo9-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250726/202507260636.eeHS4uo9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507260636.eeHS4uo9-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/iommu/iommu.c:24:
   include/linux/pci.h:2066:24: warning: no previous prototype for 'pci_bus_isolated' [-Wmissing-prototypes]
    enum pci_bus_isolation pci_bus_isolated(struct pci_bus *bus)
                           ^~~~~~~~~~~~~~~~
   include/linux/pci.h: In function 'pci_bus_isolated':
   include/linux/pci.h:2067:10: error: 'PCI_NON_ISOLATED' undeclared (first use in this function); did you mean 'PCIE_NON_ISOLATED'?
    { return PCI_NON_ISOLATED; }
             ^~~~~~~~~~~~~~~~
             PCIE_NON_ISOLATED
   include/linux/pci.h:2067:10: note: each undeclared identifier is reported only once for each function it appears in
   drivers/iommu/iommu.c: In function 'pci_device_group':
   drivers/iommu/iommu.c:1619:14: error: implicit declaration of function 'pci_real_dma_dev'; did you mean 'pci_alloc_dev'? [-Werror=implicit-function-declaration]
     real_pdev = pci_real_dma_dev(pdev);
                 ^~~~~~~~~~~~~~~~
                 pci_alloc_dev
>> drivers/iommu/iommu.c:1619:12: warning: assignment to 'struct pci_dev *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     real_pdev = pci_real_dma_dev(pdev);
               ^
   In file included from drivers/iommu/iommu.c:24:
   include/linux/pci.h: In function 'pci_bus_isolated':
   include/linux/pci.h:2067:1: warning: control reaches end of non-void function [-Wreturn-type]
    { return PCI_NON_ISOLATED; }
    ^
   cc1: some warnings being treated as errors


vim +1619 drivers/iommu/iommu.c

  1575	
  1576	/*
  1577	 * For legacy PCI we have two main considerations when forming groups:
  1578	 *
  1579	 *  1) In PCI we can loose the RID inside the fabric, or some devices will use
  1580	 *     the wrong RID. The PCI core calls this aliasing, but from an IOMMU
  1581	 *     perspective it means that a PCI device may have multiple RIDs and a
  1582	 *     single RID may represent many PCI devices. This effectively means all the
  1583	 *     aliases must share a translation, thus group, because the IOMMU cannot
  1584	 *     tell devices apart.
  1585	 *
  1586	 *  2) PCI permits a bus segment to claim an address even if the transaction
  1587	 *     originates from an end point not the CPU. When it happens it is called
  1588	 *     peer to peer. Claiming a transaction in the middle of the bus hierarchy
  1589	 *     bypasses the IOMMU translation. The IOMMU subsystem rules require these
  1590	 *     devices to be placed in the same group because they lack isolation from
  1591	 *     each other. In PCI Express the ACS system can be used to inhibit this and
  1592	 *     force transactions to go to the IOMMU.
  1593	 *
  1594	 *     From a PCI perspective any given PCI bus is either isolating or
  1595	 *     non-isolating. Isolating means downstream originated transactions always
  1596	 *     progress toward the CPU and do not go to other devices on the bus
  1597	 *     segment, while non-isolating means downstream originated transactions can
  1598	 *     progress back downstream through another device on the bus segment.
  1599	 *
  1600	 *     Beyond buses a multi-function device or bridge can also allow
  1601	 *     transactions to loop back internally from one function to another.
  1602	 *
  1603	 *     Once a PCI bus becomes non isolating the entire downstream hierarchy of
  1604	 *     that bus becomes a single group.
  1605	 */
  1606	struct iommu_group *pci_device_group(struct device *dev)
  1607	{
  1608		struct pci_dev *pdev = to_pci_dev(dev);
  1609		struct iommu_group *group;
  1610		struct pci_dev *real_pdev;
  1611	
  1612		if (WARN_ON(!dev_is_pci(dev)))
  1613			return ERR_PTR(-EINVAL);
  1614	
  1615		/*
  1616		 * Arches can supply a completely different PCI device that actually
  1617		 * does DMA.
  1618		 */
> 1619		real_pdev = pci_real_dma_dev(pdev);
  1620		if (real_pdev != pdev) {
  1621			group = iommu_group_get(&real_pdev->dev);
  1622			if (!group) {
  1623				/*
  1624				 * The real_pdev has not had an iommu probed to it. We
  1625				 * can't create a new group here because there is no way
  1626				 * for pci_device_group(real_pdev) to pick it up.
  1627				 */
  1628				dev_err(dev,
  1629					"PCI device is probing out of order, real device of %s is not probed yet\n",
  1630					pci_name(real_pdev));
  1631				return ERR_PTR(-EPROBE_DEFER);
  1632			}
  1633			return group;
  1634		}
  1635	
  1636		if (pdev->dev_flags & PCI_DEV_FLAGS_BRIDGE_XLATE_ROOT)
  1637			return iommu_group_alloc();
  1638	
  1639		/* Anything upstream of this enforcing non-isolated? */
  1640		group = pci_hierarchy_group(pdev);
  1641		if (group)
  1642			return group;
  1643	
  1644		switch (pci_bus_isolated(pdev->bus)) {
  1645		case PCIE_ISOLATED:
  1646			/* Check multi-function groups and same-bus devfn aliases */
  1647			group = pci_get_alias_group(pdev);
  1648			if (group)
  1649				return group;
  1650	
  1651			/* No shared group found, allocate new */
  1652			return iommu_group_alloc();
  1653	
  1654		/*
  1655		 * On legacy PCI there is no RID at an electrical level. On PCI-X the
  1656		 * RID of the bridge may be used in some cases instead of the
  1657		 * downstream's RID. This creates aliasing problems. PCI/PCI-X doesn't
  1658		 * provide isolation either. The end result is that as soon as we hit a
  1659		 * PCI/PCI-X bus we switch to non-isolated for the whole downstream for
  1660		 * both aliasing and isolation reasons. The bridge has to be included in
  1661		 * the group because of the aliasing.
  1662		 */
  1663		case PCI_BRIDGE_NON_ISOLATED:
  1664		/* A PCIe switch where the USP has MMIO and is not isolated. */
  1665		case PCIE_NON_ISOLATED:
  1666			group = iommu_group_get(&pdev->bus->self->dev);
  1667			if (WARN_ON(!group))
  1668				return ERR_PTR(-EINVAL);
  1669			/*
  1670			 * No need to be concerned with aliases here since we are going
  1671			 * to put the entire downstream tree in the bridge/USP's group.
  1672			 */
  1673			group->bus_data |= BUS_DATA_PCI_UNISOLATED;
  1674			return group;
  1675	
  1676		/*
  1677		 * It is a PCI bus and the upstream bridge/port does not alias or allow
  1678		 * P2P.
  1679		 */
  1680		case PCI_BUS_NON_ISOLATED:
  1681		/*
  1682		 * It is a PCIe switch and the DSP cannot reach the USP. The DSP's
  1683		 * are not isolated from each other and share a group.
  1684		 */
  1685		case PCIE_SWITCH_DSP_NON_ISOLATED: {
  1686			struct pci_dev *piter = NULL;
  1687	
  1688			/*
  1689			 * All the downstream devices on the bus share a group. If this
  1690			 * is a PCIe switch then they will all be DSPs
  1691			 */
  1692			for_each_pci_dev(piter) {
  1693				if (piter->bus != pdev->bus)
  1694					continue;
  1695				group = iommu_group_get(&piter->dev);
  1696				if (group) {
  1697					pci_dev_put(piter);
  1698					if (WARN_ON(!(group->bus_data &
  1699						      BUS_DATA_PCI_UNISOLATED)))
  1700						group->bus_data |=
  1701							BUS_DATA_PCI_UNISOLATED;
  1702					return group;
  1703				}
  1704			}
  1705	
  1706			group = iommu_group_alloc();
  1707			group->bus_data |= BUS_DATA_PCI_UNISOLATED;
  1708			return group;
  1709		}
  1710		default:
  1711			break;
  1712		}
  1713		WARN_ON(true);
  1714		return ERR_PTR(-EINVAL);
  1715	}
  1716	EXPORT_SYMBOL_GPL(pci_device_group);
  1717	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

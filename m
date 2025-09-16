Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69F862D6E64
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Sep 2025 11:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758022077; cv=none; b=ShOC60j5tYpGwkBZfI0d72PHRaQ+64064v0g3CD0qXNVoOf99DsvKWfNABOLopTTevLd3E6ESnTljttj2vNIQ0A6KcdhJjJOahDoR4aI/34aD7TewY4t+RWT3WdavZdsjwufXneL2GT6btjkiNJ6RXgjpix2BoR8JSFcrbh8MpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758022077; c=relaxed/simple;
	bh=Ul++FY4vTykYZeVsRUAzHo2ppNbjTjju+zhPNoEJav0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gXJFxvV7EizSjxX0Gq9kfSWil690gBF3A/2nEITmVkarO4oq40D3QiphP13Y6L6as/6MVjAUzidWO4DaigRWMppI5LWg6PaYxhQfSnZ8iNBnXUO0vIc3LbRLtdO97gu8pCGm2y6BsK/FjMRdQRnU3dG1uKbr4mXsrS+l27aKL40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AcJmdaGj; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AcJmdaGj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758022075; x=1789558075;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ul++FY4vTykYZeVsRUAzHo2ppNbjTjju+zhPNoEJav0=;
  b=AcJmdaGjHQz6YbxIh42BZArRh3E9CqW9vT8HAgnNM57ZXry9Oa4DWhBO
   LWQ9CY4lGf8gBE65xWJaNNigLfc4m+6n+EvvzwltwtMcJ+Jp51f50/egp
   A+LK3RGevyIclvuOJzaFJPcZ5s4AK4LL0vgiT9FNnfwU5f6EukhionCvi
   dF2UTF6RTmd3jt7sa1TOYJJvXEIjgQZ1i57NDZNqGAw5AOTT0+5Qqowg+
   2ZRcak+20bywhOZV382feNbUycA6Ft0cZGev3FamI7bwRgsCZkhI2qtdR
   qgYszR/kWsdxYC/oIM7+7l8gpWOaRYku8fcKAVnx2IruBmRL5IF+cRqWA
   g==;
X-CSE-ConnectionGUID: TCcte1PhRr+4BPlcgjWj/w==
X-CSE-MsgGUID: ctXcaHTnRMyNVdpQlUV8Fg==
X-IronPort-AV: E=McAfee;i="6800,10657,11554"; a="85736070"
X-IronPort-AV: E=Sophos;i="6.18,269,1751266800"; 
   d="scan'208";a="85736070"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2025 04:27:54 -0700
X-CSE-ConnectionGUID: xNvzwoHmTBqr7HgikMz4Hw==
X-CSE-MsgGUID: 5m18YeHaQ6qyPNkLXVekmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,269,1751266800"; 
   d="scan'208";a="175335577"
Received: from lkp-server01.sh.intel.com (HELO 84a20bd60769) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 16 Sep 2025 04:27:52 -0700
Received: from kbuild by 84a20bd60769 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uyTqg-0000Df-0F;
	Tue, 16 Sep 2025 11:27:50 +0000
Date: Tue, 16 Sep 2025 19:27:09 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, Donald Dutile <ddutile@redhat.com>
Subject: [jgunthorpe:pcie_switch_groups 6/13] include/linux/pci.h:866:9:
 warning: "/*" within comment
Message-ID: <202509161957.c3t4ec9Q-lkp@intel.com>
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
commit: 688297d25e0f7174014a30f873b36632eae65c38 [6/13] PCI: Add pci_reachable_bus_set()
config: i386-buildonly-randconfig-004-20250916 (https://download.01.org/0day-ci/archive/20250916/202509161957.c3t4ec9Q-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250916/202509161957.c3t4ec9Q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509161957.c3t4ec9Q-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/pci-p2pdma.h:14,
                    from kernel/dma/direct.c:16:
>> include/linux/pci.h:866:9: warning: "/*" within comment [-Wcomment]
     866 |         /*
>> include/linux/pci.h:871:9: warning: data definition has no type or storage class
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
>> include/linux/pci.h:2099:39: warning: 'struct pci_reachable_set' declared inside parameter list will not be visible outside of this definition or declaration
    2099 |         struct pci_dev *start, struct pci_reachable_set *devfns,
         |                                       ^~~~~~~~~~~~~~~~~
   include/linux/pci.h:2103:38: error: return type is an incomplete type
    2103 | static inline enum pci_bus_isolation pci_bus_isolated(struct pci_bus *bus)
         |                                      ^~~~~~~~~~~~~~~~
   include/linux/pci.h: In function 'pci_bus_isolated':
   include/linux/pci.h:2104:10: error: 'return' with a value, in function returning void [-Wreturn-mismatch]
    2104 | { return PCIE_NON_ISOLATED; }
         |          ^~~~~~~~~~~~~~~~~
   include/linux/pci.h:2103:38: note: declared here
    2103 | static inline enum pci_bus_isolation pci_bus_isolated(struct pci_bus *bus)
         |                                      ^~~~~~~~~~~~~~~~


vim +866 include/linux/pci.h

688297d25e0f71 Jason Gunthorpe 2025-06-26  864  
516f3934ddf718 Jason Gunthorpe 2025-06-27  865  enum pci_bus_isolation {
516f3934ddf718 Jason Gunthorpe 2025-06-27 @866  	/*
516f3934ddf718 Jason Gunthorpe 2025-06-27  867  	 * The bus is off a root port and the root port has isolated ACS flags
516f3934ddf718 Jason Gunthorpe 2025-06-27  868  	 * or the bus is part of a PCIe switch and the switch has isolated ACS
516f3934ddf718 Jason Gunthorpe 2025-06-27  869  	 * flags.
516f3934ddf718 Jason Gunthorpe 2025-06-27  870  	 */
516f3934ddf718 Jason Gunthorpe 2025-06-27 @871  	PCIE_ISOLATED,
516f3934ddf718 Jason Gunthorpe 2025-06-27  872  	/*
516f3934ddf718 Jason Gunthorpe 2025-06-27  873  	 * The switch's DSP's are not isolated from each other but are isolated
516f3934ddf718 Jason Gunthorpe 2025-06-27  874  	 * from the USP.
516f3934ddf718 Jason Gunthorpe 2025-06-27  875  	 */
516f3934ddf718 Jason Gunthorpe 2025-06-27  876  	PCIE_SWITCH_DSP_NON_ISOLATED,
516f3934ddf718 Jason Gunthorpe 2025-06-27  877  	/* The above and the USP's MMIO is not isolated. */
516f3934ddf718 Jason Gunthorpe 2025-06-27  878  	PCIE_NON_ISOLATED,
516f3934ddf718 Jason Gunthorpe 2025-06-27  879  	/*
516f3934ddf718 Jason Gunthorpe 2025-06-27  880  	 * A PCI/PCI-X bus, no isolation. This is like
516f3934ddf718 Jason Gunthorpe 2025-06-27  881  	 * PCIE_SWITCH_DSP_NON_ISOLATED in that the upstream bridge is isolated
516f3934ddf718 Jason Gunthorpe 2025-06-27  882  	 * from the bus. The bus itself may also have a shared alias of devfn=0.
516f3934ddf718 Jason Gunthorpe 2025-06-27  883  	 */
516f3934ddf718 Jason Gunthorpe 2025-06-27  884  	PCI_BUS_NON_ISOLATED,
516f3934ddf718 Jason Gunthorpe 2025-06-27  885  	/*
516f3934ddf718 Jason Gunthorpe 2025-06-27  886  	 * The above and the bridge's MMIO is not isolated and the bridge's RID
516f3934ddf718 Jason Gunthorpe 2025-06-27  887  	 * may be an alias.
516f3934ddf718 Jason Gunthorpe 2025-06-27  888  	 */
516f3934ddf718 Jason Gunthorpe 2025-06-27  889  	PCI_BRIDGE_NON_ISOLATED,
516f3934ddf718 Jason Gunthorpe 2025-06-27  890  };
f7625980f5820e Bjorn Helgaas   2013-11-14  891  

:::::: The code at line 866 was first introduced by commit
:::::: 516f3934ddf7189eb3e137e05ef645a5b9b8e83b PCI: Add pci_bus_isolated()

:::::: TO: Jason Gunthorpe <jgg@nvidia.com>
:::::: CC: Jason Gunthorpe <jgg@nvidia.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E9BA1D545
	for <oe-kbuild-all@lists.linux.dev>; Sat,  1 Jun 2024 20:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717275092; cv=none; b=lT2u5aW1EKeUzQg30qQFsDHU9iJ+Xzyh8FqEw4SQk3dUfAAzhddCgha/erVwAtv7dAXkw821xyD7J2GGYBqv3ak76pIUbcAFkqaZ5RIEq3l7Wd0lgFT7jbBFf3lhriALk3d4WRvQqtb2fhAU/zeQXt+wkDtEtcZ0M9mEMd3cB3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717275092; c=relaxed/simple;
	bh=ctt3VkbbQNeEQMMooYFjMLEOIjgUMNgAobUulcEe/oo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qfwt68p3suletK745cx1b1F5d/KLWWJ61NREnwe2qEi6zsCO3QJ7LzIpteasovbyeeUS6cgnPbtpCedIiA4k/StdZnuDZMpJnMarqXfhNxgM8Y5rwIXjR8m3I96pAZy9nLTqrM8MnaIQVx8UJQcG0yHbJpeoc7zYGwSbYp613mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bDOR5CpI; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bDOR5CpI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717275091; x=1748811091;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ctt3VkbbQNeEQMMooYFjMLEOIjgUMNgAobUulcEe/oo=;
  b=bDOR5CpIfFiQeHqMrre/I3SDk7+BaH+NUrVPdOX5zWUAFoAEk59NtcfS
   vkEu9w4/S+EOHd6alKdcJXc+wkLNZR0MDkhtSpmeZDEl7L7zWBzvfI7VA
   /+xMdeQSIRe0J26HXXEeTcuZZdTIg/FR2aYgJBRTWXSnSIO0yqJ5IY01B
   Ce47YqbiBrkEJ+jhBc65VyTIho9pNIdyZ1nO2/YezHyKuji66uWygJ77G
   UEBLXZ0CDQcKAw843hIv1EkVqxIXKyxf2GHfA9O9L2qyp8jDjomAmJdgO
   MKRLlQ0Qiz99AgpKrruX+mvzAhlLv5P0uOFjpIYJvATgYytHhMXanNnWm
   Q==;
X-CSE-ConnectionGUID: mwgZTgxuTGmG1tgjLB0dyg==
X-CSE-MsgGUID: j1hyrVfPSjWxfWCXOdc5Kg==
X-IronPort-AV: E=McAfee;i="6600,9927,11090"; a="13927899"
X-IronPort-AV: E=Sophos;i="6.08,208,1712646000"; 
   d="scan'208";a="13927899"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2024 13:51:30 -0700
X-CSE-ConnectionGUID: dasCn/WvS+yImuM6E2ai5Q==
X-CSE-MsgGUID: N8QQydWpSlSxEJq22/BIGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,208,1712646000"; 
   d="scan'208";a="37082327"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 01 Jun 2024 13:51:29 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sDVgw-000JKj-2d;
	Sat, 01 Jun 2024 20:51:17 +0000
Date: Sun, 2 Jun 2024 04:47:35 +0800
From: kernel test robot <lkp@intel.com>
To: Conor Dooley <conor+lkp@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [conor:pcie-fix-series 2/10]
 drivers/pci/controller/pcie-microchip-host.c:1003:39: warning: implicit
 conversion from 'unsigned long long' to 'size_t' (aka 'unsigned int')
 changes value from 4294967296 to 0
Message-ID: <202406020409.uVbpohfX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git pcie-fix-series
head:   a331ca5a235fb88ab207b09471b40e082fea9912
commit: 3ec01400bd0a58b64fcbf0bc190ea114dff2364f [2/10] PCI: microchip: Fix inbound address translation tables
config: i386-randconfig-052-20240602 (https://download.01.org/0day-ci/archive/20240602/202406020409.uVbpohfX-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240602/202406020409.uVbpohfX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406020409.uVbpohfX-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/pci/controller/pcie-microchip-host.c:1003:39: warning: implicit conversion from 'unsigned long long' to 'size_t' (aka 'unsigned int') changes value from 4294967296 to 0 [-Wconstant-conversion]
    1003 |                         mc_pcie_setup_inbound_atr(0, 0, 0, SZ_4G);
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~          ^~~~~
   include/linux/sizes.h:46:18: note: expanded from macro 'SZ_4G'
      46 | #define SZ_4G                           _AC(0x100000000, ULL)
         |                                         ^~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/const.h:21:18: note: expanded from macro '_AC'
      21 | #define _AC(X,Y)        __AC(X,Y)
         |                         ^~~~~~~~~
   include/uapi/linux/const.h:20:20: note: expanded from macro '__AC'
      20 | #define __AC(X,Y)       (X##Y)
         |                          ^~~~
   <scratch space>:48:1: note: expanded from here
      48 | 0x100000000ULL
         | ^~~~~~~~~~~~~~
   1 warning generated.


vim +1003 drivers/pci/controller/pcie-microchip-host.c

   964	
   965	static int mc_pcie_setup_inbound_ranges(struct platform_device *pdev, struct mc_pcie *port)
   966	{
   967		struct device *dev = &pdev->dev;
   968		struct device_node *dn = dev->of_node;
   969		struct of_range_parser parser;
   970		struct of_range range;
   971		int atr_index = 0;
   972	
   973		/*
   974		 * MPFS PCIe root port is 32-bit only, behind a Fabric Interface
   975		 * Controller FPGA logic block which contains the AXI-S interface.
   976		 *
   977		 * From the point of view of the PCIe root port, There are only
   978		 * two supported Root Port configurations
   979		 *
   980		 * Configuration 1: for use with fully coherent designs; supports a
   981		 * window from 0x0 (CPU space) to specified PCIe space.
   982		 *
   983		 * Configuration 2: for use with non-coherent designs; supports two
   984		 * 1 Gb wide windows to CPU space; one mapping cpu space 0 to pcie
   985		 * space 0x80000000 and mapping cpu space 0x40000000 to pcie
   986		 * space 0xc0000000. This cfg needs two windows because of how
   987		 * the MSI space is allocated in the AXI-S range on MPFS.
   988		 *
   989		 * The FIC interface outside the PCIe block *must* complete the inbound
   990		 * address translation as per MCHP MPFS FPGA design guidelines.
   991		 */
   992		if (device_property_read_bool(dev, "dma-noncoherent")) {
   993			/*
   994			 * Always need same two tables in this case.  Need two tables
   995			 * due to hardware interactions between address and size.
   996			 */
   997			mc_pcie_setup_inbound_atr(0, 0, MPFS_NC_BOUNCE_ADDR, SZ_1G);
   998			mc_pcie_setup_inbound_atr(1, SZ_1G, MPFS_NC_BOUNCE_ADDR + SZ_1G, SZ_1G);
   999		} else {
  1000			/* Find any dma-ranges */
  1001			if (of_pci_dma_range_parser_init(&parser, dn)) {
  1002				/* No dma-range property - setup default */
> 1003				mc_pcie_setup_inbound_atr(0, 0, 0, SZ_4G);
  1004				return 0;
  1005			}
  1006	
  1007			for_each_of_range(&parser, &range) {
  1008				if (atr_index >= MC_MAX_NUM_INBOUND_WINDOWS) {
  1009					dev_err(dev, "too many inbound ranges; %d available tables\n",
  1010						MC_MAX_NUM_INBOUND_WINDOWS);
  1011					return -EINVAL;
  1012				}
  1013				mc_pcie_setup_inbound_atr(atr_index, 0, range.pci_addr, range.size);
  1014				atr_index++;
  1015			}
  1016		}
  1017	
  1018		return 0;
  1019	}
  1020	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

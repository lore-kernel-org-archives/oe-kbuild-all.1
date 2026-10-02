Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB545347532
	for <oe-kbuild-all@lists.linux.dev>; Fri,  2 Oct 2026 03:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790912191; cv=none; b=qJ8Qus3j1J7tnN6r3P+rThrg/8L6Y721Fv3iO1uBjwPO1LMrR3JZ3f7nieZTuC+4qRriMXxiie8LzeQW5WZa18ug4DOSW3Btp6rxlCiZpUFDrOS4Q398I6AE94m/6n7cGAmil22uhgKOMCQqcCFNshq4lS7kllSFbjn+5I20szM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790912191; c=relaxed/simple;
	bh=nt/Fwh5GqCRFpngffiDcHc6iAqqlcY73ObFp6Cu/pU4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=T73aHfmlaY0YNTmo8Na6SfqSg+hkAwAHW/aVdytKiFweCGtf8lAUufTdZsGCPtanAuzAznG6ScJ2rJJ6XFpqg1X1WcKI1XMuJAMRae3SZ1icp2sas3qkMWrpXl28T8CaEaoUA+xk3K3h3ADSvpeaAxCKhZRsCTA7Xr7BWIHaIGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MwaraKJA; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MwaraKJA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790912189; x=1822448189;
  h=date:from:to:cc:subject:message-id;
  bh=nt/Fwh5GqCRFpngffiDcHc6iAqqlcY73ObFp6Cu/pU4=;
  b=MwaraKJAMu2Mgym2uy0/YrPubEKm4u23iCbw65dwE6aAAF2F/DhCRwN4
   mbzzoPB+Ub8RCi3lQZofW6IQkox35kpI/mO57ixKW6RbDSqIKxwvOIdS0
   ep2GESTa80MuJjtHBh63QfKbDQO4IW+aYEXt/GZbolKsqTzBpeQAZ8w/E
   3k0tjpKadoHWbIph9608WTdnGDYHAF94rl8mQa5XCwTnySaT7u618mVd9
   iUH9TxOiPKoQ3N8LUu24IijZlmaZo1aaFTpNFJmKZVPGdMe6ZmRcQu2Re
   BT7Dtyb45D72DnSkfURq/S12WNAiEnDw32XbdfuThRrqemsF0xTOOs5zW
   g==;
X-CSE-ConnectionGUID: nE0kGkyYSLSHn5pZ2+GgRQ==
X-CSE-MsgGUID: RAHxy9kXR32WCnWFtI99OA==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="90583095"
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; 
   d="scan'208";a="90583095"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 20:36:26 -0700
X-CSE-ConnectionGUID: ANtLPklJTjKJZfMZlU0Ppg==
X-CSE-MsgGUID: ad/m9Q++R0mwzi+li9wb5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; 
   d="scan'208";a="276216498"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 01 Oct 2026 20:36:24 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xCU4M-00000000Sc1-19mB;
	Fri, 02 Oct 2026 03:36:22 +0000
Date: Fri, 02 Oct 2026 11:35:52 +0800
From: kernel test robot <lkp@intel.com>
To: Alex Elder <elder@riscstar.com>
Cc: oe-kbuild-all@lists.linux.dev,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 Daniel Thompson <daniel@riscstar.com>
Subject: [char-misc:char-misc-testing 19/37] drivers/pci/of.c:783:12:
 error: assignment to 'struct device_node *' from 'int' makes pointer from
 integer without a cast
Message-ID: <202610021154.ObogJhHN-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.git char-misc-testing
head:   04434a1d0f311d76b1f15fa987918b471a0b8c6a
commit: 1304b0c47ef81cbd21e51ea0645a98104393ba49 [19/37] misc: tc9564: introduce base PCI driver
config: sparc-defconfig (https://download.01.org/0day-ci/archive/20261002/202610021154.ObogJhHN-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261002/202610021154.ObogJhHN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610021154.ObogJhHN-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/pci/of.c: In function 'of_pci_remove_node':
>> drivers/pci/of.c:740:9: error: implicit declaration of function 'of_changeset_revert' [-Wimplicit-function-declaration]
     740 |         of_changeset_revert(np->data);
         |         ^~~~~~~~~~~~~~~~~~~
>> drivers/pci/of.c:741:9: error: implicit declaration of function 'of_changeset_destroy' [-Wimplicit-function-declaration]
     741 |         of_changeset_destroy(np->data);
         |         ^~~~~~~~~~~~~~~~~~~~
   drivers/pci/of.c: In function 'of_pci_make_dev_node':
>> drivers/pci/of.c:781:9: error: implicit declaration of function 'of_changeset_init' [-Wimplicit-function-declaration]
     781 |         of_changeset_init(cset);
         |         ^~~~~~~~~~~~~~~~~
>> drivers/pci/of.c:783:14: error: implicit declaration of function 'of_changeset_create_node' [-Wimplicit-function-declaration]
     783 |         np = of_changeset_create_node(cset, ppnode, name);
         |              ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/pci/of.c:783:12: error: assignment to 'struct device_node *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     783 |         np = of_changeset_create_node(cset, ppnode, name);
         |            ^
>> drivers/pci/of.c:791:15: error: implicit declaration of function 'of_changeset_apply' [-Wimplicit-function-declaration]
     791 |         ret = of_changeset_apply(cset);
         |               ^~~~~~~~~~~~~~~~~~
   drivers/pci/of.c: In function 'of_pci_make_host_bridge_node':
   drivers/pci/of.c:871:12: error: assignment to 'struct device_node *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     871 |         np = of_changeset_create_node(cset, of_root, name);
         |            ^
--
   drivers/pci/of_property.c: In function 'of_pci_prop_bus_range':
>> drivers/pci/of_property.c:105:16: error: implicit declaration of function 'of_changeset_add_prop_u32_array' [-Wimplicit-function-declaration]
     105 |         return of_changeset_add_prop_u32_array(ocs, np, "bus-range", bus_range,
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pci/of_property.c: In function 'of_pci_prop_interrupts':
>> drivers/pci/of_property.c:191:16: error: implicit declaration of function 'of_changeset_add_prop_u32' [-Wimplicit-function-declaration]
     191 |         return of_changeset_add_prop_u32(ocs, np, "interrupts", (u32)pin);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pci/of_property.c: In function 'of_pci_prop_intr_ctrl':
>> drivers/pci/of_property.c:211:16: error: implicit declaration of function 'of_changeset_add_prop_bool' [-Wimplicit-function-declaration]
     211 |         return of_changeset_add_prop_bool(ocs, np, "interrupt-controller");
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pci/of_property.c: In function 'of_pci_prop_compatible':
>> drivers/pci/of_property.c:348:15: error: implicit declaration of function 'of_changeset_add_prop_string_array' [-Wimplicit-function-declaration]
     348 |         ret = of_changeset_add_prop_string_array(ocs, np, "compatible",
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pci/of_property.c: In function 'of_pci_add_properties':
>> drivers/pci/of_property.c:366:23: error: implicit declaration of function 'of_changeset_add_prop_string' [-Wimplicit-function-declaration]
     366 |                 ret = of_changeset_add_prop_string(ocs, np, "device_type",
         |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PCI_DYNAMIC_OF_NODES
   Depends on [n]: PCI [=y] && OF_IRQ [=n]
   Selected by [m]:
   - TC9564_PCI [=m] && OF [=y] && PCI [=y]


vim +783 drivers/pci/of.c

407d1a51921e9f2 Lizhi Hou      2023-08-15  730  
407d1a51921e9f2 Lizhi Hou      2023-08-15  731  void of_pci_remove_node(struct pci_dev *pdev)
407d1a51921e9f2 Lizhi Hou      2023-08-15  732  {
407d1a51921e9f2 Lizhi Hou      2023-08-15  733  	struct device_node *np;
407d1a51921e9f2 Lizhi Hou      2023-08-15  734  
407d1a51921e9f2 Lizhi Hou      2023-08-15  735  	np = pci_device_to_OF_node(pdev);
407d1a51921e9f2 Lizhi Hou      2023-08-15  736  	if (!np || !of_node_check_flag(np, OF_DYNAMIC))
407d1a51921e9f2 Lizhi Hou      2023-08-15  737  		return;
407d1a51921e9f2 Lizhi Hou      2023-08-15  738  
e2267841fe26d45 Herve Codina   2025-02-24  739  	device_remove_of_node(&pdev->dev);
407d1a51921e9f2 Lizhi Hou      2023-08-15 @740  	of_changeset_revert(np->data);
407d1a51921e9f2 Lizhi Hou      2023-08-15 @741  	of_changeset_destroy(np->data);
407d1a51921e9f2 Lizhi Hou      2023-08-15  742  	of_node_put(np);
407d1a51921e9f2 Lizhi Hou      2023-08-15  743  }
407d1a51921e9f2 Lizhi Hou      2023-08-15  744  
407d1a51921e9f2 Lizhi Hou      2023-08-15  745  void of_pci_make_dev_node(struct pci_dev *pdev)
407d1a51921e9f2 Lizhi Hou      2023-08-15  746  {
407d1a51921e9f2 Lizhi Hou      2023-08-15  747  	struct device_node *ppnode, *np = NULL;
407d1a51921e9f2 Lizhi Hou      2023-08-15  748  	const char *pci_type;
407d1a51921e9f2 Lizhi Hou      2023-08-15  749  	struct of_changeset *cset;
407d1a51921e9f2 Lizhi Hou      2023-08-15  750  	const char *name;
407d1a51921e9f2 Lizhi Hou      2023-08-15  751  	int ret;
407d1a51921e9f2 Lizhi Hou      2023-08-15  752  
407d1a51921e9f2 Lizhi Hou      2023-08-15  753  	/*
407d1a51921e9f2 Lizhi Hou      2023-08-15  754  	 * If there is already a device tree node linked to this device,
407d1a51921e9f2 Lizhi Hou      2023-08-15  755  	 * return immediately.
407d1a51921e9f2 Lizhi Hou      2023-08-15  756  	 */
407d1a51921e9f2 Lizhi Hou      2023-08-15  757  	if (pci_device_to_OF_node(pdev))
407d1a51921e9f2 Lizhi Hou      2023-08-15  758  		return;
407d1a51921e9f2 Lizhi Hou      2023-08-15  759  
407d1a51921e9f2 Lizhi Hou      2023-08-15  760  	/* Check if there is device tree node for parent device */
407d1a51921e9f2 Lizhi Hou      2023-08-15  761  	if (!pdev->bus->self)
407d1a51921e9f2 Lizhi Hou      2023-08-15  762  		ppnode = pdev->bus->dev.of_node;
407d1a51921e9f2 Lizhi Hou      2023-08-15  763  	else
407d1a51921e9f2 Lizhi Hou      2023-08-15  764  		ppnode = pdev->bus->self->dev.of_node;
407d1a51921e9f2 Lizhi Hou      2023-08-15  765  	if (!ppnode)
407d1a51921e9f2 Lizhi Hou      2023-08-15  766  		return;
407d1a51921e9f2 Lizhi Hou      2023-08-15  767  
407d1a51921e9f2 Lizhi Hou      2023-08-15  768  	if (pci_is_bridge(pdev))
407d1a51921e9f2 Lizhi Hou      2023-08-15  769  		pci_type = "pci";
407d1a51921e9f2 Lizhi Hou      2023-08-15  770  	else
407d1a51921e9f2 Lizhi Hou      2023-08-15  771  		pci_type = "dev";
407d1a51921e9f2 Lizhi Hou      2023-08-15  772  
407d1a51921e9f2 Lizhi Hou      2023-08-15  773  	name = kasprintf(GFP_KERNEL, "%s@%x,%x", pci_type,
407d1a51921e9f2 Lizhi Hou      2023-08-15  774  			 PCI_SLOT(pdev->devfn), PCI_FUNC(pdev->devfn));
407d1a51921e9f2 Lizhi Hou      2023-08-15  775  	if (!name)
407d1a51921e9f2 Lizhi Hou      2023-08-15  776  		return;
407d1a51921e9f2 Lizhi Hou      2023-08-15  777  
bf4afc53b77aeaa Linus Torvalds 2026-02-21  778  	cset = kmalloc_obj(*cset);
407d1a51921e9f2 Lizhi Hou      2023-08-15  779  	if (!cset)
f69977404700a3d Lizhi Hou      2023-09-29  780  		goto out_free_name;
407d1a51921e9f2 Lizhi Hou      2023-08-15 @781  	of_changeset_init(cset);
407d1a51921e9f2 Lizhi Hou      2023-08-15  782  
407d1a51921e9f2 Lizhi Hou      2023-08-15 @783  	np = of_changeset_create_node(cset, ppnode, name);
407d1a51921e9f2 Lizhi Hou      2023-08-15  784  	if (!np)
f69977404700a3d Lizhi Hou      2023-09-29  785  		goto out_destroy_cset;
407d1a51921e9f2 Lizhi Hou      2023-08-15  786  
407d1a51921e9f2 Lizhi Hou      2023-08-15  787  	ret = of_pci_add_properties(pdev, cset, np);
407d1a51921e9f2 Lizhi Hou      2023-08-15  788  	if (ret)
f69977404700a3d Lizhi Hou      2023-09-29  789  		goto out_free_node;
407d1a51921e9f2 Lizhi Hou      2023-08-15  790  
407d1a51921e9f2 Lizhi Hou      2023-08-15 @791  	ret = of_changeset_apply(cset);
407d1a51921e9f2 Lizhi Hou      2023-08-15  792  	if (ret)
f69977404700a3d Lizhi Hou      2023-09-29  793  		goto out_free_node;
407d1a51921e9f2 Lizhi Hou      2023-08-15  794  
f69977404700a3d Lizhi Hou      2023-09-29  795  	np->data = cset;
e2267841fe26d45 Herve Codina   2025-02-24  796  
e2267841fe26d45 Herve Codina   2025-02-24  797  	ret = device_add_of_node(&pdev->dev, np);
e2267841fe26d45 Herve Codina   2025-02-24  798  	if (ret)
e2267841fe26d45 Herve Codina   2025-02-24  799  		goto out_revert_cset;
e2267841fe26d45 Herve Codina   2025-02-24  800  
407d1a51921e9f2 Lizhi Hou      2023-08-15  801  	kfree(name);
407d1a51921e9f2 Lizhi Hou      2023-08-15  802  
407d1a51921e9f2 Lizhi Hou      2023-08-15  803  	return;
407d1a51921e9f2 Lizhi Hou      2023-08-15  804  
e2267841fe26d45 Herve Codina   2025-02-24  805  out_revert_cset:
e2267841fe26d45 Herve Codina   2025-02-24  806  	np->data = NULL;
e2267841fe26d45 Herve Codina   2025-02-24  807  	of_changeset_revert(cset);
f69977404700a3d Lizhi Hou      2023-09-29  808  out_free_node:
407d1a51921e9f2 Lizhi Hou      2023-08-15  809  	of_node_put(np);
f69977404700a3d Lizhi Hou      2023-09-29  810  out_destroy_cset:
f69977404700a3d Lizhi Hou      2023-09-29  811  	of_changeset_destroy(cset);
f69977404700a3d Lizhi Hou      2023-09-29  812  	kfree(cset);
f69977404700a3d Lizhi Hou      2023-09-29  813  out_free_name:
407d1a51921e9f2 Lizhi Hou      2023-08-15  814  	kfree(name);
407d1a51921e9f2 Lizhi Hou      2023-08-15  815  }
1f340724419eda8 Herve Codina   2025-02-24  816  

:::::: The code at line 783 was first introduced by commit
:::::: 407d1a51921e9f28c1bcec647c2205925bd1fdab PCI: Create device tree node for bridge

:::::: TO: Lizhi Hou <lizhi.hou@amd.com>
:::::: CC: Rob Herring <robh@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

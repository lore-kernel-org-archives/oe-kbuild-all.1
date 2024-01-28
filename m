Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7781F2EB14
	for <oe-kbuild-all@lists.linux.dev>; Sun, 28 Jan 2024 19:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706471684; cv=none; b=Haq9sOU9+cVyPAU3KfOuJGDAq3F0Djlfl2QYID5DtXi/EI2fYzB4NHHrHmeVCjzT5FD1GhKcsTllUOAnCxIC6iwEnqsmFXzPXll7nusPtC4kbX94CQlUBI54p0q1ya4cSqO0dxMx9aGSP37KoGq7+Y8tvY0x5k5bwWHzgdLgcro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706471684; c=relaxed/simple;
	bh=Abbh7y5lHQRqOPIe9zB59OzHUUaZCsBwZtJ7vnlUeKE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=m/nNEhxP28jePlZkljXxGhVb2rPMlPCv3baI33fHkPharhHU1y6N8sa4d69ot/2giZLQ/89OS4WUz18YkmPtnBF3+XSIdOKqOB9fCz9OEZrxTO94Sceh70VLs3edDDX25rBcYku2Pe5bwZy208v0fTw3jh24fwyonZnNOIUbOs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MIfDMU3E; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MIfDMU3E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706471682; x=1738007682;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Abbh7y5lHQRqOPIe9zB59OzHUUaZCsBwZtJ7vnlUeKE=;
  b=MIfDMU3EpAxSg0bmCh5tvR/tm6PNu3c+ADbXii3CCPbTXMLiL1JqwRrZ
   dCQGSDMemwuZB96rbKgz36BpFFetsDZQAn2/7uE8xH9ynIijA29sUg0x2
   AwCmfoB4DeG9E4QTTLnqLXla0ztbFSVwHQtQfMg1Vzb1kcc+CEEIrAINc
   dRma/AhTCUr+Q2oVupyw2JDNwft079YfV9QbSuum0QCx9w4THJk5cLcip
   6j1WzkHStvcpsvi6tQieAG5bE14uF7d3Y1JLA/SxeWUaBUwNywK9lFcoS
   3ZfPMDSGaBvUMLDyFeDYT/Z3i59sEFxdJPj3OY6Eqg8gEGqBynms4fRc1
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10967"; a="16158912"
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="16158912"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2024 11:54:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="3181776"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 28 Jan 2024 11:54:40 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rUBEj-0003ic-25;
	Sun, 28 Jan 2024 19:54:37 +0000
Date: Mon, 29 Jan 2024 03:53:38 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:5.10-main 9/25133] drivers/pci/probe.c:929:39:
 error: 'struct device' has no member named 'msi_domain'; did you mean
 'pm_domain'?
Message-ID: <202401290309.reFWgZvI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 5.10-main
head:   5dec1c9a6ec6bf420730bba9cc9baff4f5327361
commit: aae45a226341c84a12b431abb7904bb39cac53c2 [9/25133] pci: fix MSI issue part 2
config: i386-randconfig-012-20240128 (https://download.01.org/0day-ci/archive/20240129/202401290309.reFWgZvI-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240129/202401290309.reFWgZvI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401290309.reFWgZvI-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/pci/probe.c: In function 'pci_register_host_bridge':
>> drivers/pci/probe.c:929:39: error: 'struct device' has no member named 'msi_domain'; did you mean 'pm_domain'?
         (bridge->msi_domain && !bus->dev.msi_domain))
                                          ^~~~~~~~~~
                                          pm_domain


vim +929 drivers/pci/probe.c

   903	
   904		b = pci_find_bus(pci_domain_nr(bus), bridge->busnr);
   905		if (b) {
   906			/* Ignore it if we already got here via a different bridge */
   907			dev_dbg(&b->dev, "bus already known\n");
   908			err = -EEXIST;
   909			goto free;
   910		}
   911	
   912		dev_set_name(&bridge->dev, "pci%04x:%02x", pci_domain_nr(bus),
   913			     bridge->busnr);
   914	
   915		err = pcibios_root_bridge_prepare(bridge);
   916		if (err)
   917			goto free;
   918	
   919		err = device_add(&bridge->dev);
   920		if (err) {
   921			put_device(&bridge->dev);
   922			goto free;
   923		}
   924		bus->bridge = get_device(&bridge->dev);
   925		device_enable_async_suspend(bus->bridge);
   926		pci_set_bus_of_node(bus);
   927		pci_set_bus_msi_domain(bus);
   928		if (bridge->no_msi ||
 > 929		    (bridge->msi_domain && !bus->dev.msi_domain))
   930			bus->bus_flags |= PCI_BUS_FLAGS_NO_MSI;
   931	
   932		if (!parent)
   933			set_dev_node(bus->bridge, pcibus_to_node(bus));
   934	
   935		bus->dev.class = &pcibus_class;
   936		bus->dev.parent = bus->bridge;
   937	
   938		dev_set_name(&bus->dev, "%04x:%02x", pci_domain_nr(bus), bus->number);
   939		name = dev_name(&bus->dev);
   940	
   941		err = device_register(&bus->dev);
   942		if (err)
   943			goto unregister;
   944	
   945		pcibios_add_bus(bus);
   946	
   947		if (bus->ops->add_bus) {
   948			err = bus->ops->add_bus(bus);
   949			if (WARN_ON(err < 0))
   950				dev_err(&bus->dev, "failed to add bus: %d\n", err);
   951		}
   952	
   953		/* Create legacy_io and legacy_mem files for this bus */
   954		pci_create_legacy_files(bus);
   955	
   956		if (parent)
   957			dev_info(parent, "PCI host bridge to bus %s\n", name);
   958		else
   959			pr_info("PCI host bridge to bus %s\n", name);
   960	
   961		if (nr_node_ids > 1 && pcibus_to_node(bus) == NUMA_NO_NODE)
   962			dev_warn(&bus->dev, "Unknown NUMA node; performance will be reduced\n");
   963	
   964		/* Add initial resources to the bus */
   965		resource_list_for_each_entry_safe(window, n, &resources) {
   966			list_move_tail(&window->node, &bridge->windows);
   967			offset = window->offset;
   968			res = window->res;
   969	
   970			if (res->flags & IORESOURCE_BUS)
   971				pci_bus_insert_busn_res(bus, bus->number, res->end);
   972			else
   973				pci_bus_add_resource(bus, res, 0);
   974	
   975			if (offset) {
   976				if (resource_type(res) == IORESOURCE_IO)
   977					fmt = " (bus address [%#06llx-%#06llx])";
   978				else
   979					fmt = " (bus address [%#010llx-%#010llx])";
   980	
   981				snprintf(addr, sizeof(addr), fmt,
   982					 (unsigned long long)(res->start - offset),
   983					 (unsigned long long)(res->end - offset));
   984			} else
   985				addr[0] = '\0';
   986	
   987			dev_info(&bus->dev, "root bus resource %pR%s\n", res, addr);
   988		}
   989	
   990		down_write(&pci_bus_sem);
   991		list_add_tail(&bus->node, &pci_root_buses);
   992		up_write(&pci_bus_sem);
   993	
   994		return 0;
   995	
   996	unregister:
   997		put_device(&bridge->dev);
   998		device_del(&bridge->dev);
   999	
  1000	free:
  1001		kfree(bus);
  1002		return err;
  1003	}
  1004	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 560D27C
	for <oe-kbuild-all@lists.linux.dev>; Sat,  6 May 2023 09:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683364630; x=1714900630;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=POQxPUI7Rf8AvBlzLy4y8JvX6KfeTIaB7NKDsmjqh9A=;
  b=KAtFAmMA2VuguWfZ8AhehZqFQUYfOaatyLC/vmKaBDjmsuY9WtWwHBem
   AeBHMdBlgvEaI1krngz8lCFGOfN5Ctlqb8VaT9G+6DxyyDPP+YTLhMVh1
   wIyIT8TChBnQ/D2m8fh9qAzoi59FUvhIdy7AUUI0MrTAQ7BjYtLC0QWA/
   NanwmgspEUlkoyeO7jMC8RCv1TyO4RY4gRdYdx5vpaAETJ4ijm95MRuQ/
   h6Juoseu5jZUDhZ/X0W113RnXffL/tp5RazyaffPJP0rg6+aV6smO/Qvu
   DFr+YW6onclNf7XeyONiYD+WwCLTMNXUQG5NLZid/AT/8JkotquC3HH14
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10701"; a="349398358"
X-IronPort-AV: E=Sophos;i="5.99,254,1677571200"; 
   d="scan'208";a="349398358"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2023 02:17:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10701"; a="822044135"
X-IronPort-AV: E=Sophos;i="5.99,254,1677571200"; 
   d="scan'208";a="822044135"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 06 May 2023 02:17:07 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pvE2M-00005l-2m;
	Sat, 06 May 2023 09:17:06 +0000
Date: Sat, 6 May 2023 17:16:48 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: oe-kbuild-all@lists.linux.dev, Sasha Levin <sashal@kernel.org>,
	Bjorn Helgaas <helgaas@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [linux-stable-rc:queue/5.4 9/26]
 drivers/pci/hotplug/pciehp_pci.c:73:49: error: 'struct controller' has no
 member named 'depth'
Message-ID: <202305061744.WUfxTieI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git queue/5.4
head:   7e4ab664280ce88c69fad5875e49d02c7c4cf810
commit: 0abbecb869f2627caa08d3d6b7cc7f1472b8b4a9 [9/26] PCI: pciehp: Fix AB-BA deadlock between reset_lock and device_lock
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20230506/202305061744.WUfxTieI-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/commit/?id=0abbecb869f2627caa08d3d6b7cc7f1472b8b4a9
        git remote add linux-stable-rc https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
        git fetch --no-tags linux-stable-rc queue/5.4
        git checkout 0abbecb869f2627caa08d3d6b7cc7f1472b8b4a9
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash drivers/pci/hotplug/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305061744.WUfxTieI-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/pci/hotplug/pciehp_pci.c: In function 'pciehp_configure_device':
>> drivers/pci/hotplug/pciehp_pci.c:73:49: error: 'struct controller' has no member named 'depth'
      73 |         down_read_nested(&ctrl->reset_lock, ctrl->depth);
         |                                                 ^~
   drivers/pci/hotplug/pciehp_pci.c: In function 'pciehp_unconfigure_device':
   drivers/pci/hotplug/pciehp_pci.c:121:57: error: 'struct controller' has no member named 'depth'
     121 |                 down_read_nested(&ctrl->reset_lock, ctrl->depth);
         |                                                         ^~


vim +73 drivers/pci/hotplug/pciehp_pci.c

    23	
    24	/**
    25	 * pciehp_configure_device() - enumerate PCI devices below a hotplug bridge
    26	 * @ctrl: PCIe hotplug controller
    27	 *
    28	 * Enumerate PCI devices below a hotplug bridge and add them to the system.
    29	 * Return 0 on success, %-EEXIST if the devices are already enumerated or
    30	 * %-ENODEV if enumeration failed.
    31	 */
    32	int pciehp_configure_device(struct controller *ctrl)
    33	{
    34		struct pci_dev *dev;
    35		struct pci_dev *bridge = ctrl->pcie->port;
    36		struct pci_bus *parent = bridge->subordinate;
    37		int num, ret = 0;
    38	
    39		pci_lock_rescan_remove();
    40	
    41		dev = pci_get_slot(parent, PCI_DEVFN(0, 0));
    42		if (dev) {
    43			/*
    44			 * The device is already there. Either configured by the
    45			 * boot firmware or a previous hotplug event.
    46			 */
    47			ctrl_dbg(ctrl, "Device %s already exists at %04x:%02x:00, skipping hot-add\n",
    48				 pci_name(dev), pci_domain_nr(parent), parent->number);
    49			pci_dev_put(dev);
    50			ret = -EEXIST;
    51			goto out;
    52		}
    53	
    54		num = pci_scan_slot(parent, PCI_DEVFN(0, 0));
    55		if (num == 0) {
    56			ctrl_err(ctrl, "No new device found\n");
    57			ret = -ENODEV;
    58			goto out;
    59		}
    60	
    61		for_each_pci_bridge(dev, parent)
    62			pci_hp_add_bridge(dev);
    63	
    64		pci_assign_unassigned_bridge_resources(bridge);
    65		pcie_bus_configure_settings(parent);
    66	
    67		/*
    68		 * Release reset_lock during driver binding
    69		 * to avoid AB-BA deadlock with device_lock.
    70		 */
    71		up_read(&ctrl->reset_lock);
    72		pci_bus_add_devices(parent);
  > 73		down_read_nested(&ctrl->reset_lock, ctrl->depth);
    74	
    75	 out:
    76		pci_unlock_rescan_remove();
    77		return ret;
    78	}
    79	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

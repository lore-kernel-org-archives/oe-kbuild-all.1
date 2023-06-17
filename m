Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D012636
	for <oe-kbuild-all@lists.linux.dev>; Sat, 17 Jun 2023 02:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686970151; x=1718506151;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JeHJD950M6yuXb6mwy4z5Mx9/VJF6OSE4Ji+YDaScTY=;
  b=OFccbVsORfTd/fP1u1B6lKWQrpE4u7RMNgIt7S3Q5d5AxtdF3vE1ZQ7E
   /TIHc/r02wltGJ9YzE/sHEyMaBwk88oslA7QxliHg+Dhje70jLRYMPvNu
   cLXMB2baBOxJwXF1gIXkl+jnyEabHSQ5CQrKRAhzDyOmyXNERWtXC7FGa
   Xnlz4JFfq4KGKSPinYaOqv0mbtYuJclFeOHjKabEu7Jjen6isCN4LrUIo
   NZ8tH5eUDqNQIHST+dmdF81g51ZL01e6mp4ZOHlSLL6oZIxPfFlKVWToM
   4++A7EOD2o6NI6qW4clzDkjzGUFh3fYXpP5UusMsBkKCGFY6opuX2wwlK
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10743"; a="349064196"
X-IronPort-AV: E=Sophos;i="6.00,249,1681196400"; 
   d="scan'208";a="349064196"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2023 19:49:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10743"; a="837228092"
X-IronPort-AV: E=Sophos;i="6.00,249,1681196400"; 
   d="scan'208";a="837228092"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 16 Jun 2023 19:49:08 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qALzv-000288-12;
	Sat, 17 Jun 2023 02:49:07 +0000
Date: Sat, 17 Jun 2023 10:48:18 +0800
From: kernel test robot <lkp@intel.com>
To: Vincent Whitchurch <vincent.whitchurch@axis.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Richard Weinberger <richard@nod.at>
Subject: arch/um/drivers/virt-pci.c:537:21: warning: no previous prototype
 for 'pcibios_get_phb_of_node'
Message-ID: <202306171053.SOGnteNi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   1639fae5132bc8a904af28d97cea0bedb3af802e
commit: 314a1408b79a844dafdcde867d90de5d509409b7 um: virt-pci: implement pcibios_get_phb_of_node()
date:   4 months ago
config: um-randconfig-r026-20230617 (https://download.01.org/0day-ci/archive/20230617/202306171053.SOGnteNi-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230617/202306171053.SOGnteNi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306171053.SOGnteNi-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/um/drivers/virt-pci.c:537:21: warning: no previous prototype for 'pcibios_get_phb_of_node' [-Wmissing-prototypes]
     537 | struct device_node *pcibios_get_phb_of_node(struct pci_bus *bus)
         |                     ^~~~~~~~~~~~~~~~~~~~~~~


vim +/pcibios_get_phb_of_node +537 arch/um/drivers/virt-pci.c

   535	
   536	/* Copied from arch/x86/kernel/devicetree.c */
 > 537	struct device_node *pcibios_get_phb_of_node(struct pci_bus *bus)
   538	{
   539		struct device_node *np;
   540	
   541		for_each_node_by_type(np, "pci") {
   542			const void *prop;
   543			unsigned int bus_min;
   544	
   545			prop = of_get_property(np, "bus-range", NULL);
   546			if (!prop)
   547				continue;
   548			bus_min = be32_to_cpup(prop);
   549			if (bus->number == bus_min)
   550				return np;
   551		}
   552		return NULL;
   553	}
   554	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

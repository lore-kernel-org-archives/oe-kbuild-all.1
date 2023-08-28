Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51FDA7ED
	for <oe-kbuild-all@lists.linux.dev>; Mon, 28 Aug 2023 05:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693199996; x=1724735996;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3Wmb9qRrBEQjBTOJC7WCppmDVzjriaFUG415qA3WNC0=;
  b=B6JR0U+PmP/JeKdRYRDO2UKWT1GorkSV3sopFswgTVVy84kK3oYVtGMn
   N+2rC/Zu60kpeQPDVQWO+VGv68yIFZwaD8IgPc64Yg70/up/6ymNWN71N
   Z8bb+zXA1aZuavlNF8B5Yfvi8YMT0BgspUPOFmpUZjhaflNPfZd7NeKtf
   CntkUx4x6ZCHndlVF+FcKhgQOaRPxEumRNdO0zPsHfNLCuC7bYPd0nXlI
   Rzs234K0LSsLnQR+r5CDAq31qBZXyr7HQEVO8TsLzyTGeKWa3koMf1R0h
   vos0kdrMYqJQ+FXnLrYKj2J1AQupHlhKumnUShBRj2MN3EGuYoDB30sd0
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10815"; a="354537780"
X-IronPort-AV: E=Sophos;i="6.02,206,1688454000"; 
   d="scan'208";a="354537780"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2023 22:19:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10815"; a="911909919"
X-IronPort-AV: E=Sophos;i="6.02,206,1688454000"; 
   d="scan'208";a="911909919"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 27 Aug 2023 22:19:53 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qaUfE-0007aZ-2W;
	Mon, 28 Aug 2023 05:19:49 +0000
Date: Mon, 28 Aug 2023 13:19:20 +0800
From: kernel test robot <lkp@intel.com>
To: Kishon Vijay Abraham I <kishon@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Achal Verma <a-verma1@ti.com>
Subject: [ti:ti-rt-linux-6.1.y-cicd 11/17]
 drivers/pci/controller/cadence/pci-j721e-host.c:137:17: sparse: sparse:
 symbol 'j721e_pcie_irq_chip' was not declared. Should it be static?
Message-ID: <202308281333.G2RoiyJq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.1.y-cicd
head:   dd944f14304d2ce6d26c9cdc3d2d2d6d373a322c
commit: 0cc7dd00c998242b68e5ffe1d630f2198a4385db [11/17] PCI: j721e: Add PCI legacy interrupt support for J7200
config: i386-randconfig-063-20230828 (https://download.01.org/0day-ci/archive/20230828/202308281333.G2RoiyJq-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230828/202308281333.G2RoiyJq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308281333.G2RoiyJq-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/pci/controller/cadence/pci-j721e-host.c:137:17: sparse: sparse: symbol 'j721e_pcie_irq_chip' was not declared. Should it be static?

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

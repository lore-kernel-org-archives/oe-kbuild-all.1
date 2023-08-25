Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F45218B0E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Aug 2023 23:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693004590; x=1724540590;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PMWyedzjGEa/JeBo0oe1/7li+FCc/yPBXOlAG0OXsHA=;
  b=mqV+iq84VT0d51o5jKa/dKt7dy+MhmOEnxP96UvC21+0mczq3TWjgreQ
   419Ft9va5vJhJ5nFzeFArN1giUyh1PDHboWOs2jJXwHZ7vcJSIiWX5kb0
   ANBxW4lctYYo21doTM364rBW4LwPmbkttOWeDgvn7WhUrhkoZeZ97Zlo3
   YSF+qX5o6iiNswfzIh+bvyTRoua2moSJaCC585irp80RnRT5PDf0x1BlB
   ar3DOJ38QhOzrSsc8H6OylZBieoPcxXrsWaoWRiL2A3WTqWSrKPPYPrMX
   o0IVjm+KACBZBjBUqJcXmOUqvs2QHWe8alwGn7ls7ZSyxlbMJpl1r6gPf
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="441167875"
X-IronPort-AV: E=Sophos;i="6.02,202,1688454000"; 
   d="scan'208";a="441167875"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2023 16:03:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="803111860"
X-IronPort-AV: E=Sophos;i="6.02,202,1688454000"; 
   d="scan'208";a="803111860"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 25 Aug 2023 16:03:08 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZfpb-00046F-1h;
	Fri, 25 Aug 2023 23:03:07 +0000
Date: Sat, 26 Aug 2023 07:03:06 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Jiang <dave.jiang@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [davejiang:cxl-ide 19/25] drivers/pci/ide.c:527: warning: Function
 parameter or member 'type' not described in 'pci_ide_stream_disable'
Message-ID: <202308260655.xlURwQTl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/davejiang/linux.git cxl-ide
head:   ecc190dd66d4c533dc9d4aa0058cd06888c318d6
commit: b1ca57e4e9e4ccd3193335dbc764a7c3ea16030c [19/25] pci: ide: Add support for IDE stream allocation
config: openrisc-allyesconfig (https://download.01.org/0day-ci/archive/20230826/202308260655.xlURwQTl-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230826/202308260655.xlURwQTl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308260655.xlURwQTl-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/pci/ide.c:421: warning: Function parameter or member 'type' not described in 'pci_ide_stream_setup'
>> drivers/pci/ide.c:527: warning: Function parameter or member 'type' not described in 'pci_ide_stream_disable'
>> drivers/pci/ide.c:549: warning: Function parameter or member 'type' not described in 'pci_ide_stream_enable'


vim +527 drivers/pci/ide.c

   517	
   518	/**
   519	 * pci_ide_stream_disable - disables the PCIe IDE stream
   520	 * @pdev1: the first PCI device of the IDE stream
   521	 * @pdev2: the second PCI device of the IDE stream
   522	 *
   523	 * Returns 0 if success or -errno if failed.
   524	 */
   525	int pci_ide_stream_disable(struct pci_dev *pdev1, struct pci_dev *pdev2,
   526				   enum pci_ide_stream_type type)
 > 527	{
   528		int pdev1_id = pdev2->ide.pdev1_stream_pos_id;
   529		int pdev2_id = pdev2->ide.pdev2_stream_pos_id;
   530		int rc;
   531	
   532		rc = pci_ide_stream_ctrl(pdev2, pdev2_id, type, false);
   533		if (rc < 0)
   534			return rc;
   535	
   536		return pci_ide_stream_ctrl(pdev1, pdev1_id, type, false);
   537	}
   538	EXPORT_SYMBOL_GPL(pci_ide_stream_disable);
   539	
   540	/**
   541	 * pci_ide_stream_enable - Enables the PCIe IDE stream
   542	 * @pdev1: the first PCI device of the IDE stream
   543	 * @pdev2: the second PCI device of the IDE stream
   544	 *
   545	 * Returns 0 if success or -errno if failed.
   546	 */
   547	int pci_ide_stream_enable(struct pci_dev *pdev1, struct pci_dev *pdev2,
   548				  enum pci_ide_stream_type type)
 > 549	{
   550		int pdev1_id = pdev2->ide.pdev1_stream_pos_id;
   551		int pdev2_id = pdev2->ide.pdev2_stream_pos_id;
   552		int rc;
   553	
   554		rc = pci_ide_stream_ctrl(pdev2, pdev2_id, type, true);
   555		if (rc < 0)
   556			return rc;
   557	
   558		return pci_ide_stream_ctrl(pdev1, pdev1_id, type, true);
   559	}
   560	EXPORT_SYMBOL_GPL(pci_ide_stream_enable);
   561	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

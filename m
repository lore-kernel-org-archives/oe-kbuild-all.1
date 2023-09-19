Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 569841CF92
	for <oe-kbuild-all@lists.linux.dev>; Tue, 19 Sep 2023 19:43:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695152588; x=1726688588;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7dJEjSHd/9jWRxxg+807oRXUuvrxL0/e8Q5iRG3U0As=;
  b=JRpT9PAkzZMFxVMEGsCGzaccCIwdzCh+ziOyeBAUtl46u5XYllvGXC5P
   8OIGYQNK5YopQi0VIDJqqlpyESCR8DoP5qcoeIXbbgxBIRjqxmKMYT1Lf
   MUTU5ZHXlbfSBqj1Iz96laPJZIEyYnGdmQSfkiJREp3gsIcXfjSjZgyrZ
   RFKFM8CE2fmD2xEjHD9UacmD0yoPDx5s6QQjoIh1lAYeSg3MHbBqO3Yfb
   3s/zbGvwYTl7HyOcvvvkKd2G2G8SC9N13k9LAd5Xmb5YltP3G1srWyUKs
   FTayyjs2RfIJ8JDZTceYzrMinF+I3DY+bmffsnMr5ZhI8ASwZcdUASYQ0
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="382789240"
X-IronPort-AV: E=Sophos;i="6.02,160,1688454000"; 
   d="scan'208";a="382789240"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2023 12:43:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="781413973"
X-IronPort-AV: E=Sophos;i="6.02,160,1688454000"; 
   d="scan'208";a="781413973"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 19 Sep 2023 12:43:06 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qigci-0007qu-2K;
	Tue, 19 Sep 2023 19:43:04 +0000
Date: Wed, 20 Sep 2023 03:42:13 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-4.19 252/266]
 drivers/pci/controller/dwc/pci-imx6.c:645:10: error: 'const struct
 dw_pcie_host_ops' has no member named 'host_deinit'; did you mean
 'host_init'?
Message-ID: <202309200331.1nwTWez7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git pending-4.19
head:   1332a1761eea8a5fd0a62101b2a39e8718ce7575
commit: b0804ed8ae17af82157d0a4dec0592bc2dd26de9 [252/266] PCI: dwc: Provide deinit callback for i.MX
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20230920/202309200331.1nwTWez7-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230920/202309200331.1nwTWez7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309200331.1nwTWez7-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/pci/controller/dwc/pci-imx6.c:645:10: error: 'const struct dw_pcie_host_ops' has no member named 'host_deinit'; did you mean 'host_init'?
     645 |         .host_deinit = imx6_pcie_host_exit,
         |          ^~~~~~~~~~~
         |          host_init
>> drivers/pci/controller/dwc/pci-imx6.c:645:24: error: 'imx6_pcie_host_exit' undeclared here (not in a function); did you mean 'imx6_pcie_host_init'?
     645 |         .host_deinit = imx6_pcie_host_exit,
         |                        ^~~~~~~~~~~~~~~~~~~
         |                        imx6_pcie_host_init


vim +645 drivers/pci/controller/dwc/pci-imx6.c

   642	
   643	static const struct dw_pcie_host_ops imx6_pcie_host_ops = {
   644		.host_init = imx6_pcie_host_init,
 > 645		.host_deinit = imx6_pcie_host_exit,
   646	};
   647	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

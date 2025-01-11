Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFBB816F851
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Jan 2025 06:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736575748; cv=none; b=IemEbttbKXqc+NIARnUS0KaSKjhd3v8zsKY7Tss7V89jyrefaWW3AHcuqiBmUrI5U2LpVn3X9INPWeQ7hDjtYYOBXWuGb8iVhZrgqHr7mHmXowvn7hwx9POCR7z6WpASH+VDGOc86kuCwXVycEdDU7OyuDZNmKJpVUSB+2qJMtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736575748; c=relaxed/simple;
	bh=THjE8dEWsHCNe2NzpGLi+vpkMCubEQqeh0EQEeq5ke4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sZGk0EiLrvZp83MoH8l0X2HAVjIurDlyqc2NZcirZ2hafW8CdlNkom0GWODM8/Y8uK70KiqEV6IBX1lRZ0W5k6VjuwvzTTcB5tBGa8fr7PKW0Oy1X27s3b1TikFN0TjFRTiXz7TciPdC1GcoSgaACopJoqlBToXyJBou2/Cpq58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SWX0yUMB; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SWX0yUMB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736575745; x=1768111745;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=THjE8dEWsHCNe2NzpGLi+vpkMCubEQqeh0EQEeq5ke4=;
  b=SWX0yUMBXWEClkpCpqElLo/6SRZks7+1F+AMweh6oAZ+XcHkMHAmdSTV
   P18YwvuP/NGQfla3qGldhhDZ650qPrKLSLM8eELAN/agj4/6VSaj9Yr/Z
   WB7/iym1lFvs9PZMuv2spLkVwvRumdj5BqP1mUsGpi6qW6TbGYLwe1EeU
   ELOA182/tHiQo5K1vkqhDFFC0nxbX00ons697XW/Y4wPkT523CwMtb4Xr
   TIIFI7NIn/vqGXG3sgjtwelPWZPhFPQxMSt8Gt0MDFp0/U0kB4DJziTYD
   j7Ic5uVPIsfncMhWKslsuDmsC0v6wz2WFqnM/4ruSAasvCmYEE49Ao7Md
   Q==;
X-CSE-ConnectionGUID: DT/NKpb6RLC7SQGWZiYodw==
X-CSE-MsgGUID: VAKEK4ssSoSTIJmzga+JFA==
X-IronPort-AV: E=McAfee;i="6700,10204,11311"; a="48246495"
X-IronPort-AV: E=Sophos;i="6.12,306,1728975600"; 
   d="scan'208";a="48246495"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2025 22:09:04 -0800
X-CSE-ConnectionGUID: SmryxVjpQbmNbOjklDZuCg==
X-CSE-MsgGUID: lOdJxy4YTRG3mUwKUBO2Cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="103808028"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 10 Jan 2025 22:09:02 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWUg8-000KGI-0B;
	Sat, 11 Jan 2025 06:09:00 +0000
Date: Sat, 11 Jan 2025 14:08:48 +0800
From: kernel test robot <lkp@intel.com>
To: Srinivas Neeli <srinivas.neeli@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>, Suraj Gupta <suraj.gupta2@amd.com>,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Subject: [xilinx-xlnx:lkp_test 478/504]
 drivers/net/ethernet/xilinx/xilinx_axienet.h:41:9: warning: this 'for'
 clause does not guard...
Message-ID: <202501111356.AWR7ZHoR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx lkp_test
head:   9ac6b4acf9144465ac1408d4d799635dec0223a0
commit: 8512a3fbb60d8910d671a191f738295edc596a74 [478/504] net: axienet: added multichannel DMA support
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20250111/202501111356.AWR7ZHoR-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250111/202501111356.AWR7ZHoR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501111356.AWR7ZHoR-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/net/ethernet/xilinx/xilinx_axienet_main.c:55:
   drivers/net/ethernet/xilinx/xilinx_axienet_main.c: In function 'axienet_poll_controller':
>> drivers/net/ethernet/xilinx/xilinx_axienet.h:41:9: warning: this 'for' clause does not guard... [-Wmisleading-indentation]
      41 |         for ((var) = 0; (var) < (lp)->num_rx_queues; (var)++)
         |         ^~~
   drivers/net/ethernet/xilinx/xilinx_axienet_main.c:2316:9: note: in expansion of macro 'for_each_rx_dma_queue'
    2316 |         for_each_rx_dma_queue(lp, i)
         |         ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/xilinx/xilinx_axienet_main.c:2319:17: note: ...this statement, but the latter is misleadingly indented as if it were guarded by the 'for'
    2319 |                 axienet_mcdma_tx_irq(lp->dq[i]->tx_irq, ndev);
         |                 ^~~~~~~~~~~~~~~~~~~~


vim +/for +41 drivers/net/ethernet/xilinx/xilinx_axienet.h

    35	
    36	/* In AXI DMA Tx and Rx queue count is same */
    37	#define for_each_tx_dma_queue(lp, var) \
    38		for ((var) = 0; (var) < (lp)->num_tx_queues; (var)++)
    39	
    40	#define for_each_rx_dma_queue(lp, var) \
  > 41		for ((var) = 0; (var) < (lp)->num_rx_queues; (var)++)
    42	/* Configuration options */
    43	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

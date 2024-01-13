Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5131812E7B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Jan 2024 09:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MRHvdWti"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705139741; x=1736675741;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=O0zn8Zfe1X9tgGpNmhFOGwwQsJB+rRT9Hrh7Mgo1YNw=;
  b=MRHvdWtiuHvJPc99n2mio9+0H2jVbp0G+L9IsoDXELjRivl5EyOx/HrR
   /Y/aCsOOLrn3TIrVa8o54NoviegXG/ZSmV6Xd0UIRBCUZZDhjNKtJOfv2
   RLJQDxwIXN9JgN6BZqQHYnzVVkW2Z/opCl1TzRMooN58sMx8tXiZRFvCB
   e/sY3F+S9WN5Tgg9sSdGflS8lG+xxeIOreFWRCyPdp0GJ836Ea43gH82l
   tApdpIYAh4IHy6RSIXRPUkhZLpZhDo9aUqaPAYgPO/vP+AkoS/xJ8Qpp9
   B5neVmcGXXiiHPD5F24n+AFJ0Vti815r5wONPjnz/PnqNM/KyynuZUeW9
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10951"; a="6088596"
X-IronPort-AV: E=Sophos;i="6.04,192,1695711600"; 
   d="scan'208";a="6088596"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2024 01:55:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10951"; a="853518532"
X-IronPort-AV: E=Sophos;i="6.04,192,1695711600"; 
   d="scan'208";a="853518532"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 13 Jan 2024 01:55:39 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rOajp-000AK8-1U;
	Sat, 13 Jan 2024 09:55:37 +0000
Date: Sat, 13 Jan 2024 17:55:32 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 21243/21544]
 drivers/net/can/phytium/phytium_can.c:1050: warning: Function parameter or
 member 'skb' not described in 'phytium_can_start_xmit'
Message-ID: <202401131722.SsAq5hFe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   1f0983450549eeea71fb9333517330947a779262
commit: db0908f0353219c48495233e71e676da2cefee44 [21243/21544] can: can controller driver for phytium CPUs
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240113/202401131722.SsAq5hFe-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240113/202401131722.SsAq5hFe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401131722.SsAq5hFe-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/can/phytium/phytium_can.c:1050: warning: Function parameter or member 'skb' not described in 'phytium_can_start_xmit'
>> drivers/net/can/phytium/phytium_can.c:1050: warning: Function parameter or member 'dev' not described in 'phytium_can_start_xmit'


vim +1050 drivers/net/can/phytium/phytium_can.c

  1042	
  1043	/**
  1044	 * phytium_can_start_xmit - Starts the transmission
  1045	 *
  1046	 * Return: 0 on success.
  1047	 */
  1048	static netdev_tx_t phytium_can_start_xmit(struct
  1049		sk_buff *skb, struct net_device *dev)
> 1050	{
  1051		struct phytium_can_dev *cdev = netdev_priv(dev);
  1052	
  1053		if (can_dropped_invalid_skb(dev, skb))
  1054			return NETDEV_TX_OK;
  1055	
  1056		cdev->tx_skb = skb;
  1057	
  1058		return phytium_can_tx_handler(cdev);
  1059	}
  1060	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

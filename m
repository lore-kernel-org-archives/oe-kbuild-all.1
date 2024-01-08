Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A80D27F
	for <oe-kbuild-all@lists.linux.dev>; Mon,  8 Jan 2024 03:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GUJ88wls"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704684090; x=1736220090;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4EZG+yAUMwJz9mPz876kfLpebmTk4zhW7VsTPh6P7yI=;
  b=GUJ88wlsTGeM5a+20JZU+1BQYMMVw6K+PPn1TT30whzweRtPgSREey98
   lYCBAbZsTujOOT38MwwOljv5UVJkCAjMIVyHZLn9RBLpRThvrUfjwlD5Y
   HR0F00ujB133BAcZI/QYps5EvT5cOiXqU6N1wW3llvNhbMCMrr1ldgXMp
   tP2Ic9pTuLt5pfFOSRbNONZ4wqrsbii/QXUmIu9RRNLEeYpEEL0I7/qFD
   DFKCdlDUbyrdkULp7C9fFEAJW3NJ9p6dRL9QldYlb2DiCATwa/73AFyrH
   zwHfJDHBsjXL1w0DIs+s23iNOaQAmPW5hay61WPTeTiZuhRzuDOyeBsk8
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10946"; a="400540958"
X-IronPort-AV: E=Sophos;i="6.04,340,1695711600"; 
   d="scan'208";a="400540958"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2024 19:21:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,340,1695711600"; 
   d="scan'208";a="15792090"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 07 Jan 2024 19:21:28 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rMgCc-0004Ri-1B;
	Mon, 08 Jan 2024 03:21:26 +0000
Date: Mon, 8 Jan 2024 11:21:08 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [lunn:v6.7-rc6-net-next-mv88e6xxx-leds-v3 8/8]
 drivers/net/dsa/qca/qca8k-8xxx.c:1817:7: error: 'qca8k_netdev_leds_ops'
 undeclared; did you mean 'netdev_leds_ops'?
Message-ID: <202401081153.o3Rxiw65-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/lunn/linux.git v6.7-rc6-net-next-mv88e6xxx-leds-v3
head:   9a48ae1a616c32799d10fcde6a9eea1bbade8496
commit: 9a48ae1a616c32799d10fcde6a9eea1bbade8496 [8/8] dsa: qca8k: Use netdev_leds common code for LEDs
config: x86_64-buildonly-randconfig-002-20240108 (https://download.01.org/0day-ci/archive/20240108/202401081153.o3Rxiw65-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240108/202401081153.o3Rxiw65-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401081153.o3Rxiw65-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/net/dsa/qca/qca8k-8xxx.c: In function 'qca8k_port_setup':
>> drivers/net/dsa/qca/qca8k-8xxx.c:1817:7: error: 'qca8k_netdev_leds_ops' undeclared (first use in this function); did you mean 'netdev_leds_ops'?
    1817 |      &qca8k_netdev_leds_ops);
         |       ^~~~~~~~~~~~~~~~~~~~~
         |       netdev_leds_ops
   drivers/net/dsa/qca/qca8k-8xxx.c:1817:7: note: each undeclared identifier is reported only once for each function it appears in
>> drivers/net/dsa/qca/qca8k-8xxx.c:1818:1: warning: control reaches end of non-void function [-Wreturn-type]
    1818 | }
         | ^


vim +1817 drivers/net/dsa/qca/qca8k-8xxx.c

  1810	
  1811	static int qca8k_port_setup(struct dsa_switch *ds, int port)
  1812	{
  1813		struct dsa_port *dp = dsa_to_port(ds, port);
  1814		struct qca8k_priv *priv = ds->priv;
  1815	
  1816		return netdev_leds_setup(dp->user, dp->dn, &priv->leds,
> 1817					 &qca8k_netdev_leds_ops);
> 1818	}
  1819	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

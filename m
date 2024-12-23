Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18348C8E0
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Dec 2024 01:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734916842; cv=none; b=WWqGdmmEmpScZ2bFbzxDruMXhz+efpjbNhRupaIFoSdKK7oxTPnxaZAzhUWJ/QthGQLLPO9+3qbbDz6u8kxx1Ljl1XsivEusnSZJsiVtEMk8CxF63+s/AGsuyovFkA5Y3Tu+0icm0XdA8EwxN1ei+znl/eFUtVPr8R7SKb2c+q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734916842; c=relaxed/simple;
	bh=Y1Vh39yQAai4kzyB8+BQD0FYFgZsOWPnzqi/TL3v58A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BY+MITl4yp0kui5i952ah3wmwQ2SI4vLfuLiPynelD6/Q0H8+cz5qYAc3VN16f7gXSp2Ts6keDLCPUJRFuI0nJ+VYl7OOhmg4PedrPGC6sQG86lwSaYNc+d0B5cw1GF9fySVKB7RlXVWdDtDKhV+EX3H+rGImcmFoYFCuzvr6yE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jUGISYD2; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jUGISYD2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734916841; x=1766452841;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Y1Vh39yQAai4kzyB8+BQD0FYFgZsOWPnzqi/TL3v58A=;
  b=jUGISYD2NnbSYzSk2cemKOno0SemUohWEDJ2oP1BumFfIUFs9heB5FS4
   l0lkoND/sGtWNd3WPvgu/4SsGOmcfLIEccpw7wLzGHEOzMAR2bVxNwIdE
   v7cG8cv7lw8JRowsRCOZ2wk6boNGNJwL2jDeb4oB2YDvdqeEIttE048mV
   8582615tAmr0mhZq/uEbCDfN5oMncF8F4Dd0gZqQOiIp9F8PyjjUCPLnO
   PG+13K3GvIYvVIBTvgFyeh8S8wMx3GW1H+3qjU/n8cB5bMJD7RHdp4vO5
   qcdTc84WTEehejwweN1/XX+uYbVG9RvtgPWI6geTXh63H1+jlfWKk9ag1
   A==;
X-CSE-ConnectionGUID: 86Vp2hGWTWuqrSqcsr943w==
X-CSE-MsgGUID: sE9QzxxeQuKiyz7OJC8kxQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11294"; a="35262199"
X-IronPort-AV: E=Sophos;i="6.12,256,1728975600"; 
   d="scan'208";a="35262199"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2024 17:20:40 -0800
X-CSE-ConnectionGUID: td/9oqmWTq2DEOcAnowjQw==
X-CSE-MsgGUID: 7ayX5TmCT0Cny2X+uzwSZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="103683745"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 22 Dec 2024 17:20:39 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tPX7d-0003KV-1D;
	Mon, 23 Dec 2024 01:20:37 +0000
Date: Mon, 23 Dec 2024 09:19:58 +0800
From: kernel test robot <lkp@intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Wolfram Sang <wsa-dev@sang-engineering.com>
Subject: drivers/i2c/busses/i2c-mxs.c:130: warning: Function parameter or
 struct member 'timing0' not described in 'mxs_i2c_dev'
Message-ID: <202412230939.8AJO139S-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4bbf9020becbfd8fc2c3da790855b7042fad455b
commit: 4a2d5f663dab6614772d8e28ca190b127ba46d9d i2c: Enable compile testing for more drivers
date:   4 years, 11 months ago
config: sparc-randconfig-001-20241212 (https://download.01.org/0day-ci/archive/20241223/202412230939.8AJO139S-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241223/202412230939.8AJO139S-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412230939.8AJO139S-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/i2c/busses/i2c-mxs.c:130: warning: Function parameter or struct member 'timing0' not described in 'mxs_i2c_dev'
>> drivers/i2c/busses/i2c-mxs.c:130: warning: Function parameter or struct member 'timing1' not described in 'mxs_i2c_dev'
>> drivers/i2c/busses/i2c-mxs.c:130: warning: Function parameter or struct member 'timing2' not described in 'mxs_i2c_dev'
>> drivers/i2c/busses/i2c-mxs.c:130: warning: Function parameter or struct member 'dmach' not described in 'mxs_i2c_dev'
>> drivers/i2c/busses/i2c-mxs.c:130: warning: Function parameter or struct member 'pio_data' not described in 'mxs_i2c_dev'
>> drivers/i2c/busses/i2c-mxs.c:130: warning: Function parameter or struct member 'addr_data' not described in 'mxs_i2c_dev'
>> drivers/i2c/busses/i2c-mxs.c:130: warning: Function parameter or struct member 'sg_io' not described in 'mxs_i2c_dev'
>> drivers/i2c/busses/i2c-mxs.c:130: warning: Function parameter or struct member 'dma_read' not described in 'mxs_i2c_dev'


vim +130 drivers/i2c/busses/i2c-mxs.c

616228a164d436 Juergen Beisert 2013-09-30  101  
a8da7fecb60102 Wolfram Sang    2011-02-16  102  /**
a8da7fecb60102 Wolfram Sang    2011-02-16  103   * struct mxs_i2c_dev - per device, private MXS-I2C data
a8da7fecb60102 Wolfram Sang    2011-02-16  104   *
a8da7fecb60102 Wolfram Sang    2011-02-16  105   * @dev: driver model device node
616228a164d436 Juergen Beisert 2013-09-30  106   * @dev_type: distinguish i.MX23/i.MX28 features
a8da7fecb60102 Wolfram Sang    2011-02-16  107   * @regs: IO registers pointer
a8da7fecb60102 Wolfram Sang    2011-02-16  108   * @cmd_complete: completion object for transaction wait
a8da7fecb60102 Wolfram Sang    2011-02-16  109   * @cmd_err: error code for last transaction
a8da7fecb60102 Wolfram Sang    2011-02-16  110   * @adapter: i2c subsystem adapter node
a8da7fecb60102 Wolfram Sang    2011-02-16  111   */
a8da7fecb60102 Wolfram Sang    2011-02-16  112  struct mxs_i2c_dev {
a8da7fecb60102 Wolfram Sang    2011-02-16  113  	struct device *dev;
616228a164d436 Juergen Beisert 2013-09-30  114  	enum mxs_i2c_devtype dev_type;
a8da7fecb60102 Wolfram Sang    2011-02-16  115  	void __iomem *regs;
a8da7fecb60102 Wolfram Sang    2011-02-16  116  	struct completion cmd_complete;
0f40cbc4f85e13 Fabio Estevam   2013-01-07  117  	int cmd_err;
a8da7fecb60102 Wolfram Sang    2011-02-16  118  	struct i2c_adapter adapter;
626f0a2ff6bc98 Marek Vasut     2012-11-30  119  
626f0a2ff6bc98 Marek Vasut     2012-11-30  120  	uint32_t timing0;
626f0a2ff6bc98 Marek Vasut     2012-11-30  121  	uint32_t timing1;
869c6a3ededbb1 Lothar Waﬂmann  2013-07-05  122  	uint32_t timing2;
62885f59a26195 Marek Vasut     2012-08-24  123  
62885f59a26195 Marek Vasut     2012-08-24  124  	/* DMA support components */
62885f59a26195 Marek Vasut     2012-08-24  125  	struct dma_chan			*dmach;
62885f59a26195 Marek Vasut     2012-08-24  126  	uint32_t			pio_data[2];
62885f59a26195 Marek Vasut     2012-08-24  127  	uint32_t			addr_data;
62885f59a26195 Marek Vasut     2012-08-24  128  	struct scatterlist		sg_io[2];
62885f59a26195 Marek Vasut     2012-08-24  129  	bool				dma_read;
a8da7fecb60102 Wolfram Sang    2011-02-16 @130  };
a8da7fecb60102 Wolfram Sang    2011-02-16  131  

:::::: The code at line 130 was first introduced by commit
:::::: a8da7fecb6010222fe495cc2b4330b99bca20c61 i2c: add driver for Freescale i.MX28

:::::: TO: Wolfram Sang <w.sang@pengutronix.de>
:::::: CC: Ben Dooks <ben-linux@fluff.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

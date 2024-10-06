Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B88C8EACD
	for <oe-kbuild-all@lists.linux.dev>; Sun,  6 Oct 2024 13:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728222442; cv=none; b=p1uL1GYrjcnv9G7kekH1xWM0Xmcp6rJq7+E/c7XXXIyxxseOJKmO8i86HVs4nX1ltXC9MBXoTX77/eGTmo+OpUPqDE/wqP/48jtolSyYLCe1OVCMibdTqvRvcfCiASa4CrNkodrWZpR2MHcGWYZN2pYXH90zHLy36yRJuHjDnOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728222442; c=relaxed/simple;
	bh=VbgItJWh75Mi91IksgtSDDQ1Vkc72wLLTbApnflo4/4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RTkxNtzAW0C+RRpF2rtQLuxIcXPbnb/8LUDofN0R80QKYUunOUYdo01x78EY1hOi9NULgGkjAOyGp6BJMgnKXEQIF6vL8ZtaKjuozRr+pjErfxjwV49+qL3ctSjC9T91JwujL6iXedht/NxdxQ+bMAtv2ijOQkThoz0gsTgsaQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IBkd2x/d; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IBkd2x/d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728222441; x=1759758441;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VbgItJWh75Mi91IksgtSDDQ1Vkc72wLLTbApnflo4/4=;
  b=IBkd2x/dtAPCN2NvkHDw60AL/sWRlULBDVVDLrptcp5Sn0cneXPuEt2E
   cqjDUAexwWxXmu7I2GPi4qKuRhRmbk4UDiKUirsmkJDc08bKoRqiXx1g9
   5VfG4KjtFg0rIUNCcl/DTUHcgExUpMn/AXae1a88ScuCAlDltIApRSHtH
   KyvqlHYLrITVcaNRVezXDdzVpWz/DbqiwOfVrETXZ0vzJ7I0fvfYkWaDa
   1MmAYQ/X+8sCPSOSIp2d2d1xKF9iOXZF9VnbjTpRyC6GD4DyURBu0zObu
   UwNWghzy+yivWkA5gAncwI4RoJSS7/APIycQLa6Pe4uVL91+SnFpuwntB
   A==;
X-CSE-ConnectionGUID: QDtjrt6eTqq09YT9Ff2pPQ==
X-CSE-MsgGUID: sBZsLMtKQ9Gg6U+fkEhlsA==
X-IronPort-AV: E=McAfee;i="6700,10204,11217"; a="52779314"
X-IronPort-AV: E=Sophos;i="6.11,182,1725346800"; 
   d="scan'208";a="52779314"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2024 06:47:20 -0700
X-CSE-ConnectionGUID: Np2f5s0zR7y0/xCQtsCzOA==
X-CSE-MsgGUID: dERYWmhZQPqlNUwqA2qNfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,182,1725346800"; 
   d="scan'208";a="105972271"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 06 Oct 2024 06:47:18 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sxRbQ-0003ue-0u;
	Sun, 06 Oct 2024 13:47:16 +0000
Date: Sun, 6 Oct 2024 21:46:31 +0800
From: kernel test robot <lkp@intel.com>
To: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>,
	Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Subject: [xilinx-xlnx:xlnx_rebase_v6.6_LTS_2024.1_update 671/1001]
 drivers/spi/spi-zynq-qspi.c:158: warning: Function parameter or member
 'flags' not described in 'zynq_qspi'
Message-ID: <202410062110.XDrwnNXD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.6_LTS_2024.1_update
head:   5365c13a86998da06d845c918f849b30b8735538
commit: 55f9046c8b1b7bf39e3569e0d608706b68d0106b [671/1001] spi: spi-zynq-qspi: Add multi-cs support in Zynq QSPI driver
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20241006/202410062110.XDrwnNXD-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241006/202410062110.XDrwnNXD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410062110.XDrwnNXD-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/spi/spi-zynq-qspi.c:158: warning: Function parameter or member 'flags' not described in 'zynq_qspi'


vim +158 drivers/spi/spi-zynq-qspi.c

67dca5e580f1e9 Naga Sureshkumar Relli 2019-04-01  122  
55f9046c8b1b7b Amit Kumar Mahapatra   2023-12-08  123  /* Maximum address width */
55f9046c8b1b7b Amit Kumar Mahapatra   2023-12-08  124  #define ZYNQ_QSPI_MAX_ADDR_WIDTH	3
67dca5e580f1e9 Naga Sureshkumar Relli 2019-04-01  125  /**
67dca5e580f1e9 Naga Sureshkumar Relli 2019-04-01  126   * struct zynq_qspi - Defines qspi driver instance
55f9046c8b1b7b Amit Kumar Mahapatra   2023-12-08  127   * @ctlr:		Pointer to the spi controller information
e867feecda9bbb Lee Jones              2020-07-17  128   * @dev:		Pointer to the this device's information
67dca5e580f1e9 Naga Sureshkumar Relli 2019-04-01  129   * @regs:		Virtual address of the QSPI controller registers
67dca5e580f1e9 Naga Sureshkumar Relli 2019-04-01  130   * @refclk:		Pointer to the peripheral clock
67dca5e580f1e9 Naga Sureshkumar Relli 2019-04-01  131   * @pclk:		Pointer to the APB clock
67dca5e580f1e9 Naga Sureshkumar Relli 2019-04-01  132   * @irq:		IRQ number
67dca5e580f1e9 Naga Sureshkumar Relli 2019-04-01  133   * @txbuf:		Pointer to the TX buffer
67dca5e580f1e9 Naga Sureshkumar Relli 2019-04-01  134   * @rxbuf:		Pointer to the RX buffer
67dca5e580f1e9 Naga Sureshkumar Relli 2019-04-01  135   * @tx_bytes:		Number of bytes left to transfer
67dca5e580f1e9 Naga Sureshkumar Relli 2019-04-01  136   * @rx_bytes:		Number of bytes left to receive
67dca5e580f1e9 Naga Sureshkumar Relli 2019-04-01  137   * @data_completion:	completion structure
55f9046c8b1b7b Amit Kumar Mahapatra   2023-12-08  138   * @is_stripe:		Flag to indicate if data needs to be split between flashes
55f9046c8b1b7b Amit Kumar Mahapatra   2023-12-08  139   *			(Used in dual parallel configuration)
67dca5e580f1e9 Naga Sureshkumar Relli 2019-04-01  140   */
67dca5e580f1e9 Naga Sureshkumar Relli 2019-04-01  141  struct zynq_qspi {
55f9046c8b1b7b Amit Kumar Mahapatra   2023-12-08  142  	struct spi_controller *ctlr;
67dca5e580f1e9 Naga Sureshkumar Relli 2019-04-01  143  	struct device *dev;
67dca5e580f1e9 Naga Sureshkumar Relli 2019-04-01  144  	void __iomem *regs;
67dca5e580f1e9 Naga Sureshkumar Relli 2019-04-01  145  	struct clk *refclk;
67dca5e580f1e9 Naga Sureshkumar Relli 2019-04-01  146  	struct clk *pclk;
67dca5e580f1e9 Naga Sureshkumar Relli 2019-04-01  147  	int irq;
67dca5e580f1e9 Naga Sureshkumar Relli 2019-04-01  148  	u8 *txbuf;
67dca5e580f1e9 Naga Sureshkumar Relli 2019-04-01  149  	u8 *rxbuf;
67dca5e580f1e9 Naga Sureshkumar Relli 2019-04-01  150  	int tx_bytes;
67dca5e580f1e9 Naga Sureshkumar Relli 2019-04-01  151  	int rx_bytes;
55f9046c8b1b7b Amit Kumar Mahapatra   2023-12-08  152  	u32 flags;
55f9046c8b1b7b Amit Kumar Mahapatra   2023-12-08  153  #define	ZYNQ_QSPI_MEM_CONFIG		BIT(0)
55f9046c8b1b7b Amit Kumar Mahapatra   2023-12-08  154  #define	ZYNQ_QSPI_IS_PARALLEL		BIT(1)
55f9046c8b1b7b Amit Kumar Mahapatra   2023-12-08  155  #define	ZYNQ_QSPI_IS_STACKED		BIT(2)
55f9046c8b1b7b Amit Kumar Mahapatra   2023-12-08  156  	bool is_stripe;
67dca5e580f1e9 Naga Sureshkumar Relli 2019-04-01  157  	struct completion data_completion;
67dca5e580f1e9 Naga Sureshkumar Relli 2019-04-01 @158  };
67dca5e580f1e9 Naga Sureshkumar Relli 2019-04-01  159  

:::::: The code at line 158 was first introduced by commit
:::::: 67dca5e580f1e93a66177389981541cac208c817 spi: spi-mem: Add support for Zynq QSPI controller

:::::: TO: Naga Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

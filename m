Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FC601791F4
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Dec 2024 19:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735413637; cv=none; b=Wk3NJB3as40OjwcEJq3JXAH/yqjvLZnPI0bY5ZVZy7/HgMfNGC5EHC+abUX52Z773ltrxKW3eqveG22zwiQAeuvv8oKfjMY9Y5sNb2ANpCVc3B4cGThNn84nnBLzOwYZCq4l//Inss/cPfoaX0F3FlUtehK1i62fkdBNSRDvjww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735413637; c=relaxed/simple;
	bh=d/d5lBmZB5lYPawCfSORJZRxM1JVy1F+2aBQIRMSpQw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qT0O0RMSuzyNmTrcnElPY/DxvwvSWdLq0jB/KnGO+GzKLtHGS/MtJL8xV/iSOAnhgid6Qo/BCnd7h88oNB1gw+3PovRIxs2dOIpv2BTQDkuMwgkW0bmOXNIuCB8rY3c2kA2LbplIhXiHS19Pnv/c+sUZLl5dvBZTaOdLgSswZ6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MBG1ZGoG; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MBG1ZGoG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735413635; x=1766949635;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=d/d5lBmZB5lYPawCfSORJZRxM1JVy1F+2aBQIRMSpQw=;
  b=MBG1ZGoGATgpgJqLNssAK2iOgViftv9qhLmSRKNpeerT2caWmuZeC0/K
   gYCUEQIEFuNzJwhaEWSRf5LX7GcNKCmDUsVYVRvUz+RmunWteBHT4eija
   PfjsS2fmSbQxHF1bkacnPEkZd72OXuNyX9ACWwxpp4YojUhVPbyTYjr7B
   0YJ7qvBO3+bz1BOUxLeecfOwrQOa+LOae6xEkhQaHxBifc7zS6BgiWjeA
   TRBSdGjgFlVkUO8Z7xFX4PvGMzuqH/mGP8JeLoi9//8x5TZJcTQLEYicF
   QgOptymB0kJRgpjauv2mTvP22B/5YdMyMEW21+nCGrnKzmF/hMfP8nybQ
   g==;
X-CSE-ConnectionGUID: 5Z5p0KFcQtmcFlJNFYMIFA==
X-CSE-MsgGUID: ZmKwOT4lQqegZrhxMbKJeA==
X-IronPort-AV: E=McAfee;i="6700,10204,11299"; a="46448321"
X-IronPort-AV: E=Sophos;i="6.12,272,1728975600"; 
   d="scan'208";a="46448321"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2024 11:20:35 -0800
X-CSE-ConnectionGUID: Xh4K0IfyQdqi2yzP6MEtNg==
X-CSE-MsgGUID: /XJbkrbITa2Zksc/LMpxtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,272,1728975600"; 
   d="scan'208";a="100917963"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 28 Dec 2024 11:20:33 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tRcMR-0004H0-1I;
	Sat, 28 Dec 2024 19:20:31 +0000
Date: Sun, 29 Dec 2024 03:19:34 +0800
From: kernel test robot <lkp@intel.com>
To: Thierry Reding <treding@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Wolfram Sang <wsa-dev@sang-engineering.com>
Subject: drivers/i2c/busses/i2c-tegra.c:297: warning: Function parameter or
 struct member 'dma_dev' not described in 'tegra_i2c_dev'
Message-ID: <202412290303.8p5NEqyr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   fd0584d220fe285dc45be43eede55df89ad6a3d9
commit: cdbf26251d3b35c4ccaea0c3a6de4318f727d3d2 i2c: tegra: Allocate DMA memory for DMA engine
date:   2 years, 2 months ago
config: sparc-randconfig-001-20241212 (https://download.01.org/0day-ci/archive/20241229/202412290303.8p5NEqyr-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241229/202412290303.8p5NEqyr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412290303.8p5NEqyr-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/i2c/busses/i2c-tegra.c:297: warning: Function parameter or struct member 'dma_dev' not described in 'tegra_i2c_dev'


vim +297 drivers/i2c/busses/i2c-tegra.c

6ad068ed63100f Laxman Dewangan     2012-08-19  228  
db811ca0f48578 Colin Cross         2011-02-20  229  /**
c990bbafdb11c6 Thierry Reding      2018-12-17  230   * struct tegra_i2c_dev - per device I2C context
db811ca0f48578 Colin Cross         2011-02-20  231   * @dev: device reference for power management
c990bbafdb11c6 Thierry Reding      2018-12-17  232   * @hw: Tegra I2C HW feature
c990bbafdb11c6 Thierry Reding      2018-12-17  233   * @adapter: core I2C layer adapter information
c990bbafdb11c6 Thierry Reding      2018-12-17  234   * @div_clk: clock reference for div clock of I2C controller
586a97d907ac34 Dmitry Osipenko     2020-09-30  235   * @clocks: array of I2C controller clocks
586a97d907ac34 Dmitry Osipenko     2020-09-30  236   * @nclocks: number of clocks in the array
0604ee4aefa20f Thierry Reding      2018-12-17  237   * @rst: reset control for the I2C controller
db811ca0f48578 Colin Cross         2011-02-20  238   * @base: ioremapped registers cookie
86c92b9965ff17 Sowjanya Komatineni 2019-02-12  239   * @base_phys: physical base address of the I2C controller
c990bbafdb11c6 Thierry Reding      2018-12-17  240   * @cont_id: I2C controller ID, used for packet header
c990bbafdb11c6 Thierry Reding      2018-12-17  241   * @irq: IRQ number of transfer complete interrupt
c990bbafdb11c6 Thierry Reding      2018-12-17  242   * @is_dvc: identifies the DVC I2C controller, has a different register layout
c73178b93754ed Thierry Reding      2019-06-07  243   * @is_vi: identifies the VI I2C controller, has a different register layout
db811ca0f48578 Colin Cross         2011-02-20  244   * @msg_complete: transfer completion notifier
db811ca0f48578 Colin Cross         2011-02-20  245   * @msg_err: error code for completed message
db811ca0f48578 Colin Cross         2011-02-20  246   * @msg_buf: pointer to current message data
db811ca0f48578 Colin Cross         2011-02-20  247   * @msg_buf_remaining: size of unsent data in the message buffer
94a5573f0719cf Dmitry Osipenko     2020-09-30  248   * @msg_read: indicates that the transfer is a read access
50665d58db052b Akhil R             2021-12-10  249   * @timings: i2c timings information like bus frequency
a99042e7d9fb5c Dmitry Osipenko     2020-09-30  250   * @multimaster_mode: indicates that I2C controller is in multi-master mode
86c92b9965ff17 Sowjanya Komatineni 2019-02-12  251   * @tx_dma_chan: DMA transmit channel
86c92b9965ff17 Sowjanya Komatineni 2019-02-12  252   * @rx_dma_chan: DMA receive channel
86c92b9965ff17 Sowjanya Komatineni 2019-02-12  253   * @dma_phys: handle to DMA resources
86c92b9965ff17 Sowjanya Komatineni 2019-02-12  254   * @dma_buf: pointer to allocated DMA buffer
86c92b9965ff17 Sowjanya Komatineni 2019-02-12  255   * @dma_buf_size: DMA buffer size
a99042e7d9fb5c Dmitry Osipenko     2020-09-30  256   * @dma_mode: indicates active DMA transfer
86c92b9965ff17 Sowjanya Komatineni 2019-02-12  257   * @dma_complete: DMA completion notifier
a99042e7d9fb5c Dmitry Osipenko     2020-09-30  258   * @atomic_mode: indicates active atomic transfer
db811ca0f48578 Colin Cross         2011-02-20  259   */
db811ca0f48578 Colin Cross         2011-02-20  260  struct tegra_i2c_dev {
db811ca0f48578 Colin Cross         2011-02-20  261  	struct device *dev;
db811ca0f48578 Colin Cross         2011-02-20  262  	struct i2c_adapter adapter;
89e3748acd0bf6 Dmitry Osipenko     2020-09-30  263  
89e3748acd0bf6 Dmitry Osipenko     2020-09-30  264  	const struct tegra_i2c_hw_feature *hw;
dda9d6a8262cb1 Stephen Warren      2013-11-06  265  	struct reset_control *rst;
f1c2ff98065dce Dmitry Osipenko     2020-09-30  266  	unsigned int cont_id;
f1c2ff98065dce Dmitry Osipenko     2020-09-30  267  	unsigned int irq;
89e3748acd0bf6 Dmitry Osipenko     2020-09-30  268  
89e3748acd0bf6 Dmitry Osipenko     2020-09-30  269  	phys_addr_t base_phys;
89e3748acd0bf6 Dmitry Osipenko     2020-09-30  270  	void __iomem *base;
89e3748acd0bf6 Dmitry Osipenko     2020-09-30  271  
89e3748acd0bf6 Dmitry Osipenko     2020-09-30  272  	struct clk_bulk_data clocks[2];
89e3748acd0bf6 Dmitry Osipenko     2020-09-30  273  	unsigned int nclocks;
89e3748acd0bf6 Dmitry Osipenko     2020-09-30  274  
89e3748acd0bf6 Dmitry Osipenko     2020-09-30  275  	struct clk *div_clk;
50665d58db052b Akhil R             2021-12-10  276  	struct i2c_timings timings;
89e3748acd0bf6 Dmitry Osipenko     2020-09-30  277  
db811ca0f48578 Colin Cross         2011-02-20  278  	struct completion msg_complete;
89e3748acd0bf6 Dmitry Osipenko     2020-09-30  279  	size_t msg_buf_remaining;
db811ca0f48578 Colin Cross         2011-02-20  280  	int msg_err;
db811ca0f48578 Colin Cross         2011-02-20  281  	u8 *msg_buf;
89e3748acd0bf6 Dmitry Osipenko     2020-09-30  282  
89e3748acd0bf6 Dmitry Osipenko     2020-09-30  283  	struct completion dma_complete;
86c92b9965ff17 Sowjanya Komatineni 2019-02-12  284  	struct dma_chan *tx_dma_chan;
86c92b9965ff17 Sowjanya Komatineni 2019-02-12  285  	struct dma_chan *rx_dma_chan;
89e3748acd0bf6 Dmitry Osipenko     2020-09-30  286  	unsigned int dma_buf_size;
cdbf26251d3b35 Thierry Reding      2022-10-20  287  	struct device *dma_dev;
86c92b9965ff17 Sowjanya Komatineni 2019-02-12  288  	dma_addr_t dma_phys;
4be62340f3ce62 Dmitry Osipenko     2020-09-30  289  	void *dma_buf;
89e3748acd0bf6 Dmitry Osipenko     2020-09-30  290  
a99042e7d9fb5c Dmitry Osipenko     2020-09-30  291  	bool multimaster_mode;
a99042e7d9fb5c Dmitry Osipenko     2020-09-30  292  	bool atomic_mode;
a99042e7d9fb5c Dmitry Osipenko     2020-09-30  293  	bool dma_mode;
89e3748acd0bf6 Dmitry Osipenko     2020-09-30  294  	bool msg_read;
89e3748acd0bf6 Dmitry Osipenko     2020-09-30  295  	bool is_dvc;
89e3748acd0bf6 Dmitry Osipenko     2020-09-30  296  	bool is_vi;
db811ca0f48578 Colin Cross         2011-02-20 @297  };
db811ca0f48578 Colin Cross         2011-02-20  298  

:::::: The code at line 297 was first introduced by commit
:::::: db811ca0f48578f9940f49f284ac81e336b264ad i2c: tegra: Add i2c support

:::::: TO: Colin Cross <ccross@android.com>
:::::: CC: Ben Dooks <ben-linux@fluff.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

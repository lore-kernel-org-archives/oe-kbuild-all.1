Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF7F4379EFE
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 May 2026 19:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778529063; cv=none; b=Z1kT0CIkFDEjs5028qGnMeRqMusnJtJNp8yub4n4oA5G2aRZG9z4O5MkNoYT4HBpfrrHlSOI2+T+l8mVqhnKB6f1kGS0z0/CGbQHWI7RxOyeLvLiFhnhZYwo5ppCU1jZQc89YNqaRaedtUqH4OUYsTpgsJ1Ga8ZMrnHO5BydmQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778529063; c=relaxed/simple;
	bh=ltQ8mMEK54MKs0LHO6YT6Lj1gwHcWFxGSYtmvvfXQdE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DHgfqB8DBRdv9ixlwlQ4MPiNBrpcX7KNbnkQtniZRQqQKYuA9B1xgxVpCpx0hRjW6BkM8nhQCe45E0zM8tkt71uR8Sbl00lA65NmArJekmbSDSCUN3nCTW/5slu/hY0EmcHGZeRDx3NiacXfHos1mr3ADKFrcOzxbwo3M8fHNec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ja22fQzW; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ja22fQzW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778529060; x=1810065060;
  h=date:from:to:cc:subject:message-id;
  bh=ltQ8mMEK54MKs0LHO6YT6Lj1gwHcWFxGSYtmvvfXQdE=;
  b=ja22fQzWw/I46x6uncKpVteSOoKBxfehQvgRFl7RsZA9tzXmBwc9Hn39
   k0Ua/GtiC3OU2dcpTCcA0Q84fF2rz8gUm6G88N0/FbHQT4TJzjwtlbkfO
   X7aJMNNzRe2UekpJb9rdpFGc5CMFsVet4F/va30YtFxi34Dg3E1I4XIRE
   cTLyn9Jge9fB4O4TRBDqQIxleKVJ69PrSISYrRATxeVPPBfwLl3S4H+5H
   jZNpMYW/HHDy2oqjRk9jLQKLtExnxY1nBbipkJdnrhueq0UfFU1wmDYs0
   YJFUSPNnKfh+ArtM/mW92IALc8japzU2K/GGkJbLtAHrjQEqkf47YMHdv
   w==;
X-CSE-ConnectionGUID: 3cgSpb4HTu21K3/B77ZEww==
X-CSE-MsgGUID: N4Jj2OXYSjy7rT7xrkKLQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="79610048"
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; 
   d="scan'208";a="79610048"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2026 12:51:00 -0700
X-CSE-ConnectionGUID: EWpi5J68T92z7EFY+T5Z/w==
X-CSE-MsgGUID: VVkLC4g4TRaCYNoe0HfrHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; 
   d="scan'208";a="237776145"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 11 May 2026 12:50:58 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wMWeV-00000000169-1ISI;
	Mon, 11 May 2026 19:50:55 +0000
Date: Tue, 12 May 2026 03:50:21 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.10-lts 0/2]
 drivers/mtd/nand/raw/brcmnand/brcmnand.c:1932: warning: Function parameter or
 member 'oob' not described in 'brcmnand_edu_trans'
Message-ID: <202605120350.deNvTcAn-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android12-5.10-lts
head:   f1aef8673a6a1e79664c418fd9362c72b9253a77
commit: b7ec149a95673502a4d6b7828830e064c0520ca7 [0/2] mtd: rawnand: brcmnand: read/write oob during EDU transfer
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20260512/202605120350.deNvTcAn-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260512/202605120350.deNvTcAn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605120350.deNvTcAn-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/mtd/nand/raw/brcmnand/brcmnand.c:1932: warning: Function parameter or member 'host' not described in 'brcmnand_edu_trans'
   drivers/mtd/nand/raw/brcmnand/brcmnand.c:1932: warning: Function parameter or member 'addr' not described in 'brcmnand_edu_trans'
   drivers/mtd/nand/raw/brcmnand/brcmnand.c:1932: warning: Function parameter or member 'buf' not described in 'brcmnand_edu_trans'
>> drivers/mtd/nand/raw/brcmnand/brcmnand.c:1932: warning: Function parameter or member 'oob' not described in 'brcmnand_edu_trans'
   drivers/mtd/nand/raw/brcmnand/brcmnand.c:1932: warning: Function parameter or member 'len' not described in 'brcmnand_edu_trans'
   drivers/mtd/nand/raw/brcmnand/brcmnand.c:1932: warning: Function parameter or member 'cmd' not described in 'brcmnand_edu_trans'
   drivers/mtd/nand/raw/brcmnand/brcmnand.c:2053: warning: Function parameter or member 'host' not described in 'brcmnand_fill_dma_desc'
   drivers/mtd/nand/raw/brcmnand/brcmnand.c:2053: warning: Function parameter or member 'desc' not described in 'brcmnand_fill_dma_desc'
   drivers/mtd/nand/raw/brcmnand/brcmnand.c:2053: warning: Function parameter or member 'addr' not described in 'brcmnand_fill_dma_desc'
   drivers/mtd/nand/raw/brcmnand/brcmnand.c:2053: warning: Function parameter or member 'buf' not described in 'brcmnand_fill_dma_desc'
   drivers/mtd/nand/raw/brcmnand/brcmnand.c:2053: warning: Function parameter or member 'len' not described in 'brcmnand_fill_dma_desc'
   drivers/mtd/nand/raw/brcmnand/brcmnand.c:2053: warning: Function parameter or member 'dma_cmd' not described in 'brcmnand_fill_dma_desc'
   drivers/mtd/nand/raw/brcmnand/brcmnand.c:2053: warning: Function parameter or member 'begin' not described in 'brcmnand_fill_dma_desc'
   drivers/mtd/nand/raw/brcmnand/brcmnand.c:2053: warning: Function parameter or member 'end' not described in 'brcmnand_fill_dma_desc'
   drivers/mtd/nand/raw/brcmnand/brcmnand.c:2053: warning: Function parameter or member 'next_desc' not described in 'brcmnand_fill_dma_desc'
   drivers/mtd/nand/raw/brcmnand/brcmnand.c:2079: warning: Function parameter or member 'host' not described in 'brcmnand_dma_run'
   drivers/mtd/nand/raw/brcmnand/brcmnand.c:2079: warning: Function parameter or member 'desc' not described in 'brcmnand_dma_run'


vim +1932 drivers/mtd/nand/raw/brcmnand/brcmnand.c

27c5b17cd1b1056 drivers/mtd/nand/brcmnand/brcmnand.c     Brian Norris 2015-03-06  1926  
a5d53ad26a8b441 drivers/mtd/nand/raw/brcmnand/brcmnand.c Kamal Dasu   2020-01-22  1927  /**
a5d53ad26a8b441 drivers/mtd/nand/raw/brcmnand/brcmnand.c Kamal Dasu   2020-01-22  1928   *  Kick EDU engine
a5d53ad26a8b441 drivers/mtd/nand/raw/brcmnand/brcmnand.c Kamal Dasu   2020-01-22  1929   */
a5d53ad26a8b441 drivers/mtd/nand/raw/brcmnand/brcmnand.c Kamal Dasu   2020-01-22  1930  static int brcmnand_edu_trans(struct brcmnand_host *host, u64 addr, u32 *buf,
b7ec149a9567350 drivers/mtd/nand/raw/brcmnand/brcmnand.c Kamal Dasu   2021-03-11  1931  			      u8 *oob, u32 len, u8 cmd)
a5d53ad26a8b441 drivers/mtd/nand/raw/brcmnand/brcmnand.c Kamal Dasu   2020-01-22 @1932  {
a5d53ad26a8b441 drivers/mtd/nand/raw/brcmnand/brcmnand.c Kamal Dasu   2020-01-22  1933  	struct brcmnand_controller *ctrl = host->ctrl;
b7ec149a9567350 drivers/mtd/nand/raw/brcmnand/brcmnand.c Kamal Dasu   2021-03-11  1934  	struct brcmnand_cfg *cfg = &host->hwcfg;
a5d53ad26a8b441 drivers/mtd/nand/raw/brcmnand/brcmnand.c Kamal Dasu   2020-01-22  1935  	unsigned long timeo = msecs_to_jiffies(200);
a5d53ad26a8b441 drivers/mtd/nand/raw/brcmnand/brcmnand.c Kamal Dasu   2020-01-22  1936  	int ret = 0;
a5d53ad26a8b441 drivers/mtd/nand/raw/brcmnand/brcmnand.c Kamal Dasu   2020-01-22  1937  	int dir = (cmd == CMD_PAGE_READ ? DMA_FROM_DEVICE : DMA_TO_DEVICE);
a5d53ad26a8b441 drivers/mtd/nand/raw/brcmnand/brcmnand.c Kamal Dasu   2020-01-22  1938  	u8 edu_cmd = (cmd == CMD_PAGE_READ ? EDU_CMD_READ : EDU_CMD_WRITE);
a5d53ad26a8b441 drivers/mtd/nand/raw/brcmnand/brcmnand.c Kamal Dasu   2020-01-22  1939  	unsigned int trans = len >> FC_SHIFT;
a5d53ad26a8b441 drivers/mtd/nand/raw/brcmnand/brcmnand.c Kamal Dasu   2020-01-22  1940  	dma_addr_t pa;
a5d53ad26a8b441 drivers/mtd/nand/raw/brcmnand/brcmnand.c Kamal Dasu   2020-01-22  1941  
b7ec149a9567350 drivers/mtd/nand/raw/brcmnand/brcmnand.c Kamal Dasu   2021-03-11  1942  	dev_dbg(ctrl->dev, "EDU %s %p:%p\n", ((edu_cmd == EDU_CMD_READ) ?
b7ec149a9567350 drivers/mtd/nand/raw/brcmnand/brcmnand.c Kamal Dasu   2021-03-11  1943  					      "read" : "write"), buf, oob);
b7ec149a9567350 drivers/mtd/nand/raw/brcmnand/brcmnand.c Kamal Dasu   2021-03-11  1944  
a5d53ad26a8b441 drivers/mtd/nand/raw/brcmnand/brcmnand.c Kamal Dasu   2020-01-22  1945  	pa = dma_map_single(ctrl->dev, buf, len, dir);
a5d53ad26a8b441 drivers/mtd/nand/raw/brcmnand/brcmnand.c Kamal Dasu   2020-01-22  1946  	if (dma_mapping_error(ctrl->dev, pa)) {
a5d53ad26a8b441 drivers/mtd/nand/raw/brcmnand/brcmnand.c Kamal Dasu   2020-01-22  1947  		dev_err(ctrl->dev, "unable to map buffer for EDU DMA\n");
a5d53ad26a8b441 drivers/mtd/nand/raw/brcmnand/brcmnand.c Kamal Dasu   2020-01-22  1948  		return -ENOMEM;
a5d53ad26a8b441 drivers/mtd/nand/raw/brcmnand/brcmnand.c Kamal Dasu   2020-01-22  1949  	}
a5d53ad26a8b441 drivers/mtd/nand/raw/brcmnand/brcmnand.c Kamal Dasu   2020-01-22  1950  
a5d53ad26a8b441 drivers/mtd/nand/raw/brcmnand/brcmnand.c Kamal Dasu   2020-01-22  1951  	ctrl->edu_pending = true;
a5d53ad26a8b441 drivers/mtd/nand/raw/brcmnand/brcmnand.c Kamal Dasu   2020-01-22  1952  	ctrl->edu_dram_addr = pa;
a5d53ad26a8b441 drivers/mtd/nand/raw/brcmnand/brcmnand.c Kamal Dasu   2020-01-22  1953  	ctrl->edu_ext_addr = addr;
a5d53ad26a8b441 drivers/mtd/nand/raw/brcmnand/brcmnand.c Kamal Dasu   2020-01-22  1954  	ctrl->edu_cmd = edu_cmd;
a5d53ad26a8b441 drivers/mtd/nand/raw/brcmnand/brcmnand.c Kamal Dasu   2020-01-22  1955  	ctrl->edu_count = trans;
b7ec149a9567350 drivers/mtd/nand/raw/brcmnand/brcmnand.c Kamal Dasu   2021-03-11  1956  	ctrl->sas = cfg->spare_area_size;
b7ec149a9567350 drivers/mtd/nand/raw/brcmnand/brcmnand.c Kamal Dasu   2021-03-11  1957  	ctrl->oob = oob;
a5d53ad26a8b441 drivers/mtd/nand/raw/brcmnand/brcmnand.c Kamal Dasu   2020-01-22  1958  
a5d53ad26a8b441 drivers/mtd/nand/raw/brcmnand/brcmnand.c Kamal Dasu   2020-01-22  1959  	edu_writel(ctrl, EDU_DRAM_ADDR, (u32)ctrl->edu_dram_addr);
a5d53ad26a8b441 drivers/mtd/nand/raw/brcmnand/brcmnand.c Kamal Dasu   2020-01-22  1960  	edu_readl(ctrl,  EDU_DRAM_ADDR);
a5d53ad26a8b441 drivers/mtd/nand/raw/brcmnand/brcmnand.c Kamal Dasu   2020-01-22  1961  	edu_writel(ctrl, EDU_EXT_ADDR, ctrl->edu_ext_addr);
a5d53ad26a8b441 drivers/mtd/nand/raw/brcmnand/brcmnand.c Kamal Dasu   2020-01-22  1962  	edu_readl(ctrl, EDU_EXT_ADDR);
a5d53ad26a8b441 drivers/mtd/nand/raw/brcmnand/brcmnand.c Kamal Dasu   2020-01-22  1963  	edu_writel(ctrl, EDU_LENGTH, FC_BYTES);
a5d53ad26a8b441 drivers/mtd/nand/raw/brcmnand/brcmnand.c Kamal Dasu   2020-01-22  1964  	edu_readl(ctrl, EDU_LENGTH);
a5d53ad26a8b441 drivers/mtd/nand/raw/brcmnand/brcmnand.c Kamal Dasu   2020-01-22  1965  
b7ec149a9567350 drivers/mtd/nand/raw/brcmnand/brcmnand.c Kamal Dasu   2021-03-11  1966  	if (ctrl->oob && (ctrl->edu_cmd == EDU_CMD_WRITE)) {
b7ec149a9567350 drivers/mtd/nand/raw/brcmnand/brcmnand.c Kamal Dasu   2021-03-11  1967  		brcmnand_write_reg(ctrl, BRCMNAND_CMD_ADDRESS,
b7ec149a9567350 drivers/mtd/nand/raw/brcmnand/brcmnand.c Kamal Dasu   2021-03-11  1968  				   ctrl->edu_ext_addr);
b7ec149a9567350 drivers/mtd/nand/raw/brcmnand/brcmnand.c Kamal Dasu   2021-03-11  1969  		brcmnand_read_reg(ctrl, BRCMNAND_CMD_ADDRESS);
b7ec149a9567350 drivers/mtd/nand/raw/brcmnand/brcmnand.c Kamal Dasu   2021-03-11  1970  		ctrl->oob += write_oob_to_regs(ctrl,
b7ec149a9567350 drivers/mtd/nand/raw/brcmnand/brcmnand.c Kamal Dasu   2021-03-11  1971  					       1,
b7ec149a9567350 drivers/mtd/nand/raw/brcmnand/brcmnand.c Kamal Dasu   2021-03-11  1972  					       ctrl->oob, ctrl->sas,
b7ec149a9567350 drivers/mtd/nand/raw/brcmnand/brcmnand.c Kamal Dasu   2021-03-11  1973  					       ctrl->sector_size_1k);
b7ec149a9567350 drivers/mtd/nand/raw/brcmnand/brcmnand.c Kamal Dasu   2021-03-11  1974  	}
b7ec149a9567350 drivers/mtd/nand/raw/brcmnand/brcmnand.c Kamal Dasu   2021-03-11  1975  
a5d53ad26a8b441 drivers/mtd/nand/raw/brcmnand/brcmnand.c Kamal Dasu   2020-01-22  1976  	/* Start edu engine */
a5d53ad26a8b441 drivers/mtd/nand/raw/brcmnand/brcmnand.c Kamal Dasu   2020-01-22  1977  	mb(); /* flush previous writes */
a5d53ad26a8b441 drivers/mtd/nand/raw/brcmnand/brcmnand.c Kamal Dasu   2020-01-22  1978  	edu_writel(ctrl, EDU_CMD, ctrl->edu_cmd);
a5d53ad26a8b441 drivers/mtd/nand/raw/brcmnand/brcmnand.c Kamal Dasu   2020-01-22  1979  	edu_readl(ctrl, EDU_CMD);
a5d53ad26a8b441 drivers/mtd/nand/raw/brcmnand/brcmnand.c Kamal Dasu   2020-01-22  1980  
a5d53ad26a8b441 drivers/mtd/nand/raw/brcmnand/brcmnand.c Kamal Dasu   2020-01-22  1981  	if (wait_for_completion_timeout(&ctrl->edu_done, timeo) <= 0) {
a5d53ad26a8b441 drivers/mtd/nand/raw/brcmnand/brcmnand.c Kamal Dasu   2020-01-22  1982  		dev_err(ctrl->dev,
a5d53ad26a8b441 drivers/mtd/nand/raw/brcmnand/brcmnand.c Kamal Dasu   2020-01-22  1983  			"timeout waiting for EDU; status %#x, error status %#x\n",
a5d53ad26a8b441 drivers/mtd/nand/raw/brcmnand/brcmnand.c Kamal Dasu   2020-01-22  1984  			edu_readl(ctrl, EDU_STATUS),
a5d53ad26a8b441 drivers/mtd/nand/raw/brcmnand/brcmnand.c Kamal Dasu   2020-01-22  1985  			edu_readl(ctrl, EDU_ERR_STATUS));
a5d53ad26a8b441 drivers/mtd/nand/raw/brcmnand/brcmnand.c Kamal Dasu   2020-01-22  1986  	}
a5d53ad26a8b441 drivers/mtd/nand/raw/brcmnand/brcmnand.c Kamal Dasu   2020-01-22  1987  
a5d53ad26a8b441 drivers/mtd/nand/raw/brcmnand/brcmnand.c Kamal Dasu   2020-01-22  1988  	dma_unmap_single(ctrl->dev, pa, len, dir);
a5d53ad26a8b441 drivers/mtd/nand/raw/brcmnand/brcmnand.c Kamal Dasu   2020-01-22  1989  
b7ec149a9567350 drivers/mtd/nand/raw/brcmnand/brcmnand.c Kamal Dasu   2021-03-11  1990  	/* read last subpage oob */
b7ec149a9567350 drivers/mtd/nand/raw/brcmnand/brcmnand.c Kamal Dasu   2021-03-11  1991  	if (ctrl->oob && (ctrl->edu_cmd == EDU_CMD_READ)) {
b7ec149a9567350 drivers/mtd/nand/raw/brcmnand/brcmnand.c Kamal Dasu   2021-03-11  1992  		ctrl->oob += read_oob_from_regs(ctrl,
b7ec149a9567350 drivers/mtd/nand/raw/brcmnand/brcmnand.c Kamal Dasu   2021-03-11  1993  						1,
b7ec149a9567350 drivers/mtd/nand/raw/brcmnand/brcmnand.c Kamal Dasu   2021-03-11  1994  						ctrl->oob, ctrl->sas,
b7ec149a9567350 drivers/mtd/nand/raw/brcmnand/brcmnand.c Kamal Dasu   2021-03-11  1995  						ctrl->sector_size_1k);
b7ec149a9567350 drivers/mtd/nand/raw/brcmnand/brcmnand.c Kamal Dasu   2021-03-11  1996  	}
b7ec149a9567350 drivers/mtd/nand/raw/brcmnand/brcmnand.c Kamal Dasu   2021-03-11  1997  
a5d53ad26a8b441 drivers/mtd/nand/raw/brcmnand/brcmnand.c Kamal Dasu   2020-01-22  1998  	/* for program page check NAND status */
a5d53ad26a8b441 drivers/mtd/nand/raw/brcmnand/brcmnand.c Kamal Dasu   2020-01-22  1999  	if (((brcmnand_read_reg(ctrl, BRCMNAND_INTFC_STATUS) &
a5d53ad26a8b441 drivers/mtd/nand/raw/brcmnand/brcmnand.c Kamal Dasu   2020-01-22  2000  	      INTFC_FLASH_STATUS) & NAND_STATUS_FAIL) &&
a5d53ad26a8b441 drivers/mtd/nand/raw/brcmnand/brcmnand.c Kamal Dasu   2020-01-22  2001  	    edu_cmd == EDU_CMD_WRITE) {
a5d53ad26a8b441 drivers/mtd/nand/raw/brcmnand/brcmnand.c Kamal Dasu   2020-01-22  2002  		dev_info(ctrl->dev, "program failed at %llx\n",
a5d53ad26a8b441 drivers/mtd/nand/raw/brcmnand/brcmnand.c Kamal Dasu   2020-01-22  2003  			 (unsigned long long)addr);
a5d53ad26a8b441 drivers/mtd/nand/raw/brcmnand/brcmnand.c Kamal Dasu   2020-01-22  2004  		ret = -EIO;
a5d53ad26a8b441 drivers/mtd/nand/raw/brcmnand/brcmnand.c Kamal Dasu   2020-01-22  2005  	}
a5d53ad26a8b441 drivers/mtd/nand/raw/brcmnand/brcmnand.c Kamal Dasu   2020-01-22  2006  
a5d53ad26a8b441 drivers/mtd/nand/raw/brcmnand/brcmnand.c Kamal Dasu   2020-01-22  2007  	/* Make sure the EDU status is clean */
a5d53ad26a8b441 drivers/mtd/nand/raw/brcmnand/brcmnand.c Kamal Dasu   2020-01-22  2008  	if (edu_readl(ctrl, EDU_STATUS) & EDU_STATUS_ACTIVE)
a5d53ad26a8b441 drivers/mtd/nand/raw/brcmnand/brcmnand.c Kamal Dasu   2020-01-22  2009  		dev_warn(ctrl->dev, "EDU still active: %#x\n",
a5d53ad26a8b441 drivers/mtd/nand/raw/brcmnand/brcmnand.c Kamal Dasu   2020-01-22  2010  			 edu_readl(ctrl, EDU_STATUS));
a5d53ad26a8b441 drivers/mtd/nand/raw/brcmnand/brcmnand.c Kamal Dasu   2020-01-22  2011  
a5d53ad26a8b441 drivers/mtd/nand/raw/brcmnand/brcmnand.c Kamal Dasu   2020-01-22  2012  	if (unlikely(edu_readl(ctrl, EDU_ERR_STATUS) & EDU_ERR_STATUS_ERRACK)) {
a5d53ad26a8b441 drivers/mtd/nand/raw/brcmnand/brcmnand.c Kamal Dasu   2020-01-22  2013  		dev_warn(ctrl->dev, "EDU RBUS error at addr %llx\n",
a5d53ad26a8b441 drivers/mtd/nand/raw/brcmnand/brcmnand.c Kamal Dasu   2020-01-22  2014  			 (unsigned long long)addr);
a5d53ad26a8b441 drivers/mtd/nand/raw/brcmnand/brcmnand.c Kamal Dasu   2020-01-22  2015  		ret = -EIO;
a5d53ad26a8b441 drivers/mtd/nand/raw/brcmnand/brcmnand.c Kamal Dasu   2020-01-22  2016  	}
a5d53ad26a8b441 drivers/mtd/nand/raw/brcmnand/brcmnand.c Kamal Dasu   2020-01-22  2017  
a5d53ad26a8b441 drivers/mtd/nand/raw/brcmnand/brcmnand.c Kamal Dasu   2020-01-22  2018  	ctrl->edu_pending = false;
a5d53ad26a8b441 drivers/mtd/nand/raw/brcmnand/brcmnand.c Kamal Dasu   2020-01-22  2019  	brcmnand_edu_init(ctrl);
a5d53ad26a8b441 drivers/mtd/nand/raw/brcmnand/brcmnand.c Kamal Dasu   2020-01-22  2020  	edu_writel(ctrl, EDU_STOP, 0); /* force stop */
a5d53ad26a8b441 drivers/mtd/nand/raw/brcmnand/brcmnand.c Kamal Dasu   2020-01-22  2021  	edu_readl(ctrl, EDU_STOP);
a5d53ad26a8b441 drivers/mtd/nand/raw/brcmnand/brcmnand.c Kamal Dasu   2020-01-22  2022  
4551e78ad98add1 drivers/mtd/nand/raw/brcmnand/brcmnand.c Kamal Dasu   2020-06-12  2023  	if (!ret && edu_cmd == EDU_CMD_READ) {
4551e78ad98add1 drivers/mtd/nand/raw/brcmnand/brcmnand.c Kamal Dasu   2020-06-12  2024  		u64 err_addr = 0;
4551e78ad98add1 drivers/mtd/nand/raw/brcmnand/brcmnand.c Kamal Dasu   2020-06-12  2025  
4551e78ad98add1 drivers/mtd/nand/raw/brcmnand/brcmnand.c Kamal Dasu   2020-06-12  2026  		/*
4551e78ad98add1 drivers/mtd/nand/raw/brcmnand/brcmnand.c Kamal Dasu   2020-06-12  2027  		 * check for ECC errors here, subpage ECC errors are
4551e78ad98add1 drivers/mtd/nand/raw/brcmnand/brcmnand.c Kamal Dasu   2020-06-12  2028  		 * retained in ECC error address register
4551e78ad98add1 drivers/mtd/nand/raw/brcmnand/brcmnand.c Kamal Dasu   2020-06-12  2029  		 */
4551e78ad98add1 drivers/mtd/nand/raw/brcmnand/brcmnand.c Kamal Dasu   2020-06-12  2030  		err_addr = brcmnand_get_uncorrecc_addr(ctrl);
4551e78ad98add1 drivers/mtd/nand/raw/brcmnand/brcmnand.c Kamal Dasu   2020-06-12  2031  		if (!err_addr) {
4551e78ad98add1 drivers/mtd/nand/raw/brcmnand/brcmnand.c Kamal Dasu   2020-06-12  2032  			err_addr = brcmnand_get_correcc_addr(ctrl);
4551e78ad98add1 drivers/mtd/nand/raw/brcmnand/brcmnand.c Kamal Dasu   2020-06-12  2033  			if (err_addr)
4551e78ad98add1 drivers/mtd/nand/raw/brcmnand/brcmnand.c Kamal Dasu   2020-06-12  2034  				ret = -EUCLEAN;
4551e78ad98add1 drivers/mtd/nand/raw/brcmnand/brcmnand.c Kamal Dasu   2020-06-12  2035  		} else
4551e78ad98add1 drivers/mtd/nand/raw/brcmnand/brcmnand.c Kamal Dasu   2020-06-12  2036  			ret = -EBADMSG;
4551e78ad98add1 drivers/mtd/nand/raw/brcmnand/brcmnand.c Kamal Dasu   2020-06-12  2037  	}
4551e78ad98add1 drivers/mtd/nand/raw/brcmnand/brcmnand.c Kamal Dasu   2020-06-12  2038  
a5d53ad26a8b441 drivers/mtd/nand/raw/brcmnand/brcmnand.c Kamal Dasu   2020-01-22  2039  	return ret;
a5d53ad26a8b441 drivers/mtd/nand/raw/brcmnand/brcmnand.c Kamal Dasu   2020-01-22  2040  }
a5d53ad26a8b441 drivers/mtd/nand/raw/brcmnand/brcmnand.c Kamal Dasu   2020-01-22  2041  

:::::: The code at line 1932 was first introduced by commit
:::::: a5d53ad26a8b441325eb9de8e9bb816584ebca7c mtd: rawnand: brcmnand: Add support for flash-edu for dma transfers

:::::: TO: Kamal Dasu <kdasu.kdev@gmail.com>
:::::: CC: Miquel Raynal <miquel.raynal@bootlin.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

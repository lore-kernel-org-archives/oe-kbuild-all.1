Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0357E2AD02
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 May 2024 12:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714737933; cv=none; b=XbRSpMydvVX+2g7hCcsUjDR++VIXTEe7zOGU3Jn2JBW5zSM1ve8FZP2mv97Uyw1yz7l8u8f7CMLf/nkjXBkpaJqfwMFiQ7I7jn+uBl2tBrRrU7Nosne+L00cPYsvXZZT6TJOUqeoI/sYTjxSKMcepEpzMt2kRqlDEp+axRbXYak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714737933; c=relaxed/simple;
	bh=dRM9RcIkJWajOfvgYKi6gTUm8LzBsJE/Y7zl/VtN+so=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lDXQpYE414Gji6teN3BivTMlPpES4fVXTmT2snw2d9PESZ9J3mQIZjQBCbwlESztP6V3Ox/1Bd2ngcSF4JHrW3sIiJ8nmJDaFly4LZRWPbRKHnIPBWBiIY2jx8QVuu8aHMkNLlbrHq6JBlwD/ISdAKYf6MrGUB3Wp155RadK1pM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lDLn1BOm; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lDLn1BOm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714737932; x=1746273932;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=dRM9RcIkJWajOfvgYKi6gTUm8LzBsJE/Y7zl/VtN+so=;
  b=lDLn1BOmehS5WQefFX4qA8XPBvYTpj59hKwa3AFabmvGZvkk14jPR8Mx
   J+qsqk1OIu3X7LeNY8CItQPcWPlEatMdVNcGaZdj1AQnSAQUwtpcFkHyP
   ztcgDjY42AUOOrHupF0M8A7yKHlIU/r2NOCxu+T1NjkjCpFGh6EmUOnAI
   C/BRXdc1+EWo+/1wAVsolzsDw9EIfsMWG4bZSKMikjR8CxvJ1Bz3za8oZ
   HwnKNUbOArKwqSbH4dqWCncp/edPZaXycz4d4FFR3h3I711VDe69opg3X
   RD7lNgXJn958a501iM56YNl7K6Im48vWHuKxSpWHwWsEM1QkitjJQL2dG
   Q==;
X-CSE-ConnectionGUID: 2pZwFsxoRBerQ6fLqJDf/Q==
X-CSE-MsgGUID: Bs5VSbPqSDKZTFoR/H6uTg==
X-IronPort-AV: E=McAfee;i="6600,9927,11062"; a="10703005"
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; 
   d="scan'208";a="10703005"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2024 05:05:32 -0700
X-CSE-ConnectionGUID: YRb9p1qdRCC5cw9Cbsp4mA==
X-CSE-MsgGUID: zse9O9TyTuiSvgr+2cUsNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; 
   d="scan'208";a="31913237"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 03 May 2024 05:05:30 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s2rfM-000BfA-01;
	Fri, 03 May 2024 12:05:28 +0000
Date: Fri, 3 May 2024 20:04:40 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Stanley <joel@jms.id.au>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [shenki:aspeed-6.9-rebase 483/1143]
 drivers/spi/spi-aspeed-smc.c:359:37: error: incompatible pointer to integer
 conversion passing 'const struct spi_mem_op *' to parameter of type 'u8'
 (aka 'unsigned char')
Message-ID: <202405031927.Q5p2a1si-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://github.com/shenki/linux aspeed-6.9-rebase
head:   9bdcee91eb5d9149678acb9d066e9dafbd026721
commit: 27d50ee4b07f666120eec24379af1fb451d64876 [483/1143] spi: aspeed: Support address bus width greater than 1
config: arm-randconfig-002-20240503 (https://download.01.org/0day-ci/archive/20240503/202405031927.Q5p2a1si-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 37ae4ad0eef338776c7e2cffb3896153d43dcd90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240503/202405031927.Q5p2a1si-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405031927.Q5p2a1si-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/spi/spi-aspeed-smc.c:14:
   In file included from include/linux/spi/spi.h:17:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2208:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/spi/spi-aspeed-smc.c:359:37: error: incompatible pointer to integer conversion passing 'const struct spi_mem_op *' to parameter of type 'u8' (aka 'unsigned char') [-Wint-conversion]
     359 |                 ctl_val |= aspeed_spi_get_io_mode(op);
         |                                                   ^~
   drivers/spi/spi-aspeed-smc.c:110:38: note: passing argument to parameter 'buswidth' here
     110 | static u32 aspeed_spi_get_io_mode(u8 buswidth)
         |                                      ^
   1 warning and 1 error generated.


vim +359 drivers/spi/spi-aspeed-smc.c

53526ab27d9c25 Cédric Le Goater                    2022-05-09  320  
e3228ed9289345 Cédric Le Goater                    2022-05-09  321  static int do_aspeed_spi_exec_op(struct spi_mem *mem, const struct spi_mem_op *op)
e3228ed9289345 Cédric Le Goater                    2022-05-09  322  {
21ac58f59125f1 Yang Yingliang                      2023-07-28  323  	struct aspeed_spi *aspi = spi_controller_get_devdata(mem->spi->controller);
9e264f3f85a56c Amit Kumar Mahapatra via Alsa-devel 2023-03-10  324  	struct aspeed_spi_chip *chip = &aspi->chips[spi_get_chipselect(mem->spi, 0)];
e3228ed9289345 Cédric Le Goater                    2022-05-09  325  	u32 addr_mode, addr_mode_backup;
e3228ed9289345 Cédric Le Goater                    2022-05-09  326  	u32 ctl_val;
e3228ed9289345 Cédric Le Goater                    2022-05-09  327  	int ret = 0;
e3228ed9289345 Cédric Le Goater                    2022-05-09  328  
e3228ed9289345 Cédric Le Goater                    2022-05-09  329  	dev_dbg(aspi->dev,
e3228ed9289345 Cédric Le Goater                    2022-05-09  330  		"CE%d %s OP %#x mode:%d.%d.%d.%d naddr:%#x ndummies:%#x len:%#x",
e3228ed9289345 Cédric Le Goater                    2022-05-09  331  		chip->cs, op->data.dir == SPI_MEM_DATA_IN ? "read" : "write",
e3228ed9289345 Cédric Le Goater                    2022-05-09  332  		op->cmd.opcode, op->cmd.buswidth, op->addr.buswidth,
e3228ed9289345 Cédric Le Goater                    2022-05-09  333  		op->dummy.buswidth, op->data.buswidth,
e3228ed9289345 Cédric Le Goater                    2022-05-09  334  		op->addr.nbytes, op->dummy.nbytes, op->data.nbytes);
e3228ed9289345 Cédric Le Goater                    2022-05-09  335  
e3228ed9289345 Cédric Le Goater                    2022-05-09  336  	addr_mode = readl(aspi->regs + CE_CTRL_REG);
e3228ed9289345 Cédric Le Goater                    2022-05-09  337  	addr_mode_backup = addr_mode;
e3228ed9289345 Cédric Le Goater                    2022-05-09  338  
e3228ed9289345 Cédric Le Goater                    2022-05-09  339  	ctl_val = chip->ctl_val[ASPEED_SPI_BASE];
e3228ed9289345 Cédric Le Goater                    2022-05-09  340  	ctl_val &= ~CTRL_IO_CMD_MASK;
e3228ed9289345 Cédric Le Goater                    2022-05-09  341  
e3228ed9289345 Cédric Le Goater                    2022-05-09  342  	ctl_val |= op->cmd.opcode << CTRL_COMMAND_SHIFT;
e3228ed9289345 Cédric Le Goater                    2022-05-09  343  
e3228ed9289345 Cédric Le Goater                    2022-05-09  344  	/* 4BYTE address mode */
e3228ed9289345 Cédric Le Goater                    2022-05-09  345  	if (op->addr.nbytes) {
e3228ed9289345 Cédric Le Goater                    2022-05-09  346  		if (op->addr.nbytes == 4)
e3228ed9289345 Cédric Le Goater                    2022-05-09  347  			addr_mode |= (0x11 << chip->cs);
e3228ed9289345 Cédric Le Goater                    2022-05-09  348  		else
e3228ed9289345 Cédric Le Goater                    2022-05-09  349  			addr_mode &= ~(0x11 << chip->cs);
53526ab27d9c25 Cédric Le Goater                    2022-05-09  350  
53526ab27d9c25 Cédric Le Goater                    2022-05-09  351  		if (op->addr.nbytes == 4 && chip->aspi->data == &ast2400_spi_data)
53526ab27d9c25 Cédric Le Goater                    2022-05-09  352  			ctl_val |= CTRL_IO_ADDRESS_4B;
e3228ed9289345 Cédric Le Goater                    2022-05-09  353  	}
e3228ed9289345 Cédric Le Goater                    2022-05-09  354  
e3228ed9289345 Cédric Le Goater                    2022-05-09  355  	if (op->dummy.nbytes)
e3228ed9289345 Cédric Le Goater                    2022-05-09  356  		ctl_val |= CTRL_IO_DUMMY_SET(op->dummy.nbytes / op->dummy.buswidth);
e3228ed9289345 Cédric Le Goater                    2022-05-09  357  
e3228ed9289345 Cédric Le Goater                    2022-05-09  358  	if (op->data.nbytes)
e3228ed9289345 Cédric Le Goater                    2022-05-09 @359  		ctl_val |= aspeed_spi_get_io_mode(op);
e3228ed9289345 Cédric Le Goater                    2022-05-09  360  
e3228ed9289345 Cédric Le Goater                    2022-05-09  361  	if (op->data.dir == SPI_MEM_DATA_OUT)
e3228ed9289345 Cédric Le Goater                    2022-05-09  362  		ctl_val |= CTRL_IO_MODE_WRITE;
e3228ed9289345 Cédric Le Goater                    2022-05-09  363  	else
e3228ed9289345 Cédric Le Goater                    2022-05-09  364  		ctl_val |= CTRL_IO_MODE_READ;
e3228ed9289345 Cédric Le Goater                    2022-05-09  365  
e3228ed9289345 Cédric Le Goater                    2022-05-09  366  	if (addr_mode != addr_mode_backup)
e3228ed9289345 Cédric Le Goater                    2022-05-09  367  		writel(addr_mode, aspi->regs + CE_CTRL_REG);
e3228ed9289345 Cédric Le Goater                    2022-05-09  368  	writel(ctl_val, chip->ctl);
e3228ed9289345 Cédric Le Goater                    2022-05-09  369  
e3228ed9289345 Cédric Le Goater                    2022-05-09  370  	if (op->data.dir == SPI_MEM_DATA_IN) {
e3228ed9289345 Cédric Le Goater                    2022-05-09  371  		if (!op->addr.nbytes)
e3228ed9289345 Cédric Le Goater                    2022-05-09  372  			ret = aspeed_spi_read_reg(chip, op);
e3228ed9289345 Cédric Le Goater                    2022-05-09  373  		else
e3228ed9289345 Cédric Le Goater                    2022-05-09  374  			ret = aspeed_spi_read_user(chip, op, op->addr.val,
e3228ed9289345 Cédric Le Goater                    2022-05-09  375  						   op->data.nbytes, op->data.buf.in);
e3228ed9289345 Cédric Le Goater                    2022-05-09  376  	} else {
e3228ed9289345 Cédric Le Goater                    2022-05-09  377  		if (!op->addr.nbytes)
e3228ed9289345 Cédric Le Goater                    2022-05-09  378  			ret = aspeed_spi_write_reg(chip, op);
e3228ed9289345 Cédric Le Goater                    2022-05-09  379  		else
e3228ed9289345 Cédric Le Goater                    2022-05-09  380  			ret = aspeed_spi_write_user(chip, op);
e3228ed9289345 Cédric Le Goater                    2022-05-09  381  	}
e3228ed9289345 Cédric Le Goater                    2022-05-09  382  
e3228ed9289345 Cédric Le Goater                    2022-05-09  383  	/* Restore defaults */
e3228ed9289345 Cédric Le Goater                    2022-05-09  384  	if (addr_mode != addr_mode_backup)
e3228ed9289345 Cédric Le Goater                    2022-05-09  385  		writel(addr_mode_backup, aspi->regs + CE_CTRL_REG);
e3228ed9289345 Cédric Le Goater                    2022-05-09  386  	writel(chip->ctl_val[ASPEED_SPI_READ], chip->ctl);
e3228ed9289345 Cédric Le Goater                    2022-05-09  387  	return ret;
e3228ed9289345 Cédric Le Goater                    2022-05-09  388  }
e3228ed9289345 Cédric Le Goater                    2022-05-09  389  

:::::: The code at line 359 was first introduced by commit
:::::: e3228ed92893458e360ba2be8d75d859e115e552 spi: spi-mem: Convert Aspeed SMC driver to spi-mem

:::::: TO: Cédric Le Goater <clg@kaod.org>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

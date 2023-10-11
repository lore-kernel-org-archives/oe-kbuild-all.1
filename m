Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 175741C2F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Oct 2023 01:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RtVXV1TF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696989171; x=1728525171;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HFSCPfLEY+DxD2cO6xlONZt+buGAmVCX2jpZnBuP2F4=;
  b=RtVXV1TFGNmmfLmltGXZmneMjzZ4tdlXZNrDTnfAadX1jax3LsonaqwX
   rra2W402f6vOXMH10ti18N21Mj80UNxtiNiE/d9jKE2YiFuw4HD9qT8R5
   Os40L0fDS5e+zuqpPvvAJXlJUPQ3JGoZ6c+U5PHwcN2lO4C7myOQxkeb/
   FBTvkE9+jdjTuAbuxJCX1duOyxGiC4DUtUEl2cpnn8uwTFpIB9UgjSZTf
   MBw65fw23DYmxU74XDSaaPH5+R01cAZGjvX80orLnHKnHjDWJocEZXbZQ
   YztaGS6mPEJUUG3FvLFvJDTxKY4U9mOaXoNdHlWyTeNLMJ+46okVpwe6d
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="6118478"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200"; 
   d="scan'208";a="6118478"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2023 18:52:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="788805377"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200"; 
   d="scan'208";a="788805377"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 10 Oct 2023 18:52:46 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qqOOx-0001X5-37;
	Wed, 11 Oct 2023 01:52:43 +0000
Date: Wed, 11 Oct 2023 09:52:10 +0800
From: kernel test robot <lkp@intel.com>
To: Amit Kumar Mahapatra <amit.kumar-mahapatra@xilinx.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>,
	Naga Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>,
	Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
	P L Sai Krishna <lakshmis@xilinx.com>,
	Ranjit Waghmode <ranjit.waghmode@xilinx.com>,
	Tejas Prajapati Rameshchandra <tejas.prajapati.rameshchandra@xilinx.com>,
	Rajan Vaja <rajan.vaja@xilinx.com>
Subject: [xilinx-xlnx:pr/146 11243/14527] drivers/mtd/spi-nor/core.c:516:
 warning: Function parameter or member 'info' not described in 'read_ear'
Message-ID: <202310110934.lTqHczfZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Amit,

FYI, the error/warning still remains.

tree:   https://github.com/Xilinx/linux-xlnx pr/146
head:   38b0c0cf11566882cda99f8e4f2243924a684be5
commit: ffc5cb8494ba2abe218134584b22fd874b71d504 [11243/14527] spi: Update ZynqMP and Versal QSPI controller driver
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20231011/202310110934.lTqHczfZ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231011/202310110934.lTqHczfZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310110934.lTqHczfZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/mtd/spi-nor/core.c:516: warning: Function parameter or member 'info' not described in 'read_ear'


vim +516 drivers/mtd/spi-nor/core.c

e99ca98f1d7190 drivers/mtd/spi-nor/spi-nor.c Ricardo Ribalda      2016-12-02  506  
bd78733fffb572 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2020-01-19  507  /**
bd78733fffb572 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2020-01-19  508   * read_ear - Get the extended/bank address register value
bd78733fffb572 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2020-01-19  509   * @nor:	Pointer to the flash control structure
bd78733fffb572 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2020-01-19  510   *
bd78733fffb572 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2020-01-19  511   * This routine reads the Extended/bank address register value
bd78733fffb572 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2020-01-19  512   *
bd78733fffb572 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2020-01-19  513   * Return:	Negative if error occurred.
bd78733fffb572 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2020-01-19  514   */
bd78733fffb572 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2020-01-19  515  static int read_ear(struct spi_nor *nor, struct flash_info *info)
bd78733fffb572 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2020-01-19 @516  {
bd78733fffb572 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2020-01-19  517  	int ret;
bd78733fffb572 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2020-01-19  518  	u8 code;
bd78733fffb572 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2020-01-19  519  
bd78733fffb572 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2020-01-19  520  	/* This is actually Spansion */
bd78733fffb572 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2020-01-19  521  	if (nor->jedec_id == CFI_MFR_AMD)
bd78733fffb572 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2020-01-19  522  		code = SPINOR_OP_BRRD;
bd78733fffb572 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2020-01-19  523  	/* This is actually Micron */
bd78733fffb572 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2020-01-19  524  	else if (nor->jedec_id == CFI_MFR_ST ||
bd78733fffb572 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2020-01-19  525  		 nor->jedec_id == CFI_MFR_MACRONIX ||
bd78733fffb572 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2020-01-19  526  		 nor->jedec_id == CFI_MFR_PMC)
bd78733fffb572 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2020-01-19  527  		code = SPINOR_OP_RDEAR;
bd78733fffb572 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2020-01-19  528  	else
bd78733fffb572 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2020-01-19  529  		return -EINVAL;
bd78733fffb572 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2020-01-19  530  	if (nor->spimem) {
bd78733fffb572 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2020-01-19  531  		struct spi_mem_op op =
bd78733fffb572 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2020-01-19  532  			SPI_MEM_OP(SPI_MEM_OP_CMD(code, 1),
bd78733fffb572 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2020-01-19  533  				   SPI_MEM_OP_NO_ADDR,
bd78733fffb572 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2020-01-19  534  				   SPI_MEM_OP_NO_DUMMY,
bd78733fffb572 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2020-01-19  535  				   SPI_MEM_OP_DATA_IN(1, nor->bouncebuf, 1));
bd78733fffb572 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2020-01-19  536  
bd78733fffb572 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2020-01-19  537  		ret = spi_mem_exec_op(nor->spimem, &op);
bd78733fffb572 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2020-01-19  538  	} else {
bd78733fffb572 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2020-01-19  539  		ret = nor->controller_ops->read_reg(nor, code, nor->bouncebuf, 1);
bd78733fffb572 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2020-01-19  540  	}
bd78733fffb572 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2020-01-19  541  	if (ret < 0) {
bd78733fffb572 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2020-01-19  542  		pr_err("error %d reading EAR\n", ret);
bd78733fffb572 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2020-01-19  543  		return ret;
bd78733fffb572 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2020-01-19  544  	}
bd78733fffb572 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2020-01-19  545  
bd78733fffb572 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2020-01-19  546  	return nor->bouncebuf[0];
bd78733fffb572 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2020-01-19  547  }
bd78733fffb572 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2020-01-19  548  

:::::: The code at line 516 was first introduced by commit
:::::: bd78733fffb5720020ae1b7a120d344a6d63af96 mtd: spi-nor: Add 4byte support for Zynq QSPI controller

:::::: TO: Amit Kumar Mahapatra <amit.kumar-mahapatra@xilinx.com>
:::::: CC: Michal Simek <michal.simek@xilinx.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

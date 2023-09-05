Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2754DDDB4
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Sep 2023 17:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693936574; x=1725472574;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=A6RmbUnYeKyP85CCJJkgYXoM0Teql5JuVJSdnCiw44k=;
  b=jOrOfC9CaD4oO/7kvmoYM9GAPWhowHf9rwLXG+bzNY1lKnBpGmvUt7zL
   2pWIErgtO/QOhwIDygcZzb9EwWhIoTDGPGoeEMIgLLYk5MrswaHSE+slc
   4RftLHMOXgBA07k1zU7cDr+TP70+WmWh2iXXlWgqNMxd3axADIJbLHETr
   YVUPv3CK7LTxa4iuHil+fe+ExHu0the+eIAH5GK+g9DekLAeTVQ9wVAQH
   mlACxzHEdktWFAa5YSaRhFA0WWUf9PVwBDLJy/QAJLbmrl1WeKfmyfhTF
   fEkS/8u3H8PXYzExywxQ3XqnpcYDTuvt5M3K0JV3ZhygtAA81P7adu4iy
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="376786205"
X-IronPort-AV: E=Sophos;i="6.02,229,1688454000"; 
   d="scan'208";a="376786205"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2023 10:56:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="776279516"
X-IronPort-AV: E=Sophos;i="6.02,229,1688454000"; 
   d="scan'208";a="776279516"
Received: from lkp-server02.sh.intel.com (HELO e0b2ea88afd5) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 05 Sep 2023 10:56:09 -0700
Received: from kbuild by e0b2ea88afd5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qdaGa-0001vn-2a;
	Tue, 05 Sep 2023 17:55:28 +0000
Date: Wed, 6 Sep 2023 01:54:37 +0800
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
Message-ID: <202309060112.mTgBIfKl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx pr/146
head:   38b0c0cf11566882cda99f8e4f2243924a684be5
commit: ffc5cb8494ba2abe218134584b22fd874b71d504 [11243/14527] spi: Update ZynqMP and Versal QSPI controller driver
config: arc-randconfig-r015-20230905 (https://download.01.org/0day-ci/archive/20230906/202309060112.mTgBIfKl-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230906/202309060112.mTgBIfKl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309060112.mTgBIfKl-lkp@intel.com/

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

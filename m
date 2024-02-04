Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7887B2134F
	for <oe-kbuild-all@lists.linux.dev>; Sun,  4 Feb 2024 10:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707044308; cv=none; b=hybIfOUKSyjsqRp8juFg5hLid1psPNemD1ZtV/D/azQy3UlwrFDpJJRNmbPF8SZ0bQoXLbDo75WoHdXUC9PVYgoKE1I/OVxWzYmRtVNry/Rxj96bsd8kGqIwawGBYno4yvFPtHjjqKf0Lxn0gXuIQgQGY+MTvK2MYn+r3qDrgB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707044308; c=relaxed/simple;
	bh=zRZ8oNiqoQgvU1AVQx7Nhv7SpICkjQE4EI4j+L95I0w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YSWOZrZ3fQy6vF9/gSv4PJNQL3w/rbUYJvGw0Fwj+idewJ8xfFurOZMCxS3J3nL5vUJ9R26P8N245ty1vQrIZV2zljbJ2qWiVTEXl7QhpwhI5xjuvX6ZJNeIDD3syvcgb4Ot7DnLPfm8Rk10KnrX+k5b8mX/9E+zH94z31X5oSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W3jpEcOC; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W3jpEcOC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707044307; x=1738580307;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zRZ8oNiqoQgvU1AVQx7Nhv7SpICkjQE4EI4j+L95I0w=;
  b=W3jpEcOCyMpVVRAenTCgkrXtVJqVNn6jBpisaN4bMP60FwqpXBymW5nc
   nEU3NAay3Dvq7Ezc8ByleBd9BtbeKu9nCANcxxTWlNrhYGSTmtTJm8o+G
   qnLdOp2uyNNXBPqSvH0Qp/5Bvz4sWwXdr4F1Qt4hTeiruD/MqHtTFy85p
   CA/fdpvyR+8Sm+iEEwKil69mqLoHFG4Zm3osEWhZaYls1ldmbVOYP2q/A
   Mr4c2MwovMs7QEM/BdgipgElrxvWYfGOb7slTA9vTyLQEq49jSdDg06nH
   zZ+BniuoeRJ84YxvQZrXjHlBwJkV29zqhs7O4A6zAx6iVoCPhUx92SRcx
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10973"; a="11476759"
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; 
   d="scan'208";a="11476759"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2024 02:58:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; 
   d="scan'208";a="763987"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 04 Feb 2024 02:58:25 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rWaCc-0006Gm-0K;
	Sun, 04 Feb 2024 10:58:22 +0000
Date: Sun, 4 Feb 2024 18:57:52 +0800
From: kernel test robot <lkp@intel.com>
To: Apurva Nandan <a-nandan@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com
Subject: [ti:ti-rt-linux-6.1.y-cicd 315/382]
 drivers/mtd/nand/spi/winbond.c:173:27: warning: 'op' is used uninitialized
Message-ID: <202402041823.kf6lyKd7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.1.y-cicd
head:   a3301d5cd75f78159753d3c59d2e70ee78e74e58
commit: d4da27218fd9cf1f7f606ff65c7a63e87f9139cc [315/382] mtd: spianand: winbond: Add change_mode() manufacturer_ops
config: um-allyesconfig (https://download.01.org/0day-ci/archive/20240204/202402041823.kf6lyKd7-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240204/202402041823.kf6lyKd7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402041823.kf6lyKd7-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/mtd/nand/spi/winbond.c: In function 'winbond_spinand_octal_dtr_enable':
>> drivers/mtd/nand/spi/winbond.c:173:27: warning: 'op' is used uninitialized [-Wuninitialized]
     173 |         struct spi_mem_op op;
         |                           ^~
   drivers/mtd/nand/spi/winbond.c:173:27: note: 'op' declared here
     173 |         struct spi_mem_op op;
         |                           ^~


vim +/op +173 drivers/mtd/nand/spi/winbond.c

93e0fe72570d07 Apurva Nandan 2023-04-17  169  
a2f2abeb4e898b Apurva Nandan 2023-04-17  170  static int winbond_spinand_octal_dtr_enable(struct spinand_device *spinand)
a2f2abeb4e898b Apurva Nandan 2023-04-17  171  {
a2f2abeb4e898b Apurva Nandan 2023-04-17  172  	int ret;
a2f2abeb4e898b Apurva Nandan 2023-04-17 @173  	struct spi_mem_op op;
a2f2abeb4e898b Apurva Nandan 2023-04-17  174  
a2f2abeb4e898b Apurva Nandan 2023-04-17  175  	ret = winbond_write_vcr_op(spinand, WINBOND_VCR_DUMMY_CLK_ADDR,
a2f2abeb4e898b Apurva Nandan 2023-04-17  176  				   WINBOND_VCR_DUMMY_CLK_COUNT);
a2f2abeb4e898b Apurva Nandan 2023-04-17  177  	if (ret)
a2f2abeb4e898b Apurva Nandan 2023-04-17  178  		return ret;
a2f2abeb4e898b Apurva Nandan 2023-04-17  179  
a2f2abeb4e898b Apurva Nandan 2023-04-17  180  	ret = winbond_write_vcr_op(spinand, WINBOND_VCR_IO_MODE_ADDR,
a2f2abeb4e898b Apurva Nandan 2023-04-17  181  				   WINBOND_VCR_IO_MODE_OCTAL_DTR);
a2f2abeb4e898b Apurva Nandan 2023-04-17  182  	if (ret)
a2f2abeb4e898b Apurva Nandan 2023-04-17  183  		return ret;
a2f2abeb4e898b Apurva Nandan 2023-04-17  184  
a2f2abeb4e898b Apurva Nandan 2023-04-17  185  	/* Read flash ID to make sure the switch was successful. */
a2f2abeb4e898b Apurva Nandan 2023-04-17  186  	op = (struct spi_mem_op)
a2f2abeb4e898b Apurva Nandan 2023-04-17  187  		SPI_MEM_OP(SPI_MEM_OP_CMD_DTR(2, 0x9f9f, 8),
a2f2abeb4e898b Apurva Nandan 2023-04-17  188  			   SPI_MEM_OP_NO_ADDR,
a2f2abeb4e898b Apurva Nandan 2023-04-17  189  			   SPI_MEM_OP_DUMMY_DTR(16, 8),
a2f2abeb4e898b Apurva Nandan 2023-04-17  190  			   SPI_MEM_OP_DATA_IN_DTR(SPINAND_MAX_ID_LEN,
a2f2abeb4e898b Apurva Nandan 2023-04-17  191  						  spinand->scratchbuf, 8));
a2f2abeb4e898b Apurva Nandan 2023-04-17  192  
a2f2abeb4e898b Apurva Nandan 2023-04-17  193  	ret = spi_mem_exec_op(spinand->spimem, &op);
a2f2abeb4e898b Apurva Nandan 2023-04-17  194  	if (ret)
a2f2abeb4e898b Apurva Nandan 2023-04-17  195  		return ret;
a2f2abeb4e898b Apurva Nandan 2023-04-17  196  
a2f2abeb4e898b Apurva Nandan 2023-04-17  197  	if (memcmp(spinand->scratchbuf, spinand->id.data, SPINAND_MAX_ID_LEN))
a2f2abeb4e898b Apurva Nandan 2023-04-17  198  		return -EINVAL;
a2f2abeb4e898b Apurva Nandan 2023-04-17  199  
a2f2abeb4e898b Apurva Nandan 2023-04-17  200  	return 0;
a2f2abeb4e898b Apurva Nandan 2023-04-17  201  }
a2f2abeb4e898b Apurva Nandan 2023-04-17  202  

:::::: The code at line 173 was first introduced by commit
:::::: a2f2abeb4e898b4dff4c76ebcabb85470eefa11b mtd: spinand: winbond: Add octal_dtr_enable/disable() in manufacturer_ops

:::::: TO: Apurva Nandan <a-nandan@ti.com>
:::::: CC: Vignesh Raghavendra <vigneshr@ti.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

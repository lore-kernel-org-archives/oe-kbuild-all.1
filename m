Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C761E1A71B
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Nov 2023 14:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YD+6yeny"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699541350; x=1731077350;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ovg3gfy0wFcysDdyLt5+TzXg/+EgOjGgho7GTJ810Ms=;
  b=YD+6yenyjFJeCUXuOe0KfB7QxEeit179xeJl9VS8pbh7VPwQqfMJh5Lz
   Qy+rfklAODpZBT7LSdWv/j2J2Nu0K/pMklcv3PJ9Y4+SHVxzHFsu8MkSw
   Yrn0xpo3whFyJ87bVM2w3thJbJeKDVE4OS+buphoQrfUCdtzm59vbWW6I
   VGUVLF9+qpQUsCGCv2TodwnP5wgQfx5YDH5BsNywUe63j9Er6Rdwfda9V
   Cf2i4kvldrueJDwkOOz1+iwcuOAhhfRfFVeEeFc17BxAFZF56YiJgMlmG
   zJIE+jKS7zL6T7pFDh8Z/wXO47f46uOeK7HZ9it+lQdcmJ/sZj4lp1hRJ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="454298907"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; 
   d="scan'208";a="454298907"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2023 06:49:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="756895964"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; 
   d="scan'208";a="756895964"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 09 Nov 2023 06:49:09 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r16LC-0008oc-38;
	Thu, 09 Nov 2023 14:49:06 +0000
Date: Thu, 9 Nov 2023 22:48:09 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.6-dango 7032/7095]
 drivers/mtd/nand/spi/core.c:979:5: sparse: sparse: symbol 'spinand_cal_read'
 was not declared. Should it be static?
Message-ID: <202311092212.0e9QMz2h-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi SkyLake.Huang,

First bad commit (maybe != root cause):

tree:   https://github.com/frank-w/BPI-R2-4.14 6.6-dango
head:   c3f5b3f22933d3fdfdaced4da77348154240d88b
commit: 25c7062b6301054551ce439d89d66f6e5fbb7454 [7032/7095] drivers: mtd: spi-nor: Add calibration support for spi-nor
config: x86_64-randconfig-123-20231018 (https://download.01.org/0day-ci/archive/20231109/202311092212.0e9QMz2h-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231109/202311092212.0e9QMz2h-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311092212.0e9QMz2h-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/mtd/nand/spi/core.c:979:5: sparse: sparse: symbol 'spinand_cal_read' was not declared. Should it be static?

vim +/spinand_cal_read +979 drivers/mtd/nand/spi/core.c

a508e8875e135d7 Peter Pan     2018-06-22   978  
e8053513c51df65 SkyLake.Huang 2022-06-23  @979  int spinand_cal_read(void *priv, u32 *addr, int addrlen, u8 *buf, int readlen) {
e8053513c51df65 SkyLake.Huang 2022-06-23   980  	struct spinand_device *spinand = (struct spinand_device *)priv;
e8053513c51df65 SkyLake.Huang 2022-06-23   981  	struct device *dev = &spinand->spimem->spi->dev;
e8053513c51df65 SkyLake.Huang 2022-06-23   982  	struct spi_mem_op op = SPINAND_PAGE_READ_FROM_CACHE_OP(false, 0, 1, buf, readlen);
e8053513c51df65 SkyLake.Huang 2022-06-23   983  	struct nand_pos pos;
e8053513c51df65 SkyLake.Huang 2022-06-23   984  	struct nand_page_io_req req;
e8053513c51df65 SkyLake.Huang 2022-06-23   985  	u8 status;
e8053513c51df65 SkyLake.Huang 2022-06-23   986  	int ret;
e8053513c51df65 SkyLake.Huang 2022-06-23   987  
e8053513c51df65 SkyLake.Huang 2022-06-23   988  	if(addrlen != sizeof(struct nand_addr)/sizeof(unsigned int)) {
e8053513c51df65 SkyLake.Huang 2022-06-23   989  		dev_err(dev, "Must provide correct addr(length) for spinand calibration\n");
e8053513c51df65 SkyLake.Huang 2022-06-23   990  		return -EINVAL;
e8053513c51df65 SkyLake.Huang 2022-06-23   991  	}
e8053513c51df65 SkyLake.Huang 2022-06-23   992  
e8053513c51df65 SkyLake.Huang 2022-06-23   993  	ret = spinand_reset_op(spinand);
e8053513c51df65 SkyLake.Huang 2022-06-23   994  	if (ret)
e8053513c51df65 SkyLake.Huang 2022-06-23   995  		return ret;
e8053513c51df65 SkyLake.Huang 2022-06-23   996  
e8053513c51df65 SkyLake.Huang 2022-06-23   997  	/* We should store our golden data in first target because
e8053513c51df65 SkyLake.Huang 2022-06-23   998  	 * we can't switch target at this moment.
e8053513c51df65 SkyLake.Huang 2022-06-23   999  	 */
e8053513c51df65 SkyLake.Huang 2022-06-23  1000  	pos = (struct nand_pos){
e8053513c51df65 SkyLake.Huang 2022-06-23  1001  		.target = 0,
e8053513c51df65 SkyLake.Huang 2022-06-23  1002  		.lun = *addr,
e8053513c51df65 SkyLake.Huang 2022-06-23  1003  		.plane = *(addr+1),
e8053513c51df65 SkyLake.Huang 2022-06-23  1004  		.eraseblock = *(addr+2),
e8053513c51df65 SkyLake.Huang 2022-06-23  1005  		.page = *(addr+3),
e8053513c51df65 SkyLake.Huang 2022-06-23  1006  	};
e8053513c51df65 SkyLake.Huang 2022-06-23  1007  
e8053513c51df65 SkyLake.Huang 2022-06-23  1008  	req = (struct nand_page_io_req){
e8053513c51df65 SkyLake.Huang 2022-06-23  1009  		.pos = pos,
e8053513c51df65 SkyLake.Huang 2022-06-23  1010  		.dataoffs = *(addr+4),
e8053513c51df65 SkyLake.Huang 2022-06-23  1011  		.datalen = readlen,
e8053513c51df65 SkyLake.Huang 2022-06-23  1012  		.databuf.in = buf,
e8053513c51df65 SkyLake.Huang 2022-06-23  1013  		.mode = MTD_OPS_AUTO_OOB,
e8053513c51df65 SkyLake.Huang 2022-06-23  1014  	};
e8053513c51df65 SkyLake.Huang 2022-06-23  1015  
e8053513c51df65 SkyLake.Huang 2022-06-23  1016  	ret = spinand_load_page_op(spinand, &req);
e8053513c51df65 SkyLake.Huang 2022-06-23  1017  	if (ret)
e8053513c51df65 SkyLake.Huang 2022-06-23  1018  		return ret;
e8053513c51df65 SkyLake.Huang 2022-06-23  1019  
25c7062b6301054 SkyLake.Huang 2022-06-23  1020  	ret = spinand_wait(spinand,
25c7062b6301054 SkyLake.Huang 2022-06-23  1021  			   SPINAND_READ_INITIAL_DELAY_US,
25c7062b6301054 SkyLake.Huang 2022-06-23  1022  			   SPINAND_READ_POLL_DELAY_US,
25c7062b6301054 SkyLake.Huang 2022-06-23  1023  			   &status);
e8053513c51df65 SkyLake.Huang 2022-06-23  1024  	if (ret < 0)
e8053513c51df65 SkyLake.Huang 2022-06-23  1025  		return ret;
e8053513c51df65 SkyLake.Huang 2022-06-23  1026  
e8053513c51df65 SkyLake.Huang 2022-06-23  1027  	ret = spi_mem_exec_op(spinand->spimem, &op);
e8053513c51df65 SkyLake.Huang 2022-06-23  1028  
e8053513c51df65 SkyLake.Huang 2022-06-23  1029  	return 0;
e8053513c51df65 SkyLake.Huang 2022-06-23  1030  }
e8053513c51df65 SkyLake.Huang 2022-06-23  1031  

:::::: The code at line 979 was first introduced by commit
:::::: e8053513c51df65611d3654a449fa15561cbe7b7 drivers: mtd: spinand: Add calibration support for spinand

:::::: TO: SkyLake.Huang <skylake.huang@mediatek.com>
:::::: CC: Daniel Golle <daniel@makrotopia.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

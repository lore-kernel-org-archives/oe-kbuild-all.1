Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E311514A88
	for <oe-kbuild-all@lists.linux.dev>; Sun, 27 Aug 2023 23:23:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693178587; x=1724714587;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EmEM72+c2263W/JpspSeyM5d+cUXAWrQ3yTm25GkF3I=;
  b=mVpSNHdmJHzbTHrWsZi9UtVU8iGpjIE3s5BjhLG9NxO7H2fRsq7Iqf3U
   DNbJW+nsvBCc/uCeXqZqzwsndWeiC4IPW236oTb0ohlw/0Ejt7gQz8wol
   fmHIrtLwNIaCp/p/GaVWEqEO+U4b6rYjBmKvfr3ESE4J7z6tBAkXH2Hdt
   EmmiqYs4oA34vojJbY0t2bHtKavCGxudrBlooDEZ7UFjNqED33OqjxMso
   abIK8WitTNorj3mx+eS5xVun+GX39HFJ9oWNVOdF3BYj2XVP2m+QJTmVH
   NKbt4mYO2IyeBT2YGCmdyksrz/OA1+juk1JqjfU+y2MoE8uVJbmIQWId0
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10815"; a="441322462"
X-IronPort-AV: E=Sophos;i="6.02,205,1688454000"; 
   d="scan'208";a="441322462"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2023 16:23:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10815"; a="1068840586"
X-IronPort-AV: E=Sophos;i="6.02,205,1688454000"; 
   d="scan'208";a="1068840586"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 27 Aug 2023 16:23:02 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qaP5x-0006IV-38;
	Sun, 27 Aug 2023 23:23:01 +0000
Date: Mon, 28 Aug 2023 07:22:21 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.5-dango-r4_2 11419/11475]
 drivers/mtd/nand/spi/core.c:979:5: warning: no previous declaration for
 'spinand_cal_read'
Message-ID: <202308280741.9zRCBHkQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.5-dango-r4_2
head:   cc0a2308a5003e3fbb2547245447de5dc7ddc718
commit: 1d8e5fd5901586947f6a443a6adae052f5b9922e [11419/11475] drivers: mtd: spinand: Add calibration support for spinand
config: i386-randconfig-r006-20230828 (https://download.01.org/0day-ci/archive/20230828/202308280741.9zRCBHkQ-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20230828/202308280741.9zRCBHkQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308280741.9zRCBHkQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/mtd/nand/spi/core.c:979:5: warning: no previous declaration for 'spinand_cal_read' [-Wmissing-declarations]
    int spinand_cal_read(void *priv, u32 *addr, int addrlen, u8 *buf, int readlen) {
        ^~~~~~~~~~~~~~~~
   drivers/mtd/nand/spi/core.c: In function 'spinand_cal_read':
   drivers/mtd/nand/spi/core.c:1020:30: warning: passing argument 2 of 'spinand_wait' makes integer from pointer without a cast [-Wint-conversion]
     ret = spinand_wait(spinand, &status);
                                 ^
   drivers/mtd/nand/spi/core.c:499:12: note: expected 'long unsigned int' but argument is of type 'u8 * {aka unsigned char *}'
    static int spinand_wait(struct spinand_device *spinand,
               ^~~~~~~~~~~~
   drivers/mtd/nand/spi/core.c:1020:8: error: too few arguments to function 'spinand_wait'
     ret = spinand_wait(spinand, &status);
           ^~~~~~~~~~~~
   drivers/mtd/nand/spi/core.c:499:12: note: declared here
    static int spinand_wait(struct spinand_device *spinand,
               ^~~~~~~~~~~~


vim +/spinand_cal_read +979 drivers/mtd/nand/spi/core.c

   978	
 > 979	int spinand_cal_read(void *priv, u32 *addr, int addrlen, u8 *buf, int readlen) {
   980		struct spinand_device *spinand = (struct spinand_device *)priv;
   981		struct device *dev = &spinand->spimem->spi->dev;
   982		struct spi_mem_op op = SPINAND_PAGE_READ_FROM_CACHE_OP(false, 0, 1, buf, readlen);
   983		struct nand_pos pos;
   984		struct nand_page_io_req req;
   985		u8 status;
   986		int ret;
   987	
   988		if(addrlen != sizeof(struct nand_addr)/sizeof(unsigned int)) {
   989			dev_err(dev, "Must provide correct addr(length) for spinand calibration\n");
   990			return -EINVAL;
   991		}
   992	
   993		ret = spinand_reset_op(spinand);
   994		if (ret)
   995			return ret;
   996	
   997		/* We should store our golden data in first target because
   998		 * we can't switch target at this moment.
   999		 */
  1000		pos = (struct nand_pos){
  1001			.target = 0,
  1002			.lun = *addr,
  1003			.plane = *(addr+1),
  1004			.eraseblock = *(addr+2),
  1005			.page = *(addr+3),
  1006		};
  1007	
  1008		req = (struct nand_page_io_req){
  1009			.pos = pos,
  1010			.dataoffs = *(addr+4),
  1011			.datalen = readlen,
  1012			.databuf.in = buf,
  1013			.mode = MTD_OPS_AUTO_OOB,
  1014		};
  1015	
  1016		ret = spinand_load_page_op(spinand, &req);
  1017		if (ret)
  1018			return ret;
  1019	
  1020		ret = spinand_wait(spinand, &status);
  1021		if (ret < 0)
  1022			return ret;
  1023	
  1024		ret = spi_mem_exec_op(spinand->spimem, &op);
  1025	
  1026		return 0;
  1027	}
  1028	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
